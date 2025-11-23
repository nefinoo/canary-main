local config = {
    [0] = {name = 'Leather', helmet = 3355, armor = 3361, legs = 3559, boots = 3552, shield = 3445},
    [1] = {name = 'Studded', helmet = 3376, armor = 3378, legs = 3362, boots = 3551, shield = 3426, materials = {{id = 5901, count = 50}, {id = 3029, count = 20}, {id = 37110, count = 1}}, price = 500},
    [2] = {name = 'Tusk', helmet = 7458, armor = 7463, legs = 7464, boots = 9020, shield = 3443, materials = {{id = 3044, count = 50}, {id = 3030, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [3] = {name = 'Tribal', helmet = 3403, armor = 3404, legs = 3560, boots = 9017, shield = 3444, materials = {{id = 10307, count = 50}, {id = 3032, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [4] = {name = 'Chain', helmet = 3352, armor = 3358, legs = 3558, boots = 19374, shield = 3413, materials = {{id = 27270, count = 50}, {id = 16124, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [5] = {name = 'Terra', helmet = 830, armor = 811, legs = 812, boots = 813, shield = 8081, materials = {{id = 27301, count = 50}, {id = 16123, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [6] = {name = 'Bonelord', helmet = 3408, armor = 3399, legs = 8095, boots = 3556, shield = 3418, materials = {{id = 31336, count = 50}, {id = 16122, count = 20}, {id = 37110, count = 1}}, price = 2500},
	[7] = {name = 'Brass', helmet = 3354, armor = 3359, legs = 3372, boots = 3550, shield = 3411, materials = {{id = 37604, count = 50}, {id = 16125, count = 20}, {id = 37110, count = 1}}, price = 2500},
	[8] = {name = 'Frozen', helmet = 829, armor = 824, legs = 823, boots = 819, shield = 8079, materials = {{id = 23519, count = 50}, {id = 16126, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [9] = {name = 'Steel', helmet = 3351, armor = 3357, legs = 3557, boots = 3554, shield = 3409, materials = {{id = 27447, count = 50}, {id = 16127, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [10] = {name = 'Knight', helmet = 3356, armor = 3370, legs = 3371, boots = 9406, shield = 3428, materials = {{id = 16135, count = 50}, {id = 948, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [11] = {name = 'Energy', helmet = 828, armor = 825, legs = 822, boots = 820, shield = 8080, materials = {{id = 23520, count = 50}, {id = 946, count = 20}, {id = 37110, count = 1}}, price = 2500},
	[12] = {name = 'Pirate', helmet = 6096, armor = 6095, legs = 5918, boots = 5461, shield = 6432, materials = {{id = 35572, count = 50}, {id = 27867, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [13] = {name = 'Crown', helmet = 3385, armor = 3381, legs = 3382, boots = 21981, shield = 3419, materials = {{id = 4871, count = 50}, {id = 16167, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [14] = {name = 'Magma', helmet = 827, armor = 826, legs = 821, boots = 818, shield = 2510, materials = {{id = 5467, count = 50}, {id = 16130, count = 20}, {id = 37110, count = 1}}, price = 2500},    
	[15] = {name = 'Fur', helmet = 7462, armor = 22085, legs = 22087, boots = 3079, shield = 17810, materials = {{id = 27657, count = 50}, {id = 29346, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [16] = {name = 'Dwarven', helmet = 3396, armor = 3397, legs = 3398, boots = 4033, shield = 3425, materials = {{id = 9058, count = 50}, {id = 942, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [17] = {name = 'Blue', helmet = 3210, armor = 3567, legs = 645, boots = 32619, shield = 16110, materials = {{id = 30004, count = 50}, {id = 9067, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [18] = {name = 'Zaoan', helmet = 10385, armor = 10384, legs = 10387, boots = 10386, shield = 14088, materials = {{id = 10414, count = 50}, {id = 33926, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [19] = {name = 'Heat', helmet = 875, armor = 21167, legs = 21168, boots = 21169, shield = 6390, materials = {{id = 21815, count = 50}, {id = 944, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [20] = {name = 'Yalahari', helmet = 8864, armor = 8862, legs = 8863, boots = 23477, shield = 3417, materials = {{id = 3235, count = 50}, {id = 945, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [21] = {name = 'Demon', helmet = 3387, armor = 3388, legs = 3389, boots = 8191, shield = 3420, materials = {{id = 5906, count = 50}, {id = 940, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [22] = {name = 'Golden', helmet = 3365, armor = 3360, legs = 3364, boots = 3555, shield = 3423, materials = {{id = 27446, count = 50}, {id = 34143, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [23] = {name = 'Sedge', helmet = 11700, armor = 14086, legs = 19366, boots = 3246, shield = 19373, materials = {{id = 19361, count = 50}, {id = 34142, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [24] = {name = 'Prismatic', helmet = 16109, armor = 16110, legs = 14768, boots = 14769, shield = 16116, materials = {{id = 31333, count = 50}, {id = 34139, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [25] = {name = 'Dragon Scale', helmet = 3400, armor = 3386, legs = 3363, boots = 10201, shield = 3422, materials = {{id = 9611, count = 50}, {id = 3041, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [26] = {name = 'Gill', helmet = 16104, armor = 16105, legs = 16106, boots = 22774, shield = 22890, materials = {{id = 30009, count = 50}, {id = 3039, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [27] = {name = 'Royal Draken', helmet = 11689, armor = 11686, legs = 11687, boots = 9932, shield = 11688, materials = {{id = 16131, count = 50}, {id = 3038, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [28] = {name = 'Depth', helmet = 14258, armor = 13994, legs = 13996, boots = 13997, shield = 13998, materials = {{id = 14044, count = 50}, {id = 23523, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [29] = {name = 'Furious', helmet = 21892, armor = 17111, legs = 14087, boots = 31617, shield = 25545, materials = {{id = 16139, count = 50}, {id = 23507, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [30] = {name = 'Fabulous', helmet = 22757, armor = 32628, legs = 32617, boots = 35519, shield = 22758, materials = {{id = 34100, count = 50}, {id = 33947, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [31] = {name = 'Ornate', helmet = 24809, armor = 13993, legs = 13999, boots = 13997, shield = 14000, materials = {{id = 34103, count = 50}, {id = 29287, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [32] = {name = 'Beast', helmet = 30397, armor = 31578, legs = 35517, boots = 22086, shield = 20355, materials = {{id = 24381, count = 50}, {id = 30180, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [33] = {name = 'Gnome', helmet = 27647, armor = 27648, legs = 27649, boots = 30394, shield = 27650, materials = {{id = 27307, count = 50}, {id = 29288, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [34] = {name = 'Falcon', helmet = 28715, armor = 28719, legs = 28720, boots = 35520, shield = 28722, materials = {{id = 28823, count = 50}, {id = 30061, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [35] = {name = 'Lion', helmet = 34156, armor = 34157, legs = 32618, boots = 29424, shield = 34154, materials = {{id = 34160, count = 50}, {id = 30059, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [36] = {name = 'Eldritch', helmet = 36671, armor = 36663, legs = 36667, boots = 10200, shield = 36656, materials = {{id = 36835, count = 50}, {id = 30060, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [37] = {name = 'Souls Tier 1', helmet = 31577, armor = 34096, legs = 34092, boots = 34098, shield = 34099, materials = {{id = 32698, count = 50}, {id = 34102, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [38] = {name = 'Souls Tier 2', helmet = 31582, armor = 34094, legs = 34093, boots = 3551, shield = 34097, materials = {{id = 32583, count = 50}, {id = 39040, count = 20}, {id = 37110, count = 1}}, price = 2500},
    [39] = {name = 'Unknown', helmet = 37609, armor = 37608, legs = 37607, boots = 37610, shield = 29430, materials = {{id = 3029, count = 50}, {id = 16138, count = 20}, {id = 37110, count = 1}}, price = 2500},
}

local action = Action()

function action.onUse(player, item, fromPos, target, toPos, isHotkey)
	local menu = ModalWindow{
		title = "FORGE EQUIPMENT",
		message = "Choice a Material:"
	}

	-- local secondMenu = ModalWindow{
		-- title = "FORGE EQUIPMENT",
		-- message = "Choice Piece:"
	-- }

	local thirdMenu = ModalWindow{
		title = "FORGE EQUIPMENT",
		message = "Closing Details."
	}
	
	for  x = 1, 39 do
		local material = config[x]
		menu:addChoice(string.format("%s", material.name), function (player, button, choice)
			if button.name ~= "Select" then
				return
			end

			local secondMenu = ModalWindow{title = "FORGE EQUIPMENT",	message = "Choice Piece from "..material.name..":"}
			secondMenu:clear()
			secondMenu:addChoice(string.format("Helmet: %s", getItemName(material.helmet)))
			secondMenu:addChoice(string.format("Armor: %s", getItemName(material.armor)))
			secondMenu:addChoice(string.format("Legs: %s", getItemName(material.legs)))
			secondMenu:addChoice(string.format("Boots: %s", getItemName(material.boots)))
			secondMenu:addChoice(string.format("Shield: %s", getItemName(material.shield)))
			
				secondMenu:addButton("Forge", function (player, button, choice)
				
				local selectType = choice.text:match("(.+):"):lower()
				local itemId = material[selectType]
				local material2 = config[x-1]
				--COMPROBAR SI TIENE LOS MATERIALES--
				if player:getItemCount(material.materials[1].id) < material.materials[1].count or player:getItemCount(material.materials[2].id) < material.materials[2].count or player:getItemCount(material.materials[3].id) < material.materials[3].count then
					player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You dont have enough items to forge this equip.")
					player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You need "..(material.materials[1].count - player:getItemCount(material.materials[1].id)).. " "..getItemName(material.materials[1].id)..".")
					player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You need "..(material.materials[2].count - player:getItemCount(material.materials[2].id)).. " "..getItemName(material.materials[2].id)..".")
					player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You need "..(material.materials[3].count - player:getItemCount(material.materials[3].id)).. " "..getItemName(material.materials[3].id)..".")
					return false
				end
				--COMPROBAR SI TIENE LOS 3 ITEMS NECESARIOS ANTERIORES --
				if itemId == material.helmet then
						if player:getItemCount(material2.helmet) < 3 then 					
							player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You dont have enough items to forge this equip.")
							player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You need a "..(3 - player:getItemCount(material2.helmet)).. " "..getItemName(material2.helmet)..".")
							return false
						else
							itemaremover = material2.helmet
						end
				elseif itemId == material.armor then 
						if player:getItemCount(material2.armor) < 3 then 					
							player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You dont have enough items to forge this equip.")
							player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You need a "..(3 - player:getItemCount(material2.armor)).. " "..getItemName(material2.armor)..".")
							return false
						else
							itemaremover = material2.armor
						end
				elseif itemId == material.legs then 
						if player:getItemCount(material2.legs) < 3 then 					
							player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You dont have enough items to forge this equip.")
							player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You need a "..(3 - player:getItemCount(material2.legs)).. " "..getItemName(material2.legs)..".")
							return false
						else
							itemaremover = material2.legs
						end
				elseif itemId == material.boots then 
						if player:getItemCount(material2.boots) < 3 then 					
							player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You dont have enough items to forge this equip.")
							player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You need a "..(3 - player:getItemCount(material2.boots)).. " "..getItemName(material2.boots)..".")
							return false
						else
							itemaremover = material2.boots
						end
				elseif itemId == material.shield then
						if player:getItemCount(material2.shield) < 3 then 					
							player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You dont have enough items to forge this equip.")
							player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You need a "..(3 - player:getItemCount(material2.shield)).. " "..getItemName(material2.shield)..".")
							return false
						else
							itemaremover = material2.shield
						end
				end
				--COMPROBAR SI TIENE DINERO--
				if player:getMoney() < material.price then
						if player:getBankBalance() < material.price then
							player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You dont have enough money in your backpack or bank account.")
							player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You need "..(material.price - player:getMoney()).. " gold coins.")
							return false
						else
							player:setBankBalance(player:getBankBalance() - material.price)
							player:removeItem(material.materials[1].id, material.materials[1].count)
							player:removeItem(material.materials[2].id, material.materials[2].count)
							player:removeItem(material.materials[3].id, material.materials[3].count)
							player:removeItem(itemaremover, 3)
							player:sendTextMessage(MESSAGE_INFO_DESCR, "You buy "..getItemName(itemId)..".")
							player:addItem(itemId, 1)							
						end
				else
							player:setBankBalance(player:getBankBalance() - material.price)
							player:removeItem(material.materials[1].id, material.materials[1].count)
							player:removeItem(material.materials[2].id, material.materials[2].count)
							player:removeItem(material.materials[3].id, material.materials[3].count)
							player:removeItem(itemaremover, 3)
							player:sendTextMessage(MESSAGE_INFO_DESCR, "You buy "..getItemName(itemId)..".")
							player:addItem(itemId, 1)	
				end
				end)
				
				secondMenu:addButton("Details", function (player, button, choice)
				if button.name ~= "Details" then
					return
				end
				secondMenu:sendToPlayer(player)

				local text = ""
				local selectType = choice.text:match("(.+):"):lower()
				local itemId = material[selectType]
				local itemType = ItemType(itemId)
				local material2 = config[x-1]
				--
				if player:getItemCount(material.materials[1].id) >= material.materials[1].count then
					txtrema1 = "Can be forged."
				else
					txtrema1 = (material.materials[1].count - player:getItemCount(material.materials[1].id)).. " "..getItemName(material.materials[1].id).." left."
				end
				
				if player:getItemCount(material.materials[2].id) >= material.materials[2].count then
					txtrema2 = "Can be forged."
				else
					txtrema2 = (material.materials[2].count - player:getItemCount(material.materials[2].id)).. " "..getItemName(material.materials[2].id).." left."
				end
				
				if player:getItemCount(material.materials[3].id) >= material.materials[3].count then
					txtrema3 = "Can be forged."
				else								
					txtrema3 = (material.materials[3].count - player:getItemCount(material.materials[3].id)).. " "..getItemName(material.materials[3].id).." left."
				end
				--
				if player:getMoney() < material.price then
					if player:getBankBalance() < material.price then
						txtprice = material.price - player:getMoney().." gold coins left."
					else
						txtprice = "Can be bought."	
					end
				else
					txtprice = "Can be bought."	
				end
				--
				if itemId == material.helmet then				
							txtweapon = string.format("Helmet Need to Forge: 3x %s", getItemName(material2.helmet))
							if player:getItemCount(material2.helmet) < 3  then
								txtweapon2 = "[You need to look for this helmet]"
							else
								txtweapon2 = "[Helmets in possession]"
							end
				elseif itemId == material.armor then
							txtweapon = string.format("Armor Need to Forge: 3x %s", getItemName(material2.armor))
							if player:getItemCount(material2.armor) < 3  then
								txtweapon2 = "[You need to look for this armor]"
							else
								txtweapon2 = "[Armors in possession]"
							end
				elseif itemId == material.legs then
							txtweapon = string.format("Legs Need to Forge: 3x %s", getItemName(material2.legs))
							if player:getItemCount(material2.legs) < 3  then
								txtweapon2 = "[You need to look for this legs]"
							else
								txtweapon2 = "[Legs in possession]"
							end
				elseif itemId == material.boots then
							txtweapon = string.format("Boots Need to Forge: 3x %s", getItemName(material2.boots))
							if player:getItemCount(material2.boots) < 3  then
								txtweapon2 = "[You need to look for this boots]"
							else
								txtweapon2 = "[Boots in possession]"
							end
				elseif itemId == material.shield then
							txtweapon = string.format("Shield Need to Forge: 3x %s", getItemName(material2.shield))
							if player:getItemCount(material2.shield) < 3  then
								txtweapon2 = "[You need to look for this shield]"
							else
								txtweapon2 = "[Shields in possession]"
							end
				end
				local description = {
						string.format("############################"),
						string.format("Name: %s", itemType:getName()),
						string.format("Weight: %s", itemType:getWeight()),
						string.format("Description: %s", itemType:getDescription()),
						string.format("############################"),
						string.format("Price to forge: %s", material.price.." gold coins."),
						string.format("Remaining money: %s", txtprice),
						string.format("############################"),	
						string.format("Material to forge: %s", material.materials[1].count.. " "..getItemName(material.materials[1].id).."."),
						string.format("Material to forge: %s", material.materials[2].count.. " "..getItemName(material.materials[2].id).."."),
						string.format("Material to forge: %s", material.materials[3].count.. " "..getItemName(material.materials[3].id).."."),
						string.format(""),
						string.format("Remaining material: %s", txtrema1),
						string.format("Remaining material: %s", txtrema2),
						string.format("Remaining material: %s", txtrema3),
						string.format("############################"),
						string.format(txtweapon),
						string.format(txtweapon2),
						string.format("############################")	
					}
				text = text .. table.concat(description, "\n")						
				player:showTextDialog(itemId, text)
			end)
			secondMenu:addButton("Back", function (player, button, choice)
				menu:sendToPlayer(player)
			end)
			secondMenu:addButton("Close")
			secondMenu:sendToPlayer(player)
		end)
	end

	menu:addButton("Select")
	menu:addButton("Exit")

	menu:sendToPlayer(player)
	return false
end

action:uid(35151)
action:register()