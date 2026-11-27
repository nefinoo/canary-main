local crystalAction = Action()

local HAMMER_ID = 50739
local HAMMER_AID = 666

local CRYSTAL_ID = 15269
local BROKEN_CRYSTAL_ID = 15272

local STORAGE = 45001

local RESPAWN_TIME = 60 * 1000 -- 60 segundos

local crystals = {
    [1] = {pos = Position(138, 1277, 4)},
    [2] = {pos = Position(198, 1277, 4)},
    [3] = {pos = Position(140, 1308, 4)},
    [4] = {pos = Position(168, 1304, 4)},
    [5] = {pos = Position(196, 1308, 4)},
}

local function samePosition(pos1, pos2)
    return pos1.x == pos2.x and
           pos1.y == pos2.y and
           pos1.z == pos2.z
end

local function respawnCrystal(position)
    local tile = Tile(position)
    if not tile then
        return
    end

    local item = tile:getItemById(BROKEN_CRYSTAL_ID)
    if item then
        item:transform(CRYSTAL_ID)
    end
end

function crystalAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    if item:getId() ~= HAMMER_ID or item:getActionId() ~= HAMMER_AID then
        return false
    end

    if not target or target:getId() ~= CRYSTAL_ID then
        player:sendCancelMessage("You can only use this hammer on enchanted crystal pylons.")
        return true
    end

    local crystalIndex = nil

    for i, crystal in pairs(crystals) do
        if samePosition(target:getPosition(), crystal.pos) then
            crystalIndex = i
            break
        end
    end

    if not crystalIndex then
        player:sendCancelMessage("Nothing happens.")
        return true
    end

    if player:getStorageValue(50000 + crystalIndex) == 1 then
        player:sendCancelMessage("You have already destroyed this crystal.")
        return true
    end

    target:transform(BROKEN_CRYSTAL_ID)

    target:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONAREA)

    addEvent(respawnCrystal, RESPAWN_TIME, target:getPosition())

    player:setStorageValue(50000 + crystalIndex, 1)

    local destroyed = 0

    for i = 1, 5 do
        if player:getStorageValue(50000 + i) == 1 then
            destroyed = destroyed + 1
        end
    end

    if destroyed == 5 then
        player:setStorageValue(STORAGE, 2)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have destroyed all five crystal pylons.")
    else
        player:sendTextMessage(
            MESSAGE_EVENT_ADVANCE,
            string.format("Crystal destroyed (%d/5).", destroyed)
        )
    end

    return true
end

crystalAction:id(HAMMER_ID)
crystalAction:register()

local magnet = Action()

local STORAGE_MAIN = 45001

local EMPTY_MAGNET = 19207
local CHARGED_MAGNET = 19218

local FIRST_AID = 7001
local LAST_AID = 7010

function magnet.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    if item:getId() ~= EMPTY_MAGNET then
        return false
    end

    if not target then
        return false
    end

    local aid = target:getActionId()

	if aid < FIRST_AID or aid > LAST_AID then
		player:sendCancelMessage("Nothing happens.")
		return true
	end

    local crystalStorage = 46000 + aid

    if player:getStorageValue(crystalStorage) == 1 then
        player:sendCancelMessage("This crystal has already empowered your magnet.")
        return true
    end

    player:setStorageValue(crystalStorage, 1)

    toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)

    local charged = 0

    for i = FIRST_AID, LAST_AID do
        if player:getStorageValue(46000 + i) == 1 then
            charged = charged + 1
        end
    end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
        string.format("The magnet absorbs magical energy. (%d/10)", charged))

    if charged == 10 then
        item:transform(CHARGED_MAGNET)
        player:setStorageValue(STORAGE_MAIN, 5)

        player:sendMagicEffect(CONST_ME_HOLYAREA)

        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
            "The magnet is now fully charged.")
    end

    return true
end

magnet:id(EMPTY_MAGNET)
magnet:register()

local bossExit = MoveEvent()

local config = {
	actionId = 7012,

	questStorage = 45001,

	-- Etapa en la que el jugador entra al laboratorio
	requiredStorage = 6,

	-- Storage para evitar repetir el mensaje
	messageStorage = 45003,
	messageStorageValue = 1,

	effect = CONST_ME_MAGIC_BLUE,
}

function bossExit.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(config.questStorage) < config.requiredStorage then
		return true
	end

	if player:getStorageValue(config.messageStorage) == config.messageStorageValue then
		return true
	end

	player:setStorageValue(
		config.messageStorage,
		config.messageStorageValue
	)

	position:sendMagicEffect(config.effect)

	player:sendTextMessage(
		MESSAGE_EVENT_ADVANCE,
		"As you leave the laboratory, the arcane energy behind you begins to stir. Zephyr must be informed of what happened."
	)

	return true
