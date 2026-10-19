local bowl = Action()

local monsters = {
    [1] = {name = "Ryujin", aid = 28001, plural = "a Ryujin"},
    [2] = {name = "Caribdis", aid = 28002, plural = "an Caribdis"},
    [3] = {name = "Escila", aid = 28003, plural = "an Escila"},
    [4] = {name = "Leaviathan", aid = 28004, plural = "an Leaviathan"},
    [5] = {name = "Shesha", aid = 28005, plural = "an Shesha"},
    [6] = {name = "Sigma", aid = 28006, plural = "an Sigma"},
    [7] = {name = "Cicno", aid = 28007, plural = "an Cicno"},
    [8] = {name = "Oceanus", aid = 28008, plural = "an Oceanus"},
}

function bowl.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target or not target:isMonster() then
        return false
    end
 
    local MONS = nil
 
    for i = 1, #monsters do
        if target:getName() == monsters[i].name then
            MONS = monsters[i]
            break
        end
    end
 
    if not MONS then
        return player:sendCancelMessage("You cannot bowl that monster.")
    end
 
    if FISHINGMONSTERS[target:getId()] then
        if FISHINGMONSTERS[target:getId()].owner ~= player:getName() then
            return player:sendCancelMessage("That is not yours to bowl.")
        end
    else
        if player:getAccountType() < ACCOUNT_TYPE_GOD then
            return player:sendCancelMessage("That is not yours to bowl.")
        end
    end
 
    FISHINGMONSTERS[target:getId()] = nil
    target:remove()
    item:transform(5929)
	item:setAttribute("description", "It contains "..MONS.plural..".\nOwner: "..player:getName())
    item:setAttribute("aid", MONS.aid)
    return true
end

bowl:id(5928)
bowl:register()

local unBowl = Action()
function unBowl.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local description = item:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION)

	if not description or not description:find("Owner: "..player:getName()) then
		return player:sendCancelMessage("You are not the owner of this bowl.")
	end
	
    local MONS = nil
    for i = 1, #monsters do
        if item.actionid == monsters[i].aid then
            MONS = monsters[i]
            break
        end
    end
 
    if not MONS then return false end
 
    local pos = item:getPosition()
 
    local MONSTER = Game.createMonster(MONS.name, pos)
 
    if MONSTER then
        FISHINGMONSTERS[MONSTER:getId()] = {owner = player:getName(), status = 2}
        item:remove(1)
    else
        return player:sendCancelMessage("Could not unbowl monster.")
    end
    return true
end

unBowl:id(5929)
unBowl:register()