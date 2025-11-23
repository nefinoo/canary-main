local stairConfig = {
	stairId = 1977,
	stairPosition = Position(612, 834, 12)
}

local kalazurEntrance = MoveEvent()
kalazurEntrance:type("stepin")

function kalazurEntrance.onStepIn(creature, item, position, fromPosition)
	if creature:isPlayer() then
		Game.createItem(stairConfig.stairId, 1, stairConfig.stairPosition)
	end
	return true
end

kalazurEntrance:uid(20000)
kalazurEntrance:register()

kalazurEntrance = MoveEvent()
kalazurEntrance:type("stepout")

function kalazurEntrance.onStepOut(creature, item, position, fromPosition)
	if creature:isPlayer() then
		local tile = Tile(stairConfig.stairPosition)
		if tile then
			local stair = tile:getItemById(stairConfig.stairId)
			if stair then
				stair:remove()
			end
		end
	end
	return true
end

kalazurEntrance:uid(20000)
kalazurEntrance:register()


local unblockEntrance = Action()

local config = {
	lit = 2065,
	notLit = 2064,
	stoneId = 1846,
	resetTime = 30, -- minutos
	stonePosition = Position(596, 850, 12)
}

local function resetEntrance(itemUid)
	local item = Item(itemUid)
	if not item then
		return
	end

	local tile = Tile(config.stonePosition)
	if tile then
		local stone = tile:getTopDownItem()
		if not stone or stone:getId() ~= config.stoneId then
			Game.createItem(config.stoneId, 1, config.stonePosition)
			item:transform(config.notLit)
		end
	end
end

function unblockEntrance.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item:getId() == config.notLit then
		addEvent(resetEntrance, config.resetTime * 60 * 1000, item.uid)
		item:transform(config.lit)
		config.stonePosition:sendMagicEffect(CONST_ME_FIREAREA)

		local tile = Tile(config.stonePosition)
		if tile then
			
			local stone = Tile(config.stonePosition):getItemById(config.stoneId)
			if stone then
				stone:remove()
			end
		end
	end
	return true
end

unblockEntrance:uid(20001)
unblockEntrance:register()


local door = Action()


function door.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(20000) <= 3 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders...")
		return true
	end
		
	if item.itemid == 6260 then
		player:teleportTo(toPosition, true)
		item:transform(item.itemid + 1)
	elseif item.itemid == 6261 then
		item:transform(item.itemid - 1)
	end

	return true
end

-- UID de la palanca
door:aid(20001)
door:register()

local sealFlame = MoveEvent()

local config = {
	portalRoom = Position(616, 858, 11),
	treasureRoom = Position(617, 886, 11),
	sealAids = {20002, 20003, 20004, 20005, 20006, 20007},
	treasureAid = 20008
}

function sealFlame.onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return true
	end

	local player = creature
	local actionId = item:getActionId()

	-- SEALS --
	if table.contains(config.sealAids, actionId) then
		if player:getStorageValue(actionId) <= 0 then
			player:setStorageValue(actionId, 1)
			player:teleportTo(fromPosition, true)
			position:sendMagicEffect(CONST_ME_FIREAREA)
			fromPosition:sendMagicEffect(CONST_ME_FIREAREA)
		else
			player:teleportTo(fromPosition, true)
			position:sendMagicEffect(CONST_ME_POFF)
			fromPosition:sendMagicEffect(CONST_ME_POFF)
			player:say("You have already touched this seal.")
		end
		return true
	end

	-- TREASURE CHECK --
	if actionId == config.treasureAid then
		local seals = {20002, 20003, 20004, 20005, 20006, 20007}
		local allDone = true

		for _, sid in ipairs(seals) do
			if player:getStorageValue(sid) <= 0 then
				allDone = false
				break
			end
		end

		if allDone then
			player:teleportTo(config.treasureRoom, false)
			position:sendMagicEffect(CONST_ME_FIREAREA)
			config.treasureRoom:sendMagicEffect(CONST_ME_FIREAREA)
		else
			player:teleportTo(fromPosition, false)
			position:sendMagicEffect(CONST_ME_POFF)
			creature:say("You have not absorbed enough energy.")
		end
	end
	return true
end

