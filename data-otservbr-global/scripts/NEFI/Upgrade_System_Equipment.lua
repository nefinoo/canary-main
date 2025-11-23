-- Función para generar los bonus estándar por vocación
local function createDefaultBonuses()
    return {
        [1] = { -- Sorcerer
            {param = CONDITION_PARAM_STAT_MAGICPOINTS, value = 1, charge = 1, gemid = 44185, name = "Magic Level"},
            {param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 100, charge = 1, gemid = 44226, name = "Max HP"},
            {param = CONDITION_PARAM_STAT_MAXMANAPOINTS, value = 100, charge = 1, gemid = 44207, name = "Max Mana"},
            {param = CONDITION_PARAM_SKILL_SHIELD, value = 1, charge = 1, gemid = 44214, name = "Shield"},
            {param = CONDITION_PARAM_ABSORB_FIREPERCENT, value = 1, charge = 1, gemid = 44214, name = "Protection Fire"},
            {param = CONDITION_PARAM_ABSORB_ENERGYPERCENT, value = 1, charge = 1, gemid = 44214, name = "Protection Energy"},
        },
        [2] = { -- Druid
            {param = CONDITION_PARAM_STAT_MAGICPOINTS, value = 1, charge = 1, gemid = 44185, name = "Magic Level"},
            {param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 100, charge = 1, gemid = 44226, name = "Max HP"},
            {param = CONDITION_PARAM_STAT_MAXMANAPOINTS, value = 100, charge = 1, gemid = 44207, name = "Max Mana"},
            {param = CONDITION_PARAM_SKILL_SHIELD, value = 1, charge = 1, gemid = 44214, name = "Shield"},
            {param = CONDITION_PARAM_ABSORB_ICEPERCENT, value = 1, charge = 1, gemid = 44214, name = "Protection Ice"},
            {param = CONDITION_PARAM_ABSORB_EARTHPERCENT, value = 1, charge = 1, gemid = 44214, name = "Protection Earth"},
        },
        [3] = { -- Paladin
            {param = CONDITION_PARAM_SKILL_DISTANCE, value = 1, charge = 1, gemid = 44213, name = "Distance"},
            {param = CONDITION_PARAM_SKILL_SHIELD, value = 1, charge = 1, gemid = 44214, name = "Shield"},
            {param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 100, charge = 1, gemid = 44226, name = "Max HP"},
            {param = CONDITION_PARAM_STAT_MAXMANAPOINTS, value = 100, charge = 1, gemid = 44207, name = "Max Mana"},
            {param = CONDITION_PARAM_ABSORB_HOLYPERCENT, value = 1, charge = 1, gemid = 44214, name = "Protection Holy"},
        },
        [4] = { -- Knight
            {param = CONDITION_PARAM_SKILL_MELEE, value = 1, charge = 1, gemid = 44183, name = "Melee"},
            {param = CONDITION_PARAM_SKILL_SHIELD, value = 1, charge = 1, gemid = 948, name = "Shield"},
            {param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 100, charge = 1, gemid = 44226, name = "Max HP"},
            {param = CONDITION_PARAM_STAT_MAXMANAPOINTS, value = 100, charge = 1, gemid = 44207, name = "Max Mana"},
            {param = CONDITION_PARAM_ABSORB_DEATHPERCENT, value = 1, charge = 1, gemid = 44214, name = "Protection Death"},
        }
    }
end

local function getAllGemIdsFromBonuses()
    local gemIds = {}
    local bonuses = createDefaultBonuses()

    for vocationId, bonusList in pairs(bonuses) do
        for _, bonus in ipairs(bonusList) do
            if bonus.gemid and not gemIds[bonus.gemid] then
                gemIds[bonus.gemid] = true
            end
        end
    end

    local result = {}
    for gemId, _ in pairs(gemIds) do
        table.insert(result, gemId)
    end

    return result
end

