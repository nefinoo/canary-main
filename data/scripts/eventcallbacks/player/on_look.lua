local config = {
    [35800] = {items = {3031, 9689, 2973}, cantd = {450, 10, 3500, 50}},
	[35801] = {items = {3031, 9689, 2973}, cantd = {4600, 11, 3501, 100}},
	[35802] = {items = {3031, 9689, 2973}, cantd = {47000, 12, 3502, 150}},
	[35803] = {items = {3031, 9689, 2973}, cantd = {480000, 13, 3503, 200}},
	[35804] = {items = {3031, 9689, 2973}, cantd = {4900000, 14, 3504, 250}},
	[35805] = {items = {3031, 9689, 2973}, cantd = {50000000, 15, 3505, 300}},
	[35806] = {items = {3031, 9689, 2973}, cantd = {510000000, 16, 3506, 350}},
	[35807] = {items = {3031, 9689, 2973}, cantd = {5200000000, 17, 3507, 400}},
	[35808] = {items = {3031, 9689, 2973}, cantd = {53000000000, 18, 3508, 450}},
	[35809] = {items = {3031, 9689, 2973}, cantd = {540000000000, 19, 3509, 500}},
	[35810] = {items = {3031, 9689, 2973}, cantd = {5500000000000, 20, 3510, 550}},
}
local teleports = {
    [36800] = {Storage = {3500, 3600}},
	[36801] = {Storage = {3501, 3601}},
	[36802] = {Storage = {3502, 3602}},
	[36803] = {Storage = {3503, 3603}},
	[36804] = {Storage = {3504, 3604}},
	[36805] = {Storage = {3505, 3605}},
	[36806] = {Storage = {3506, 3606}},
	[36807] = {Storage = {3507, 3607}},
	[36808] = {Storage = {3508, 3608}},
	[36809] = {Storage = {3509, 3609}},
	[36810] = {Storage = {3510, 3610}},
	[36811] = {Storage = {3511, 3611}},
}

local hints = {
    [37800] = "Look for keys.- Desert, Mountain and Swamp",
	[37801] = "Do you like read?",
	[37802] = "King Kalazur",
	[37803] = "Hello",
	[37804] = "Hello",
	[37805] = "Hello",
	[37806] = "Hello",
	[37807] = "Hello",
	[37808] = "Hello",
	[37809] = "Hello",
	[37810] = "Hello",
	[37811] = "Hello",
}

local bosses = {
    [38800] = {
        monsterName = "Necropharus",
        centerPos = Position(690, 279, 9),
        rangeX = 6,
        rangeY = 6
    },
    [38801] = {
        monsterName = "Demodras",
        centerPos = Position(414, 702, 9),
        rangeX = 4,
        rangeY = 7
    },
    [38802] = {
        monsterName = "Rottie The Rotworm",
        centerPos = Position(150, 427, 10),
        rangeX = 5,
        rangeY = 5
    },
    [38803] = {
        monsterName = "Tiquandas Revenge",
        centerPos = Position(220, 277, 4),
        rangeX = 7,
        rangeY = 7
    },
    [38804] = {
        monsterName = "The Horned Fox",
        centerPos = Position(429, 733, 3),
        rangeX = 4,
        rangeY = 5
    },
    [38805] = {
        monsterName = "The Old Widow",
        centerPos = Position(514, 705, 8),
        rangeX = 7,
        rangeY = 7
    },
    [38806] = {
        monsterName = "Deadeye Devious",
        centerPos = Position(291, 1600, 6),
        rangeX = 8,
        rangeY = 8
    },
    [38807] = {
        monsterName = "Brutus Bloodbeard",
        centerPos = Position(347, 1691, 2),
        rangeX = 8,
        rangeY = 8
    },
    [38808] = {
        monsterName = "Lethal Lissy",
        centerPos = Position(332, 1760, 7),
        rangeX = 6,
        rangeY = 12
    },
    [38809] = {
        monsterName = "Ron The Ripper",
        centerPos = Position(284, 1766, 2),
        rangeX = 10,
        rangeY = 10
    },
    [38810] = {
        monsterName = "Ferumbras",
        centerPos = Position(420, 580, 4),
        rangeX = 8,
        rangeY = 8
    },
}

local bossesteleports = {
    [9001] = {Storage = {46001}},
	[9003] = {Storage = {46002}},
	[9005] = {Storage = {46003}},
	[9007] = {Storage = {46004}},
	[9009] = {Storage = {46005}},
	[9011] = {Storage = {46006}},
	[9013] = {Storage = {46007}},
	[9015] = {Storage = {46008}},
	[9017] = {Storage = {46009}},
	[9019] = {Storage = {46010}},
	[9021] = {Storage = {46011}},
}

