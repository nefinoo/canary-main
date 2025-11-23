local fishing = Action()
function fishing.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	Game.broadcastMessage("hola 2", MESSAGE_LOGIN); --mensaje en blanco en server log y en la pantalla abajo del jugador
	Game.broadcastMessage("hola 3", MESSAGE_ADMINISTRATOR); --Mensaje Rojo enserver log y en pantalla de jugador
	Game.broadcastMessage("hola 4", MESSAGE_EVENT_ADVANCE); --Mensaje blanco enserver log y en pantalla de jugador
	Game.broadcastMessage("hola 5", MESSAGE_GAME_HIGHLIGHT); --Mensaje Rojo enserver log y en pantalla de jugador
	Game.broadcastMessage("hola 6", MESSAGE_FAILURE); --mensaje blanco abajo de la pantalla solo al jugador
	Game.broadcastMessage("hola 7", MESSAGE_LOOK); --Mensaje Verde enserver log y en pantalla de jugador
	-- Game.broadcastMessage("hola 8", MESSAGE_DAMAGE_DEALT); -- msj blanco server log
	-- Game.broadcastMessage("hola 9", MESSAGE_DAMAGE_RECEIVED); -- msj blanco server log
	-- Game.broadcastMessage("hola 10", MESSAGE_HEALED); -- msj blanco server log
	-- Game.broadcastMessage("hola 11", MESSAGE_EXPERIENCE); -- msj blanco server log
	-- Game.broadcastMessage("hola 15", MESSAGE_STATUS); --mensaje en blanco en server log y en la pantalla abajo del jugador
	-- Game.broadcastMessage("hola 16", MESSAGE_LOOT); --mensaje en blanco en loot channel y en la pantalla abajo del jugador
	-- Game.broadcastMessage("hola 17", MESSAGE_TRADE); --Mensaje Verde enserver log y en pantalla de jugador
	-- Game.broadcastMessage("hola 19", MESSAGE_PARTY_MANAGEMENT); --Mensaje Verde enserver log y en pantalla de jugador
	-- Game.broadcastMessage("hola 21", MESSAGE_REPORT); --mensaje en blanco en loot channel y en la pantalla abajo del jugador
	-- Game.broadcastMessage("hola 22", MESSAGE_HOTKEY_PRESSED); --Mensaje Verde enserver log y en pantalla de jugador
    return true
end

-- fishing:allowFarUse(true)
fishing:id(7315)
fishing:register()