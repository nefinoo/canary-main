local catchs = TalkAction("!catchs")

local monsters = {
    -- Water Fish --
    [1] = {name = "Fish", key = 1},
    [2] = {name = "Calamary", key = 2},
    [3] = {name = "Northern Pike", key = 3},
    [4] = {name = "Jellyfish", key = 4},
    [5] = {name = "Shark", key = 5},
    [6] = {name = "Crab", key = 6},
    [7] = {name = "Water Elemental", key = 7},
    [8] = {name = "Blood crab", key = 8},
    [9] = {name = "Massive Water", key = 9},
    [10] = {name = "Quara Constrictor", key = 10},
    [11] = {name = "Quara Hydromancer", key = 11},
    [12] = {name = "Quara Mantassin", key = 12},
    [13] = {name = "Quara Pincher", key = 13},
    [14] = {name = "Quara Predator", key = 14},
    [15] = {name = "Deepling Brawler", key = 15},
    [16] = {name = "Deepling Scout", key = 16},
    [17] = {name = "Deepling Spellsinger", key = 17},
    [18] = {name = "Deepling Elite", key = 18},
    [19] = {name = "Deepling Guard", key = 19},
    [20] = {name = "Young Sea Serpent", key = 20},
    [21] = {name = "Sea Serpent", key = 21},
    [22] = {name = "Ryujin", key = 22},
    [23] = {name = "Caribdis", key = 23},
    [24] = {name = "Escila", key = 24},
    [25] = {name = "Leaviathan", key = 25},
    [26] = {name = "Shesha", key = 26},
    [27] = {name = "Sigma", key = 27},
    [28] = {name = "Cicno", key = 28},
    [29] = {name = "Oceanus", key = 29},
    [30] = {name = "Crustacea Gigantica", key = 30},
    [31] = {name = "Manta Ray", key = 31},

    -- Lava Fish --
    [32] = {name = "Magma Minion", key = 19},

    -- Swamp Fish --
    [33] = {name = "Volcanis", key = 50},
 
    -- Tar Fish --
    [34] = {name = "Volcanis", key = 70}
}

function catchs.onSay(player, words, param)
    -- nombre "crudo" (exacto como lo quiere Player())
    local rawTarget
    if not param or param == "" then
        rawTarget = player:getName()
    else
        rawTarget = param
    end

    -- nombre escapado para usar en queries internas que arman SQL
    local escTarget = rawTarget:gsub("'", "\\'")

    -- usa la versión ESCAPED al llamar a isRealPlayer (evita romper SQL)
    if not isRealPlayer(escTarget) then
        player:sendCancelMessage("Player does not exist.")
        return false
    end

    -- para obtener el objeto online usamos la versión RAW (sin backslash)
    local targetPlayer = Player(rawTarget)
    if not targetPlayer then
        player:sendCancelMessage("Player is not online.")
        return false
    end

    local text = "[" .. rawTarget .. " Catchs]\n\n"
    text = text .. "--[Water Fishing]--\n"

    for i = 1, #monsters do
        local info = targetPlayer:getCatch(monsters[i].key)

        if not info or info == nil or info == -1 then
            info = 0
            targetPlayer:addCatch(monsters[i].key, 0)
        end

        if i == 32 then
            text = text .. "\n--[Lava Fishing]--\n"
        elseif i == 33 then
            text = text .. "\n--[Swamp Fishing]--\n"
        elseif i == 34 then
            text = text .. "\n--[Tar Fishing]--\n"
        end

        text = text .. "[" .. monsters[i].name .. "]: " .. info .. "\n"
    end

    player:showTextDialog(32043, text)
    return false
end



catchs:separator(" ")
catchs:groupType("normal")
catchs:register()