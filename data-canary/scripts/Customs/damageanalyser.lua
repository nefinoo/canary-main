
local config = {
    command = "!dps",
    maxDuration = 300,
    reportInterval = 0,
    onlyMonsters = true
}

local sessions = {}

local damageTypes = {
    [COMBAT_PHYSICALDAMAGE] = "Physical",
    [COMBAT_FIREDAMAGE] = "Fire",
    [COMBAT_ENERGYDAMAGE] = "Energy",
    [COMBAT_EARTHDAMAGE] = "Earth",
    [COMBAT_ICEDAMAGE] = "Ice",
    [COMBAT_HOLYDAMAGE] = "Holy",
    [COMBAT_DEATHDAMAGE] = "Death",
    [COMBAT_LIFEDRAIN] = "Life Drain",
    [COMBAT_MANADRAIN] = "Mana Drain"
}

local function formatNumber(number)
    return string.format("%.2f", number)
end

local function getElapsed(session)
    return math.max(0.001, os.clock() - session.startTime)
end

local function getReport(session)
    local elapsed = getElapsed(session)
    local dps = session.totalDamage / elapsed

    local lines = {
        "===== DAMAGE ANALYZER =====",
        "Duration: " .. formatNumber(elapsed) .. " seconds",
        "Total Damage: " .. session.totalDamage,
        "Average DPS: " .. formatNumber(dps),
        "Highest Hit: " .. session.maxHit,
        "Total Hits: " .. session.hits,
        "Average Hit: " .. formatNumber(
            session.hits > 0 and
            session.totalDamage / session.hits or 0
        ),
        "",
        "Damage by Type:"
    }

    for damageType, amount in pairs(session.types) do
        local name = damageTypes[damageType] or tostring(damageType)
        table.insert(lines, name .. ": " .. amount)
    end

    table.insert(lines, "")
    table.insert(lines, "Damage by Monster:")

    for name, amount in pairs(session.monsters) do
        table.insert(lines, name .. ": " .. amount)
    end

    return table.concat(lines, "\n")
end

local function sendReport(player, session)
    player:showTextDialog(1950, getReport(session))
end

local damageEvent = CreatureEvent("NefiDamageAnalyzer")

function damageEvent.onHealthChange(
    creature, attacker,
    primaryDamage, primaryType,
    secondaryDamage, secondaryType,
    origin
)
    if not creature:isPlayer() then
        return primaryDamage, primaryType,
            secondaryDamage, secondaryType
    end

    local playerId = creature:getId()
    local session = sessions[playerId]

    if not session then
        return primaryDamage, primaryType,
            secondaryDamage, secondaryType
    end

    if not attacker then
        return primaryDamage, primaryType,
            secondaryDamage, secondaryType
    end

    local monster = attacker

    if attacker:isPlayer() then
        if config.onlyMonsters then
            return primaryDamage, primaryType,
                secondaryDamage, secondaryType
        end
    elseif not attacker:isMonster() then
        return primaryDamage, primaryType,
            secondaryDamage, secondaryType
    end

    local damage1 = math.max(0, -primaryDamage)
    local damage2 = math.max(0, -secondaryDamage)

    local total = damage1 + damage2

    if total <= 0 then
        return primaryDamage, primaryType,
            secondaryDamage, secondaryType
    end

    session.totalDamage = session.totalDamage + total
    session.hits = session.hits + 1
    session.maxHit = math.max(session.maxHit, total)

    if damage1 > 0 then
        session.types[primaryType] =
            (session.types[primaryType] or 0) + damage1
    end

    if damage2 > 0 then
        session.types[secondaryType] =
            (session.types[secondaryType] or 0) + damage2
    end

    local monsterName = monster:getName()

    session.monsters[monsterName] =
        (session.monsters[monsterName] or 0) + total

    return primaryDamage, primaryType,
        secondaryDamage, secondaryType
end

damageEvent:register()

local loginEvent = CreatureEvent("NefiDamageAnalyzerLogin")

function loginEvent.onLogin(player)
    player:registerEvent("NefiDamageAnalyzer")
    return true
end

loginEvent:register()

local dpsCommand = TalkAction(config.command)

function dpsCommand.onSay(player, words, param)
    local playerId = player:getId()
    local action = param:lower():match("^%s*(.-)%s*$")

    if action == "start" then
        sessions[playerId] = {
            startTime = os.clock(),
            totalDamage = 0,
            maxHit = 0,
            hits = 0,
            types = {},
            monsters = {}
        }

        player:registerEvent("NefiDamageAnalyzer")

        player:sendTextMessage(
            MESSAGE_EVENT_ADVANCE,
            "[DPS] Damage measurement started."
        )

        return true
    end

    local session = sessions[playerId]

    if not session then
        player:sendCancelMessage(
            "No active DPS measurement. Use !dps start."
        )
        return true
    end

    if action == "status" then
        sendReport(player, session)
        return true
    end

    if action == "stop" then
        sendReport(player, session)
        sessions[playerId] = nil

        player:sendTextMessage(
            MESSAGE_EVENT_ADVANCE,
            "[DPS] Damage measurement stopped."
        )

        return true
    end

    player:sendCancelMessage(
        "Commands: !dps start, !dps status, !dps stop"
    )

    return true
end

dpsCommand:separator(" ")
dpsCommand:groupType("normal")
dpsCommand:register()
