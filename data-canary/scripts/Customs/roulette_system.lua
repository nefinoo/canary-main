local config = {
    uniqueId = 30000, -- on lever

    lever = {
        left = 21126,
        right = 21130
    },

    playItem = {
        itemId = 51893,
        count = 1
    },

    rouletteOptions = {
        ignoredItems = {}, -- if you have tables/counters/other items on the roulette tiles, add them here
        winEffects = {CONST_ANI_FIRE, CONST_ME_SOUND_YELLOW, CONST_ME_SOUND_PURPLE, CONST_ME_SOUND_BLUE, CONST_ME_SOUND_WHITE}, -- first effect needs to be distance effect
        effectDelay = 333,
        spinTime = {min = 8, max = 12}, -- seconds
        spinSlowdownRamping = 5,
        rouletteStorage = 35876 -- required storage to avoid player abuse (if they logout/die before roulette finishes.. they can spin again for free)
    },

    prizePool = {
        {itemId = 34080, count = {1, 1}, chance = 1}, -- lion ring
        {itemId = 3010, count = {1, 1}, chance = 10}, -- emerald bangle
        {itemId = 52042, count = {1, 1}, chance = 25}, -- mega knife
        {itemId = 52037, count = {1, 1}, chance = 40}, -- Supreme Exercise
        {itemId = 51699, count = {1, 1}, chance = 70}, -- Black Demon Armor
        {itemId = 51825, count = {1, 1}, chance = 80}, -- Premium Fishing Rod
        {itemId = 51698, count = {1, 1}, chance = 90}, -- Black Demon Legs
        {itemId = 51700, count = {1, 1}, chance = 100}, -- Black Demon Helmet
        {itemId = 50713, count = {1, 1}, chance = 100}, -- Skull Remover
        {itemId = 51696, count = {1, 1}, chance = 110}, -- Black Demon Boots
        {itemId = 51695, count = {1, 1}, chance = 120}, -- Black Demon Shield
        {itemId = 28702, count = {1, 1}, chance = 180}, -- Death Note
        {itemId = 52040, count = {1, 1}, chance = 250}, -- Lasting Exercise
        {itemId = 8862, count = {1, 1}, chance = 300}, -- Yalahari Armor
        {itemId = 8863, count = {1, 1}, chance = 350}, -- Yalahari Legs
        {itemId = 3080, count = {1, 1}, chance = 350}, -- PK Amulet
        {itemId = 8864, count = {1, 1}, chance = 400}, -- Yalahari Helmet
        {itemId = 23477, count = {1, 1}, chance = 400}, -- Yalahari Boots
        {itemId = 3423, count = {1, 1}, chance = 450}, -- Yalahari Shield
        {itemId = 50843, count = {1, 1}, chance = 550}, -- Fishing Scroll
        {itemId = 51893, count = {1, 1}, chance = 650}, -- Roulette Token
        {itemId = 9306, count = {1, 1}, chance = 650}, -- Mechanical Fishing Rod
        {itemId = 52087, count = {1, 1}, chance = 700}, -- x20 Prey
        {itemId = 37608, count = {1, 1}, chance = 800}, -- Green Demon Armor
        {itemId = 51756, count = {1, 1}, chance = 800}, -- 100% EXP Ticket
        {itemId = 37609, count = {1, 1}, chance = 900}, -- Green Demon Helmet
        {itemId = 37607, count = {1, 1}, chance = 900}, -- Green Demon Legs
        {itemId = 50876, count = {1, 1}, chance = 900}, -- Stamina Refill
        {itemId = 37610, count = {1, 1}, chance = 1000}, -- Green Demon Boots
        {itemId = 6390, count = {1, 1}, chance = 1100}, -- Green Demon Shield
        {itemId = 5928, count = {1, 1}, chance = 1300}, -- Empty Gold Fish
        {itemId = 52088, count = {1, 1}, chance = 2000}, -- x10 Prey (verificar ID/cantidad)
        {itemId = 51755, count = {1, 1}, chance = 2500}, -- 50% EXP Ticket
        {itemId = 52628, count = {1, 1}, chance = 2800}, -- Soul Potion
        {itemId = 52039, count = {1, 1}, chance = 3000}, -- Durable Exercise
        {itemId = 52088, count = {1, 1}, chance = 4000}, -- x5 Prey (verificar ID/cantidad)
        {itemId = 51736, count = {1, 1}, chance = 5000}, -- Teleport Scroll
        {itemId = 3043, count = {25, 50}, chance = 6000}, -- Crystal Coins
        {itemId = 3043, count = {9, 24}, chance = 10000} -- Crystal Coins
    },

    roulettePositions = {
        Position(542, 632, 7),
        Position(543, 632, 7),
        Position(544, 632, 7),
        Position(545, 632, 7),
        Position(546, 632, 7),
        Position(547, 632, 7), -- position 11 in this list is hard-coded to be the reward location, which is the item given to the player
        Position(548, 632, 7),
        Position(549, 632, 7),
        Position(550, 632, 7),
        Position(551, 632, 7),
        Position(552, 632, 7),
    }
}

