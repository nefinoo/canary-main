local MIN = 250
local MAX = 250
local EMPTY_POTION = 7636

local action = Action()

function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getCondition(CONDITION_EXHAUST_HEAL) then
		player:sendCancelMessage(RETURNVALUE_YOUAREEXHAUSTED)
		return true
	end

	local added = player:addSoul(math.random(MIN, MAX))
	if not added then
		return false
	end
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	player:say("+++ Full Soul Points +++")
	item:remove(1)
	-- player:addItem(EMPTY_POTION, 1)
	return true
end

action:id(52628)
action:register()
