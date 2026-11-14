-- Backpack of Worms (RevScript - Canary)
-- Adaptado por ChatGPT

local bpWorms = Action()

-- Unique ID configurado en items.xml o mapa: 1001
local COST = 100000 -- 1kk gold
local BP_ID = 5949 -- ID del backpack
local WORM_ID = 3492 -- ID del worm
local STACK_COUNT = 100 -- cantidad por stack
local TOTAL_STACKS = 1 -- cuántos stacks agregar

function bpWorms.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getMoney() < COST then
        player:sendTextMessage(MESSAGE_ADMINISTRATOR, "Sorry, you do not have enough money.")
        player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You need " .. COST .. " gold to buy a backpack of worms.")
        return true
    end

    player:removeMoney(COST)
    -- local bp = player:addItem(BP_ID, 1)
    -- if not bp then
        -- player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You don't have space for the backpack.")
        -- return true
    -- end

    for i = 1, TOTAL_STACKS do
        player:addItem(WORM_ID, STACK_COUNT)
    end

    player:sendTextMessage(MESSAGE_LOOK,
        string.format("You bought a backpack of worms for %d gold.", COST))
    return true
end

bpWorms:uid(1002)
bpWorms:register()