sealFlame:type("stepin")
sealFlame:id(1959)
sealFlame:register()

local moveRock = Action()

local config = {
	notOpen = 8978,
	open = 8979,
	stoneID = 1846,
	resetTime = 30, -- minutos
	stonePos = Position(634, 935, 11)
}

local function resetRock(itemPos)
	-- Reaparece la piedra
	Game.createItem(config.stoneID, 1, config.stonePos)
	
	-- Busca el ¨ªtem de la antorcha y lo apaga (vuelve a 9892)
	local tile = Tile(itemPos)
	if tile then
		local switch = tile:getItemById(config.open)
		if switch then
			switch:transform(config.notOpen)
		end
	end
end

function moveRock.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item:getId() == config.notOpen then
		-- Enciende el ¨ªtem
		item:transform(config.open)
		toPosition:sendMagicEffect(CONST_ME_FIREAREA)

		-- Remueve la piedra
		local stoneItem = Tile(config.stonePos):getItemById(config.stoneID)
		if stoneItem then
			stoneItem:remove()
		end

		-- Programa el reinicio
		addEvent(resetRock, config.resetTime * 60 * 1000, toPosition)
	end
	return true
end

moveRock:uid(20002)
moveRock:register()

local moveWall = Action()

local config = {
	notOpen = 2772,
	open = 2773,
	resetTime = 30, -- minutos
	wallPos = Position(591, 1045, 9)
}

local function resetWall(itemPos)
	-- Reaparece la pared
	Game.createItem(8202, 1, config.wallPos)

	-- Busca la palanca y la apaga (vuelve a 1945)
	local tile = Tile(itemPos)
	if tile then
		local lever = tile:getItemById(config.open)
		if lever then
			lever:transform(config.notOpen)
		end
	end
end

function moveWall.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item:getId() == config.notOpen then
		item:transform(config.open)
		toPosition:sendMagicEffect(CONST_ME_FIREAREA)

		local wallItem = Tile(config.wallPos):getItemById(8202)
		if wallItem then
			wallItem:remove()
		end

		addEvent(resetWall, config.resetTime * 60 * 1000, toPosition)
	end
	return true
end

moveWall:uid(20003)
moveWall:register()

local fifthSealWall = Action()

local config = {
	notOpen = 2772,
	open = 2773,
	resetTime = 30, -- minutos
	wallPosition = Position(592, 1019, 6)
}

local function resetDoor(itemPos)
	Game.createItem(1356, 1, config.wallPosition)

	local leverTile = Tile(itemPos)
	if leverTile then
		local lever = leverTile:getItemById(config.open)
		if lever then
			lever:transform(config.notOpen)
		end
	end
end

function fifthSealWall.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item:getId() == config.notOpen then
		item:transform(config.open)
		config.wallPosition:sendMagicEffect(CONST_ME_FIREAREA)

		local wallItem = Tile(config.wallPosition):getItemById(1356)
		if wallItem then
			wallItem:remove()
		end

		addEvent(resetDoor, config.resetTime * 60 * 1000, toPosition)
	end
	return true
end

fifthSealWall:uid(20004)
fifthSealWall:register()


local fifthSeal = Action()

local config = {
	notOpen = 2772,
	open = 2773,
	stoneID = 2052,
	resetTime = 30, -- minutos
	blocks = {
		[20005] = Position(588, 1024, 6),
		[20006] = Position(588, 1025, 6),
		[20007] = Position(588, 1026, 6)
	}
}

local function resetBlock(uid, itemPos)
	local pos = config.blocks[uid]
	if pos then
		Game.createItem(config.stoneID, 1, pos)
	end

	-- Busca la palanca y la apaga (1946 -> 1945)
	local tile = Tile(itemPos)
	if tile then
		local lever = tile:getItemById(config.open)
		if lever then
			lever:transform(config.notOpen)
		end
	end
end

function fifthSeal.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local uid = item:getUniqueId()
	local blockPos = config.blocks[uid]
	if not blockPos then
		return true
	end

	if item:getId() == config.notOpen then
		item:transform(config.open)
		blockPos:sendMagicEffect(CONST_ME_FIREAREA)

		local stone = Tile(blockPos):getItemById(config.stoneID)
		if stone then
			stone:remove()
		end

		addEvent(resetBlock, config.resetTime * 60 * 1000, uid, toPosition)
	end
	return true
