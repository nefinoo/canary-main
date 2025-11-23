-- Death Note (RevScript para Canary)
-- Usa /write <nombre> para ejecutar al objetivo si tienes el libro en la backpack

local DEATH_NOTE_ID = 28702

local deathNoteText = TalkAction("!dn")

function deathNoteText.onSay(player, words, param)
	local text = param:trim()
	if text == "" then
		player:sendCancelMessage("You must type the player's name.")
		return false
	end

	-- Checar si el jugador tiene el Death Note en su backpack
	if player:getItemCount(DEATH_NOTE_ID) <= 0 then
		player:sendCancelMessage("You must have a Death Note in your backpack.")
		return false
	end

	local target = Player(text)
	if not target then
		player:sendCancelMessage("Player [" .. text .. "] is not online.")
		return false
	end

	-- Evitar staff
	local group = target:getGroup()
	if group and group:getAccess() then
		player:sendCancelMessage("You cannot target staff members.")
		return false
	end

	-- Evitar players con red/black skull
	local skull = target:getSkull()
	if skull == SKULL_RED or skull == SKULL_BLACK then
		player:sendCancelMessage("You may not target red/black skulled players.")
		return false
	end

	if not target:isPlayer() then
		player:sendCancelMessage("You may only target players.")
		return false
	end

	-- Eliminar el libro
	player:removeItem(DEATH_NOTE_ID, 1)

	-- Efecto visual
	local pos = target:getPosition()
	pos:sendMagicEffect(CONST_ME_MORTAREA)

	-- Matar al jugador
	target:addHealth(-100000000)
	player:sendTextMessage(MESSAGE_ADMINISTRATOR, "The Death Note claims the life of " .. target:getName() .. "!")

	return false
end

deathNoteText:separator(" ")
deathNoteText:groupType("normal")
deathNoteText:register()