-- IMPORTANTE: la ruleta usa tiradas individuales de chance/10000 y
-- luego escoge uniformemente uno de los premios que superaron la tirada.
-- Esto NO equivale a chance/10000 de probabilidad final de ganar ese premio.

local activeSpin = false
local displayedPrizes = {} -- Guarda la cantidad sorteada sin modificar atributos de los items

local function getRouletteItem(position)
    local tile = Tile(position)
    if not tile then return nil end
    local ground = tile:getGround()
    for _, thing in ipairs(tile:getItems() or {}) do
        if thing and thing:isItem() and (not ground or thing:getId() ~= ground:getId())
            and not table.contains(config.rouletteOptions.ignoredItems, thing:getId()) then
            return thing
        end
    end
    return nil
end

local function resetLever(position)
    local tile = Tile(position)
    local lever = tile and tile:getItemById(config.lever.right)
    if lever then lever:transform(config.lever.left) end
end

local function createPrizeOnTile(prize, position)
    local itemType = ItemType(prize.itemId)
    local amount = itemType:isStackable() and prize.count or 1
    -- Nunca se alteran las cargas ni otros atributos del objeto.
    return Game.createItem(prize.itemId, amount, position)
end

local function clearRoulette(prize)
    for i, pos in ipairs(config.roulettePositions) do
        local item = getRouletteItem(pos)
        if item then item:remove() end
        if prize then
            createPrizeOnTile(prize, pos)
            displayedPrizes[i] = {itemId = prize.itemId, count = prize.count}
        else
            displayedPrizes[i] = nil
            pos:sendMagicEffect(CONST_ME_POFF)
        end
    end
end

local function updateRoulette(prize)
    local positions = config.roulettePositions
    for i = #positions, 1, -1 do
        local item = getRouletteItem(positions[i])
        if item then
            if i == #positions then
                item:remove()
            else
                item:moveTo(positions[i + 1])
            end
        end
    end
    for i = #positions, 2, -1 do
        displayedPrizes[i] = displayedPrizes[i - 1]
    end
    displayedPrizes[1] = {itemId = prize.itemId, count = prize.count}
    createPrizeOnTile(prize, positions[1])
end