end

bossExit:aid(config.actionId)
bossExit:register()

-- =========================================================
-- BOSS GAUNTLET - 6 BOSSES / 21 PLAYERS
-- Canary RevScript
-- =========================================================

local bossGauntletLever = Action()
local bossGauntletPortal = MoveEvent()
local bossGauntletDeath = CreatureEvent("BossGauntletDeath")

-- =========================================================
-- CONFIGURACIÓN
-- =========================================================

local config = {
	-- ActionID que debe tener la palanca
	leverActionId = 55000,

	-- IDs visuales de la palanca
	leverOffId = 8911,
	leverOnId = 8912,

	-- Cantidad requerida para comenzar
	requiredPlayers = 1,
	maxPlayers = 21,

	-- ItemID del teleport que aparecerá al morir cada boss
	teleportItemId = 35496,

	-- ActionIDs 55101 hasta 55106
	-- Se asignan automáticamente a los teleports
	teleportActionIdBase = 55100,

	-- Tiempo máximo de todo el evento
	maxEventTime = 2 * 60 * 60,

	-- Tiempo para limpiar después del último boss
	finalCleanupTime = 15 * 60,

	-- Efectos
	startEffect = CONST_ME_TELEPORT,
	portalEffect = CONST_ME_TELEPORT,
	bossSpawnEffect = CONST_ME_MORTAREA,
	bossDeathEffect = CONST_ME_FIREWORK_YELLOW,

	-- Mensajes
	notEnoughPlayersMessage = "You need exactly 21 players to begin this challenge.",
	eventRunningMessage = "Another group is already facing the boss gauntlet.",
	startMessage = "The challenge begins! Defeat all six guardians.",
	notParticipantMessage = "This portal rejects you because you are not part of the current challenge.",

	-- =====================================================
	-- POSICIONES DE LOS JUGADORES FRENTE A LA PALANCA
	--
	-- Se genera una cuadrícula de 7 columnas x 3 filas.
	-- Total: 21 posiciones.
	--
	-- Esta posición es la esquina superior izquierda.
	-- =====================================================

	waitingAreaStart = Position(249, 1355, 7),

	waitingAreaColumns = 7,
	waitingAreaRows = 3,

	-- Sala de recompensa
	rewardRoomStart = Position(165, 1269, 3),
	rewardRoomColumns = 3,
	rewardRoomRows = 7,

	-- =====================================================
	-- CONFIGURACIÓN DE LOS 6 BOSSES
	-- =====================================================

	bosses = {
		[1] = {
			name = "The Arcane Guardian",

			bossPosition = Position(280, 1352, 7),
			teleportPosition = Position(274, 1348, 7),

			-- Esquina donde aparecerán los 21 jugadores
			playerRoomStart = Position(266, 1352, 7),

			-- Área que se limpiará antes de comenzar
			arenaFrom = Position(262, 1345, 7),
			arenaTo = Position(286, 1363, 7),
		},

		[2] = {
			name = "The Rift Conjurer",

			bossPosition = Position(281, 1353, 8),
			teleportPosition = Position(274, 1347, 8),

			playerRoomStart = Position(262, 1354, 8),

			arenaFrom = Position(253, 1343, 8),
			arenaTo = Position(285, 1362, 8),
		},

		[3] = {
			name = "The Crystal Warden",

			bossPosition = Position(275, 1340, 9),
			teleportPosition = Position(282, 1350, 9),

			playerRoomStart = Position(263, 1352, 9),

			arenaFrom = Position(255, 1338, 9),
			arenaTo = Position(286, 1359, 9),
		},

		[4] = {
			name = "The Prismatic Titan",

			bossPosition = Position(276, 1340, 10),
			teleportPosition = Position(284, 1345, 10),

			playerRoomStart = Position(271, 1348, 10),

			arenaFrom = Position(262, 1335, 10),
			arenaTo = Position(288, 1353, 10),
		},

		[5] = {
			name = "The Mirror Sovereign",

			bossPosition = Position(232, 1335, 10),
			teleportPosition = Position(232, 1341, 10),

			playerRoomStart = Position(232, 1345, 10),

			arenaFrom = Position(216, 1328, 10),
			arenaTo = Position(247, 1351, 10),
		},

		[6] = {
			name = "Zephyr the Perfect Creation",

			bossPosition = Position(190, 1335, 10),
			teleportPosition = Position(189, 1341, 10),

			playerRoomStart = Position(189, 1345, 10),

			arenaFrom = Position(173, 1329, 10),
			arenaTo = Position(204, 1352, 10),
		},
	},

}