local function getNameByGemId(player, item, gemId)
    local itemId = item:getId()
    local vocationId = player:getVocation():getId()

    local bonuses = itemBonusConfig[itemId] and itemBonusConfig[itemId][vocationId]
    if not bonuses then
        return nil
    end

    for _, bonus in ipairs(bonuses) do
        if bonus.gemid == gemId then
            return bonus.name
        end
    end

    return nil
end

function getValueByGemId(player, item, gemId, tier)
    local itemId = item:getId()
    local vocationId = player:getVocation():getId()

    local bonuses = itemBonusConfig[itemId] and itemBonusConfig[itemId][vocationId]
    if not bonuses then
        return nil
    end

    for _, bonus in ipairs(bonuses) do
        if bonus.gemid == gemId then
            if type(bonus.value) == "function" then
                return bonus.value(tier)
            else
                return bonus.value
            end
        end
    end

    return nil
end


-- Configuración de ítems
itemBonusConfig = {
    [3376] = createDefaultBonuses(),
    [7458] = createDefaultBonuses(),
    [3403] = createDefaultBonuses(),
    [3352] = createDefaultBonuses(),
    [830] = createDefaultBonuses(),
    [3408] = createDefaultBonuses(),
    [3354] = createDefaultBonuses(),
    [829] = createDefaultBonuses(),
    [3351] = createDefaultBonuses(),
    [3356] = createDefaultBonuses(),
    [828] = createDefaultBonuses(),
    [6096] = createDefaultBonuses(),
    [3385] = createDefaultBonuses(),
    [827] = createDefaultBonuses(),
    [7462] = createDefaultBonuses(),
    [3396] = createDefaultBonuses(),
    [3573] = createDefaultBonuses(),
    [10385] = createDefaultBonuses(),
    [875] = createDefaultBonuses(),
    [8864] = createDefaultBonuses(),
    [3387] = createDefaultBonuses(),
    [3365] = createDefaultBonuses(),
    [11700] = createDefaultBonuses(),
    [16109] = createDefaultBonuses(),
    [3400] = createDefaultBonuses(),
    [16104] = createDefaultBonuses(),
    [11689] = createDefaultBonuses(),
    [14258] = createDefaultBonuses(),
    [21892] = createDefaultBonuses(),
    [22757] = createDefaultBonuses(),
    [22153] = createDefaultBonuses(),
    [30397] = createDefaultBonuses(),
    [27647] = createDefaultBonuses(),
    [28715] = createDefaultBonuses(),
    [34156] = createDefaultBonuses(),
    [36671] = createDefaultBonuses(),
    [31577] = createDefaultBonuses(),
    [31582] = createDefaultBonuses(),
    -- [4020] = createDefaultBonuses(),
    -- Agrega aquí todos los itemID adicionales que usen los mismos bonuses
}
 
local allowedItemIds = {}
for itemId, _ in pairs(itemBonusConfig) do
    table.insert(allowedItemIds, itemId)
end

for _, gemId in ipairs(getAllGemIdsFromBonuses()) do
local ArmorLegendary = Action()

