-- Frozen Hell: supplementary loot for the nine post-1000 hunting-room creatures.
-- Names originate from the map's creature labels. Some local monster Lua files have
-- not yet been pushed to the balancing branch. This callback will affect those
-- monsters only after their types are registered on the server.
--
-- Regular hunting loot only: rewardBoss creatures use reward_chest.lua instead.
-- Chance scale: 100000 = 100%, 100 = 0.10%, 10 = 0.01%.
-- All equipment IDs were checked against data/items/items.xml.
-- Do not add quest-only weapons to regular loot.

local bonusLoot = {
    ["arch angel"] = {
        { id = 3038, chance = 2500 }, -- green gem
        { id = 51670, chance = 1000 }, -- experience scroll
        { id = 3387, chance = 120 }, -- demon helmet (older equipment)
    },
    ["dementor"] = {
        { id = 3037, chance = 3000 }, -- yellow gem
        { id = 6529, chance = 100 }, -- soft boots
        { id = 3389, chance = 90 }, -- demon legs
    },
    ["little puppy"] = {
        { id = 3028, chance = 12000 }, -- small diamond
        { id = 3388, chance = 80 }, -- demon armor
        { id = 6390, chance = 35 }, -- nightmare shield
    },
    ["orshabaal"] = {
        { id = 3038, chance = 2500 }, -- green gem
        { id = 51670, chance = 1500 }, -- experience scroll
        { id = 3387, chance = 90 }, -- demon helmet
    },
    ["hellraiser"] = {
        { id = 3043, chance = 10000 }, -- crystal coin
        { id = 3388, chance = 100 }, -- demon armor
        { id = 37607, chance = 65 }, -- green demon legs
    },
    ["frozenhell guard"] = {
        { id = 51670, chance = 2500 }, -- experience scroll
        { id = 22516, chance = 500 }, -- silver token
        { id = 37608, chance = 60 }, -- green demon armor
    },
    ["venom"] = {
        { id = 22516, chance = 750 }, -- silver token
        { id = 3389, chance = 120 }, -- demon legs
        { id = 37609, chance = 80 }, -- green demon helmet
    },
}

-- Yalahari remains primarily obtainable from the event-token shop.
-- Only the late hunting tiers can obtain one random piece per lucky kill.
-- Requiring level 2500 prevents farming this reward on earlier characters.
local yalahariChance = {
    ["hellraiser"] = 10,        -- 0.010% / kill
    ["frozenhell guard"] = 20, -- 0.020% / kill
    ["venom"] = 35,            -- 0.035% / kill
}
local yalahariIds = { 8864, 8862, 8863, 3423, 23477 }

local callback = EventCallback("FrozenHellPost1000HuntLoot")

function callback.monsterPostDropLoot(monster, corpse)
    if not monster or not corpse then
        return
    end

    local monsterName = monster:getName():lower()
    local candidates = bonusLoot[monsterName]
    if not candidates then
        return
    end

    local playerId = corpse:getCorpseOwner()
    local player = playerId and Player(playerId)
    if not player or not player:canReceiveLoot() then
        return
    end

    local result = {}

    local function addItem(itemId, count)
        if result[itemId] then
            result[itemId].count = result[itemId].count + count
        else
            result[itemId] = { count = count, gut = false }
        end
    end

    for _, drop in ipairs(candidates) do
        if math.random(1, 100000) <= drop.chance then
            addItem(drop.id, 1)
        end
    end

    local chance = yalahariChance[monsterName]
    if chance and player:getLevel() >= 2500 and math.random(1, 100000) <= chance then
        addItem(yalahariIds[math.random(1, #yalahariIds)], 1)
    end

    if next(result) then
        corpse:addLoot(result)
    end
end

callback:register()