-- =========================================================
-- ESTADO DEL EVENTO
-- =========================================================

local activeRun = {
	active = false,
	token = 0,

	players = {},
	playerSlots = {},

	spawnedBosses = {},
	bossStages = {},

	createdTeleports = {},
	finishedPlayers = {},
}

-- =========================================================
-- CREAR CUADRÍCULA DE POSICIONES
-- =========================================================

local function createPositionGrid(startPosition, columns, rows)
	local positions = {}

	for row = 0, rows - 1 do
		for column = 0, columns - 1 do
			positions[#positions + 1] = Position(
				startPosition.x + column,
				startPosition.y + row,
				startPosition.z
			)
		end
	end

	return positions
end

-- =========================================================
-- COMPARAR POSICIONES
-- =========================================================

local function isPositionInside(position, fromPosition, toPosition)
	return position.x >= fromPosition.x
		and position.x <= toPosition.x
		and position.y >= fromPosition.y
		and position.y <= toPosition.y
		and position.z >= fromPosition.z
		and position.z <= toPosition.z
end

-- =========================================================
-- ELIMINAR TELEPORTS CREADOS
-- =========================================================

local function removeCreatedTeleports()
	for _, teleportData in pairs(activeRun.createdTeleports) do
		local tile = Tile(teleportData.position)

		if tile then
			local teleport = tile:getItemById(config.teleportItemId)

			if teleport and teleport:getActionId() == teleportData.actionId then
				teleport:remove()
				teleportData.position:sendMagicEffect(CONST_ME_POFF)
			end
		end
	end

	activeRun.createdTeleports = {}
end

-- =========================================================
-- LIMPIAR MONSTRUOS DE UNA ARENA
-- =========================================================

local function clearArena(arenaData)
	local centerPosition = Position(
		math.floor((arenaData.arenaFrom.x + arenaData.arenaTo.x) / 2),
		math.floor((arenaData.arenaFrom.y + arenaData.arenaTo.y) / 2),
		arenaData.arenaFrom.z
	)

	local rangeX = math.max(
		centerPosition.x - arenaData.arenaFrom.x,
		arenaData.arenaTo.x - centerPosition.x
	)

	local rangeY = math.max(
		centerPosition.y - arenaData.arenaFrom.y,
		arenaData.arenaTo.y - centerPosition.y
	)

	local spectators = Game.getSpectators(
		centerPosition,
		false,
		false,
		rangeX,
		rangeX,
		rangeY,
		rangeY
	)

	for _, creature in ipairs(spectators) do
		local monster = creature:getMonster()

		if monster then
			local monsterPosition = monster:getPosition()

			if isPositionInside(
				monsterPosition,
				arenaData.arenaFrom,
				arenaData.arenaTo
			) then
				monster:remove()
			end
		end
	end
end

-- =========================================================
-- LIMPIAR TODAS LAS ARENAS
-- =========================================================

local function clearAllArenas()
	for _, bossData in ipairs(config.bosses) do
		clearArena(bossData)
	end

	removeCreatedTeleports()
end

-- =========================================================
-- REINICIAR EVENTO
-- =========================================================

local function resetEvent(token)
	if token and token ~= activeRun.token then
		return
	end

	clearAllArenas()

	activeRun.active = false
	activeRun.players = {}
	activeRun.playerSlots = {}
	activeRun.spawnedBosses = {}
	activeRun.bossStages = {}
	activeRun.createdTeleports = {}
	activeRun.finishedPlayers = {}
end

-- =========================================================
-- CREAR UN BOSS
-- =========================================================

local function spawnBoss(stage)
	if not activeRun.active then
		return false
	end

	if activeRun.spawnedBosses[stage] then
		return true
	end

	local bossData = config.bosses[stage]
	if not bossData then
		return false
	end

	local boss = Game.createMonster(
		bossData.name,
		bossData.bossPosition,
		true,
		true
	)

	if not boss then
		return false
	end

	boss:registerEvent("BossGauntletDeath")

	activeRun.spawnedBosses[stage] = boss:getId()
	activeRun.bossStages[boss:getId()] = stage

	bossData.bossPosition:sendMagicEffect(config.bossSpawnEffect)

	Game.broadcastMessage(
		"Boss " .. stage .. " has appeared: " .. bossData.name .. "!",
		MESSAGE_EVENT_ADVANCE
	)

	return true
end

-- =========================================================
-- CREAR TELEPORT DESPUÉS DE MATAR BOSS
-- =========================================================

