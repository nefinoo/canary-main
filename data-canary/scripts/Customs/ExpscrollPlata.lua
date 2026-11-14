local experienceScroll = {
    id = 0, -- Cambia por el ID del scroll
    config = {
        funnyEffect = "YES", 
        minimumLevel = 50,
        maximumLevel = 99999, -- para infinito usar math.huge
    },
    
    addExp = {
		[{8, 50}] = 3500000,
		[{50, 100}] = 10000000,
		[{100, 200}] = 13000000,
		[{200, 300}] = 15000000,
		[{300, 400}] = 20000000,
		[{400, 500}] = 30000000,
		[{500, 600}] = 40000000,
		[{600, 1000}] = 60000000,
		[{1000, 2000}] = 90000000,
		[{2000, 3000}] = 250000000,
		[{3000, 4000}] = 300000000,
		[{4000, 5000}] = 350000000,
		[{5000, 6000}] = 400000000,
		[{6000, 7000}] = 450000000,
		[{7000, 8000}] = 500000000,
		[{8000, 9000}] = 550000000,
		[{9000, 10000}] = 600000000,
		[{10000, 11000}] = 650000000,
		[{11000, 12000}] = 700000000,
		[{12000, 13000}] = 750000000,
		[{13000, 14000}] = 800000000,
		[{14000, 15000}] = 850000000,
		[{15000, 16000}] = 900000000,
		[{16000, 17000}] = 950000000,
		[{17000, 18000}] = 1000000000,
		[{18000, 19000}] = 1050000000,
		[{19000, 20000}] = 1100000000,
		[{20000, 99999}] = 1200000000
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
scrollAction:id(51671)
scrollAction:register()