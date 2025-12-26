local reqml = 8            -- Magic level required to use
local reqlvl = 250         -- Level required to use
local potExhaust = false   -- If true, uses potion exhaust system
local storeValue = 50995   -- Storage used for custom exhaust
local exhaustTime = 2      -- Exhaust time
local infinite = false      -- Rune loses charges? true = infinite
local canUseInPz = true    -- Allow PZ use?

local ani = 570
local playerSay = "Ahhh..."

local error_ml = "You don't have the required magic level to use that rune."
local error_lvl = "You don't have the required level to use that rune."
local error_voc = "You don't are Knight."
local error_notPlayer = "You can only use this rune on players."
local error_exhaust = "You are exhausted."
local error_pz = "You may not use this in Protected Zones."

local manaRune = Action()

-- Exhaust Function
local function checkExhaust(player)
    local newExhaust = os.time()
    local oldExhaust = player:getStorageValue(storeValue)

    if oldExhaust < 0 then oldExhaust = 0 end

    local diff = os.difftime(newExhaust, oldExhaust)
    if diff >= exhaustTime then
        player:setStorageValue(storeValue, newExhaust)
        return true
    end
    return false
end

function manaRune.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target or not target:isPlayer() then
        player:sendCancelMessage(error_notPlayer)
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        return true
    end

    if not canUseInPz and player:getTile():hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendCancelMessage(error_pz)
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        return true
    end

    if player:getLevel() < reqlvl then
        player:sendCancelMessage(error_lvl)
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        return true
    end

    if not player:isKnight() then
        player:sendCancelMessage(error_voc)
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        return true
    end

    if player:getMagicLevel() < reqml then
        player:sendCancelMessage(error_ml)
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        return true
    end

    -- Exhaust check
    if not potExhaust then
        if not checkExhaust(player) then
            player:sendCancelMessage(error_exhaust)
            return true
        end
    else
        if player:hasCondition(CONDITION_EXHAUST_HEAL) then
            player:sendCancelMessage(error_exhaust)
            return true
        end
    end

    local lvl = player:getLevel()
    local ml = player:getMagicLevel()

    local minMana = ((lvl * 0.35 + ml * 1) * 0.55) + 15
    local maxMana = ((lvl * 0.35 + ml * 2) * 0.65) + 20

    local minHealth = ((lvl * 1.75 + ml * 2) * 0.55) + 15
    local maxHealth = ((lvl * 2 + ml * 1) * 0.75) + 20

    -- Ring bonus
    local ring = player:getSlotItem(CONST_SLOT_RING)
    if ring and ring:getId() == 6536 and player:getStorageValue(50781) == 1 then
        minHealth = minHealth * 1.5
        maxHealth = maxHealth * 1.5
    end

    -- Apply effects
    toPosition:sendMagicEffect(ani)
    target:addMana(math.random(minMana, maxMana))
    target:addHealth(math.random(minHealth, maxHealth))
    player:say(playerSay, TALKTYPE_MONSTER_SAY)

    -- Consume charge?
    if not infinite then
       item:remove(1)
    end
    return true
end

manaRune:id(3170) -- <<=== Cambia al ID de tu mana rune
manaRune:register()