local function createStageTeleport(stage)
	local bossData = config.bosses[stage]
	if not bossData then
		return false
	end

	local tile = Tile(bossData.teleportPosition)

	if tile then
		local oldTeleport = tile:getItemById(config.teleportItemId)

		if oldTeleport then
			oldTeleport:remove()
		end
	end

	local teleport = Game.createItem(
		config.teleportItemId,
		1,
		bossData.teleportPosition
	)

	if not teleport then
		return false
	end

	local actionId = config.teleportActionIdBase + stage

	teleport:setActionId(actionId)

	activeRun.createdTeleports[stage] = {
		position = bossData.teleportPosition,
		actionId = actionId,
	}

	bossData.teleportPosition:sendMagicEffect(config.portalEffect)

	return true
end

-- =========================================================
-- OBTENER LOS JUGADORES DE LA SALA DE ESPERA
-- =========================================================

local function getWaitingPlayers()
	local positions = createPositionGrid(
		config.waitingAreaStart,
		config.waitingAreaColumns,
		config.waitingAreaRows
	)

	local players = {}

	for slot, position in ipairs(positions) do
		local tile = Tile(position)

		if tile then
			local creature = tile:getTopCreature()

			if creature then
				local player = creature:getPlayer()

				if player then
					players[#players + 1] = {
						player = player,
						slot = slot,
					}
				end
			end
		end
	end

	return players
end

-- =========================================================
-- OBTENER POSICIÓN DEL JUGADOR EN UNA ARENA
-- =========================================================

local function getPlayerRoomPosition(stage, slot)
	local bossData = config.bosses[stage]
	if not bossData then
		return nil
	end

	local positions = createPositionGrid(
		bossData.playerRoomStart,
		config.waitingAreaColumns,
		config.waitingAreaRows
	)

	return positions[slot]
end

-- =========================================================
-- OBTENER POSICIÓN EN SALA DE RECOMPENSA
-- =========================================================

local function getRewardPosition(slot)
	local positions = createPositionGrid(
		config.rewardRoomStart,
		config.rewardRoomColumns,
		config.rewardRoomRows
	)

	return positions[slot]
end

-- =========================================================
-- INICIAR EVENTO CON LA PALANCA
-- =========================================================

function bossGauntletLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if activeRun.active then
		player:sendCancelMessage(config.eventRunningMessage)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	local waitingPlayers = getWaitingPlayers()
	local playerCount = #waitingPlayers

	if playerCount ~= config.requiredPlayers then
		player:sendTextMessage(
			MESSAGE_EVENT_ADVANCE,
			config.notEnoughPlayersMessage
				.. " Players ready: "
				.. playerCount
				.. "/"
				.. config.requiredPlayers
				.. "."
		)

		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	if playerCount > config.maxPlayers then
		player:sendCancelMessage(
			"The maximum number of players is " .. config.maxPlayers .. "."
		)
		return true
	end

	clearAllArenas()

	activeRun.token = activeRun.token + 1
	activeRun.active = true
	activeRun.players = {}
	activeRun.playerSlots = {}
	activeRun.spawnedBosses = {}
	activeRun.bossStages = {}
	activeRun.createdTeleports = {}
	activeRun.finishedPlayers = {}

	local currentToken = activeRun.token

	for _, playerData in ipairs(waitingPlayers) do
		local participant = playerData.player
		local slot = playerData.slot
		local destination = getPlayerRoomPosition(1, slot)

		if participant and destination then
			local playerId = participant:getId()

			activeRun.players[playerId] = true
			activeRun.playerSlots[playerId] = slot

			participant:teleportTo(destination, true)
			destination:sendMagicEffect(config.startEffect)

			participant:sendTextMessage(
				MESSAGE_EVENT_ADVANCE,
				config.startMessage
			)
		end
	end

	if item:getId() == config.leverOffId then
		item:transform(config.leverOnId)

		addEvent(function(position)
			local tile = Tile(position)
			if not tile then
				return
			end

			local lever = tile:getItemById(config.leverOnId)

			if lever then
				lever:transform(config.leverOffId)
			end
		end, 1000, item:getPosition())
	end

	if not spawnBoss(1) then
		for playerId in pairs(activeRun.players) do
			local participant = Player(playerId)

			if participant then
				participant:sendTextMessage(
					MESSAGE_EVENT_ADVANCE,
					"The first boss could not be created. Contact an administrator."
				)
			end
		end

		resetEvent(currentToken)
		return true
	end

	addEvent(
		resetEvent,
		config.maxEventTime * 1000,
		currentToken
	)

	return true
end

bossGauntletLever:aid(config.leverActionId)
bossGauntletLever:register()