function ArmorLegendary.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local itemId = item:getId()
    player:openMarket()
    local nombre = target:getName()
    local currentDescription = target:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION)
    local nombreCheck = tonumber(nombre:match("%[(%d+)%]"))
    local tierCheck = tonumber(currentDescription:match("%((%d+)%/"))

    if tierCheck == nil or (tierCheck >= 0 and tierCheck < nombreCheck) then
        if itemId == gemId then
            local targetItemId = target:getId()

            if table.contains(allowedItemIds, targetItemId) then
                player:removeItem(itemId, 1)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The item received the power of the jewel of soul. The hammer broke in the process.")
                player:getPosition():sendMagicEffect(CONST_ME_ORANGE_ENERGY_SPARK)

                if not currentDescription or not currentDescription:lower():find("charges") then
					local description = "Charges (1/"..nombreCheck..")."
					local value = getValueByGemId(player, target, gemId, 1)
					local name = getNameByGemId(player, target, gemId)	
					print(name)
					description = description .. "\n+" .. value .. " " .. name
                    target:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, description)
                else
					local name = getNameByGemId(player, target, gemId)
					local value = getValueByGemId(player, target, gemId, tierCheck + 1) -- tier siguiente

					if not name or not value then
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Esta gema no es compatible con este ítem o vocación.")
						return true
					end
					local currentDescription = target:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION) or ""
					local newCharges = tierCheck + 1
					local maxCharges = nombreCheck
					local newDescription = currentDescription:gsub("Charges %(%d+/%d+%)", "Charges (" .. newCharges .. "/" .. maxCharges .. ")")
					local pattern = "%+(%d+)%s" .. name
					local existingValue = tonumber(currentDescription:match(pattern))
					if existingValue then
						value = value + existingValue
						local updatedLine = "+" .. value .. " " .. name
						newDescription = newDescription:gsub("%+" .. existingValue .. "%s" .. name, updatedLine)
					else
						newDescription = newDescription .. "\n+" .. value .. " " .. name
					end
					target:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, newDescription)
                end
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Be careful, this item does not support a jewel, or you are using the incorrect hammer.")
            end
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need the jewel of soul, hammer of soul, and 100,000 to upgrade.")
        end
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your item already has the maximum power.")
    end

    return true
end

ArmorLegendary:id(gemId)
ArmorLegendary:register()
end

--// Do not touch
local conditionSlots = {
    [CONST_SLOT_HEAD]     = {condition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_HEAD),     id = CONDITIONID_HEAD},
    [CONST_SLOT_NECKLACE] = {condition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_NECKLACE), id = CONDITIONID_NECKLACE},
    [CONST_SLOT_BACKPACK] = {condition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_BACKPACK), id = CONDITIONID_BACKPACK},
    [CONST_SLOT_ARMOR]    = {condition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_ARMOR),    id = CONDITIONID_ARMOR},
    [CONST_SLOT_RIGHT]    = {condition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_RIGHT),    id = CONDITIONID_RIGHT},
    [CONST_SLOT_LEFT]     = {condition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_LEFT),     id = CONDITIONID_LEFT},
    [CONST_SLOT_LEGS]     = {condition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_LEGS),     id = CONDITIONID_LEGS},
    [CONST_SLOT_FEET]     = {condition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_FEET),     id = CONDITIONID_FEET},
    [CONST_SLOT_RING]     = {condition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_RING),     id = CONDITIONID_RING},
    [CONST_SLOT_AMMO]     = {condition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_AMMO),     id = CONDITIONID_AMMO}
}
 
-- Set all conditions to infinite ticks
for i = 1, #conditionSlots do
    conditionSlots[i].condition:setParameter(CONDITION_PARAM_TICKS, -1)
end
 
