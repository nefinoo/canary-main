local pisolvl = MoveEvent()


function pisolvl.onStepIn(creature, item, position, fromPosition)
	-- Solo jugadores
	local player = creature:getPlayer()
	if not player then
		return true
	end

	-- Comprobar si tiene el almacenamiento requerido
	if player:getLevel() < 2500 then
		player:teleportTo(fromPosition, false)
        player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You need level 2500+ to pass.")
	end
	return true
end

-- UID de la palanca
pisolvl:aid(10004)
pisolvl:register()

local door = Action()


function door.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(10003) <= 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
		return true
	end
		
	if item.itemid == 9558 then
		player:teleportTo(toPosition, true)
		item:transform(item.itemid + 1)
	elseif item.itemid == 9559 then
		if item.itemid == 9559 then
			item:transform(item.itemid - 1)
			return true
		end
	end

	return true
end

-- UID de la palanca
door:aid(10003)
door:register()


local lever = Action()

-- 📍 Posiciones de los jugadores requeridos
local playerPositions = {
	-- Position(1524, 1532, 8),
	-- Position(1524, 1533, 8),
	Position(1529, 1532, 8),
	-- Position(1529, 1533, 8)
}

-- 📍 Posiciones de los muros que se eliminarán
local wallPositions = {
	Position(1526, 1530, 8),
	Position(1527, 1530, 8)
}

-- ⚙️ Configuración
local requiredLevel = 2500
local leverOn = 8913
local leverOff = 8914
local wallId = 9273
local resetTime = 30 -- segundos

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- Si intenta usar la palanca mientras está activa
	if item.itemid == leverOff then
		player:sendCancelMessage("Sorry, not possible right now.")
		return true
	end

	-- Verificar jugadores
	local validPlayers = {}
	for i, pos in ipairs(playerPositions) do
		local tile = Tile(pos)
		if not tile then
			player:sendCancelMessage("Tile not found.")
			return true
		end

		local creature = tile:getTopCreature()
		if not creature or not creature:isPlayer() then
			player:sendCancelMessage("Requires 4 players standing on the correct tiles.")
			return true
		end

		if creature:getLevel() < requiredLevel then
			player:sendCancelMessage("All players must be level " .. requiredLevel .. " or higher.")
			return true
		end

		table.insert(validPlayers, creature)
	end

	-- Si todos los jugadores cumplen los requisitos
	for _, pos in ipairs(wallPositions) do
		local wall = Tile(pos):getItemById(wallId)
		if wall then
			wall:remove()
			pos:sendMagicEffect(CONST_ME_FIREAREA)
		end
	end

	item:transform(leverOff)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The path is now open for 30 seconds!")

	-- 🔁 Función para restaurar los muros y la palanca
	addEvent(function()
		for _, pos in ipairs(wallPositions) do
			if not Tile(pos):getItemById(wallId) then
				Game.createItem(wallId, 1, pos)
				pos:sendMagicEffect(CONST_ME_BLOCKHIT)
			end
		end

		local leverItem = Tile(fromPosition):getItemById(leverOff)
		if leverItem then
			leverItem:transform(leverOn)
		end
	end, resetTime * 1000)

	return true
end

-- UID de la palanca
lever:uid(10023)
lever:register()


local spiritCheck = MoveEvent()

-- ⚙️ Configuración de storages y mensajes
local throneStorages = {
	[10005] = 10000, -- Primer trono
	[10006] = 10001, -- Segundo trono
	[10007] = 10002, -- Tercer trono
	[10008] = 10003  -- Cuarto trono
}

local message = "You have not absorbed enough spirit."

function spiritCheck.onStepIn(creature, item, position, fromPosition)
	-- Solo jugadores
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local storage = throneStorages[item.uid]
	if not storage then
		return true
	end

	-- Comprobar si tiene el almacenamiento requerido
	if player:getStorageValue(storage) <= 0 then
		player:teleportTo(fromPosition, false)
        player:sendTextMessage(MESSAGE_ADMINISTRATOR, message)
	end
	return true
end

-- 🔗 Registrar cada uniqueid del XML original
spiritCheck:uid(10005)
spiritCheck:uid(10006)
spiritCheck:uid(10007)
spiritCheck:uid(10008)
spiritCheck:register()

local firstThrone = MoveEvent()

-- Configuración del área donde se revisan los monstruos
local areaStart = {x = 1520, y = 1526, z = 7}
local areaEnd   = {x = 1534, y = 1542, z = 7}

local first_throne_storage = 10000

