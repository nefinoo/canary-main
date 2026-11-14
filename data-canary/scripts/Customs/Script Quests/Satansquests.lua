local darkStrangerLever = Action()

local spawnPos = Position(494, 1787, 5)

local function spawnSatan(count)
    Game.createMonster("Satan", spawnPos, false, true)

    if count < 5 then
        addEvent(spawnSatan, 10000, count + 1)
    end
end

function darkStrangerLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getId() ~= 2772 then
        player:say("Switch temporarily disabled.", TALKTYPE_MONSTER_SAY)
        return true
    end

    local storage = player:getStorageValue(45000)

    if storage == 5 then
        player:say("Here comes the pain...", TALKTYPE_MONSTER_SAY)

        addEvent(spawnSatan, 5000, 1)

        item:transform(2773)

        Game.createItem(2182, 1, Position(492, 1800, 6))
        Game.createItem(2182, 1, Position(488, 1800, 6))

    elseif storage > 5 then
        player:say("You have already completed this part.", TALKTYPE_MONSTER_SAY)

    else
        player:say("Speak to the Dark Stranger first.", TALKTYPE_MONSTER_SAY)
    end

    return true
end

darkStrangerLever:aid(44995)
darkStrangerLever:register()


local darkStrangerTp = MoveEvent()

local teleportPos = Position(530, 1824, 6)

function darkStrangerTp.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    if player:getStorageValue(45000) == 5 then
        player:addExperience(187500000000)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been rewarded for your efforts.")
        player:teleportTo(teleportPos)
        teleportPos:sendMagicEffect(CONST_ME_TELEPORT)
        player:setStorageValue(45000, 6)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have not completed another part of the quest. Check your quest log.")
    end

    return true
end

darkStrangerTp:aid(44990)
darkStrangerTp:register()

local satansDen = MoveEvent()

local depotPos = Position(517, 840, 7)

function satansDen.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    player:teleportTo(depotPos)

    position:sendMagicEffect(CONST_ME_TELEPORT)
    depotPos:sendMagicEffect(CONST_ME_TELEPORT)

    if player:getStorageValue(45000) == 6 then
        player:setStorageValue(45000, 7)
    end

    return true
end

satansDen:uid(44998)
satansDen:register()


local professorFanglethorn = Action()

function professorFanglethorn.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getStorageValue(45000) ~= 8 then
        return true
    end

    if player:getItemCount(24969) < 1 then
        local watch = player:addItem(24969, 1)

        if watch then
            watch:setActionId(666)
            watch:setAttribute(ITEM_ATTRIBUTE_NAME, "professor fanglethorn's watch")
        end

        player:sendTextMessage(MESSAGE_LOOK, "You have found a watch.")
    else
        player:sendTextMessage(MESSAGE_LOOK, "It is empty.")
    end

    return true
end

professorFanglethorn:aid(44996)
professorFanglethorn:register()


local satanTp = MoveEvent()

local destination = Position(529, 1924, 6)

function satanTp.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    if player:getStorageValue(45000) == 9 then
        player:teleportTo(destination)

        position:sendMagicEffect(CONST_ME_TELEPORT)
        destination:sendMagicEffect(CONST_ME_TELEPORT)

        player:setStorageValue(45000, 10)
    end

    return true
end

satanTp:aid(44994)
satanTp:register()