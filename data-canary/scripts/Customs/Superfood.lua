local superFoods = {
    [3578] = { -- fish
		hp = 50,
		mana = 50,
		hpPercent = 1,
		manaPercent = 1,
        removable = true, -- remove food when is used?
        says = "ah."
    },
    [3579] = {--salmon
        hp = 200,
		mana = 200,
		hpPercent = 3,
		manaPercent = 3,	
        removable = true, -- remove food when is used?
        says = "ahh.."
    },
    [3580] = {--northern pike
        hp = 150,
		mana = 100,
		hpPercent = 2,
		manaPercent = 1.5,
        removable = true, -- remove food when is used?
        says = "aahh.."
    },
    [3581] = {--shrim
        hp = 400,
		mana = 250,
		hpPercent = 4,
		manaPercent = 2.5,
        removable = true, -- remove food when is used?
        says = "Ahhh..."
    },
    [7159] = { --green perch
        hp = 350,
		mana = 500,
		hpPercent = 3.5,
		manaPercent = 5,
        removable = true, -- remove food when is used?
        says = "Aahhh..."
    },
    [7158] = { --rainbow trout
        hp = 550,
		mana = 550,
		hpPercent = 6,
		manaPercent = 6,
        removable = true, -- remove food when is used?
        says = "Aaahhh..."
    }
}

-- Shared with data/scripts/actions/items/potions.lua.
local consumableExhaustSubId = 620096
local consumableExhaust = Condition(CONDITION_EXHAUST_HEAL, CONDITIONID_COMBAT, consumableExhaustSubId)
consumableExhaust:setParameter(CONDITION_PARAM_TICKS, 2000)

local action = Action()

function action.onUse(player, item, fromPos, target, toPos, isHotkey)
    local food = superFoods[item.itemid]
    if not food then
        return false
    end

    if player:getCondition(CONDITION_EXHAUST_HEAL, CONDITIONID_COMBAT, consumableExhaustSubId) then
        player:sendCancelMessage(RETURNVALUE_YOUAREEXHAUSTED)
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
            gainHp = math.floor(math.min(gainHp, playerMaxHealth - playerHealth))
            player:addHealth(gainHp)
        end
    end

    local gainMana = 0
    if food.mana or food.manaPercent then
        if playerMana < playerMaxMana then
            gainMana = food.mana or 0
            gainMana = gainMana + (player:getMaxMana() / 100 * (food.manaPercent or 0))
            gainMana = math.floor(math.min(gainMana, playerMaxMana - playerMana))
            player:addMana(gainMana)
        end
    end

    if food.removable then
        item:remove(1)
    end

    player:addCondition(consumableExhaust)

    player:getPosition():sendMagicEffect(570)
    player:say(food.says, TALKTYPE_MONSTER_SAY)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have been fed, You recover %s%s.", (gainHp > 0 and string.format("%d hit points", gainHp) or ""), (gainMana > 0 and string.format("%s%s", (gainHp > 0 and " and " or ""), string.format("%d mana points", gainMana)) or "")))
    return true
end

for id, _ in pairs(superFoods) do
    action:id(id)
end
action:register()