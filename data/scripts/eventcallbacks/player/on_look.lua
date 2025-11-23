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
