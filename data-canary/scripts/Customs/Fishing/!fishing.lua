local fishing = TalkAction("!fishing")

local monsters = {
    [1] = {name = "Fish", level = 8, fishing = 10, scroll = false},
    [2] = {name = "Calamary", level = 50, fishing = 12, scroll = false},
    [3] = {name = "Northern Pike", level = 100, fishing = 15, scroll = false},
    [4] = {name = "Jellyfish", level = 150, fishing = 17, scroll = false},
    [5] = {name = "Shark", level = 250, fishing = 24, scroll = false},
    [6] = {name = "Crab", level = 350, fishing = 30, scroll = false},
    [7] = {name = "Water Elemental", level = 500, fishing = 34, scroll = false},
    [8] = {name = "Blood crab", level = 650, fishing = 38, scroll = false},
    [9] = {name = "Massive Water Elemental", level = 750, fishing = 40, scroll = false},
    [10] = {name = "Quara Constrictor", level = 1000, fishing = 45, scroll = false},
    [11] = {name = "Quara Hydromancer", level = 1300, fishing = 50, scroll = false},
    [12] = {name = "Quara Mantassin", level = 1500, fishing = 55, scroll = false},
    [13] = {name = "Quara Pincher", level = 1750, fishing = 60, scroll = false},
    [14] = {name = "Quara Predator", level = 2000, fishing = 65, scroll = false},
    [15] = {name = "Deepling Scout", level = 2200, fishing = 70, scroll = false},
    [16] = {name = "Deepling Brawler", level = 2400, fishing = 75, scroll = false},
    [17] = {name = "Deepling Spellsinger", level = 2600, fishing = 80, scroll = false},
    [18] = {name = "Deepling Guard", level = 2800, fishing = 85, scroll = false},
    [19] = {name = "Deepling Elite", level = 3000, fishing = 90, scroll = false},
    [20] = {name = "Wyrm", level = 5000, fishing = 100, scroll = false},
    [21] = {name = "Sea Serpent", level = 10000, fishing = 85, scroll = false},
    [22] = {name = "Ryujin", level = 20000, fishing = 90, scroll = false},
    [23] = {name = "Caribdis", level = 600000, fishing = 95, scroll = true},
    [24] = {name = "Escila", level = 700000, fishing = 100, scroll = true},
    [25] = {name = "Leaviathan", level = 800000, fishing = 105, scroll = true},
    [26] = {name = "Shesha", level = 900000, fishing = 110, scroll = true},
    [27] = {name = "Sigma", level = 1000000, fishing = 115, scroll = true},
    [28] = {name = "Cicno", level = 1250000, fishing = 120, scroll = true},
    [29] = {name = "Oceanus", level = 1500000, fishing = 125, scroll = true},
    [30] = {name = "Crustacea Gigantica", level = 1750000, fishing = 130, scroll = true},
    [31] = {name = "Manta Ray", level = 2000000, fishing = 140, scroll = true},
	
    -- [32] = {name = "Magma Minion", level = 1000, fishing = 120, scroll = false},
    -- [33] = {name = "Magma Devil", level = 1000, fishing = 120, scroll = false},
    -- [34] = {name = "Magma Demonn", level = 1000, fishing = 120, scroll = false},
 
    -- [35] = {name = "Swamp Blob", level = 1000, fishing = 120, scroll = false},
 
    -- [36] = {name = "Tar Fish", level = 1000, fishing = 120, scroll = false}
}

function fishing.onSay(player, words, param)
    local text = "[Monster Fishing Requirements]\nName - <Level> - {Fishing} - (scroll)\n\n[Water Monsters]\n"
 
    for i = 1, #monsters do
        if monsters[i].scroll then
            text = text..""..monsters[i].name..":\n<"..monsters[i].level.."> / {"..monsters[i].fishing.."} / (yes)\n"
        else
            text = text..""..monsters[i].name..":\n<"..monsters[i].level.."> / {"..monsters[i].fishing.."} / (no)\n"
        end

         -- Change 2, 3, 4 to whenever the next set of fish are for different fishing types --
        if i == 31 then
            text = text.."\n[Lava Monsters]\n"
        end
   
        if i == 34 then
            text = text.."\n[Swamp Monsters]\n"
        end
   
        if i == 35 then
            text = text.."\n[Tar Monsters]\n"
        end
    end

    player:showTextDialog(52053, text)
    -- player:popupFYI(text)
    return false
end

fishing:separator(" ")
fishing:groupType("normal")
fishing:register()