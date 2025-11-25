local config = {
    -- uniqueid = {cost, amount}
    [9001] = {cost = 115, amount = 1},  -- Monster Drink (stamina +2h) Frecuente pero útil
	[9002] = {cost = 30, amount = 1},  -- Teleport Scroll (muy usado pero no OP)
	[9003] = {cost = 150, amount = 1},  -- 100% EXP Ticket (muy fuerte → caro)
	[9004] = {cost = 80, amount = 1},  -- 50% EXP Ticket (balanceado)
	[9005] = {cost = 65, amount = 5},  -- Prey Wildcards (ventaja grande, uso continuo)

	-- Black Demon set (solo por tienda, stats únicos)
	[9006] = {cost = 980, amount = 1}, -- Black Demon Helmet
	[9007] = {cost = 980, amount = 1}, -- Black Demon Armor (pieza principal)
	[9008] = {cost = 980, amount = 1}, -- Black Demon Legs
	[9009] = {cost = 980, amount = 1}, -- Black Demon Shield
	[9010] = {cost = 980, amount = 1}, -- Black Demon Boots

	-- Overpower Runes (consumibles pero fuertes)
	[9011] = {cost = 15, amount = 100}, -- Thunderstorm OV
	[9012] = {cost = 25, amount = 100}, -- Fireball OV
	[9013] = {cost = 25, amount = 100}, -- Avalanche OV
	[9014] = {cost = 15, amount = 100}, -- Stoneshower OV (menos usada)
	[9015] = {cost = 35, amount = 100}, -- Sudden Death OV (la más valiosa)

	-- Objetos especiales / utilitarios
	[9016] = {cost = 350, amount = 1},  -- The Death Note (molesto = caro)
	[9017] = {cost = 20, amount = 1},  -- Elven Amulet (se usa mucho)
	[9018] = {cost = 250, amount = 1},  -- PK Amulet (situacional pero útil)
	[9019] = {cost = 650, amount = 1},  -- Skull Remover (muy situacional)
	[9020] = {cost = 80, amount = 1},  -- Soul Potion (útil pero no OP)

	-- Yalahari set (único como el black demon)
	[9021] = {cost = 550, amount = 1}, -- Mask
	[9022] = {cost = 550, amount = 1}, -- Armor
	[9023] = {cost = 550, amount = 1}, -- Legs
	[9024] = {cost = 550, amount = 1}, -- Shield
	[9025] = {cost = 550, amount = 1}, -- Boots

	-- Monedas especiales / retraining
	[9026] = {cost = 250, amount = 1},  -- Roulette Token (objeto de riesgo/suerte)

	-- Exercise Presents (basado en cargas)
	[9027] = {cost = 25, amount = 1},  -- Exercise Present (500 cargas)
	[9028] = {cost = 90, amount = 1},  -- Durable (1800 cargas)
	[9029] = {cost = 720, amount = 1}, -- Lasting (14400 cargas)
	[9030] = {cost = 2250, amount = 1}, -- Legendary (45000 cargas)

}

local TOKEN_ID = 52583
local FIRST_UID = 9001
local LAST_UID  = 9030

local eventShop = Action()

function eventShop.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- if player:getLevel() <= 25000 then
        -- player:sendTextMessage(MESSAGE_LOOK,"Event Shop Closed for now, We are making final adjustments...")
        -- return true
    -- end
	
    -- 1) Obtener el tile donde está el counter
    local tile = Tile(fromPosition)
    if not tile then
        player:sendCancelMessage("Invalid tile.")
        return true
    end

    -- 2) Buscar el item que está ARRIBA del counter (ID 2320 u otro)
    local topItem = tile:getTopDownItem() or tile:getTopTopItem() or tile:getTopItem()

    if not topItem then
        player:sendCancelMessage("No item found on the counter.")
        return true
    end

    -- 3) Validar que el uniqueid esté configurado
    local uid = topItem:getAttribute(ITEM_ATTRIBUTE_UNIQUEID)

    if not uid or uid < FIRST_UID or uid > LAST_UID then
        player:sendCancelMessage("This item is not for sale.")
        return true
    end

    local entry = config[uid]
    if not entry then
        player:sendCancelMessage("This shop item is not configured.")
        return true
    end
	local itemType = ItemType(TOKEN_ID)
    -- 4) Revisar tokens
    if player:getItemCount(TOKEN_ID) < entry.cost then
        player:sendCancelMessage("You need " .. entry.cost .. " "..itemType:getName().."s to buy this.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end
    -- 5) Cobrar
    player:removeItem(TOKEN_ID, entry.cost)
	
	local amount = item:getCharges()
	
	if amount <= 0 then
		amount = 1 * entry.amount
	end
    -- 6) Dar EXACTAMENTE el item del top del tile
    local rewardItem = player:addItem(topItem:getId(), amount)

    if rewardItem then
        player:sendTextMessage(MESSAGE_LOOK,
            "You bought " .. entry.amount .. "x " .. rewardItem:getName() ..
            " for " .. entry.cost .. " tokens."
        )
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    else
        player:sendCancelMessage("Not enough capacity to receive this item.")
    end

    return true
end

-- Acciones para UIDs 9001 - 9030
for uid = FIRST_UID, LAST_UID do
    eventShop:uid(uid)
end

eventShop:register()
