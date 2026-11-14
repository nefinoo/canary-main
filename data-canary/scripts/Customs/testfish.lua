local testFish = TalkAction("/testfish")

function testFish.onSay(player, words, param)

    local attempts = 100
    local results = {}

    -- Selecciona la tabla que quieres probar
    local fishingMonsters = waterMonsters

    local difficulty = 2.10
    local skillModifier = player:getSkillLevel(SKILL_FISHING) / 100
    difficulty = difficulty - math.abs(skillModifier)

    local realMonsterChance = catchMonstersRandom * difficulty

    for i = 1, attempts do

        local finalChance = math.random(1, realMonsterChance)
        local caught = false

        for _, monster in ipairs(fishingMonsters) do
            if player:getLevel() >= monster.level
            and player:getSkillLevel(SKILL_FISHING) >= monster.fishing
            and finalChance <= monster.chance then

                results[monster.name] = (results[monster.name] or 0) + 1
                caught = true
                break
            end
        end

        if not caught then
            results["Nothing"] = (results["Nothing"] or 0) + 1
        end
    end

    local text = "=== Fishing Test (" .. attempts .. " casts) ===\n\n"

    for name, amount in pairs(results) do
        text = text .. name .. ": " .. amount .. "\n"
    end

    player:showTextDialog(1950, text)
    return false
end

testFish:separator(" ")
testFish:groupType("normal")
testFish:register()