local function isBossAlive(monsterName, centerPos, rangeX, rangeY)
    local spectators = Game.getSpectators(centerPos, false, false, rangeX, rangeX, rangeY, rangeY)
    if not spectators then
        return false
    end

    for _, creature in ipairs(spectators) do
        if creature:isMonster() and creature:getName():lower() == monsterName:lower() then
            return true
        end
    end

    return false
end

local specialItemRanges = {
	{ rangeStart = ITEM_HEALTH_CASK_START, rangeEnd = ITEM_HEALTH_CASK_END },
	{ rangeStart = ITEM_MANA_CASK_START, rangeEnd = ITEM_MANA_CASK_END },
	{ rangeStart = ITEM_SPIRIT_CASK_START, rangeEnd = ITEM_SPIRIT_CASK_END },
	{ rangeStart = ITEM_KEG_START, rangeEnd = ITEM_KEG_END },
}

local function isSpecialItem(itemId)
	for _, range in ipairs(specialItemRanges) do
		if itemId >= range.rangeStart and itemId <= range.rangeEnd then
			return true
		end
	end
	return false
end

local function getPositionDescription(position)
	if position.x == 65535 then
		return "Position: In your inventory."
	else
		return string.format("Position: (%d, %d, %d)", position.x, position.y, position.z)
	end
end

local function handleItemDescription(inspectedThing, lookDistance, player)
	local descriptionText = inspectedThing:getDescription(lookDistance)

	if not player:getGroup():getAccess() then
		if inspectedThing:getId() == ITEM_MAGICWALL or inspectedThing:getId() == ITEM_MAGICWALL_SAFE then
			return "You see a magic wall."
		elseif inspectedThing:getId() == ITEM_WILDGROWTH or inspectedThing:getId() == ITEM_WILDGROWTH_SAFE then
			return "You see rush wood."
		end
	end
	if isSpecialItem(inspectedThing.itemid) then
		local itemCharges = inspectedThing:getCharges()
		if itemCharges > 0 then
			return string.format("You see %s\nIt has %d refillings left.", descriptionText, itemCharges)
		end
	else
		return "You see " .. descriptionText
	end

	return descriptionText
end

local function handleCreatureDescription(inspectedThing, lookDistance)
	local descriptionText = inspectedThing:getDescription(lookDistance)

	if inspectedThing:isMonster() then
		local monsterMaster = inspectedThing:getMaster()
		if monsterMaster and table.contains({ "sorcerer familiar", "knight familiar", "druid familiar", "paladin familiar" }, inspectedThing:getName():lower()) then
			local summonTimeRemaining = monsterMaster:kv():get("familiar-summon-time") or 0
			descriptionText = string.format("%s (Master: %s). It will disappear in %s", descriptionText, monsterMaster:getName(), Game.getTimeInWords(summonTimeRemaining - os.time()))
		end
	end

	return "You see " .. descriptionText
end

local function appendAdminDetails(descriptionText, inspectedThing, inspectedPosition)
	if inspectedThing:isItem() then
		descriptionText = string.format("%s\nClient ID: %d", descriptionText, inspectedThing:getId())

		local itemActionId = inspectedThing:getActionId()
		if itemActionId ~= 0 then
			descriptionText = string.format("%s, Action ID: %d", descriptionText, itemActionId)
		end

		local itemUniqueId = inspectedThing:getUniqueId()
		if itemUniqueId > 0 and itemUniqueId < 65536 then
			descriptionText = string.format("%s, Unique ID: %d", descriptionText, itemUniqueId)
		end

		local doorIdAttribute = inspectedThing:getAttribute(ITEM_ATTRIBUTE_DOORID)
		if doorIdAttribute and doorIdAttribute > 0 then
			descriptionText = string.format("%s, Door ID: %d", descriptionText, doorIdAttribute)
		end

		local itemType = inspectedThing:getType()
		local transformOnEquipId = itemType:getTransformEquipId()
		local transformOnDeEquipId = itemType:getTransformDeEquipId()

		if transformOnEquipId ~= 0 then
			descriptionText = string.format("%s\nTransforms to: %d (onEquip)", descriptionText, transformOnEquipId)
		elseif transformOnDeEquipId ~= 0 then
			descriptionText = string.format("%s\nTransforms to: %d (onDeEquip)", descriptionText, transformOnDeEquipId)
		end

		local itemDecayId = itemType:getDecayId()
		if itemDecayId ~= -1 then
			descriptionText = string.format("%s\nDecays to: %d", descriptionText, itemDecayId)
		end
	elseif inspectedThing:isCreature() then
		local healthDescription, creatureId = "%s\n%s\nHealth: %d / %d"
		if inspectedThing:isPlayer() and inspectedThing:getMaxMana() > 0 then
			creatureId = string.format("Player ID: %i", inspectedThing:getGuid())
			healthDescription = string.format("%s, Mana: %d / %d", healthDescription, inspectedThing:getMana(), inspectedThing:getMaxMana())
		elseif inspectedThing:isMonster() then
			creatureId = string.format("Monster ID: %i", inspectedThing:getId())
		elseif inspectedThing:isNpc() then
			creatureId = string.format("NPC ID: %i", inspectedThing:getId())
		end

		descriptionText = string.format(healthDescription, descriptionText, creatureId, inspectedThing:getHealth(), inspectedThing:getMaxHealth())
	end

	descriptionText = string.format("%s\n%s", descriptionText, getPositionDescription(inspectedPosition))

	if inspectedThing:isCreature() then
		local creatureBaseSpeed = inspectedThing:getBaseSpeed()
		local creatureCurrentSpeed = inspectedThing:getSpeed()
		descriptionText = string.format("%s\nSpeed Base: %d\nSpeed: %d", descriptionText, creatureBaseSpeed, creatureCurrentSpeed)

		if inspectedThing:isPlayer() then
			descriptionText = string.format("%s\nIP: %s", descriptionText, Game.convertIpToString(inspectedThing:getIp()))
		end
	end

	return descriptionText