function firstThrone.onStepIn(creature, item, position, fromPosition)
    if not creature:isPlayer() then
        return true
    end

    local totalMonsters = 0
    -- Recorre el área definida
    for x = areaStart.x, areaEnd.x do
        for y = areaStart.y, areaEnd.y do
            local tile = Tile(Position(x, y, areaStart.z))
            if tile then
                local topCreature = tile:getTopCreature()
                if topCreature and topCreature:isMonster() then
                    totalMonsters = totalMonsters + 1
                end
            end
        end
    end

    -- Si no hay monstruos y el jugador aún no tocó el trono
    if item.uid == 10000 and totalMonsters == 0 then
        if creature:getStorageValue(first_throne_storage) <= 0 then
            creature:setStorageValue(first_throne_storage, 1)
            creature:say("The Throne is too powerful for you to sit, you are shaken and absorb part of the spirit of Asmoday.")
        else
            creature:teleportTo(fromPosition)
            creature:say("You have already touched the throne.")
        end
    else
        creature:teleportTo(fromPosition)
        creature:say("Asmoday repells you.")
    end

    return true
end

firstThrone:type("stepin")
firstThrone:uid(10000)
firstThrone:register()


local secondThrone = MoveEvent()

-- Configuración del área donde se revisan los monstruos
local areaStart = {x = 1520, y = 1526, z = 6}
local areaEnd   = {x = 1532, y = 1541, z = 6}

local second_throne_storage = 10001

function secondThrone.onStepIn(creature, item, position, fromPosition)
    if not creature:isPlayer() then
        return true
    end

    local totalMonsters = 0

    -- Recorre el área definida
    for x = areaStart.x, areaEnd.x do
        for y = areaStart.y, areaEnd.y do
            local tile = Tile(Position(x, y, areaStart.z))
            if tile then
                local topCreature = tile:getTopCreature()
                if topCreature and topCreature:isMonster() then
                    totalMonsters = totalMonsters + 1
                end
            end
        end
    end

    -- Si no hay monstruos y el jugador aún no tocó el trono
    if item.uid == 10001 and totalMonsters == 0 then
        if creature:getStorageValue(second_throne_storage) <= 0 then
            creature:setStorageValue(second_throne_storage, 1)
            creature:say("The Throne is too powerful for you to sit, you are shaken and absorb part of the spirit of Mephistopheles.")
        else
            creature:teleportTo(fromPosition)
            creature:say("You have already touched the throne.")
        end
    else
        creature:teleportTo(fromPosition)
        creature:say("Mephistopheles repells you.")
    end

    return true
end

secondThrone:type("stepin")
secondThrone:uid(10001)
secondThrone:register()


local fourthThrone = MoveEvent()

-- Configuración del área donde se verifican los monstruos
local areaStart = {x = 1520, y = 1526, z = 4}
local areaEnd   = {x = 1532, y = 1541, z = 4}

local fourth_throne_storage = 10003

function fourthThrone.onStepIn(creature, item, position, fromPosition)
    if not creature:isPlayer() then
        return true
    end

    local totalMonsters = 0

    -- Recorre el área para contar monstruos
    for x = areaStart.x, areaEnd.x do
        for y = areaStart.y, areaEnd.y do
            local tile = Tile(Position(x, y, areaStart.z))
            if tile then
                local topCreature = tile:getTopCreature()
                if topCreature and topCreature:isMonster() then
                    totalMonsters = totalMonsters + 1
                end
            end
        end
    end

    -- Condiciones de activación del trono
    if item.uid == 10003 and totalMonsters == 0 then
        if creature:getStorageValue(fourth_throne_storage) <= 0 then
            creature:setStorageValue(fourth_throne_storage, 1)
            creature:say("The Throne is too powerful for you to sit, you are shaken and absorb part of the spirit of Naberius.")
        else
            creature:teleportTo(fromPosition)
            creature:say("You have already touched the throne.")
        end
    else
        creature:teleportTo(fromPosition)
        creature:say("Naberius repells you.")
    end

    return true
end

fourthThrone:type("stepin")
fourthThrone:uid(10003)
fourthThrone:register()



local thirdThrone = MoveEvent()

-- ⚙️ CONFIGURACIÓN DEL ÁREA A REVISAR
local areaStart = Position(1520, 1526, 5)
local areaEnd = Position(1532, 1541, 5)
local throneStorage = 10002

function thirdThrone.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local totalMonsters = 0

	-- 🔍 Revisión del área en busca de criaturas
	for x = areaStart.x, areaEnd.x do
		for y = areaStart.y, areaEnd.y do
			local tile = Tile(x, y, areaStart.z)
			if tile then
				local topCreature = tile:getTopCreature()
				if topCreature and topCreature:isMonster() then
					totalMonsters = totalMonsters + 1
				end
			end
		end
	end

	-- ⚔️ Condiciones según monstruos y storage
	if item.uid == 10002 then
		if totalMonsters == 0 then
			if player:getStorageValue(throneStorage) <= 0 then
				player:setStorageValue(throneStorage, 1)
				player:say("The Throne is too powerful for you to sit, you are shaken and absorb part of the spirit of Semiazas.")
				position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			else
				player:teleportTo(fromPosition, false)
				player:say("You have already touched the throne.")
			end
		else
			player:teleportTo(fromPosition, false)
			player:say("Semiazas repels you.")
			position:sendMagicEffect(CONST_ME_POFF)
		end
	end
	return true
end

-- 🔗 Registrar el UID del trono
thirdThrone:uid(10002)
thirdThrone:register()
