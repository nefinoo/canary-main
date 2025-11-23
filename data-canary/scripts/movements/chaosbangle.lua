-- >> Config --

local outfit =
{
    -- Girls
    {
        lookType   = 224,
        lookHead   = 19,
        lookBody   = 53,
        lookLegs   = 92,
        lookFeet   = 79,
        lookAddons = 0
    },
    -- Boys
    {
        lookType   = 224,
        lookHead   = 19,
        lookBody   = 79,
        lookLegs   = 3,
        lookFeet   = 81,
        lookAddons = 0
    }
}
 
local wastingInterval = 2000
local wastingQuantity = 10000
local triggerQuantity = 100000
local warnOnLowSupply = TRUE
local lowSupplyMargin = 500000
local storage         = 50780

-- Config << --
 
local condition1 = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition1, CONDITION_PARAM_TICKS, -1)
setConditionParam(condition1, CONDITION_PARAM_SKILL_FIST,                50)
setConditionParam(condition1, CONDITION_PARAM_SKILL_CLUB,                50)
setConditionParam(condition1, CONDITION_PARAM_SKILL_SWORD,               50)
setConditionParam(condition1, CONDITION_PARAM_SKILL_AXE,                 50)
setConditionParam(condition1, CONDITION_PARAM_SKILL_DISTANCE,            50)
setConditionParam(condition1, CONDITION_PARAM_SKILL_SHIELD,              50)
setConditionParam(condition1, CONDITION_PARAM_STAT_MAGICPOINTS,          50)
setConditionParam(condition1, CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT,  130)
setConditionParam(condition1, CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 130)
 
local condition2 = createConditionObject(CONDITION_HASTE)
setConditionParam(condition2, CONDITION_PARAM_TICKS, -1)
setConditionFormula(condition2, 2.5, 0, 3.0, 0)
 
local area = createCombatArea({
    {0, 0, 0, 1, 0, 0, 0},
    {0, 1, 0, 0, 0, 1, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {1, 0, 0, 2, 0, 0, 1},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 1, 0, 0, 0, 1, 0},
    {0, 0, 0, 1, 0, 0, 0}
})
 
local animCombat =
{
    createCombatObject(),
    createCombatObject()
}
 
local sexyEffect =
{
    CONST_ME_FIREWORK_RED,
    CONST_ME_FIREWORK_YELLOW,
    CONST_ME_MAGIC_RED,
    CONST_ME_MAGIC_GREEN
}
 
setCombatParam(animCombat[2], COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
setCombatParam(animCombat[2], COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)
setCombatParam(animCombat[1], COMBAT_PARAM_EFFECT, CONST_ME_FIREWORK_RED)
setCombatParam(animCombat[1], COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
 
setCombatArea(animCombat[2], area)
setCombatArea(animCombat[1], area)
 
local function StopSuperForm(cid)
    if (getPlayerStorageValue(cid, storage) == 1) then
        setPlayerStorageValue(cid, storage, 0)
        doRemoveCondition(cid, CONDITION_OUTFIT)
        doRemoveCondition(cid, CONDITION_ATTRIBUTES)
        doRemoveCondition(cid, CONDITION_HASTE)
    end
    return TRUE
end
 
local function SuperForm(cid, sexIndex)
    if (isCreature(cid)) then
        if (getPlayerStorageValue(cid, storage) == 1) then
            local goldLeft = getPlayerMoney(cid)
            if (goldLeft >= wastingQuantity) then
                local position = getCreaturePosition(cid)
                doPlayerRemoveMoney(cid, wastingQuantity)
                doSendMagicEffect(position, sexyEffect[sexIndex + 2])
                doSendMagicEffect(position, sexyEffect[sexIndex])
                if (goldLeft <= lowSupplyMargin and warnOnLowSupply == TRUE) then	
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Coins left: " ..((goldLeft - wastingQuantity) / 10000) .. "! Your bangle will be destroyed if you run out with it on!")
                end
                addEvent(SuperForm, wastingInterval, cid, sexIndex)
            else
	    	        doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your bangle has been destroyed!")
                doPlayerRemoveItem(cid, 2127, 1)
                return StopSuperForm(cid)
            end
        end
    end
end

local ctfArena = {
  frompos = {x=659, y=483, z=7},
  topos = {x=769, y=569, z=7},
}

local warArena = {
  frompos = {x=638, y=711, z=7},
  topos = {x=751, y=780, z=7},
}

local waitingRoom = {
  frompos = {x=617, y=625, z=7},
  topos = {x=652, y=654, z=7},
}

 
function onEquip(cid, item, slot)

if isInArea(getPlayerPosition(cid), warArena.frompos, warArena.topos) or isInArea(getPlayerPosition(cid), ctfArena.frompos, ctfArena.topos) or isInArea(getPlayerPosition(cid), waitingRoom.frompos, waitingRoom.topos) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cannot use your bangle in a team pvp event.")
return true
end
    if (getPlayerMoney(cid) > triggerQuantity and getPlayerStorageValue(cid, storage) ~= 1) then
        local sexIndex = getPlayerSex(cid) + 1
        doCombat(cid, animCombat[sexIndex], numberToVariant(cid))
        doSetCreatureOutfit(cid, outfit[sexIndex], -1)
        setPlayerStorageValue(cid, storage, 1)
        doAddCondition(cid, condition1)
        doAddCondition(cid, condition2)
		doPlayerRemoveMoney(cid, triggerQuantity-wastingQuantity)
        SuperForm(cid, sexIndex)
    elseif (getPlayerStorageValue(cid, storage) == 1) then
        return true
    else
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You do not have enough coins!")
    end
    return TRUE
end
 
function onDeEquip(cid, item, slot)
    return StopSuperForm(cid)
end