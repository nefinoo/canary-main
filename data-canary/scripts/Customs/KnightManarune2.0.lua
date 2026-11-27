local reqml = 10            -- Magic level required to use
local reqlvl = 10000         -- Level required to use
local potExhaust = true    -- If true, uses potion exhaust system
local storeValue = 50995   -- Storage used for custom exhaust
local exhaustTime = 2      -- Exhaust time
local infinite = false     -- Rune loses charges? true = infinite
local canUseInPz = true    -- Allow PZ use?

local exhausteds = {}

local ani = 570
local playerSay = "Ahhh..."

local error_ml = "You don't have the required magic level to use that rune."
local error_lvl = "You don't have the required level to use that rune."
local error_voc = "You don't are Knight."
local error_notPlayer = "You can only use this rune on players."
local error_exhaust = "You are exhausted."
local error_pz = "You may not use this in Protected Zones."

local manaRune = Action()

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
    local playerId = player:getId()
    local exhausted = exhausteds[playerId]	
    if exhausted and os.time() < exhausted then
		player:sendTextMessage(MESSAGE_FAILURE, "You are exhausted.")
		return true
	end
	

    ----------------------------------------------------------------------
    -- Vida base del jugador (sin contar equipo)
    ----------------------------------------------------------------------

    local hpPerLevel = 0

    if target:isSorcerer() or target:isDruid() then
        hpPerLevel = 5
    elseif target:isPaladin() then
        hpPerLevel = 10
    elseif target:isKnight() then
        hpPerLevel = 15
    end

    local baseHealth = math.max(0, (target:getLevel() - 8) * hpPerLevel)

	local minHealth = math.floor(baseHealth * 0.02396) + 1400
	local maxHealth = math.floor(baseHealth * 0.03185) + 1800

    -- Bonus del ring
    local ring = player:getSlotItem(CONST_SLOT_RING)
	
    if ring and ring:getId() == 6536 and player:getStorageValue(50781) >= 1 then
        minHealth = math.floor(minHealth * 1.5)
        maxHealth = math.floor(maxHealth * 1.5)
    end	
	
    -- Aplicar efectos
    toPosition:sendMagicEffect(ani)

    local heal = math.random(minHealth, maxHealth)
    target:addHealth(heal)	
	target:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_SPELL_FAIR_WOUND_CLEANSING, player:isInGhostMode() and nil or player)

    player:say(playerSay, TALKTYPE_MONSTER_SAY)

    -- print(string.format(
        -- "[KNIGHT RUNE] %s +%d HP (Nivel: %d | HP Base: %d)",
        -- target:getName(),
        -- heal,
        -- target:getLevel(),
        -- baseHealth
    -- ))

    if not infinite then
        item:remove(1)
    end
	exhausteds[playerId] = os.time() + exhaustTime

    return true
end

manaRune:id(3170)
manaRune:register()