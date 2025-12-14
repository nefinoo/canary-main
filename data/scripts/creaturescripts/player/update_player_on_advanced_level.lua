local updatePlayerOnAdvancedLevel = CreatureEvent("UpdatePlayerOnAdvancedLevel")

local levels = {300033, 300050, 300080, 300100, 300200, 300300, 300400, 300500, 300600, 300700, 300800, 300900, 301000, 301500, 302000, 302500}

function updatePlayerOnAdvancedLevel.onAdvance(player, skill, oldLevel, newLevel)
	local position = player:getPosition()
	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end 
	for _, storageId in ipairs(levels) do
        local targetLevel = tonumber(string.sub(storageId, 4)) -- extrae la parte numérica (ej: "33" de "300033")
        
        if newLevel >= targetLevel then
            if player:getStorageValue(storageId) < 1 then
                player:setStorageValue(storageId, 1)
            end
        end
    end
	-- player:addHealth(player:getMaxHealth())
	-- player:addMana(player:getMaxMana())
	player:getFinalLowLevelBonus()
	player:getFinalLowLevelBonus()
	player:getPosition():sendMagicEffect(284)
	player:save()
	return true
end

updatePlayerOnAdvancedLevel:register()
