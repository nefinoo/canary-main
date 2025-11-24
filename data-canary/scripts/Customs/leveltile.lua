local levelTile = MoveEvent()

function levelTile.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    local levelRequired = item.actionid - 1000
    local playerLevel = player:getLevel()

    if item.itemid == 8282 or item.itemid == 8886 then
		if item.actionid > 100 and playerLevel < levelRequired then
			player:teleportTo(fromPosition, true)
			fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
			player:say("You must be level " .. levelRequired .. " to enter.")
		end
	end
    return true
end

-- REGISTRO
levelTile:type("stepin")
levelTile:id(8282)
levelTile:register()
