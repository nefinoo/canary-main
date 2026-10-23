-- Frozen Hell / Canary RevScript: genuine in-game Knight encounter recorder.
-- TEST SERVER ONLY. Does NOT create enemies, damage/heal anything or alter loot.
-- Place already spawned named enemies in a private arena, then use !fhtrial.
-- Configure allowedNames below with the NAME of your ordinary Knight test character.

local CFG = {
    command = "!fhtrial",
    allowedNames = { ["Maloka"] = true },
    maxRange = 8,
    sampleMs = 1000,
    maxSeconds = 900,
    file = "data/logs/frozen_hell_live_trials.csv",
    itemIds = { 23375, 51246, 50967, 51702, 53144, 3578, 3579, 3580, 3581, 7159, 7158 },
    potionPrices = { [23375] = 625, [51246] = 738, [50967] = 938,
                     [51702] = 1138, [53144] = 1338 },
    encounters = {
        ["deathpincer"] = { 1 },
        ["frozenhell guard"] = { 1, 2 },
        ["venom"] = { 1, 2 }
    }
}

local sessions, targetOwner, lastRuns = {}, {}, {}
local cols = { "trial_id", "event", "utc_time", "elapsed_s", "player", "level", "monster", "expected", "killed", "player_hp", "player_mana", "monster_hp_sum", "damage_to_player_events", "damage_to_monsters_events", "healing_events", "xp_gained", "min_hp_sampled", "min_mana_sampled", "notes" }

local function cell(v)
    local s = tostring(v == nil and "" or v):gsub('"', '""')
    return '"' .. s .. '"'
end

local function csvRow(values)
    local parts = {}
    for i = 1, #cols do parts[i] = cell(values[i]) end
    return table.concat(parts, ";")
end

local function writeRow(values)
    local line = csvRow(values)
    local existing = io.open(CFG.file, "r")
    local headerNeeded = not existing
    if existing then
        headerNeeded = (existing:seek("end") == 0)
        existing:close()
    end
    local file = io.open(CFG.file, "a")
    if file then
        if headerNeeded then file:write(csvRow(cols) .. "\n") end
        file:write(line .. "\n")
        file:close()
    else
        logger.warn("[FHTrial] Cannot write CSV at {}. Check the data/logs directory.", CFG.file)
    end
    -- Console is a fallback if file permissions/path are wrong.
    logger.info("[FHTrial] {}", line)
end

local function nowUtc()
    return os.date("!%Y-%m-%dT%H:%M:%SZ")
end

local function counts(player)
    local result = {}
    if not player then return result end
    for _, id in ipairs(CFG.itemIds) do
        result[id] = player:getItemCount(id)
    end
    return result
end

local function summaryCount(before, after)
    local parts, potionCost = {}, 0
    for _, id in ipairs(CFG.itemIds) do
        local used = math.max(0, (before[id] or 0) - (after[id] or 0))
        if used > 0 then
            table.insert(parts, tostring(id) .. ":" .. tostring(used))
            potionCost = potionCost + used * (CFG.potionPrices[id] or 0)
        end
    end
    return table.concat(parts, "|"), potionCost
end

local function equipment(player)
    local slots = {
        { "head", CONST_SLOT_HEAD }, { "armor", CONST_SLOT_ARMOR },
        { "legs", CONST_SLOT_LEGS }, { "feet", CONST_SLOT_FEET },
        { "left", CONST_SLOT_LEFT }, { "right", CONST_SLOT_RIGHT }
    }
    local parts = {}
    for _, pair in ipairs(slots) do
        local item = player:getSlotItem(pair[2])
        table.insert(parts, pair[1] .. ":" .. tostring(item and item:getId() or 0))
    end
    return table.concat(parts, "|")
end

local function aliveAndHp(s)
    local total, alive, killed = 0, 0, 0
    for monsterId, entry in pairs(s.targets) do
        if entry.dead then
            killed = killed + 1
        else
            local monster = Monster(monsterId)
            if monster then
                entry.lastHp = monster:getHealth()
                total = total + entry.lastHp
                alive = alive + 1
            else
                -- A vanished monster is not automatically a kill.
                entry.missing = true
            end
        end
    end
    return alive, killed, total
end

