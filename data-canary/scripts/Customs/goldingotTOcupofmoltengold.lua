local moltenGold = Action()

local config = {
	goldIngotId = 9058,
	lavaSourceIds = {11502, 11503, 11504, 11505, 7813, 7844, 7817, 7815},
	resultItemId = 12804
}

function moltenGold.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- Seguridad extra (por si acaso)
	if not table.contains(config.lavaSourceIds, item.itemid) then
		return true
	end

	-- Contar gold ingots en TODAS las backpacks
	local ingotCount = player:getItemCount(config.goldIngotId)
	if ingotCount <= 0 then
		player:sendCancelMessage("You don't have any gold ingots to melt.")
		return true
	end

	-- Remover ingots
	player:removeItem(config.goldIngotId, ingotCount)

	-- Dar cups de molten gold
	player:addItem(config.resultItemId, ingotCount)

	-- Efecto + mensaje
	fromPosition:sendMagicEffect(CONST_ME_FIREAREA)
	player:sendTextMessage(
		MESSAGE_EVENT_ADVANCE,
		string.format(
			"You melt %d gold ingot%s into %d cup%s of molten gold.",
			ingotCount,
			ingotCount > 1 and "s" or "",
			ingotCount,
			ingotCount > 1 and "s" or ""
		)
	)

	return true
end

-- ✅ Registrar el Action EN LA LAVA
moltenGold:id(11502, 11503, 11504, 11505, 7813, 7844, 7817, 7815)
moltenGold:register()