end

local callback = EventCallback("PlayerOnLookBaseEvent")

function callback.playerOnLook(player, inspectedThing, inspectedPosition, lookDistance)
	local descriptionText

	if inspectedThing:isItem() then
		descriptionText = handleItemDescription(inspectedThing, lookDistance, player)
			if inspectedThing:getActionId() >= 35800 and inspectedThing:getActionId() <= 35810 then
				descriptionText = descriptionText .. "\nRequires: "..config[inspectedThing:getActionId()].cantd[1].." gold coins, "..config[inspectedThing:getActionId()].cantd[2].." "..getItemName(config[inspectedThing:getActionId()].items[2]).." and BOSS Key."
			end
			if inspectedThing:getActionId() >= 36800 and inspectedThing:getActionId() <= 36811 then
			valueentrance = player:getStorageValue(teleports[inspectedThing:getActionId()].Storage[1])
			valuequest = player:getStorageValue(teleports[inspectedThing:getActionId()].Storage[2])
				if valueentrance <= 0 then
					if teleports[inspectedThing:getActionId()].Storage[1] ~= 3500 then
						descriptionText = descriptionText .. "\nEntrance: [Unknown]"
					end
				else
					descriptionText = descriptionText .. "\nEntrance: [Discovered]"
				end
				
				if valuequest <= 0 then					
					descriptionText = descriptionText .. "\nQuest: [Unknown]"
				else
					descriptionText = descriptionText .. "\nQuest: [Done]"
				end
			end
			
			if inspectedThing:getActionId() >= 37800 and inspectedThing:getActionId() <= 37810 then
				descriptionText = descriptionText .. "\nHint: "..hints[inspectedThing:getActionId()].."."
			end
			if inspectedThing:getActionId() >= 38800 and inspectedThing:getActionId() <= 38810 then
				local bossData = bosses[inspectedThing:getActionId()]
				if bossData then
					local alive = isBossAlive(
						bossData.monsterName,
						bossData.centerPos,
						bossData.rangeX or 0,
						bossData.rangeY or 0
					)

					if alive then
						descriptionText = descriptionText .. "\nBoss: [Alive]"
					else
						descriptionText = descriptionText .. "\nBoss: [Not Alive]"
					end
				end
			end
			if inspectedThing:getActionId() >= 9001 and inspectedThing:getActionId() <= 9110 then
				local valueentrance = player:getStorageValue(bossesteleports[inspectedThing:getActionId()].Storage[1])
				if valueentrance < 1 then
					descriptionText = descriptionText .. "\nEntrance: [Undiscovered]"
				else
					descriptionText = descriptionText .. "\nEntrance: [Discovered]"
				end
			end
	elseif inspectedThing:isCreature() then
		descriptionText = handleCreatureDescription(inspectedThing, lookDistance)
		if FISHINGMONSTERS[inspectedThing:getId()] then
            if FISHINGMONSTERS[inspectedThing:getId()].status == 1 then
                descriptionText = descriptionText.."\n It was caught by "..FISHINGMONSTERS[inspectedThing:getId()].owner.."."
            else
                descriptionText = descriptionText.."\n It was released by "..FISHINGMONSTERS[inspectedThing:getId()].owner.."."
            end
        end
	end

	if player:getGroup():getAccess() then
		descriptionText = appendAdminDetails(descriptionText, inspectedThing, inspectedPosition)
	end

	player:sendTextMessage(MESSAGE_LOOK, descriptionText)
end

callback:register()