local function logSample(s, player, event, notes)
    local alive, killed, targetHp = aliveAndHp(s)
    local hp = player and player:getHealth() or s.lastHp
    local mana = player and player:getMana() or s.lastMana
    s.lastHp, s.lastMana = hp, mana
    s.minHp = math.min(s.minHp, hp)
    s.minMana = math.min(s.minMana, mana)
    local elapsed = math.max(0, os.time() - s.started)
    local gained = player and (player:getExperience() - s.startXp) or 0
    writeRow({s.id, event, nowUtc(), elapsed, s.name, s.level, s.monsterName,
        s.expected, killed, hp, mana, targetHp, s.damageIn, s.damageOut,
        s.healingEvents, gained, s.minHp, s.minMana,
        (notes or "") .. "|alive:" .. tostring(alive)})
    return alive, killed, elapsed, gained
end

local function finish(playerId, result)
    local s = sessions[playerId]
    if not s then return end
    local player = Player(playerId)
    local alive, killed, elapsed, xpGain = logSample(s, player, "END", result)
    local used, potionCost = summaryCount(s.startItems, player and counts(player) or s.startItems)
    writeRow({s.id, "COST", nowUtc(), elapsed, s.name, s.level,
        s.monsterName, s.expected, killed, s.lastHp, s.lastMana, "",
        s.damageIn, s.damageOut, s.healingEvents, xpGain, s.minHp,
        s.minMana, "items_used:" .. used .. "|potion_gp:" .. potionCost ..
        "|outcome:" .. result .. "|combat_xp_hour:" ..
        math.floor(xpGain * 3600 / math.max(1, elapsed))})
    for monsterId in pairs(s.targets) do targetOwner[monsterId] = nil end
    lastRuns[playerId] = { id = s.id, potionCost = potionCost, lootReported = false,
        outcome = result, seconds = elapsed, xp = xpGain }
    sessions[playerId] = nil
    if player then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
            "[FHTrial] " .. result .. ", " .. elapsed .. "s, " .. killed ..
            "/" .. s.expected .. " kills, potions " .. potionCost ..
            " gp. Report real loot using !fhtrial loot, GP_VALUE.")
    end
end

local function tick(playerId, expectedId)
    local s = sessions[playerId]
    if not s or s.id ~= expectedId then return end
    local player = Player(playerId)
    if not player then finish(playerId, "PLAYER_DISCONNECTED"); return end
    local alive, killed, elapsed = logSample(s, player, "SAMPLE", "")
    if player:getHealth() <= 0 then finish(playerId, "PLAYER_DEAD"); return end
    if killed == s.expected then finish(playerId, "ALL_KILLED"); return end
    if alive + killed < s.expected then finish(playerId, "TARGET_MISSING"); return end
    if elapsed >= CFG.maxSeconds then finish(playerId, "TIMEOUT"); return end
    addEvent(tick, CFG.sampleMs, playerId, expectedId)
end

local watchPlayer = CreatureEvent("FHTrialPlayerDamage")
function watchPlayer.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    local s = sessions[creature:getId()]
    if s then
        local lost = math.max(0, -primaryDamage) + math.max(0, -secondaryDamage)
        local healed = math.max(0, primaryDamage) + math.max(0, secondaryDamage)
        s.damageIn = s.damageIn + lost
        s.healingEvents = s.healingEvents + healed
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
watchPlayer:register()

local watchMonster = CreatureEvent("FHTrialMonsterDamage")
function watchMonster.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    local playerId = targetOwner[creature:getId()]
    local s = playerId and sessions[playerId]
    if s and attacker and attacker:isPlayer() and attacker:getId() == playerId then
        s.damageOut = s.damageOut + math.max(0, -primaryDamage) + math.max(0, -secondaryDamage)
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
watchMonster:register()

local watchDeath = CreatureEvent("FHTrialMonsterDeath")
function watchDeath.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
    local playerId = targetOwner[creature:getId()]
    local s = playerId and sessions[playerId]
    if s and s.targets[creature:getId()] then
        s.targets[creature:getId()].dead = true
        s.targets[creature:getId()].lastHp = 0
    end
    return true
end
watchDeath:register()

