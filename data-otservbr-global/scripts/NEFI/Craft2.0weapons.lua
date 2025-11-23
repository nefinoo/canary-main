local config = {
	[0] = {name = 'Novice', crossbow = 3298, bow = 1781, axe = 3276, club = 3270, sword = 3291, wand = 23719, rod = 23721, price = 50000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 10},
    [1] = {name = 'Novice', crossbow = 3277, bow = 3287, axe = 3316, club = 3327, sword = 7774, wand = 2401, rod = 3068, price = 50000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 10},
    [2] = {name = 'Level F', crossbow = 7378, bow = 3350, axe = 3274, club = 32010, sword = 3297, wand = 3074, rod = 3066, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [3] = {name = 'Level D', crossbow = 21158, bow = 7438, axe = 7433, club = 27523, sword = 7416, wand = 3075, rod = 3070, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [4] = {name = 'Level D+', crossbow = 3349, bow = 8027, axe = 3342, club = 17859, sword = 6528, wand = 3072, rod = 3069, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [5] = {name = 'Level C-', crossbow = 8023, bow = 8028, axe = 7454, club = 3324, sword = 7419, wand = 8093, rod = 8083, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [6] = {name = 'Level C', crossbow = 8852, bow = 22866, axe = 3319, club = 8100, sword = 7420, wand = 3073, rod = 3065, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [7] = {name = 'Level C+', crossbow = 8021, bow = 20082, axe = 3320, club = 7430, sword = 3280, wand = 3071, rod = 3067, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [8] = {name = 'Level B-', crossbow = 22867, bow = 31581, axe = 7388, club = 7415, sword = 11693, wand = 8094, rod = 8082, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [9] = {name = 'Level B', crossbow = 5803, bow = 16164, axe = 3335, club = 7424, sword = 8932, wand = 8092, rod = 8084, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [10] = {name = 'Level B+', crossbow = 12733, bow = 8030, axe = 22172, club = 22171, sword = 12731, wand = 12741, rod = 12732, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [11] = {name = 'Level A-', crossbow = 8022, bow = 20083, axe = 29286, club = 31580, sword = 29421, wand = 16115, rod = 16117, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [12] = {name = 'Level A', crossbow = 16163, bow = 19362, axe = 29419, club = 21173, sword = 29422, wand = 16096, rod = 16118, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [13] = {name = 'Level A+', crossbow = 14247, bow = 20084, axe = 21176, club = 21219, sword = 21177, wand = 12603, rod = 22183, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [14] = {name = 'Level A++', crossbow = 19356, bow = 14246, axe = 21180, club = 21178, sword = 21179, wand = 13987, rod = 28825, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [15] = {name = 'Level S-', crossbow = 14768, bow = 8026, axe = 22759, club = 22762, sword = 22760, wand = 29425, rod = 25700, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [16] = {name = 'Level S', crossbow = 20085, bow = 35518, axe = 35515, club = 35514, sword = 27651, wand = 35522, rod = 35521, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [17] = {name = 'Level S+', crossbow = 30393, bow = 8029, axe = 30396, club = 30395, sword = 30398, wand = 30399, rod = 30400, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [18] = {name = 'Level S++', crossbow = 20086, bow = 34150, axe = 34253, club = 34254, sword = 34155, wand = 34152, rod = 34151, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [19] = {name = 'Level S+++', crossbow = 8853, bow = 28718, axe = 28724, club = 28725, sword = 28723, wand = 28717, rod = 28716, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [20] = {name = 'Level L-', crossbow = 34089, bow = 34088, axe = 34084, club = 34086, sword = 34082, wand = 34090, rod = 34091, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [21] = {name = 'Level L', crossbow = 22867, bow = 36664, axe = 36661, club = 36659, sword = 36657, wand = 36668, rod = 36674, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [22] = {name = 'Level L+', crossbow = 20087, bow = 36665, axe = 36662, club = 36660, sword = 36658, wand = 36669, rod = 36675, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [23] = {name = 'Level L++', crossbow = 25886, bow = 25885, axe = 25881, club = 25883, sword = 25879, wand = 25887, rod = 25888, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [24] = {name = 'Level L+++', crossbow = 25916, bow = 25915, axe = 25911, club = 25913, sword = 25909, wand = 25917, rod = 25918, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [25] = {name = 'Level L++++', crossbow = 25990, bow = 25986, axe = 25970, club = 25978, sword = 26270, wand = 25994, rod = 25998, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [26] = {name = 'Level L+++++', crossbow = 25950, bow = 25946, axe = 25930, club = 25938, sword = 25922, wand = 25954, rod = 25958, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
    [27] = {name = 'Level M', crossbow = 27456, bow = 27455, axe = 27451, club = 27453, sword = 27449, wand = 27457, rod = 27458, price = 100000, costcross = 12407, costbow = 36817, costaxe = 20131, costclub = 12617, costsword = 2234, costwand = 12408, costrod = 12419, cantreq = 20},
}

local action = Action()

function action.onUse(player, item, fromPos, target, toPos, isHotkey)
	local menu = ModalWindow{
		title = "FORGE WEAPONS",
		message = "Choice a Level:"
	}

	-- local secondMenu = ModalWindow{
		-- title = "FORGE EQUIPMENT"
	-- }

	local thirdMenu = ModalWindow{
		title = "FORGE WEAPONS",
		message = "Closing Details."
	}
	
	for  x = 1, #config do
		local material = config[x]
		menu:addChoice(string.format("%s", material.name), function (player, button, choice)
			if button.name ~= "Select" then
				return
			end

			local secondMenu = ModalWindow{title = "FORGE WEAPONS",	message = "Choice Piece from "..material.name..":"}
			secondMenu:clear()
			secondMenu:addChoice(string.format("Crossbow: %s", getItemName(material.crossbow)))
			secondMenu:addChoice(string.format("Bow: %s", getItemName(material.bow)))
			secondMenu:addChoice(string.format("Axe: %s", getItemName(material.axe)))
			secondMenu:addChoice(string.format("Club: %s", getItemName(material.club)))
			secondMenu:addChoice(string.format("Sword: %s", getItemName(material.sword)))
			secondMenu:addChoice(string.format("Wand: %s", getItemName(material.wand)))
			secondMenu:addChoice(string.format("Rod: %s", getItemName(material.rod)))
			
				secondMenu:addButton("Forge", function (player, button, choice)
				
				local selectType = choice.text:match("(.+):"):lower()
				local itemId = material[selectType]				
				local material2 = config[x-1]
				
				
				if itemId == material.crossbow then 
					if player:getItemCount(material.costcross) < material.cantreq then
						player:sendTextMessage(MESSAGE_STATUS_WARNING, "You dont have enough items to forge this equip.")
						player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You need "..(material.cantreq - player:getItemCount(material.costcross)).. " "..getItemName(material.costcross)..".")
						return false
					end
					if player:getItemCount(material2.crossbow) == 0 then 
					
						player:sendTextMessage(MESSAGE_STATUS_WARNING, "You dont have enough items to forge this equip.")
						player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You need a "..getItemName(material2.crossbow)..".")
						return false
					end
				elseif itemId == material.bow then 
					if player:getItemCount(material.costbow) < material.cantreq then
						player:sendTextMessage(MESSAGE_STATUS_WARNING, "You dont have enough items to forge this equip.")
						player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You need "..(material.cantreq - player:getItemCount(material.costbow)).. " "..getItemName(material.costbow)..".")
						return false
					end
					if player:getItemCount(material2.bow) == 0 then 
					
						player:sendTextMessage(MESSAGE_STATUS_WARNING, "You dont have enough items to forge this equip.")
						player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You need a "..getItemName(material2.bow)..".")
						return false
					end
				elseif itemId == material.axe then 
					if player:getItemCount(material.costaxe) < material.cantreq then
						player:sendTextMessage(MESSAGE_STATUS_WARNING, "You dont have enough items to forge this equip.")
						player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You need "..(material.cantreq - player:getItemCount(material.costaxe)).. " "..getItemName(material.costaxe)..".")
						return false
					end
					if player:getItemCount(material2.axe) == 0 then 
					
						player:sendTextMessage(MESSAGE_STATUS_WARNING, "You dont have enough items to forge this equip.")
						player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You need a "..getItemName(material2.axe)..".")
						return false
					end
				elseif itemId == material.club then 
					if player:getItemCount(material.costclub) < material.cantreq then
						player:sendTextMessage(MESSAGE_STATUS_WARNING, "You dont have enough items to forge this equip.")
						player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You need "..(material.cantreq - player:getItemCount(material.costclub)).. " "..getItemName(material.costclub)..".")
						return false
					end
					if player:getItemCount(material2.club) == 0 then 
					
						player:sendTextMessage(MESSAGE_STATUS_WARNING, "You dont have enough items to forge this equip.")
						player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You need a "..getItemName(material2.club)..".")
						return false
					end
				elseif itemId == material.sword then 
					if player:getItemCount(material.costsword) < material.cantreq then
						player:sendTextMessage(MESSAGE_STATUS_WARNING, "You dont have enough items to forge this equip.")
						player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You need "..(material.cantreq - player:getItemCount(material.costsword)).. " "..getItemName(material.costsword)..".")
						return false
					end
					if player:getItemCount(material2.sword) == 0 then 
					
						player:sendTextMessage(MESSAGE_STATUS_WARNING, "You dont have enough items to forge this equip.")
						player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You need a "..getItemName(material2.sword)..".")
						return false
					end
				elseif itemId == material.wand then 
					if player:getItemCount(material.costwand) < material.cantreq then
						player:sendTextMessage(MESSAGE_STATUS_WARNING, "You dont have enough items to forge this equip.")
						player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You need "..(material.cantreq - player:getItemCount(material.costwand)).. " "..getItemName(material.costwand)..".")
						return false
					end
					if player:getItemCount(material2.wand) == 0 then 
					
						player:sendTextMessage(MESSAGE_STATUS_WARNING, "You dont have enough items to forge this equip.")
						player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You need a "..getItemName(material2.wand)..".")
						return false
					end
				elseif itemId == material.rod then 
					if player:getItemCount(material.costrod) < material.cantreq then
						player:sendTextMessage(MESSAGE_STATUS_WARNING, "You dont have enough items to forge this equip.")
						player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You need "..(material.cantreq - player:getItemCount(material.costrod)).. " "..getItemName(material.costrod)..".")
						return false
					end
					if player:getItemCount(material2.rod) == 0 then 
					
						player:sendTextMessage(MESSAGE_STATUS_WARNING, "You dont have enough items to forge this equip.")
						player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You need a "..getItemName(material2.rod)..".")
						return false
					
					end
				end
				
				
					if player:getMoney() < material.price then
						if player:getBankBalance() < material.price then
							player:sendTextMessage(MESSAGE_STATUS_WARNING, "You dont have enough money in your backpack or bank account.")
							player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You need "..(material.price - player:getMoney()).. " gold coins.")
							return false
						else
							if itemId == material.crossbow then 
									player:setBankBalance(player:getBankBalance() - material.price)
									player:removeItem(material.costcross, material.cantreq)
									player:removeItem(material2.crossbow, 1)
									player:sendTextMessage(MESSAGE_INFO_DESCR, "You buy "..getItemName(itemId)..".")
									player:addItem(itemId, 1)
									
							elseif itemId == material.bow then
									player:setBankBalance(player:getBankBalance() - material.price)
									player:removeItem(material.costbow, material.cantreq)
									player:removeItem(material2.bow, 1)
									player:sendTextMessage(MESSAGE_INFO_DESCR, "You buy "..getItemName(itemId)..".")
									player:addItem(itemId, 1)
									
							elseif itemId == material.axe then 
									player:setBankBalance(player:getBankBalance() - material.price)
									player:removeItem(material.costaxe, material.cantreq)
									player:removeItem(material2.axe, 1)
									player:sendTextMessage(MESSAGE_INFO_DESCR, "You buy "..getItemName(itemId)..".")
									player:addItem(itemId, 1)
									
							elseif itemId == material.club then 
									player:setBankBalance(player:getBankBalance() - material.price)
									player:removeItem(material.costclub, material.cantreq)
									player:removeItem(material2.club, 1)
									player:sendTextMessage(MESSAGE_INFO_DESCR, "You buy "..getItemName(itemId)..".")
									player:addItem(itemId, 1)
									
							elseif itemId == material.sword then 
									player:setBankBalance(player:getBankBalance() - material.price)
									player:removeItem(material.costsword, material.cantreq)
									player:removeItem(material2.sword, 1)
									player:sendTextMessage(MESSAGE_INFO_DESCR, "You buy "..getItemName(itemId)..".")
									player:addItem(itemId, 1)
									
							elseif itemId == material.wand then 
									player:setBankBalance(player:getBankBalance() - material.price)
									player:removeItem(material.costwand, material.cantreq)
									player:removeItem(material2.wand, 1)
									player:sendTextMessage(MESSAGE_INFO_DESCR, "You buy "..getItemName(itemId)..".")
									player:addItem(itemId, 1)
									
							elseif itemId == material.rod then 
									player:setBankBalance(player:getBankBalance() - material.price)
									player:removeItem(material.costrod, material.cantreq)
									player:removeItem(material2.rod, 1)
									player:sendTextMessage(MESSAGE_INFO_DESCR, "You buy "..getItemName(itemId)..".")
									player:addItem(itemId, 1)
									
							end
						end
					else
							if itemId == material.crossbow then 
									player:removeItem(material.costcross, material.cantreq)
									player:removeItem(material2.crossbow, 1)
									player:removeMoney(material.price)
									player:sendTextMessage(MESSAGE_INFO_DESCR, "You buy "..getItemName(itemId)..".")
									player:addItem(itemId, 1)
									
							elseif itemId == material.bow then
									player:removeItem(material.costbow, material.cantreq)
									player:removeItem(material2.bow, 1)
									player:removeMoney(material.price)
									player:sendTextMessage(MESSAGE_INFO_DESCR, "You buy "..getItemName(itemId)..".")
									player:addItem(itemId, 1)
									
							elseif itemId == material.axe then 
									player:removeItem(material.costaxe, material.cantreq)
									player:removeItem(material2.axe, 1)
									player:removeMoney(material.price)
									player:sendTextMessage(MESSAGE_INFO_DESCR, "You buy "..getItemName(itemId)..".")
									player:addItem(itemId, 1)
									
							elseif itemId == material.club then 
									player:removeItem(material.costclub, material.cantreq)
									player:removeItem(material2.club, 1)
									player:removeMoney(material.price)
									player:sendTextMessage(MESSAGE_INFO_DESCR, "You buy "..getItemName(itemId)..".")
									player:addItem(itemId, 1)
									
							elseif itemId == material.sword then 
									player:removeItem(material.costsword, material.cantreq)
									player:removeItem(material2.sword, 1)
									player:removeMoney(material.price)
									player:sendTextMessage(MESSAGE_INFO_DESCR, "You buy "..getItemName(itemId)..".")
									player:addItem(itemId, 1)
									
							elseif itemId == material.wand then 
									player:removeItem(material.costwand, material.cantreq)
									player:removeItem(material2.wand, 1)
									player:removeMoney(material.price)
									player:sendTextMessage(MESSAGE_INFO_DESCR, "You buy "..getItemName(itemId)..".")
									player:addItem(itemId, 1)
									
							elseif itemId == material.rod then 
									player:removeItem(material.costrod, material.cantreq)
									player:removeItem(material2.rod, 1)
									player:removeMoney(material.price)
									player:sendTextMessage(MESSAGE_INFO_DESCR, "You buy "..getItemName(itemId)..".")
									player:addItem(itemId, 1)	
							end
					end
				end)
				
				secondMenu:addButton("Details", function (player, button, choice)
				if button.name ~= "Details" then
					return
				end
				
				-- thirdMenu:clear()
				-- thirdMenu:addButton("Back", function (player, button, choice)
					-- secondMenu:sendToPlayer(player)
				-- end)
				-- thirdMenu:addButton("Close")
				secondMenu:sendToPlayer(player)

				local text = ""
				local selectType = choice.text:match("(.+):"):lower()
				local itemId = material[selectType]
				local itemType = ItemType(itemId)
				local material2 = config[x-1]
						if itemId == material.crossbow then
								if material.cantreq <= player:getItemCount(material.costcross) then
									txtrema = "Can be forged."
								else
									txtrema = (material.cantreq - player:getItemCount(material.costcross)).. " "..getItemName(material.costcross).." left."
								end
						elseif itemId == material.bow then
								if material.cantreq <= player:getItemCount(material.costbow) then
									txtrema = "Can be forged."
								else
									txtrema = (material.cantreq - player:getItemCount(material.costbow)).. " "..getItemName(material.costbow).." left."
								end
						elseif itemId == material.axe then
								if material.cantreq <= player:getItemCount(material.costaxe) then
									txtrema = "Can be forged."
								else
									txtrema = (material.cantreq - player:getItemCount(material.costaxe)).. " "..getItemName(material.costaxe).." left."
								end
						elseif itemId == material.club then
								if material.cantreq <= player:getItemCount(material.costclub) then
									txtrema = "Can be forged."
								else
									txtrema = (material.cantreq - player:getItemCount(material.costclub)).. " "..getItemName(material.costclub).." left."
								end
						elseif itemId == material.sword then
								if material.cantreq <= player:getItemCount(material.costsword) then
									txtrema = "Can be forged."
								else
									txtrema = (material.cantreq - player:getItemCount(material.costsword)).. " "..getItemName(material.costsword).." left."
								end
						elseif itemId == material.wand then
								if material.cantreq <= player:getItemCount(material.costwand) then
									txtrema = "Can be forged."
								else
									txtrema = (material.cantreq - player:getItemCount(material.costwand)).. " "..getItemName(material.costwand).." left."
								end
						else
								if material.cantreq <= player:getItemCount(material.costrod) then
									txtrema = "Can be forged."
								else
									txtrema = (material.cantreq - player:getItemCount(material.costrod)).. " "..getItemName(material.costrod).." left."
								end
						end
						
						if player:getMoney() < material.price then
							if player:getBankBalance() < material.price then
								txtprice = material.price - player:getMoney().." gold coins left."
							else
								txtprice = "Can be bought."	
							end
						else
							txtprice = "Can be bought."	
						end
				if itemId == material.crossbow then
						if player:getItemCount(material2.crossbow) == 0  then
							txtweapon = "[You need to look for this weapon]"
						else
							txtweapon = "[Weapon in possession]"
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
							string.format("Material to forge: %s", material.cantreq.. " "..getItemName(material.costcross).."."),
							string.format("Remaining material: %s", txtrema),
							string.format("############################"),
							string.format("Weapon Need to Forge: %s", getItemName(material2.crossbow)),
							string.format(txtweapon),
							string.format("############################")	
						}
					text = text .. table.concat(description, "\n")
					-- local description = {
						-- string.format("############################"),
							-- string.format("Name: %s", itemType:getName()),
							-- string.format("############################"),
							-- string.format("Weight: %s", itemType:getWeight()),
							-- string.format("############################"),
							-- string.format("MATERIAL TO FORGE:"),
							-- string.format("["..player:getMoney().."/"..material.price.."] gold coins."),
							-- string.format("["..player:getItemCount(material.costcross).."/"..material.cantreq.."] "..getItemName(material.costcross).."."),
							-- string.format("["..player:getItemCount(material2.crossbow).."/1] "..getItemName(material2.crossbow).."."),
							-- string.format("############################")	
						-- }
					-- text = text .. table.concat(description, "\n")
				elseif itemId == material.bow then
						if player:getItemCount(material2.bow) == 0  then
							txtweapon = "[You need to look for this weapon]"
						else
							txtweapon = "[Weapon in possession]"
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
							string.format("Material to forge: %s", material.cantreq.. " "..getItemName(material.costbow).."."),
							string.format("Remaining material: %s", txtrema),
							string.format("############################"),
							string.format("Weapon Need to Forge: %s", getItemName(material2.bow)),
							string.format("############################")	
						}
					text = text .. table.concat(description, "\n")
					
				elseif itemId == material.axe then
						if player:getItemCount(material2.axe) == 0  then
							txtweapon = "[You need to look for this weapon]"
						else
							txtweapon = "[Weapon in possession]"
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
							string.format("Material to forge: %s", material.cantreq.. " "..getItemName(material.costaxe).."."),
							string.format("Remaining material: %s", txtrema),
							string.format("############################"),
							string.format("Weapon Need to Forge: %s", getItemName(material2.axe)),
							string.format("############################")
						}
					text = text .. table.concat(description, "\n")
					
				elseif itemId == material.club then
						if player:getItemCount(material2.club) == 0  then
							txtweapon = "[You need to look for this weapon]"
						else
							txtweapon = "[Weapon in possession]"
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
							string.format("Material to forge: %s", material.cantreq.. " "..getItemName(material.costclub).."."),
							string.format("Remaining material: %s", txtrema),
							string.format("############################"),
							string.format("Weapon Need to Forge: %s", getItemName(material2.club)),
							string.format("############################")	
						}
					text = text .. table.concat(description, "\n")
					
				elseif itemId == material.sword then
						if player:getItemCount(material2.sword) == 0  then
							txtweapon = "[You need to look for this weapon]"
						else
							txtweapon = "[Weapon in possession]"
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
							string.format("Material to forge: %s", material.cantreq.. " "..getItemName(material.costsword).."."),
							string.format("Remaining material: %s", txtrema),
							string.format("############################"),
							string.format("Weapon Need to Forge: %s", getItemName(material2.sword)),
							string.format("############################")	
						}
					text = text .. table.concat(description, "\n")
					
				elseif itemId == material.wand then
						if player:getItemCount(material2.wand) == 0  then
							txtweapon = "[You need to look for this weapon]"
						else
							txtweapon = "[Weapon in possession]"
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
							string.format("Material to forge: %s", material.cantreq.. " "..getItemName(material.costwand).."."),
							string.format("Remaining material: %s", txtrema),
							string.format("############################"),
							string.format("Weapon Need to Forge: %s", getItemName(material2.wand)),
							string.format("############################")	
						}
					text = text .. table.concat(description, "\n")
					
				elseif itemId == material.rod then
						if player:getItemCount(material2.rod) == 0  then
							txtweapon = "[You need to look for this weapon]"
						else
							txtweapon = "[Weapon in possession]"
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
							string.format("Material to forge: %s", material.cantreq.. " "..getItemName(material.costrod).."."),
							string.format("Remaining material: %s", txtrema),
							string.format("############################"),
							string.format("Weapon Need to Forge: %s", getItemName(material2.rod)),
							string.format("############################")	
						}
					text = text .. table.concat(description, "\n")
				end				

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

action:uid(35156)
action:register()