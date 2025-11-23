local bowl = Action()

local monsters = {
    [1] = {name = "Fish", aid = 2000, plural = "a Fish"},
    [2] = {name = "Quara predator", aid = 2013, plural = "an quara predator"},
}

function bowl.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target or not target:isMonster() then
        return false
    end
 
    local MONS = nil
 
    for i = 1, #monsters do
        if target:getName():lower() == monsters[i].name:lower() then
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
    item:setAttribute("description", "It contains "..MONS.plural..".")
    item:setAttribute("aid", MONS.aid)
    return true
end

bowl:id(5928)
bowl:register()

local unBowl = Action()
function unBowl.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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