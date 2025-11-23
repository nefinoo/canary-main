-- ⚒️ CONFIGURACIÓN DE LOS SETS
local config = {
    Knight = {
	-- 1
        ["Level F"]  = {helmet = 51226, armor = 51229, legs = 51212, boots = 51228, shield = 51697,
            materials = {
			
			helmets = {
			{id = 39148, count = 1},{id = 37609, count = 1},{id = 49531, count = 1},{id = 30397, count = 1},{id = 40588, count = 1},{id = 31577, count = 1},{id = 16109, count = 1},{id = 10385, count = 1}},
						
			armors = {
			{id = 39147, count = 1},{id = 44621, count = 1},{id = 28719, count = 1},{id = 44620, count = 1},{id = 36663, count = 1},{id = 11686, count = 1},{id = 13993, count = 1},{id = 8056, count = 1}},
			
			legs = {
			{id = 43876, count = 1},{id = 28720, count = 1},{id = 44642, count = 1},{id = 32617, count = 1},{id = 37607, count = 1},{id = 40589, count = 1},{id = 35516, count = 1},{id = 13999, count = 1}},
			
			boots = {
			{id = 34097, count = 1},{id = 22756, count = 1},{id = 3555, count = 1},{id = 30394, count = 1},{id = 13997, count = 1},{id = 39158, count = 1},{id = 10201, count = 1},{id = 9017, count = 1}},
			
			{id = 5901, count = 50}, 
			{id = 3029, count = 20}, 
			{id = 37110, count = 1}}, 
			price = 1000000},
			
	-- 2		
        ["Level E"]  = {helmet = 51062, armor = 51059, legs = 51060, boots = 51061, shield = 51063,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 1000},
			
	-- 3		
        ["Level D"]  = {helmet = 51040, armor = 51041, legs = 51042, boots = 51043, shield = 51039,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 1500},
			
	-- 4		
        ["Level C"]  = {helmet = 51242, armor = 51243, legs = 51244, boots = 51245, shield = 51506,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 2000},
			
	-- 5		
        ["Level B"]  = {helmet = 51905, armor = 51906, legs = 51911, boots = 51912, shield = 51916,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 2500},
			
	-- 6		
        ["Level A"]  = {helmet = 51881, armor = 51882, legs = 51883, boots = 51884, shield = 51885,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 3000},
			
	-- 7		
        ["Level A+"] = {helmet = 52709, armor = 52713, legs = 52714, boots = 52715, shield = 52734,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 3500},
			
	-- 8		
        ["Level A++"] = {helmet = 52359, armor = 52360, legs = 52361, boots = 52362, shield = 52333,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 4000},
			
	-- 9		
        ["Level S"]  = {helmet = 52664, armor = 52665, legs = 52666, boots = 52667, shield = 52668,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 4500},
			
	-- 10		
        ["Level S+"] = {helmet = 50408, armor = 50406, legs = 50409, boots = 50407, shield = 50410,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 5000},
			
	-- 11		
        ["Level S++"] = {helmet = 50457, armor = 50458, legs = 50459, boots = 50460, shield = 51734,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 5500},
			
	-- 12		
        ["Level M"]  = {helmet = 50666, armor = 50679, legs = 50667, boots = 50663, shield = 50668,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 6000},
			
	-- 13		
        ["Level L"]  = {helmet = 50821, armor = 50813, legs = 50822, boots = 50818, shield = 50824,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 6500},
			
    },

    Paladin = {
	-- 1
        ["Level F"]  = {helmet = 51230, armor = 51231, legs = 51232, boots = 51233, shield = 52367,
            materials = {
			
			helmets = {
			{id = 39149, count = 1},{id = 49532, count = 1},{id = 28715, count = 1},{id = 11689, count = 1},{id = 34156, count = 1},{id = 44636, count = 1},{id = 29427, count = 1},{id = 13995, count = 1}},
						
			armors = {
			{id = 34094, count = 1},{id = 44622, count = 1},{id = 40591, count = 1},{id = 27648, count = 1},{id = 32628, count = 1},{id = 13994, count = 1},{id = 8060, count = 1},{id = 8058, count = 1}},
			
			legs = {
			{id = 43881, count = 1},{id = 36667, count = 1},{id = 40590, count = 1},{id = 3389, count = 1},{id = 35517, count = 1},{id = 8863, count = 1},{id = 16111, count = 1},{id = 8095, count = 1}},
			
			boots = {
			{id = 34098, count = 1},{id = 39161, count = 1},{id = 44648, count = 1},{id = 31617, count = 1},{id = 16112, count = 1},{id = 10323, count = 1},{id = 10200, count = 1},{id = 3550, count = 1}},
			
			{id = 5901, count = 50}, 
			{id = 3029, count = 20}, 
			{id = 37110, count = 1}}, 
			price = 1000000},
			
	-- 2		
        ["Level E"]  = {helmet = 51200, armor = 51201, legs = 51202, boots = 51203, shield = 53419,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 2500},
			
	-- 3		
        ["Level D"]  = {helmet = 51200, armor = 51201, legs = 51202, boots = 51203, shield = 53419,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 2500},
			
	-- 4		
        ["Level C"]  = {helmet = 51251, armor = 51252, legs = 51253, boots = 51254, shield = 52169,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 2000},
			
	-- 5		
        ["Level B"]  = {helmet = 51044, armor = 51045, legs = 51046, boots = 51047, shield = 51048,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 1500},	
			
	-- 6		
        ["Level A"]  = {helmet = 51874, armor = 51875, legs = 51876, boots = 51877, shield = 51878,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 3000},
			
	-- 7		
        ["Level A+"] = {helmet = 52707, armor = 52710, legs = 52711, boots = 52712, shield = 53375,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 3500},
			
	-- 8		
        ["Level A++"] = {helmet = 52354, armor = 52355, legs = 52356, boots = 52357, shield = 52358,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 4000},
			
	-- 9		
        ["Level S"]  = {helmet = 52653, armor = 52654, legs = 52655, boots = 52656, shield = 52657,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 4500},
			
	-- 10		
        ["Level S+"] = {helmet = 50403, armor = 50401, legs = 50404, boots = 50402, shield = 50405,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 5000},
			
	-- 11		
        ["Level S++"] = {helmet = 50466, armor = 50467, legs = 50468, boots = 50469, shield = 50470,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 5500},
			
	-- 12		
        ["Level M"]  = {helmet = 50653, armor = 50662, legs = 50654, boots = 50650, shield = 50655,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 6000},
			
	-- 13		
        ["Level L"]  = {helmet = 50832, armor = 50828, legs = 50833, boots = 50829, shield = 50834,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 6500},
    },

    Sorcerer = {
	-- 1
        ["Level F"]  = {helmet = 51076, armor = 51077, legs = 51078, boots = 51079, shield = 51080,
            materials = {
			
			helmets = {
			{id = 39151, count = 1},{id = 49533, count = 1},{id = 28714, count = 1},{id = 36670, count = 1},{id = 31582, count = 1},{id = 22757, count = 1},{id = 3210, count = 1},{id = 27522, count = 1}},
						
			armors = {
			{id = 34095, count = 1},{id = 31583, count = 1},{id = 39164, count = 1},{id = 44623, count = 1},{id = 8062, count = 1},{id = 8039, count = 1},{id = 8040, count = 1},{id = 8037, count = 1}},
			
			legs = {
			{id = 34092, count = 1},{id = 27649, count = 1},{id = 39166, count = 1},{id = 44643, count = 1},{id = 32618, count = 1},{id = 13996, count = 1},{id = 24402, count = 1},{id = 32097, count = 1}},
			
			boots = {
			{id = 3246, count = 1},{id = 23476, count = 1},{id = 3553, count = 1},{id = 32619, count = 1},{id = 44649, count = 1},{id = 43884, count = 1},{id = 35519, count = 1},{id = 40592, count = 1}},
			
			{id = 5901, count = 50}, 
			{id = 3029, count = 20}, 
			{id = 37110, count = 1}}, 
			price = 1000000},
			
	-- 2		
        ["Level E"]  = {helmet = 51049, armor = 51050, legs = 51051, boots = 51052, shield = 51053,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 1000},
			
	-- 3		
        ["Level D"]  = {helmet = 52374, armor = 52373, legs = 52372, boots = 52371, shield = 52370,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 2500},
			
	-- 4		
        ["Level C"]  = {helmet = 51238, armor = 51239, legs = 51240, boots = 51241, shield = 53328,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 1500},
			
	-- 5
        ["Level B"]  = {helmet = 51260, armor = 51259, legs = 51261, boots = 51262, shield = 51510,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 2000},
			
	-- 6		
        ["Level A"]  = {helmet = 51860, armor = 51861, legs = 51862, boots = 51863, shield = 51864,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 3000},
			
	-- 7		
        ["Level A+"] = {helmet = 52708, armor = 52716, legs = 52717, boots = 52718, shield = 52737,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 3500},
			
	-- 8		
        ["Level A++"] = {helmet = 52349, armor = 52350, legs = 52351, boots = 52352, shield = 52353,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 4000},
			
	-- 9		
        ["Level S"]  = {helmet = 52676, armor = 52677, legs = 52678, boots = 52679, shield = 52680,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 4500},
			
	-- 10		
        ["Level S+"] = {helmet = 50398, armor = 50396, legs = 50399, boots = 50397, shield = 50400,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 5000},
			
	-- 11		
        ["Level S++"] = {helmet = 50462, armor = 50463, legs = 50464, boots = 50465, shield = 50461,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 5500},
			
	-- 12		
        ["Level M"]  = {helmet = 50660, armor = 50656, legs = 50661, boots = 50659, shield = 50658,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 6000},
			
	-- 13		
        ["Level L"]  = {helmet = 50840, armor = 50837, legs = 50841, boots = 50839, shield = 50838,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 6500},
    },

    Druid = {
	-- 1
        ["Level F"]  = {helmet = 51070, armor = 51071, legs = 51072, boots = 51073, shield = 51074,
            materials = {
			
			helmets = {
			{id = 22754, count = 1},{id = 16104, count = 1},{id = 8864, count = 1},{id = 27647, count = 1},{id = 49534, count = 1},{id = 39153, count = 1},{id = 36671, count = 1},{id = 44637, count = 1}},
						
			armors = {
			{id = 29418, count = 1},{id = 44619, count = 1},{id = 34096, count = 1},{id = 8038, count = 1},{id = 31578, count = 1},{id = 8041, count = 1},{id = 39165, count = 1},{id = 44624, count = 1}},
			
			legs = {
			{id = 3398, count = 1},{id = 22087, count = 1},{id = 645, count = 1},{id = 19366, count = 1},{id = 16106, count = 1},{id = 39167, count = 1},{id = 40595, count = 1},{id = 34093, count = 1}},
			
			boots = {
			{id = 32098, count = 1},{id = 19374, count = 1},{id = 30196, count = 1},{id = 37610, count = 1},{id = 35520, count = 1},{id = 40593, count = 1},{id = 43887, count = 1},{id = 29424, count = 1}},
			
			{id = 5901, count = 50}, 
			{id = 3029, count = 20}, 
			{id = 37110, count = 1}}, 
			price = 1000000},
			
	-- 2		
        ["Level E"]  = {helmet = 51054, armor = 51055, legs = 51056, boots = 51057, shield = 51058,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 1000},
			
	-- 3		
        ["Level D"]  = {helmet = 51234, armor = 51235, legs = 51236, boots = 51237, shield = 51504,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 1500},
			
	-- 4		
        ["Level C"]  = {helmet = 51255, armor = 51256, legs = 51257, boots = 51258, shield = 51509,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 2000},
			
	-- 5		
        ["Level B"]  = {helmet = 51213, armor = 51208, legs = 51210, boots = 51216, shield = 50475,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 2500},
			
	-- 6		
        ["Level A"]  = {helmet = 51867, armor = 51868, legs = 51869, boots = 51870, shield = 51871,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 3000},
			
	-- 7		
        ["Level A+"] = {helmet = 52719, armor = 52720, legs = 52721, boots = 52722, shield = 52706,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 3500},
			
	-- 8		
        ["Level A++"] = {helmet = 52344, armor = 52345, legs = 52346, boots = 52347, shield = 52348,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 4000},
			
	-- 9		
        ["Level S"]  = {helmet = 52670, armor = 52671, legs = 52672, boots = 52673, shield = 52674,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 4500},
			
	-- 10		
        ["Level S+"] = {helmet = 50413, armor = 50411, legs = 50414, boots = 50412, shield = 50415,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 5000},
			
	-- 11		
        ["Level S++"] = {helmet = 50471, armor = 50472, legs = 50473, boots = 50474, shield = 52746,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 5500},
			
	-- 12		
        ["Level M"]  = {helmet = 50676, armor = 50677, legs = 50675, boots = 50674, shield = 50673,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 6000},
			
	-- 13		
        ["Level L"]  = {helmet = 50810, armor = 50812, legs = 50809, boots = 50808, shield = 50807,
            materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 6500},
    }
}

