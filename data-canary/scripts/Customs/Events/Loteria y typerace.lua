-------------------------------------------
--  LOTTERY + TYPE RACE (ALTERNADOS)
--  Cada 30 minutos inicia uno u otro
-------------------------------------------

local System = {
    mode = 0,  -- 0 = Lottery, 1 = TypeRace
    interval = 30 * 60 * 1000, -- 30 minutos (en ms)
}

---------------------------------------------------
-- LOTTERY SYSTEM
---------------------------------------------------
local LotterySystem = {
    ticketPrice = { itemId = 52583, count = 50 },
    storageTicket = 55000,
    storageDailyPrize = 55001,
    storageDailyPrizeCount = 55002,

    prizePool = {
        {3031, 5, 10},
        {3035, 1, 3},
        {3043, 1, 1},
        {22118, 1, 1},
        {24390, 1, 1},
        {32583, 1, 1},
        {37317, 1, 1},
    }
}

local talkLottery = TalkAction("!lottery")

function talkLottery.onSay(player, words, param)
    local cmd = param:lower()	
	local tokenId = LotterySystem.ticketPrice.itemId
	local tokenAmount = LotterySystem.ticketPrice.count

    if cmd == "info" or cmd == "" then
        local prizeId = Game.getStorageValue(LotterySystem.storageDailyPrize)
        local prizeCount = Game.getStorageValue(LotterySystem.storageDailyPrizeCount)
        if prizeId <= 0 then
            player:sendCancelMessage("Lottery prize has not been selected yet.")
            return false
        end

        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 
            "Today's lottery prize: " .. prizeCount .. "x " .. ItemType(prizeId):getName() .. 
            ".\nUse !lottery buy to purchase a ticket for " .. tokenAmount .. " gold.")
		Webhook.send("Lottery", "Today's lottery prize: " .. prizeCount .. "x " .. ItemType(prizeId):getName() .. 
            ".\nUse !lottery buy to purchase a ticket for " .. tokenAmount .. " gold.", WEBHOOK_COLOR_WARNING)
        return false
    end

    if cmd == "buy" then
        if player:getStorageValue(LotterySystem.storageTicket) == 1 then
            player:sendCancelMessage("You already bought a ticket for today's lottery.")
            return false
        end


		if player:getItemCount(tokenId) < tokenAmount then
			player:sendCancelMessage("You need ".. tokenAmount .." Event Tokens to buy a lottery ticket.")
			return false
		end

		player:removeItem(tokenId, tokenAmount)

        player:setStorageValue(LotterySystem.storageTicket, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You purchased a lottery ticket! Good luck!")
        return false
    end

    player:sendCancelMessage("Commands: !lottery info, !lottery buy")
    return false
end

talkLottery:separator(" ")
talkLottery:groupType("normal")
talkLottery:register()


-- Ejecutar lotería completa
local function RunLottery()
    local players = Game.getPlayers()

    -- Elegir premio si no existe
    local prizeId = Game.getStorageValue(LotterySystem.storageDailyPrize)
    if prizeId <= 0 then
        local pool = LotterySystem.prizePool
        local prize = pool[math.random(#pool)]

        local itemId = prize[1]
        local min = prize[2]
        local max = prize[3]
        local count = math.random(min, max)

        Game.setStorageValue(LotterySystem.storageDailyPrize, itemId)
        Game.setStorageValue(LotterySystem.storageDailyPrizeCount, count)

        Game.broadcastMessage(
            "[LOTTERY] New prize: " .. count .. "x " .. ItemType(itemId):getName() .. "!",
            MESSAGE_EVENT_ADVANCE
        )
        return
    end

    -- Repartir premio
    local ticketPlayers = {}
    for _, p in ipairs(players) do
        if p:getStorageValue(LotterySystem.storageTicket) == 1 and not p:getGroup():getAccess() then
            table.insert(ticketPlayers, p)
        end
    end

    if #ticketPlayers == 0 then
        Game.broadcastMessage("[LOTTERY] No one bought a ticket!", MESSAGE_EVENT_ADVANCE)
    else
        local winner = ticketPlayers[math.random(#ticketPlayers)]
        local prize = Game.getStorageValue(LotterySystem.storageDailyPrize)
        local count = Game.getStorageValue(LotterySystem.storageDailyPrizeCount)
        winner:addItem(prize, count)

        Game.broadcastMessage(
            "[LOTTERY] Winner: " .. winner:getName() ..
            " gained " .. count .. "x " .. ItemType(prize):getName() .. "!",
            MESSAGE_EVENT_ADVANCE
        )
		
		Webhook.send("Lottery Winner", "[LOTTERY] Winner: " .. winner:getName() ..
            " gained " .. count .. "x " .. ItemType(prize):getName() .. "!", WEBHOOK_COLOR_WARNING)
    end

    -- Limpiar para siguiente ronda
    for _, p in ipairs(players) do
        p:setStorageValue(LotterySystem.storageTicket, 0)
    end
    Game.setStorageValue(LotterySystem.storageDailyPrize, -1)
    Game.setStorageValue(LotterySystem.storageDailyPrizeCount, -1)
end

---------------------------------------------------
-- TYPE RACE SYSTEM
---------------------------------------------------
local TypeRace = {
    active = false,
    currentCode = "",
    prize = {52583, 10},
}

function TypeRace.generateCode()
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local code = ""
    for i = 1, 6 do
        local index = math.random(#chars)
        code = code .. chars:sub(index, index)
    end
    return code
end

local talkType = TalkAction("!type")

function talkType.onSay(player, words, param)
    local code = param:upper():trim()

    if not TypeRace.active then
        player:sendCancelMessage("There is no active Type Race event.")
        return false
    end

    if code == "" then
        player:sendCancelMessage("Usage: !type <code>")
        return false
    end

    if player:getGroup():getAccess() then
        player:sendCancelMessage("Staff cannot participate.")
        return false
    end

    if code ~= TypeRace.currentCode then
        player:sendCancelMessage("Incorrect code! Try again.")
        return false
    end

    TypeRace.active = false

    local itemId = TypeRace.prize[1]
    local count = TypeRace.prize[2]
    local randomprice = math.random(count-5, count)
    player:addItem(itemId, randomprice)

    Game.broadcastMessage(
        "[TYPE RACE EVENT] " .. player:getName() .. " typed the correct code first and won " ..
        randomprice .. "x " .. ItemType(itemId):getName() .. "!",
        MESSAGE_EVENT_ADVANCE
    )
	
	Webhook.send("[TYPE RACE EVENT]", "" .. player:getName() .. " typed the correct code first and won " ..
        randomprice .. "x " .. ItemType(itemId):getName() .. "!", WEBHOOK_COLOR_WARNING)
    return false
end

talkType:separator(" ")
talkType:groupType("normal")
talkType:register()

local function RunTypeRace()
    TypeRace.active = true
    TypeRace.currentCode = TypeRace.generateCode()
    local spaced = TypeRace.currentCode:gsub(".", "%1 ")

    Game.broadcastMessage(
        "[TYPE RACE EVENT] First to type this code (WITHOUT spaces) using !type <code> wins:\n" ..
        spaced,
        MESSAGE_EVENT_ADVANCE
    )
	
	Webhook.send("[TYPE RACE EVENT]", "First to type this code (WITHOUT spaces) using !type <code> wins:\n" ..
        spaced", WEBHOOK_COLOR_WARNING)
end

---------------------------------------------------
-- GLOBAL EVENT — ALTERNADOR
---------------------------------------------------

local event = GlobalEvent("alternating_events")

function event.onThink(interval)
    if System.mode == 0 then
        RunLottery()
        System.mode = 1
    else
        RunTypeRace()
        System.mode = 0
    end

    return true
end

event:interval(System.interval)
event:register()
