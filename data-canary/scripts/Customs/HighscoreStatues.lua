---------- CONFIG ------------
local howManyPlayers = 10
local statues = {
    { position = Position(576, 754, 7), skill = "level" },
    -- { position = Position(512, 850, 7), skill = "magic" }, 
    -- { position = Position(100, 102, 7), skill = "axe" },
    -- { position = Position(100, 103, 7), skill = "sword" },
    -- { position = Position(100, 104, 7), skill = "club" },
    -- { position = Position(100, 105, 7), skill = "shielding" },
    -- { position = Position(100, 106, 7), skill = "dist" },
    -- { position = Position(100, 107, 7), skill = "fist" },
    -- { position = Position(100, 108, 7), skill = "sorcerer" },
    -- { position = Position(100, 109, 7), skill = "druid" },
    -- { position = Position(100, 110, 7), skill = "knight" },
    -- { position = Position(100, 111, 7), skill = "paladin" },
    -- { position = Position(100, 112, 7), skill = "rook" }
}
------------------------------

local numberOfPlayersInDB = db.storeQuery("SELECT COUNT(*) AS `count` FROM `players` LIMIT " .. howManyPlayers)
local tmpHowManyPlayers = result.getDataString(numberOfPlayersInDB, "count")
result.free(numberOfPlayersInDB)
howManyPlayers = math.min(howManyPlayers,tmpHowManyPlayers)

local function getPlayersByLevelText()
    local topPlayerQuery = db.storeQuery("SELECT * FROM `players` ORDER BY `experience` DESC LIMIT " .. howManyPlayers)
    local text = "Top " .. howManyPlayers .. " players by Level:"
    for i = 1, howManyPlayers do
        local topPlayerName = result.getDataString(topPlayerQuery, "name")
        local topPlayerLevel = result.getDataString(topPlayerQuery, "level")
        text = text .. "\n" .. i .. ". " .. topPlayerName .. " [" .. topPlayerLevel .. "]"
        result.next(topPlayerQuery)
    end   
    result.free(topPlayerQuery)
    return text
end
local function getPlayersByMagicText()
    local topPlayerQuery = db.storeQuery("SELECT * FROM `players` ORDER BY `manaspent` DESC LIMIT " .. howManyPlayers)
    local text = "Top " .. howManyPlayers .. " players by Magic Level:"
    for i = 1, howManyPlayers do
        local topPlayerName = result.getDataString(topPlayerQuery, "name")
        local topPlayerMagic = result.getDataString(topPlayerQuery, "maglevel")
        local topPlayerLevel = result.getDataString(topPlayerQuery, "level")
        text = text .. "\n" .. i .. ". " .. topPlayerName .. " [" .. topPlayerLevel .. "]: " .. topPlayerMagic
        result.next(topPlayerQuery)
    end   
    result.free(topPlayerQuery)
    return text
end
local function getPlayersBySkillText(skillName)
    local topPlayerQuery = db.storeQuery("SELECT * FROM `players` ORDER BY `skill_" .. skillName .."` DESC, `skill_" .. skillName .. "_tries` DESC LIMIT " .. howManyPlayers)
    local uppercaseSkillName = skillName:gsub("^%l", string.upper)
    if uppercaseSkillName == "Dist" then
        uppercaseSkillName = "Distance"
    end
    if uppercaseSkillName ~= "Shielding" then
        uppercaseSkillName = uppercaseSkillName .. " fighting"
    end
    local text = "Top " .. howManyPlayers .. " players by " .. uppercaseSkillName .. ":"
    for i = 1, howManyPlayers do
        local topPlayerName = result.getDataString(topPlayerQuery, "name")
        local topPlayerSkill = result.getDataString(topPlayerQuery, "skill_" .. skillName )
        local topPlayerLevel = result.getDataString(topPlayerQuery, "level")
        text = text .. "\n" .. i .. ". " .. topPlayerName .. " [" .. topPlayerLevel .. "]: " .. topPlayerSkill
        result.next(topPlayerQuery)
    end   
    result.free(topPlayerQuery)
    return text
end
local function getPlayersByVocationText(name)
    local vocationIds = {
        ["rook"] = { 0, 9, "Rook Slayers" },
        ["sorcerer"] = { 1, 5, "Sorcerers" },
        ["druid"] = { 2, 6, "Druids" },
        ["paladin"] = { 3, 7, "Paladins" },
        ["knight"] = { 4, 8, "Knights" }
    }
    local numberOfPlayersInDB = db.storeQuery("SELECT COUNT(*) AS `count` FROM `players` WHERE `vocation` = " .. vocationIds[name][1] .. " or `vocation` = " .. vocationIds[name][2] .. " ORDER BY `experience` DESC LIMIT " .. howManyPlayers)
    local vocationPlayers = result.getDataString(numberOfPlayersInDB, "count")
    result.free(numberOfPlayersInDB)
    vocationPlayers = math.min(vocationPlayers, howManyPlayers)
    local topPlayerQuery = db.storeQuery("SELECT * FROM `players` WHERE `vocation` = " .. vocationIds[name][1] .. " or `vocation` = " .. vocationIds[name][2] .. " ORDER BY `experience` DESC LIMIT " .. vocationPlayers)
    local text = "Top " .. vocationPlayers .. " " .. vocationIds[name][3] ..  " by Level:"
    for i = 1, vocationPlayers do
        local topPlayerName = result.getDataString(topPlayerQuery, "name")
        local topPlayerLevel = result.getDataString(topPlayerQuery, "level")
        text = text .. "\n" .. i .. ". " .. topPlayerName .. " [" .. topPlayerLevel .. "]"
        result.next(topPlayerQuery)
    end   
    result.free(topPlayerQuery)
    return text
end

local updateStatue = GlobalEvent("UpdateHeroStatues")
function updateStatue.onThink(interval)
    local texts = {
        ["level"] = getPlayersByLevelText(),
        -- ["sorcerer"] = getPlayersByVocationText("sorcerer"),
        -- ["druid"] = getPlayersByVocationText("druid"),
        -- ["paladin"] = getPlayersByVocationText("paladin"),
        -- ["knight"] = getPlayersByVocationText("knight"),
        -- ["rook"] = getPlayersByVocationText("rook"),
        -- ["magic"] = getPlayersByMagicText(),
        -- ["fist"] = getPlayersBySkillText("fist"),
        -- ["sword"] = getPlayersBySkillText("sword"),
        -- ["axe"] = getPlayersBySkillText("axe"),
        -- ["club"] = getPlayersBySkillText("club"),
        -- ["dist"] = getPlayersBySkillText("dist"),
        -- ["shielding"] = getPlayersBySkillText("shielding"),
    }
    
		for k,v in pairs(statues) do
        local statue = Tile(v.position):getTopTopItem()
        statue:setAttribute(ITEM_ATTRIBUTE_TEXT, texts[v.skill])
    end
    return true
end
updateStatue:interval(5 * 60000)
updateStatue:register()