end

for uid in pairs(config.blocks) do
	fifthSeal:uid(uid)
end

fifthSeal:register()


local config = {
	stoneID = 1772,
	firstPosition = Position(588, 1031, 6),
	secondPosition = Position(588, 1032, 6)
}

local fifthSealStones = MoveEvent()
kalazurEntrance:type("stepin")

function fifthSealStones.onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return true
	end

	if item.uid == 20008 then
		local tile = Tile(config.firstPosition)
		local stone = tile and tile:getItemById(config.stoneID)
		if stone then
			config.firstPosition:sendMagicEffect(CONST_ME_FIREAREA)
			stone:remove()
		end
	elseif item.uid == 20009 then
		local tile = Tile(config.secondPosition)
		local stone = tile and tile:getItemById(config.stoneID)
		if stone then
			config.secondPosition:sendMagicEffect(CONST_ME_FIREAREA)
			stone:remove()
		end
	end
	return true
end

fifthSealStones:uid(20008, 20009)
fifthSealStones:register()

local fifthSealStones = MoveEvent()
kalazurEntrance:type("stepout")

function fifthSealStones.onStepOut(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return true
	end

	if item.uid == 20008 then
		local tile = Tile(config.firstPosition)
		if tile and not tile:getItemById(config.stoneID) then
			Game.createItem(config.stoneID, 1, config.firstPosition)
		end
	elseif item.uid == 20009 then
		local tile = Tile(config.secondPosition)
		if tile and not tile:getItemById(config.stoneID) then
			Game.createItem(config.stoneID, 1, config.secondPosition)
		end
	end
	return true
end

fifthSealStones:uid(20008, 20009)
fifthSealStones:register()

local basinsAction = Action()

local config = {
	fixed = 8341,
	seal = 1959,
	northPipePos = {x=686, y=1057, z=11},
	southPipePos = {x=686, y=1143, z=11},
	northBasinPos = {x=702, y=1099, z=10},
	southBasinPos = {x=702, y=1100, z=10},
	northFlamePos = {x=699, y=1097, z=10},
	southFlamePos = {x=699, y=1102, z=10}
}

local RESET_TIME_MS = 90 * 60 * 1000 -- 90 minutos

local function resetNorth(leverX, leverY, leverZ)
	local leverTile = Tile(Position(leverX, leverY, leverZ))
	if leverTile then
		local lever = leverTile:getTopDownItem() -- intentar localizar la palanca
		if lever and lever:getId() == 8912 then
			lever:transform(8911)
		end
	end

	local pipeTile = Tile(Position(config.northPipePos.x, config.northPipePos.y, config.northPipePos.z))
	if pipeTile then
		local pipe = pipeTile:getItemById(config.fixed)
		if pipe then
			pipe:transform(8343)
		end
	end

	local basinTile = Tile(Position(config.northBasinPos.x, config.northBasinPos.y, config.northBasinPos.z))
	if basinTile then
		local basin = basinTile:getItemById(2113)
		if basin then
			basin:transform(2114)
		end
	end
end

local function resetSouth(leverX, leverY, leverZ)
	local leverTile = Tile(Position(leverX, leverY, leverZ))
	if leverTile then
		local lever = leverTile:getTopDownItem()
		if lever and lever:getId() == 8912 then
			lever:transform(8911)
		end
	end

	local pipeTile = Tile(Position(config.southPipePos.x, config.southPipePos.y, config.southPipePos.z))
	if pipeTile then
		local pipe = pipeTile:getItemById(config.fixed)
		if pipe then
			pipe:transform(8343)
		end
	end

	local basinTile = Tile(Position(config.southBasinPos.x, config.southBasinPos.y, config.southBasinPos.z))
	if basinTile then
		local basin = basinTile:getItemById(2113)
		if basin then
			basin:transform(2114)
		end
	end

	-- reset flame action ids to 100
	local northFlameTile = Tile(Position(config.northFlamePos.x, config.northFlamePos.y, config.northFlamePos.z))
	if northFlameTile then
		local flame = northFlameTile:getTopDownItem()
		if flame then
			flame:setActionId(100)
		end
	end
	local southFlameTile = Tile(Position(config.southFlamePos.x, config.southFlamePos.y, config.southFlamePos.z))
	if southFlameTile then
		local flame = southFlameTile:getTopDownItem()
		if flame then
			flame:setActionId(100)
		end
	end
end

function basinsAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- comprobar que es jugador
	if not player or not player:isPlayer() then
		return true
	end

	local uid = item:getUniqueId()
	local itemId = item:getId()

	-- NORTH BASIN (uid 20010)
	if uid == 20010 and itemId == 8911 then
		local northPipeTile = Tile(Position(config.northPipePos.x, config.northPipePos.y, config.northPipePos.z))
		local pipe = northPipeTile and northPipeTile:getItemById(config.fixed)
		if pipe then
			item:transform(8912)
			local basinTile = Tile(Position(config.northBasinPos.x, config.northBasinPos.y, config.northBasinPos.z))
			if basinTile then
				local basin = basinTile:getItemById(2114)
				if basin then
					basin:transform(2113)
				end
			end
			Position(config.northBasinPos):sendMagicEffect(CONST_ME_FIREATTACK)
			addEvent(resetNorth, RESET_TIME_MS, toPosition.x, toPosition.y, toPosition.z)
		else
			player:say("The gas line seems to be broken!")
		end
		return true
	end

	-- SOUTH BASIN (uid 20011)
	if uid == 20011 and itemId == 8911 then
		-- exigir que el north basin esté encendido (1484)
		local northBasinTile = Tile(Position(config.northBasinPos.x, config.northBasinPos.y, config.northBasinPos.z))
		local northBasin = northBasinTile and northBasinTile:getItemById(2113)
		if not northBasin then
			player:say("You must light the north basin first.")
			return true
		end

		local southPipeTile = Tile(Position(config.southPipePos.x, config.southPipePos.y, config.southPipePos.z))
		local pipe = southPipeTile and southPipeTile:getItemById(config.fixed)
		if pipe then
			item:transform(8912)
			local basinTile = Tile(Position(config.southBasinPos.x, config.southBasinPos.y, config.southBasinPos.z))
			if basinTile then
				local basin = basinTile:getItemById(2114)
				if basin then
					basin:transform(2113)
				end
			end
			Position(config.southBasinPos):sendMagicEffect(CONST_ME_FIREATTACK)

			-- set flames to actionid 20007
			local northFlameTile = Tile(Position(config.northFlamePos.x, config.northFlamePos.y, config.northFlamePos.z))
			print(northFlameTile)
			if northFlameTile then
				local flame = northFlameTile:getItemById(config.seal)
				if flame then
					flame:setActionId(20007)
				end
			end
			local southFlameTile = Tile(Position(config.southFlamePos.x, config.southFlamePos.y, config.southFlamePos.z))
			if southFlameTile then
				local flame = southFlameTile:getItemById(config.seal)
				if flame then
					flame:setActionId(20007)
				end
			end

			addEvent(resetSouth, RESET_TIME_MS, toPosition.x, toPosition.y, toPosition.z)
		else
			player:say("The gas line seems to be broken!")
		end
		return true
	end

	return true
end

-- registrar como action UIDs
basinsAction:uid(20010)
basinsAction:uid(20011)
basinsAction:register()


local pipeFix = Action()

local config = {
	fix = 8341,
	broken = 8343,
	tool = 7889
}

function pipeFix.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item:getId() ~= config.tool then
		return false
	end

	if target.itemid == config.broken then
		target:transform(config.fix)
		toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
		player:say("Clink!")
		item:remove(1)
	else
		player:sendCancelMessage("You may only use this tool on a broken gas pipe.")
	end

	return true
end

pipeFix:id(7889)
pipeFix:register()


local doormedusa = Action()


function doormedusa.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(20000) <= 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders...")
		return true
	end
		
	if item.itemid == 9361 then
		player:teleportTo(toPosition, true)
		item:transform(item.itemid + 1)
	elseif item.itemid == 9562 then
		item:transform(item.itemid - 1)
	end

	return true
end

-- UID de la palanca
doormedusa:aid(20010)
doormedusa:register()
