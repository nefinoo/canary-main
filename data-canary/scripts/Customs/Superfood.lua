local superFoods = {
    [3578] = {
        hp = 1000,
        mana = 1000,
        hpPercent = 1,
        manaPercent = 1,
        removable = true, -- remove food when is used?
        exhaustedTime = 1, -- 3 seconds
        says = "Aaahhh..."
    },
    [3579] = {--salmon
        hp = 4500,
        mana = 4500,
        hpPercent = 2,
        manaPercent = 2,
        removable = true, -- remove food when is used?
        exhaustedTime = 1, -- 3 seconds
        says = "Aaahhh..."
    },
    [3580] = {--northern pike
        hp = 2500,
        mana = 2500,
        hpPercent = 2,
        manaPercent = 2,
        removable = true, -- remove food when is used?
        exhaustedTime = 1, -- 3 seconds
        says = "Aaahhh..."
    },
    [3581] = {--shrim
        hp = 2500,
        mana = 2500,
        hpPercent = 1.5,
        manaPercent = 1.5,
        removable = true, -- remove food when is used?
        exhaustedTime = 1, -- 3 seconds
        says = "Aaahhh..."
    },
    [7158] = { --green perch
        hp = 7000,
        mana = 7000,
        hpPercent = 3,
        manaPercent = 3,
        removable = true, -- remove food when is used?
        exhaustedTime = 1, -- 3 seconds
        says = "Aaahhh..."
    },
    [7159] = { --rainbow trout
        hp = 10000,
        mana = 10000,
        hpPercent = 3.5,
        manaPercent = 3.5,
        removable = true, -- remove food when is used?
        exhaustedTime = 1, -- 3 seconds
        says = "Aaahhh..."
    }
}

local exhausteds = {}

local action = Action()

function action.onUse(player, item, fromPos, target, toPos, isHotkey)
    local food = superFoods[item.itemid]
    if not food then
        return false
    end

    local playerId = player:getId()
    local exhausted = exhausteds[playerId]
    if exhausted and os.time() < exhausted then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are exhausted.")
		return true
	end

    local playerHealth = player:getHealth()
    local playerMaxHealth = player:getMaxHealth()
    local playerMana = player:getMana()
    local playerMaxMana = player:getMaxMana()
    if playerHealth == playerMaxHealth and playerMana == playerMaxMana then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are already at full health and mana.")
        return true
    end

    local gainHp = 0
    if food.hp or food.hpPercent then
        if playerHealth < playerMaxHealth then
            gainHp = food.hp or 0
            gainHp = gainHp + (player:getMaxHealth() / 100 * (food.hpPercent or 0))
            gainHp = math.min(gainHp, playerMaxHealth - playerHealth)
            player:addHealth(gainHp)
        end
    end

    local gainMana = 0
    if food.mana or food.manaPercent then
        if playerMana < playerMaxMana then
            gainMana = food.mana or 0
            gainMana = gainMana + (player:getMaxMana() / 100 * (food.manaPercent or 0))
            gainMana = math.min(gainMana, playerMaxMana - playerMana)
            player:addMana(gainMana)
        end
    end

    if food.removable then
        item:remove(1)
    end

    if food.exhaustedTime then
        exhausteds[playerId] = os.time() + food.exhaustedTime
    end

    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    player:say(food.says, TALKTYPE_MONSTER_SAY)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have been fed, You recover %s%s.", (gainHp > 0 and string.format("%d hit points", gainHp) or ""), (gainMana > 0 and string.format("%s%s", (gainHp > 0 and " and " or ""), string.format("%d mana points", gainMana)) or "")))
    return true
end

for id, _ in pairs(superFoods) do
    action:id(id)
end
action:register()