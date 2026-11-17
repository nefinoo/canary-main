-- Lee los mismos requisitos que utiliza la Action de pesca; sin tablas duplicadas.
local fishingList = TalkAction("!fishing")
function fishingList.onSay(player, words, param)
    local cfg = FROZENHELL_FISHING
    if not cfg then
        player:sendCancelMessage("Fishing configuration has not been loaded.")
        return false
    end
    local output = "[Monster Fishing Requirements]\nLevel / Fishing / Scroll\n"
    for _, area in ipairs({"water", "lava", "swamp", "tar"}) do
        output = output .. string.format("\n[%s] Minimum Fishing: %d\n", cfg.areaNames[area], cfg.areaMinimum[area])
        local entries = cfg.tables[area]
        for i = #entries, 1, -1 do
            local entry = entries[i]
            local available = MonsterType(entry.spawnName or entry.name) and "" or " [missing monster]"
            output = output .. string.format("%s: %d / %d / %s%s\n",
                entry.name, entry.level, entry.fishing, entry.scroll and "yes" or "no", available)
        end
    end
    output = output .. "\nA Fishing Scroll uses storage 15000 = 1."
    player:showTextDialog(52053, output)
    return false
end
fishingList:separator(" ")
fishingList:groupType("normal")
fishingList:register()
