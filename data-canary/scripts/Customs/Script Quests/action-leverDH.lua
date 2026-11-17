local lever = Action()

-- ⚙️ CONFIGURACIÓN
local teleportPosition = Position(492, 497, 10)
local stonePosition = Position(491, 499, 10)
local teleportDestination = Position(518, 840, 7)
local stoneId = 1842
local teleportId = 1949
local leverOn = 2772
local leverOff = 2773
local respawnTime = 30 -- segundos para que reaparezca la piedra y desaparezca el teleport

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == leverOn then
		-- Crear teleport
		local teleport = Game.createItem(teleportId, 1, teleportPosition)
		if teleport then
			teleport:setDestination(teleportDestination)
			teleportPosition:sendMagicEffect(CONST_ME_TELEPORT)
		end

		-- Quitar piedra si existe
		local stone = Tile(stonePosition):getItemById(stoneId)
		if stone then
			stone:remove()
		end

		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The stone has vanished. It will return soon.")
		item:transform(leverOff)

		-- 🕒 Iniciar temporizador
		addEvent(function()
			-- Eliminar teleport si aún existe
			local teleport = Tile(teleportPosition):getItemById(teleportId)
			if teleport then
				teleport:remove()
				teleportPosition:sendMagicEffect(CONST_ME_POFF)
			end

			-- Crear la piedra nuevamente
			if not Tile(stonePosition):getItemById(stoneId) then
				Game.createItem(stoneId, 1, stonePosition)
				stonePosition:sendMagicEffect(CONST_ME_BLOCKHIT)
			end

			-- Volver a posición inicial la palanca
			local leverItem = Tile(fromPosition):getItemById(leverOff)
			if leverItem then
				leverItem:transform(leverOn)
			end

			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The stone has returned and the teleport has vanished.")
		end, respawnTime * 1000)

	elseif item.itemid == leverOff then
		-- Uso manual para apagar (por si el jugador la usa antes del tiempo)
		local teleport = Tile(teleportPosition):getItemById(teleportId)
		if teleport then
			teleport:remove()
			teleportPosition:sendMagicEffect(CONST_ME_POFF)
		end

		Game.createItem(stoneId, 1, stonePosition)
		item:transform(leverOn)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have manually restored the stone.")
	end
	return true
end

lever:uid(30007)
lever:register()