local params = {
    CONDITION_PARAM_OWNER,
	CONDITION_PARAM_TICKS,
	CONDITION_PARAM_HEALTHGAIN,
	CONDITION_PARAM_HEALTHTICKS,
	CONDITION_PARAM_MANAGAIN,
	CONDITION_PARAM_MANATICKS,
	CONDITION_PARAM_DELAYED,
	CONDITION_PARAM_SPEED,
	CONDITION_PARAM_LIGHT_LEVEL,
	CONDITION_PARAM_LIGHT_COLOR,
	CONDITION_PARAM_SOULGAIN,
	CONDITION_PARAM_SOULTICKS,
	CONDITION_PARAM_MINVALUE,
	CONDITION_PARAM_MAXVALUE,
	CONDITION_PARAM_STARTVALUE,
	CONDITION_PARAM_TICKINTERVAL,
	CONDITION_PARAM_FORCEUPDATE,
	CONDITION_PARAM_SKILL_MELEE,
	CONDITION_PARAM_SKILL_FIST,
	CONDITION_PARAM_SKILL_CLUB,
	CONDITION_PARAM_SKILL_SWORD,
	CONDITION_PARAM_SKILL_AXE,
	CONDITION_PARAM_SKILL_DISTANCE,
	CONDITION_PARAM_SKILL_SHIELD,
	CONDITION_PARAM_SKILL_FISHING,
	CONDITION_PARAM_SKILL_CRITICAL_HIT_CHANCE,
	CONDITION_PARAM_SKILL_CRITICAL_HIT_DAMAGE,
	CONDITION_PARAM_SKILL_LIFE_LEECH_CHANCE,
	CONDITION_PARAM_SKILL_LIFE_LEECH_AMOUNT,
	CONDITION_PARAM_SKILL_MANA_LEECH_CHANCE,
	CONDITION_PARAM_SKILL_MANA_LEECH_AMOUNT,
	CONDITION_PARAM_STAT_MAXHITPOINTS,
	CONDITION_PARAM_STAT_MAXMANAPOINTS,
	CONDITION_PARAM_STAT_MAGICPOINTS,
	CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT,
	CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT,
	CONDITION_PARAM_STAT_MAGICPOINTSPERCENT,
	CONDITION_PARAM_PERIODICDAMAGE,
	CONDITION_PARAM_SKILL_MELEEPERCENT,
	CONDITION_PARAM_SKILL_FISTPERCENT,
	CONDITION_PARAM_SKILL_CLUBPERCENT,
	CONDITION_PARAM_SKILL_SWORDPERCENT,
	CONDITION_PARAM_SKILL_AXEPERCENT,
	CONDITION_PARAM_SKILL_DISTANCEPERCENT,
	CONDITION_PARAM_SKILL_SHIELDPERCENT,
	CONDITION_PARAM_SKILL_FISHINGPERCENT,
	CONDITION_PARAM_BUFF_SPELL,
	CONDITION_PARAM_SUBID,
	CONDITION_PARAM_FIELD,
	CONDITION_PARAM_DISABLE_DEFENSE,
	CONDITION_PARAM_MANASHIELD,
	CONDITION_PARAM_BUFF_DAMAGEDEALT,
	CONDITION_PARAM_BUFF_DAMAGERECEIVED,
	CONDITION_PARAM_DRAIN_BODY,
	CONDITION_PARAM_ABSORB_PHYSICALPERCENT,
	CONDITION_PARAM_ABSORB_FIREPERCENT,
	CONDITION_PARAM_ABSORB_ENERGYPERCENT,
	CONDITION_PARAM_ABSORB_ICEPERCENT,
	CONDITION_PARAM_ABSORB_EARTHPERCENT,
	CONDITION_PARAM_ABSORB_DEATHPERCENT,
	CONDITION_PARAM_ABSORB_HOLYPERCENT,
	CONDITION_PARAM_ABSORB_LIFEDRAINPERCENT,
	CONDITION_PARAM_ABSORB_MANADRAINPERCENT,
	CONDITION_PARAM_ABSORB_DROWNPERCENT,
	CONDITION_PARAM_INCREASE_PHYSICALPERCENT,
	CONDITION_PARAM_INCREASE_FIREPERCENT,
	CONDITION_PARAM_INCREASE_ENERGYPERCENT,
	CONDITION_PARAM_INCREASE_ICEPERCENT,
	CONDITION_PARAM_INCREASE_EARTHPERCENT,
	CONDITION_PARAM_INCREASE_DEATHPERCENT,
	CONDITION_PARAM_INCREASE_HOLYPERCENT,
	CONDITION_PARAM_INCREASE_LIFEDRAINPERCENT,
	CONDITION_PARAM_INCREASE_MANADRAINPERCENT,
	CONDITION_PARAM_INCREASE_DROWNPERCENT,
}
--\\