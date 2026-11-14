local satanDeath = CreatureEvent("satanDeath")

local rockPos = Position(491, 1787, 5)

local den = {
    fromPos = Position(487, 1781, 5),
    toPos = Position(503, 1793, 5)
}

local leverPos = Position(500, 1784, 5)

local function makePortal(pos)
    local tile = Tile(pos)
    if not tile then
        return
    end

    -- Elimina todo lo que haya en la posición
    for _, item in ipairs(tile:getItems() or {}) do
        item:remove()
    end

    local portal = Game.createItem(1949, 1, pos)
    if portal then
        portal:setActionId(44990)
        pos:sendMagicEffect(CONST_ME_TELEPORT)
    end
end

local function removeTeleport(pos)
    local leverTile = Tile(leverPos)
    if leverTile then
        local lever = leverTile:getItemById(2773)
        if lever then
            lever:transform(2772)
        end
    end

    local tile = Tile(pos)
    if not tile then
        return
    end

    local portal = tile:getItemById(1949)
    if portal then
        portal:remove()
        pos:sendMagicEffect(CONST_ME_POFF)
    end
end

function satanDeath.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
    if not creature or creature:isPlayer() then
        return true
    end

    if creature:getName():lower() ~= "satan" then
        return true
    end

    local targetPos = creature:getPosition()

    if not targetPos:isInRange(den.fromPos, den.toPos) then
        return true
    end

    local rockTile = Tile(rockPos)

	if rockTile then

		local items = rockTile:getItems()
		if items then
			for i, item in ipairs(items) do
			end
		end
	end
	
    local rock = rockTile:getItemById(1860)
	if not rock then
		return true
	end

    local aid = rock:getActionId()

    if aid == 0 then
        rock:setActionId(100)

    elseif aid == 100 then
        rock:setActionId(200)

    elseif aid == 200 then
        rock:setActionId(300)

    elseif aid == 300 then
        rock:setActionId(400)

    elseif aid == 400 then
        rock:setActionId(0)

        creature:say(
            "You have defeated me. Here is your portal. It won't last forever though.",
            TALKTYPE_MONSTER_SAY
        )

        addEvent(makePortal, 3000, targetPos)

        local fence1 = Tile(Position(492, 1800, 6))
        if fence1 then
            local item = fence1:getTopDownItem()
            if item then
                item:remove()
            end
        end

        local fence2 = Tile(Position(488, 1800, 6))
        if fence2 then
            local item = fence2:getTopDownItem()
            if item then
                item:remove()
            end
        end

        addEvent(removeTeleport, 30000, targetPos)
    end

    return true
end

satanDeath:register()