-- orden de los sets
local setOrder = {
    "Level F", "Level E", "Level D", "Level C", "Level B",
    "Level A", "Level A+", "Level A++", "Level S", "Level S+",
    "Level S++", "Level M", "Level L"
}

local action = Action()

function action.onUse(player, item, fromPos, target, toPos, isHotkey)
    -- primer menú vocaciones
    local vocationMenu = ModalWindow{
        title = "FORGE EQUIPMENT",
        message = "Select vocation:"
    }

    for vocName, _ in pairs(config) do
        vocationMenu:addChoice(vocName, function(player, button, choice)
            if button.name ~= "Select" then return end

            local setMenu = ModalWindow{
                title = "FORGE EQUIPMENT",
                message = "Select set for "..vocName..":"
            }

            for _, setName in ipairs(setOrder) do
                local setData = config[vocName][setName]
                if setData then
                    setMenu:addChoice(setName, function(player, button, choice)
                        if button.name ~= "Select" then return end

                        local pieceMenu = ModalWindow{
                            title = "FORGE EQUIPMENT",
                            message = "Select piece from "..setName..":"
                        }

                        for _, piece in ipairs({"helmet", "armor", "legs", "boots", "shield"}) do
                            local id = setData[piece]
                            pieceMenu:addChoice(piece:sub(1,1):upper()..piece:sub(2)..": "..getItemName(id), function(player, button, choice)
                                if button.name ~= "Select" then return end

                                -- Validar materiales y dinero
                                local missing = {}
                                for _, mat in ipairs(setData.materials) do
                                    local have = player:getItemCount(mat.id)
                                    if have < mat.count then
                                        table.insert(missing, (mat.count - have).."x "..getItemName(mat.id))
                                    end
                                end

                                if player:getMoney() + player:getBankBalance() < setData.price then
                                    table.insert(missing, (setData.price - (player:getMoney() + player:getBankBalance())).." gold coins")
                                end

                                if #missing > 0 then
                                    player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You are missing: "..table.concat(missing, ", "))
                                    return
                                end

                                -- consumir materiales
                                for _, mat in ipairs(setData.materials) do
                                    player:removeItem(mat.id, mat.count)
                                end
                                if not player:removeMoneyBank(setData.price) then
                                    player:removeMoney(setData.price)
                                end

                                -- entregar ítem
                                player:addItem(id, 1)
                                player:sendTextMessage(MESSAGE_INFO_DESCR, "You forged "..getItemName(id).." ("..setName.." "..vocName..").")
                            end)
                        end
	
                       pieceMenu:addButton("Details", function(player, button, choice)
							if button.name ~= "Details" then return end
							pieceMenu:sendToPlayer(player)

							local selectType = choice.text:match("(.+):"):lower()

							-- convertir a plural para buscar en la subsección
							local pluralMap = {
								armor = "armors",
								helmet = "helmets",
								leg = "legs",
								boots = "boots",
								shield = "shields"
							}
							local pluralType = pluralMap[selectType] or selectType

							local id = setData[selectType]
							local itemType = ItemType(id)

							local lines = {}
							table.insert(lines, "############################")
							table.insert(lines, "Name: "..itemType:getName())
							table.insert(lines, "Weight: "..itemType:getWeight())
							table.insert(lines, "Description: "..itemType:getDescription())
							table.insert(lines, "############################")
							table.insert(lines, "Price to forge: "..setData.price.." gold coins.")

							-- usar la subsección plural si existe, si no la lista general
							local materials = setData.materials[pluralType] or setData.materials
							for _, mat in ipairs(materials) do
								local have = player:getItemCount(mat.id)
								local need = mat.count
								local status = (have >= need) and "OK" or ("Missing "..(need - have))
								table.insert(lines, getItemName(mat.id)..": "..need.." ("..status..")")
							end

							player:showTextDialog(id, table.concat(lines, "\n"))
						end)


                        pieceMenu:addButton("Back", function(p, b, c) setMenu:sendToPlayer(p) end)
                        pieceMenu:addButton("Close")
                        pieceMenu:sendToPlayer(player)
                    end)
                end
            end

            setMenu:addButton("Select")
            setMenu:addButton("Back", function(p, b, c) vocationMenu:sendToPlayer(p) end)
            setMenu:addButton("Close")
            setMenu:sendToPlayer(player)
        end)
    end

    vocationMenu:addButton("Select")
    vocationMenu:addButton("Exit")
    vocationMenu:sendToPlayer(player)
    return false
end

action:uid(35155)
action:register()