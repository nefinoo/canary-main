
-- Monster DPS Simulator
-- Canary RevScript 1.5
-- Command: !monsterdps dragon, 100, 80

local config = {
    command = "!monsterdps",
    dialogItemId = 1950,

    -- Approximate armor formula
    armorMinFactor = 0.475,
    armorMaxFactor = 0.95,

    -- Approximate shield mitigation
    shieldFactor = 0.50
}

local function round(value)
    return math.floor(value + 0.5)
end

local function format(value)
    return string.format("%.2f", value)
end

local function parseArguments(param)
    local name, armor, shield = param:match(
        "^%s*(.-)%s*,%s*(%d+)%s*,%s*(%d+)%s*$"
    )

    if not name or name == "" then
        return nil
    end

    return name, tonumber(armor), tonumber(shield)
end

local function calculateArmorReduction(armor)
    local minimum = math.ceil(
        armor * config.armorMinFactor
    )

    local maximum = math.ceil(
        armor * config.armorMaxFactor
    )

    return (minimum + maximum) / 2
end

local function calculatePhysicalDamage(damage, armor, shield)
    local armorBlocked = math.min(
        damage,
        calculateArmorReduction(armor)
    )

    local remaining = damage - armorBlocked

    local shieldBlocked = math.min(
        remaining,
        shield * config.shieldFactor
    )

    local finalDamage = math.max(
        0,
        remaining - shieldBlocked
    )

    return finalDamage, armorBlocked, shieldBlocked
end

local function analyzeMonster(monsterType, armor, shield)
    local attacks = monsterType:getAttackList()

    local result = {
        rawDps = 0,
        equippedDps = 0,
        armorBlocked = 0,
        shieldBlocked = 0,
        attacks = {}
    }

    for index, attack in ipairs(attacks) do
        local minDamage = math.abs(
            tonumber(attack.minCombatValue) or 0
        )

        local maxDamage = math.abs(
            tonumber(attack.maxCombatValue) or 0
        )

        if minDamage > maxDamage then
            minDamage, maxDamage = maxDamage, minDamage
        end

        local average = (minDamage + maxDamage) / 2

        local interval = math.max(
            1,
            tonumber(attack.speed) or 2000
        )

        local chance = math.max(
            0,
            math.min(100, tonumber(attack.chance) or 100)
        )

        local attacksPerSecond =
            (1000 / interval) * (chance / 100)

        local rawDps = average * attacksPerSecond

        local isMelee =
            attack.isMelee == 1 or
            attack.isMelee == true

        local finalDamage = average
        local armorBlocked = 0
        local shieldBlocked = 0

        -- Apply estimated armor and shield
        -- mitigation only to melee attacks.
        if isMelee then
            finalDamage, armorBlocked, shieldBlocked =
                calculatePhysicalDamage(
                    average,
                    armor,
                    shield
                )
        end

        local equippedDps =
            finalDamage * attacksPerSecond

        result.rawDps = result.rawDps + rawDps

        result.equippedDps =
            result.equippedDps + equippedDps

        result.armorBlocked =
            result.armorBlocked +
            armorBlocked * attacksPerSecond

        result.shieldBlocked =
            result.shieldBlocked +
            shieldBlocked * attacksPerSecond

        table.insert(result.attacks, {
            index = index,
            name = isMelee and "Melee" or "Spell",
            min = minDamage,
            max = maxDamage,
            chance = chance,
            interval = interval,
            rawDps = rawDps,
            equippedDps = equippedDps
        })
    end

    return result
end

local monsterDps = TalkAction(config.command)

function monsterDps.onSay(player, words, param)
    local name, armor, shield = parseArguments(param)

    if not name then
        player:sendCancelMessage(
            "Usage: !monsterdps dragon, 100, 80"
        )
        return true
    end

    local monsterType = MonsterType(name)

    if not monsterType then
        player:sendCancelMessage(
            "Monster not found: " .. name
        )
        return true
    end

    local result = analyzeMonster(
        monsterType, armor, shield
    )

    if #result.attacks == 0 then
        player:sendCancelMessage(
            "Monster has no available attack data."
        )
        return true
    end

    local totalBlocked =
        result.rawDps - result.equippedDps

    local reduction = 0

    if result.rawDps > 0 then
        reduction =
            (totalBlocked / result.rawDps) * 100
    end

    local lines = {
        "===== MONSTER DPS SIMULATOR =====",
        "",
        "Monster: " .. monsterType:getName(),
        "Armor: " .. armor,
        "Shield Defense: " .. shield,
        "",
        "WITHOUT EQUIPMENT:",
        "Estimated DPS: " .. format(result.rawDps),
        "",
        "WITH EQUIPMENT:",
        "Estimated DPS: " .. format(result.equippedDps),
        "",
        "DAMAGE REDUCTION:",
        "Armor blocked/s: " .. format(result.armorBlocked),
        "Shield blocked/s: " .. format(result.shieldBlocked),
        "Total blocked/s: " .. format(totalBlocked),
        "Reduction: " .. format(reduction) .. "%",
        "",
        "MONSTER ATTACKS:"
    }

    for _, attack in ipairs(result.attacks) do
        table.insert(lines,
            attack.index .. ". " .. attack.name ..
            " [" .. round(attack.min) ..
            "-" .. round(attack.max) .. "]" ..
            " Chance: " .. attack.chance .. "%" ..
            " DPS: " .. format(attack.rawDps)
        )
    end

    table.insert(lines, "")
    table.insert(lines, "Estimated values, not exact combat results.")

    player:showTextDialog(
        config.dialogItemId,
        table.concat(lines, "\n")
    )

    return true
end

monsterDps:separator(" ")
monsterDps:groupType("normal")
monsterDps:register()