local function chanceNewReward()
    local candidates = {}
    repeat
        candidates = {}
        for _, prize in ipairs(config.prizePool) do
            if math.random(10000) <= prize.chance then
                candidates[#candidates + 1] = prize
            end
        end
    until #candidates > 0

    local prize = candidates[math.random(#candidates)]
    return {
        itemId = prize.itemId,
        count = math.random(prize.count[1], prize.count[2])
    }
end

local function finishSpin(playerId, leverPosition)
    local player = Player(playerId)
    if player then
        player:setStorageValue(config.rouletteOptions.rouletteStorage, -1)
        player:setMoveLocked(false)
    end
    resetLever(leverPosition)
    activeSpin = false
    displayedPrizes = {}
end

local function awardPrize(player, prize)
    local inbox = player:getStoreInbox()
    if not inbox then return false end
    local itemType = ItemType(prize.itemId)
    local isStackable = itemType:isStackable()

    -- Entrega la cantidad real de objetos. Algunas versiones de Canary
    -- pueden crear solo una unidad por llamada a addItemStoreInbox.
    local remaining = prize.count
    local delivered = 0
    while remaining > 0 do
        local inboxItems = inbox:getItems() or {}
        if #inboxItems >= inbox:getMaxCapacity() then
            return false, delivered
        end
        local requested = isStackable and math.min(remaining, 100) or 1
        local added = player:addItemStoreInbox(prize.itemId, requested, INDEX_WHEREEVER, FLAG_NOLIMIT)
        if not added then return false, delivered end

        local received = isStackable and added:getCount() or 1
        if not received or received < 1 then return false, delivered end
        received = math.min(received, remaining)
        delivered = delivered + received
        remaining = remaining - received
    end
    return true, delivered
end

local function announceWinner(player, prize)
    local name = ItemType(prize.itemId):getName()
    player:sendTextMessage(MESSAGE_STATUS,
        string.format("Congratulations! You have won %dx %s. The prize has been sent to your inbox.", prize.count, name))
    Game.broadcastMessage(string.format(
        "{%d|%s} The player %s has won {%d|%s} from the roulette!",
        MESSAGE_LOOK, "[ROULETTE WINNER]", player:getName(), MESSAGE_EVENT_ADVANCE, name), MESSAGE_LOOT)
end

local function initiateReward(playerId, leverPosition, prize, effectCounter)
    local player = Player(playerId)
    if not player then
        finishSpin(playerId, leverPosition)
        return
    end

    if effectCounter < #config.rouletteOptions.winEffects then
        effectCounter = effectCounter + 1
        if effectCounter == 1 then
            config.roulettePositions[11]:sendDistanceEffect(config.roulettePositions[6], config.rouletteOptions.winEffects[1])
            config.roulettePositions[11]:sendDistanceEffect(config.roulettePositions[6], config.rouletteOptions.winEffects[1])
        else
            for _, pos in ipairs(config.roulettePositions) do
                pos:sendMagicEffect(config.rouletteOptions.winEffects[effectCounter])
            end
        end
        config.roulettePositions[6]:sendMagicEffect(CONST_ME_TUTORIALSQUARE)
        -- Conservar los 11 premios visibles tal como quedaron al detenerse.
        -- No reemplazar los objetos por copias del premio ganador.
        addEvent(initiateReward, config.rouletteOptions.effectDelay, playerId, leverPosition, prize, effectCounter)
        return
    end

    -- En caso de fallo de entrega, no consumir definitivamente el token.
    local success, delivered = awardPrize(player, prize)
    if success then
        announceWinner(player, prize)
    elseif delivered == 0 then
        player:addItem(config.playItem.itemId, config.playItem.count)
        player:sendTextMessage(MESSAGE_FAILURE,
            "Your store inbox could not receive the prize. Your roulette token was refunded.")
    else
        player:sendTextMessage(MESSAGE_FAILURE,
            string.format("Inbox delivery incomplete: %d of %d items delivered. Contact an administrator.", delivered, prize.count))
        print(string.format("[ROULETTE] PARTIAL DELIVERY player=%s itemId=%d expected=%d delivered=%d", player:getName(), prize.itemId, prize.count, delivered))
    end
    finishSpin(playerId, leverPosition)
end

local function roulette(playerId, leverPosition, remaining, delay)
    local player = Player(playerId)
    if not player then
        finishSpin(playerId, leverPosition)
        return
    end

    updateRoulette(chanceNewReward())
    if remaining > 0 then
        local nextDelay = delay + config.rouletteOptions.spinSlowdownRamping
        addEvent(roulette, nextDelay, playerId, leverPosition, remaining - delay, nextDelay)
        return
    end

    -- El premio real se guarda aquí, sin depender de leer un item del mapa.
    local item = getRouletteItem(config.roulettePositions[6])
    if not item then
        player:addItem(config.playItem.itemId, config.playItem.count)
        player:sendTextMessage(MESSAGE_FAILURE, "Roulette error. Your token was refunded.")
        finishSpin(playerId, leverPosition)
        return
    end
    local prize = displayedPrizes[6]
    if not prize or prize.itemId ~= item:getId() then
        player:addItem(config.playItem.itemId, config.playItem.count)
        player:sendTextMessage(MESSAGE_FAILURE, "Roulette prize tracking error. Your token was refunded.")
        finishSpin(playerId, leverPosition)
        return
    end
    initiateReward(playerId, leverPosition, prize, 0)
end

local casinoRoulette = Action()

function casinoRoulette.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getLevel() <= 25000 then
        player:sendTextMessage(MESSAGE_LOOK, "Cassino is closed for now, We are making final adjustments...")
        return true
    end
    if activeSpin or item:getId() == config.lever.right then
        player:sendTextMessage(MESSAGE_FAILURE, "Casino Roulette is currently in progress. Please wait.")
        return true
    end
    if player:getItemCount(config.playItem.itemId) < config.playItem.count then
        player:sendTextMessage(MESSAGE_FAILURE, "Casino Roulette requires " .. config.playItem.count .. " " .. ItemType(config.playItem.itemId):getName() .. " to use.")
        return true
    end
    local inbox = player:getStoreInbox()
    if not inbox or #(inbox:getItems() or {}) >= inbox:getMaxCapacity() then
        player:sendTextMessage(MESSAGE_FAILURE, "You do not have enough space in your store inbox.")
        return true
    end
    if not player:removeItem(config.playItem.itemId, config.playItem.count) then
        player:sendTextMessage(MESSAGE_FAILURE, "Could not consume the roulette token.")
        return true
    end

    activeSpin = true
    item:transform(config.lever.right)
    clearRoulette()
    player:setStorageValue(config.rouletteOptions.rouletteStorage, 1)
    player:setMoveLocked(true)
    local remaining = math.random(config.rouletteOptions.spinTime.min * 1000,
        config.rouletteOptions.spinTime.max * 1000)
    roulette(player:getId(), toPosition, remaining, 100)
    return true
end

casinoRoulette:uid(config.uniqueId)
casinoRoulette:register()

local callback = EventCallback("playerOnMoveItemCasino")
callback.playerOnMoveItem = function(self, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
    for _, pos in ipairs(config.roulettePositions) do
        if toPosition == pos then return false end
    end
    return true
end
callback:register()

local rouletteLogout = CreatureEvent("Roulette Logout")
function rouletteLogout.onLogout(player)
    if player:getStorageValue(config.rouletteOptions.rouletteStorage) == 1 then
        player:sendTextMessage(MESSAGE_FAILURE, "You cannot disconnect while using roulette!")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end
    return true
end
rouletteLogout:register()
