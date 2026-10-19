local experienceScroll = {
    id = 0, -- Cambia por el ID del scroll
    config = {
        funnyEffect = "YES", 
        minimumLevel = 50,
        maximumLevel = 99999, -- para infinito usar math.huge
    },
    
    addExp = {
		[{8, 50}] = 14000000,
		[{50, 100}] = 40000000,
		[{100, 200}] = 52000000,
		[{200, 300}] = 60000000,
		[{300, 400}] = 80000000,
		[{400, 500}] = 120000000,
		[{500, 600}] = 160000000,
		[{600, 1000}] = 240000000,
		[{1000, 2000}] = 360000000,
		[{2000, 3000}] = 1000000000,
		[{3000, 4000}] = 1200000000,
		[{4000, 5000}] = 1400000000,
		[{5000, 6000}] = 1600000000,
		[{6000, 7000}] = 1800000000,
		[{7000, 8000}] = 2000000000,
		[{8000, 9000}] = 2200000000,
		[{9000, 10000}] = 2400000000,
		[{10000, 11000}] = 2600000000,
		[{11000, 12000}] = 2800000000,
		[{12000, 13000}] = 3000000000,
		[{13000, 14000}] = 3200000000,
		[{14000, 15000}] = 3400000000,
		[{15000, 16000}] = 3600000000,
		[{16000, 17000}] = 3800000000,
		[{17000, 18000}] = 4000000000,
		[{18000, 19000}] = 4200000000,
		[{19000, 20000}] = 4400000000,
		[{20000, 99999}] = 4800000000
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
scrollAction:id(51672)
scrollAction:register()