local action = TalkAction(CFG.command)
function action.onSay(player, words, param)
    if not CFG.allowedNames[player:getName()] then
        player:sendCancelMessage("[FHTrial] Character not whitelisted in the test script.")
        return true
    end
    local vocationName = player:getVocation():getName():lower()
    if not vocationName:find("knight", 1, true) then
        player:sendCancelMessage("[FHTrial] Use a normal Knight test character.")
        return true
    end
    local playerId = player:getId()
    local actionText = param:lower():match("^%s*(.-)%s*$")

    if actionText == "status" then
        local s = sessions[playerId]
        if not s then player:sendCancelMessage("[FHTrial] No active trial."); return true end
        logSample(s, player, "STATUS", "manual_status")
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[FHTrial] Active trial " .. s.id)
        return true
    end
    if actionText == "stop" then
        if not sessions[playerId] then
            player:sendCancelMessage("[FHTrial] No active trial.")
        else
            finish(playerId, "MANUAL_STOP")
        end
        return true
    end
    local lootGP = actionText:match("^loot%s*,%s*(%d+)$")
    if lootGP then
        local previous = lastRuns[playerId]
        if not previous or previous.lootReported then
            player:sendCancelMessage("[FHTrial] No unfinished loot entry.")
            return true
        end
        lootGP = tonumber(lootGP)
        previous.lootReported = true
        writeRow({previous.id, "LOOT", nowUtc(), previous.seconds, player:getName(),
            player:getLevel(), "", "", "", player:getHealth(), player:getMana(),
            "", "", "", "", previous.xp, "", "",
            "manual_nephy_gp:" .. lootGP .. "|potion_gp:" .. previous.potionCost ..
            "|net_after_potions_gp:" .. (lootGP - previous.potionCost)})
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
            "[FHTrial] Recorded loot " .. lootGP .. " gp. Net after potions " ..
            (lootGP - previous.potionCost) .. " gp (food cost excluded).")
        return true
    end

    local monsterName, countText = actionText:match("^start%s*,%s*(.-)%s*,%s*(%d+)$")
    local expected = tonumber(countText)
    local valid = monsterName and CFG.encounters[monsterName]
    if not valid or (expected ~= 1 and expected ~= 2) or
       not ((expected == 1 and valid[1] == 1) or
            (expected == 2 and valid[2] == 2)) then
        player:sendCancelMessage("[FHTrial] !fhtrial start, deathpincer, 1 / frozenhell guard, 1|2 / venom, 1|2; status; stop; loot, GP")
        return true
    end
    if sessions[playerId] then
        player:sendCancelMessage("[FHTrial] Stop the current trial first.")
        return true
    end

    local seen = {}
    local spectators = Game.getSpectators(player:getPosition(), false, false,
        CFG.maxRange, CFG.maxRange, CFG.maxRange, CFG.maxRange)
    for _, candidate in ipairs(spectators) do
        if candidate:isPlayer() and candidate:getId() ~= playerId then
            player:sendCancelMessage("[FHTrial] Other players are nearby; use a private arena.")
            return true
        end
        if candidate:isMonster() and candidate:getName():lower() == monsterName then
            table.insert(seen, candidate)
        end
    end
    if #seen ~= expected then
        player:sendCancelMessage("[FHTrial] Expected " .. expected .. " nearby " ..
            monsterName .. ", found " .. #seen .. ". Spawn/position them first.")
        return true
    end
    for _, monster in ipairs(seen) do
        if targetOwner[monster:getId()] then
            player:sendCancelMessage("[FHTrial] A target is already being monitored.")
            return true
        end
    end

    local id = os.date("!%Y%m%dT%H%M%S") .. "_" .. tostring(playerId)
    local start = os.time()
    local targets = {}
    for _, monster in ipairs(seen) do
        targets[monster:getId()] = {lastHp = monster:getHealth(), dead = false}
    end
    local s = {
        id = id, started = start, name = player:getName(), level = player:getLevel(),
        monsterName = monsterName, expected = expected, targets = targets,
        startXp = player:getExperience(), startItems = counts(player),
        damageIn = 0, damageOut = 0, healingEvents = 0,
        lastHp = player:getHealth(), lastMana = player:getMana(),
        minHp = player:getHealth(), minMana = player:getMana()
    }
    sessions[playerId] = s
    player:registerEvent("FHTrialPlayerDamage")
    for _, monster in ipairs(seen) do
        targetOwner[monster:getId()] = playerId
        monster:registerEvent("FHTrialMonsterDamage")
        monster:registerEvent("FHTrialMonsterDeath")
    end
    logSample(s, player, "START", "gear:" .. equipment(player) ..
        "|max_hp:" .. player:getMaxHealth() .. "|max_mana:" .. player:getMaxMana())
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
        "[FHTrial] Started " .. monsterName .. " x" .. expected ..
        ". Fight normally; do not collect loot/restock until END.")
    addEvent(tick, CFG.sampleMs, playerId, id)
    return true
end

action:separator(" ")
action:groupType("normal")
action:register()