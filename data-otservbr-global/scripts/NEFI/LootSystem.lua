local config = {
    ["chicken"] = {
        chance = 70, tiers = {
            [{1, 10000}] = {tier = {"**KEY**", true}, effect = {CONST_ME_CHIVALRIOUS_CHALLENGE, true}, itemList = {{2973, 1, 1, 10000, 3500}}, bossname = {"Kaband"}}
        }
    },
	["bat"] = {
        chance = 70, tiers = {
            [{1, 10000}] = {tier = {"**KEY**", true}, effect = {CONST_ME_CHIVALRIOUS_CHALLENGE, true}, itemList = {{2973, 1, 1, 10000, 3500}}, bossname = {"Kaband"}}
        }
    },
	["wolf"] = {
        chance = 70, tiers = {
            [{1, 10000}] = {tier = {"**KEY**", true}, effect = {CONST_ME_CHIVALRIOUS_CHALLENGE, true}, itemList = {{2973, 1, 1, 10000, 3500}}, bossname = {"Kaband"}}
        }
    },
	["bear"] = {
        chance = 70, tiers = {
            [{1, 10000}] = {tier = {"**KEY**", true}, effect = {CONST_ME_CHIVALRIOUS_CHALLENGE, true}, itemList = {{2973, 1, 1, 10000, 3500}}, bossname = {"Kaband"}}
        }
    },
	["troll"] = {
        chance = 85, tiers = {
            [{1, 7500}] = {tier = {"**KEY**", true}, effect = {CONST_ME_CHIVALRIOUS_CHALLENGE, true}, itemList = {{2973, 1, 1, 10000, 3500}}, bossname = {"Kaband"}},
            [{7501, 10000}] = {tier = {"**KEY**", true}, effect = {CONST_ME_CHIVALRIOUS_CHALLENGE, true}, itemList = {{2973, 1, 1, 10000, 3501}}, bossname = {"Metallur"}}
        }
    },
    ["salamander"] = {
        chance = 100, tiers = {
            [{1, 5000}] = {tier = {"**KEY**", true}, effect = {CONST_ME_CHIVALRIOUS_CHALLENGE, true}, itemList = {{2973, 1, 1, 10000, 3500}}, bossname = {"Kaband"}},
            [{5001, 10000}] = {tier = {"**KEY**", true}, effect = {CONST_ME_CHIVALRIOUS_CHALLENGE, true}, itemList = {{2973, 1, 1, 10000, 3501}}, bossname = {"Metallur"}}
        }
    },
}

-- con chance 50 ocupas matar 328, con 150 ocupas matar 64, con 100 ocupas matar 184

local creatureevent = CreatureEvent("onDeath_randomItemDrops")

function creatureevent.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
    local monster = config[creature:getName():lower()]
    -- check if monster is in table
    if monster then
        -- check if corpse item has available space to receive an additional item.
        if corpse:getEmptySlots() > 0 then
            -- check if an additional item will drop.
            if math.random(10000) > monster.chance then
                return true
            end
            -- choose a tier.
            local rand = math.random(10000)
            for chance, index in pairs(monster.tiers) do
                if chance[1] <= rand and chance[2] >= rand then
                    -- create loot list.
                    local rewardItems = {}
                    for i = 1, #index.itemList do
                        if math.random(10000) <= index.itemList[i][4] then
                            rewardItems[#rewardItems + 1] = i
                        end
                    end
                    -- give a random item, if there are any to give.
                    if rewardItems[1] then
                        rand = math.random(#rewardItems)	
												
						local item = Game.createItem(index.itemList[rand][1], math.random(index.itemList[rand][2], index.itemList[rand][3]))
						if item then
							item:setAttribute(ITEM_ATTRIBUTE_NAME, index.bossname[1].." Key")
							item:setActionId(index.itemList[rand][5])
							corpse:addItemEx(item)
						end
                        if index.tier[2] == true then
                            creature:say(index.tier[1], TALKTYPE_MONSTER_SAY, false, nil, creature:getPosition())
                        end
                        if index.effect[2] == true then
                            local position = creature:getPosition()
                            for i = 1, 4 do
                                addEvent(function() position:sendMagicEffect(index.effect[1]) end, (i - 1) * 500)
                            end
                        end
                    end
                    return true
                end
            end
        end
    end
    return true
end

creatureevent:register()