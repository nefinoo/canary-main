--[[
    Shop Display Rotator
    Autor: Nefi & ChatGPT
    Descripción:
        Muestra los items de la tienda uno por uno cada 5 segundos
        sobre un tile específico (por ejemplo antes de entrar a la tienda).
        Compatible con Canary Engine (revscript).
]]
-- local DISPLAY_POSITION = Position(525, 844, 7)   -- <<< CAMBIA ESTO
-- local ROTATION_INTERVAL = 5000                     -- 5000 ms = 5 segundos

local POS = Position(525, 844, 7) -- <<--- POSICIÓN donde aparecerá el ítem
local INTERVAL = 3000 -- 5 segundos

local effects = {11, 7, 18, 5, 20}
local ItemList = {
    -- Consumibles / Utilitarios
    52628, -- Soul Potion
    51736, -- Teleport Scroll
    51756, -- 100% EXP Ticket
    51755, -- 50% EXP Ticket
    52088, -- 5x Prey Wildcards

    -- Amulets / Utilitarios
    3082, -- Elven Amulet
    3080, -- PK Amulet

    -- Exercise presents
    52038, -- Exercise Present
    52039, -- Durable
    52040, -- Lasting
    52037, -- Legendary

    -- Overpower runes (100x)
    52636, -- Thunderstorm OV
    52635, -- Fireball OV
    52634, -- Avalanche OV
    52633, -- Stone Shower OV
    51432, -- Sudden Death OV

    -- Objetos especiales
    28702, -- The Death Note
    50713, -- Skull Remover
    51893, -- Roulette Token
    50876, -- Monster Drink

    -- Yalahari set
    8864,  -- Mask
    8862,  -- Armor
    8863,  -- Legs
    3423,  -- Blessed Shield
    23477, -- Void Boots

    -- Black Demon set
    51700, -- Helmet
    51699, -- Armor
    51698, -- Legs
    51695, -- Shield
    51696  -- Boots
}

local index = 1

local function rotateItem()
    -- limpiar item previo
    local tile = Tile(POS)
    if tile then
        local topItem = tile:getTopDownItem()
        if topItem then
            topItem:remove()
        end
    end
	
	local randEffect = effects[math.random(1, #effects)]
    POS:sendMagicEffect(randEffect)
	
    -- colocar nuevo item
    local newId = ItemList[index]
    Game.createItem(newId, 1, POS)

    -- rotación
    index = index + 1
    if index > #ItemList then
        index = 1
    end

    -- repetir cada 5s
    addEvent(rotateItem, INTERVAL)
end

-- iniciar al cargar el script
rotateItem()