-- =========================================================
-- MUERTE DE LOS BOSSES
-- =========================================================

function bossGauntletDeath.onDeath(
	creature,
	corpse,
	killer,
	mostDamageKiller,
	unjustified,
	mostDamageUnjustified
)
	if not activeRun.active then
		return true
	end

	local creatureId = creature:getId()
	local stage = activeRun.bossStages[creatureId]

	if not stage then
		return true
	end

	activeRun.bossStages[creatureId] = nil
	activeRun.spawnedBosses[stage] = nil

	local bossData = config.bosses[stage]

	if bossData then
		bossData.bossPosition:sendMagicEffect(
			config.bossDeathEffect
		)
	end

	if not createStageTeleport(stage) then
		return true
	end

	for playerId in pairs(activeRun.players) do
		local participant = Player(playerId)

		if participant then
			if stage < #config.bosses then
				participant:sendTextMessage(
					MESSAGE_EVENT_ADVANCE,
					"Boss "
						.. stage
						.. " has been defeated. Enter the portal to face the next guardian."
				)
			else
				participant:sendTextMessage(
					MESSAGE_EVENT_ADVANCE,
					"The final guardian has fallen. Enter the portal to claim your reward."
				)
			end
		end
	end

	if stage == #config.bosses then
		local token = activeRun.token

		addEvent(
			resetEvent,
			config.finalCleanupTime * 1000,
			token
		)
	end

	return true
end

bossGauntletDeath:register()

-- =========================================================
-- ENTRAR A LOS TELEPORTS
-- =========================================================

function bossGauntletPortal.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()

	if not player then
		return true
	end

	if not activeRun.active then
		player:teleportTo(fromPosition, true)
		player:sendCancelMessage("The challenge is no longer active.")
		return true
	end

	local playerId = player:getId()

	if not activeRun.players[playerId] then
		player:teleportTo(fromPosition, true)
		player:sendTextMessage(
			MESSAGE_EVENT_ADVANCE,
			config.notParticipantMessage
		)

		fromPosition:sendMagicEffect(CONST_ME_POFF)
		return true
	end

	local stage = item:getActionId() - config.teleportActionIdBase

	if stage < 1 or stage > #config.bosses then
		return true
	end

	local slot = activeRun.playerSlots[playerId] or 1

	-- =====================================================
	-- TELEPORTS ENTRE BOSSES
	-- =====================================================

	if stage < #config.bosses then
		local nextStage = stage + 1
		local destination = getPlayerRoomPosition(nextStage, slot)

		if not destination then
			player:teleportTo(fromPosition, true)
			return true
		end

		player:teleportTo(destination, true)
		destination:sendMagicEffect(config.portalEffect)

		-- El siguiente boss aparece cuando cruza el primer jugador
		if not activeRun.spawnedBosses[nextStage] then
			if not spawnBoss(nextStage) then
				player:sendTextMessage(
					MESSAGE_EVENT_ADVANCE,
					"The next boss could not be created. Contact an administrator."
				)
			end
		end

		return true
	end

	-- =====================================================
	-- ÚLTIMO TELEPORT: SALA DE RECOMPENSA
	-- =====================================================

	local rewardPosition = getRewardPosition(slot)

	if not rewardPosition then
		player:teleportTo(fromPosition, true)
		return true
	end

	player:teleportTo(rewardPosition, true)
	rewardPosition:sendMagicEffect(CONST_ME_FIREWORK_YELLOW)

	player:sendTextMessage(
		MESSAGE_EVENT_ADVANCE,
		"You have defeated all six guardians. Claim your reward!"
	)

	activeRun.finishedPlayers[playerId] = true

	return true
end

for stage = 1, #config.bosses do
	bossGauntletPortal:aid(
		config.teleportActionIdBase + stage
	)
end

bossGauntletPortal:register()

-- tp moon --
local storageTeleport = Action()

local config = {
	questStorage = 45001,
	requiredValue = 4,

	teleports = {
		[7012] = Position(167, 1294, 8), -- Entrada
		[7013] = Position(167, 1302, 6), -- Salida
	},

	effect = CONST_ME_TELEPORT
}

function storageTeleport.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(config.questStorage) < config.requiredValue then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
			"You have not completed the required mission.")
		return true
	end

	local destination = config.teleports[item:getActionId()]
	if not destination then
		return false
	end

	player:getPosition():sendMagicEffect(config.effect)
	player:teleportTo(destination)
	destination:sendMagicEffect(config.effect)

	return true
end

storageTeleport:aid(7012)
storageTeleport:aid(7013)
storageTeleport:register()