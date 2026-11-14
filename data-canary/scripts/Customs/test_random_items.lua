
local bagId = 12413
local bagsToSimulate = 200

local loot = {
    { from = 1, to = 1442, itemId = 3123 },
    { from = 1443, to = 2856, itemId = 19148 },
    { from = 2857, to = 4262, itemId = 2996 },
    { from = 4263, to = 4819, itemId = 3031, count = 6 },
    { from = 4820, to = 5325, itemId = 3723 },
    { from = 5326, to = 5813, itemId = 5890 },
    { from = 5814, to = 6283, itemId = 3492, count = 10 },
    { from = 6284, to = 6751, itemId = 3606 },
    { from = 6752, to = 7175, itemId = 5899 },
    { from = 7176, to = 7576, itemId = 5894 },
    { from = 7577, to = 7949, itemId = 9689 },
    { from = 7950, to = 8315, itemId = 3035 },
    { from = 8316, to = 8673, itemId = 8031 },
    { from = 8674, to = 8972, itemId = 5902 },
    { from = 8973, to = 9187 },
    { from = 9188, to = 9328, itemId = 3008 },
    { from = 9329, to = 9428, itemId = 3083 },
    { from = 9429, to = 9515, itemId = 12787 },
    { from = 9516, to = 9594, itemId = 3026 },
    { from = 9595, to = 9666, itemId = 5879 },
    { from = 9667, to = 9732, itemId = 2995 },
    { from = 9733, to = 9791, itemId = 12786 },
    { from = 9792, to = 9845, itemId = 9646 },
    { from = 9846, to = 9891, itemId = 2991 },
    { from = 9892, to = 9929, itemId = 5895 },
    { from = 9930, to = 9967, itemId = 5880 },
    { from = 9968, to = 9998, itemId = 12519 },
    { from = 9999, to = 10001, itemId = 3079 },
}

local testLoot = TalkAction("!testloot200")

function testLoot.onSay(player, words, param)
    local results = {}
    local nothing = 0

    for i = 1, bagsToSimulate do
        local roll = math.random(10001)

        for _, entry in ipairs(loot) do
            if roll >= entry.from and roll <= entry.to then
                if entry.itemId then
                    local id = entry.itemId
                    local count = entry.count or 1

                    if not results[id] then
                        results[id] = {
                            count = 0,
                            times = 0
                        }
                    end

                    results[id].count = results[id].count + count
                    results[id].times = results[id].times + 1
                else
                    nothing = nothing + 1
                end

                break
            end
        end
    end

    player:sendTextMessage(
        MESSAGE_LOOK,
        "===== SIMULACION DE LOOT ====="
    )

    player:sendTextMessage(
        MESSAGE_LOOK,
        "Bolsas simuladas: " .. bagsToSimulate
    )

    for id, data in pairs(results) do
        local itemType = ItemType(id)
        local name = itemType:getName()

        player:sendTextMessage(
            MESSAGE_LOOK,
            name .. " (ID " .. id .. "): " ..
            data.count .. " unidades, obtenido " ..
            data.times .. " veces."
        )
    end

    player:sendTextMessage(
        MESSAGE_LOOK,
        "Bolsas sin objeto util: " .. nothing
    )

    player:sendTextMessage(
        MESSAGE_LOOK,
        "===== FIN DE SIMULACION ====="
    )

    return false
end

testLoot:groupType("normal")
testLoot:register()
