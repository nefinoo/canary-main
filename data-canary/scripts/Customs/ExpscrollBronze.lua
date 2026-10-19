local experienceScroll = {
    id = 0, -- Cambia por el ID del scroll
    config = {
        funnyEffect = "YES", 
        minimumLevel = 50,
        maximumLevel = 99999, -- para infinito usar math.huge
    },
    
    addExp = {
        [{8, 50}] = 1700000,
		[{50, 100}] = 5000000,
		[{100, 200}] = 6500000,
		[{200, 300}] = 7500000,
		[{300, 400}] = 10000000,
		[{400, 500}] = 15000000,
		[{500, 600}] = 20000000,
		[{600, 1000}] = 30000000,
		[{1000, 2000}] = 45000000,
		[{2000, 3000}] = 125000000,
		[{3000, 4000}] = 150000000,
		[{4000, 5000}] = 175000000,
		[{5000, 6000}] = 200000000,
		[{6000, 7000}] = 225000000,
		[{7000, 8000}] = 250000000,
		[{8000, 9000}] = 275000000,
		[{9000, 10000}] = 300000000,
		[{10000, 11000}] = 325000000,
		[{11000, 12000}] = 350000000,
		[{12000, 13000}] = 375000000,
		[{13000, 14000}] = 400000000,
		[{14000, 15000}] = 425000000,
		[{15000, 16000}] = 450000000,
		[{16000, 17000}] = 475000000,
		[{17000, 18000}] = 500000000,
		[{18000, 19000}] = 525000000,
		[{19000, 20000}] = 550000000,
		[{20000, 99999}] = 600000000
    },
    
    getExperienceForLevel = function(self, level)
        for levelRange, exp in pairs(self.addExp) do
            if level >= levelRange[1] and level < levelRange[2] then
                return exp
            end
        end
        return 0
    end,
    
    sendFireworkEffects = function(self, player, expAmount)
		local pos = player:getPosition()

		local positions = {
			{x = pos.x + 1, y = pos.y - 1, z = pos.z},
			{x = pos.x - 1, y = pos.y - 1, z = pos.z},
			{x = pos.x + 1, y = pos.y + 1, z = pos.z},
			{x = pos.x - 1, y = pos.y + 1, z = pos.z},
			{x = pos.x + 1, y = pos.y, z = pos.z},
			{x = pos.x - 1, y = pos.y, z = pos.z},
			{x = pos.x, y = pos.y + 1, z = pos.z},
			{x = pos.x, y = pos.y - 1, z = pos.z}
		}

		for i = 1, #positions do
			Position(positions[i]):sendMagicEffect(math.random(CONST_ME_FIREWORK_YELLOW, CONST_ME_FIREWORK_BLUE))
		end

		pos:sendAnimatedText(tostring(expAmount), TEXTCOLOR_RED)
	end
}

local scrollAction = Action()

function scrollAction.onUse(player, item, fromPos, target, toPos, isHotkey)
    local level = player:getLevel()
    local config = experienceScroll.config
    
    -- Verificar nivel mínimo
    if level < config.minimumLevel then
        player:sendCancelMessage("You need to be at least " .. config.minimumLevel .. " to use a scroll.")
        return true
    end
    
    -- Verificar nivel máximo
    if level >= config.maximumLevel then
        player:sendCancelMessage("Your level is too high for using a scroll.")
        return true
    end
    
    -- Obtener experiencia correspondiente al nivel
    local expToAdd = experienceScroll:getExperienceForLevel(level)
    
    if expToAdd > 0 then
        -- Añadir experiencia
        player:addExperience(expToAdd)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Experience Scroll Gave You " .. expToAdd .. " experience!")
        
        -- Efectos visuales si están activados
        if config.funnyEffect == "YES" then
            experienceScroll:sendFireworkEffects(player, expToAdd)
        end
        
        -- Consumir el scroll
        item:remove(1)
    else
        player:sendCancelMessage("No experience defined for your level range.")
    end
    
    return true
end

-- Cambia el 0 por el ID real de tu scroll
scrollAction:id(51670)
scrollAction:register()