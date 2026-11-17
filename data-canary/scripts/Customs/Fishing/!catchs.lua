-- Contadores compartidos con la Action de pesca; sin lista o keys duplicadas.
local catches = TalkAction("!catchs")
function catches.onSay(player, words, param)
    local cfg = FROZENHELL_FISHING
    if not cfg then
        player:sendCancelMessage("Fishing configuration has not been loaded.")
        return false
    end
    local target = player
    if param and param ~= "" then
        target = Player(param)
        if not target then
            player:sendCancelMessage("Player is not online.")
            return false
        end
    end
    local output = "[" .. target:getName() .. " Fishing Catches]\n\n"
    local total = 0
    for _, area in ipairs({"water", "lava", "swamp", "tar"}) do
        local subtotal = 0
        output = output .. "[" .. cfg.areaNames[area] .. "]\n"
        local entries = cfg.tables[area]
        for i = #entries, 1, -1 do
            local entry = entries[i]
            local amount = tonumber(target:getCatch(entry.key)) or 0
            if amount < 0 then amount = 0 end
            subtotal = subtotal + amount
            output = output .. entry.name .. ": " .. amount .. "\n"
        end
        total = total + subtotal
        output = output .. string.format("Subtotal: %d | Casts since update: %d\n\n",
            subtotal, cfg.getStorageCount(target, cfg.statStorage[area]))
    end
    output = output .. string.format(
        "Total individual catches: %d\nTotal recorded successful monsters (legacy): %d\nBass: %d | Small Bass: %d | Tiny Bass: %d\n",
        total, cfg.getStorageCount(target, 200500),
        cfg.getStorageCount(target, cfg.statStorage.bass),
        cfg.getStorageCount(target, cfg.statStorage.smallBass),
        cfg.getStorageCount(target, cfg.statStorage.tinyBass))
    output = output .. "\nCast/item counters begin with this update; old shared swamp/lava keys cannot be split retroactively."
    player:showTextDialog(32043, output)
    return false
end
catches:separator(" ")
catches:groupType("normal")
catches:register()
