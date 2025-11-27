local BONUS = CreatureEvent("BONUSADDONS")

-- LISTA DE OUTFITS VALIDOS PARA EL SISTEMA
local maleOutfits = {128,129,130,131,132,133,134,143,144,145,146,151,152,153,154,251,268,273,278,289,325,328,335,367,430,432,463,465,472,512,516,541,574,577,610,619,633,634,637,665,667,684,695,697,699,725,733,746,750,760,846,853,873,884,899,908,931,955,957,962,964,966,968,970,972,974,1021,1023,1042,1051,1056,1069,1094,1102,1127,1146,1161,1173,1186,1202,1204,1210,1245,1243,1251,1270,1279,1282,1288,1292,1322,1331,1338,1371,1382,1384,1415,1386,1415,1436,1444,1449,1457,1460,1489,1500}

local femaleOutfits = {136,137,138,139,140,141,142,147,148,149,150,156,157,158,252,269,270,279,288,324,329,336,366,431,433,464,466,471,513,514,542,575,578,618,620,632,635,636,664,666,683,694,696,698,724,732,745,749,845,852,874,885,900,909,929,956,958,963,965,967,969,971,973,975,1020,1024,1043,1050,1057,1070,1095,1103,1128,1147,1162,1174,1187,1203,1205,1207,1211,1246,1244,1252,1271,1280,1283,1289,1293,1323,1332,1339,1372,1383,1385,1387,1416,1437,1445,1450,1456,1461,1490,1501}

-- Máximo 235 monturas reales de Canary
local MAX_MOUNTS = 235
local BONUS_RATE = 5
local MAX_LEVELS = 71

-- Buff base por nivel
local baseExp   = 1   -- 1% exp por nivel
local baseLoot  = 1   -- 1% loot por nivel
local baseCrit  = 1   -- 1% crit por nivel
local baseLeech = 0.5 -- 0.5% leech por nivel

-- Bonos por vocación
-- knight = +2 HP
-- mage   = +2 MP
-- paladin= +1 HP +1 MP
local vocBuff = {
    sorcerer = {hp = 0, mp = 2, leech = baseLeech},
    druid    = {hp = 0, mp = 2, leech = baseLeech},
    paladin  = {hp = 1, mp = 1, leech = baseLeech},
    knight   = {hp = 2, mp = 0, leech = baseLeech}
}

function BONUS.onLogin(player)
    local sex = player:getSex()
    local voc = player:getVocation():getId()

    local vocType =
        (voc == 1 or voc == 5) and "sorcerer" or
        (voc == 2 or voc == 6) and "druid" or
        (voc == 3 or voc == 7) and "paladin" or
        (voc == 4 or voc == 8) and "knight" or nil

    if not vocType then
        return true
    end

    -- Selección correcta de outfits según sexo
    local outfitList = (sex == 0) and femaleOutfits or maleOutfits

    --------------------------------------------
    -- CONTAR OUTFITS COMPLETOS (3 addons)
    --------------------------------------------
    local outfitCount = 0
    for _, looktype in ipairs(outfitList) do
        if player:hasOutfit(looktype, 3) then
            outfitCount = outfitCount + 1
        end
    end

    --------------------------------------------
    -- CONTAR MONTURAS
    --------------------------------------------
    local mountCount = 0
    for i = 1, MAX_MOUNTS do
        if player:hasMount(i) then
            mountCount = mountCount + 1
        end
    end

    local total = outfitCount + mountCount
    local levels = math.floor(total / BONUS_RATE)
    if levels > MAX_LEVELS then levels = MAX_LEVELS end

    --------------------------------------------
    -- CALCULAR BONOS
    --------------------------------------------
    local v = vocBuff[vocType]

    local hpBonus   = v.hp * levels
    local mpBonus   = v.mp * levels
    local leech     = v.leech * levels
    local crit      = baseCrit * levels
    local loot      = baseLoot * levels
    local expBonus  = baseExp * levels  -- % experiencia

    --------------------------------------------
    -- APLICAR CONDICIÓN DE ESTADÍSTICAS
    --------------------------------------------
    local cond = Condition(CONDITION_ATTRIBUTES)
    cond:setParameter(CONDITION_PARAM_TICKS, -1)

    cond:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_DAMAGE, crit * 100)
    cond:setParameter(CONDITION_PARAM_SKILL_LIFE_LEECH_AMOUNT, leech * 100)
    cond:setParameter(CONDITION_PARAM_SKILL_MANA_LEECH_AMOUNT, leech * 100)

    if hpBonus > 0 then
        cond:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 100 + hpBonus)
    end
    if mpBonus > 0 then
        cond:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 100 + mpBonus)
    end

    player:addCondition(cond)

    --------------------------------------------
    -- LOOT BONUS (storage opcional)
    --------------------------------------------
    -- player:setStorageValue(21111, loot)

    --------------------------------------------
    -- ⭐ XP BONUS → USANDO API DE CANARY ⭐
    --------------------------------------------
    -- IMPORTANTE: setXpBoostPercent es ACUMULATIVO.
    -- ejemplo: player:setXpBoostPercent(10) → +10% exp
    --------------------------------------------

    player:setXpBoostPercent(expBonus)

    return true
end

BONUS:register()


function recalcBonus(player)
    local sex = player:getSex()
    local voc = player:getVocation():getId()

    local vocType =
        (voc == 1 or voc == 5) and "sorcerer" or
        (voc == 2 or voc == 6) and "druid" or
        (voc == 3 or voc == 7) and "paladin" or
        (voc == 4 or voc == 8) and "knight" or nil

    if not vocType then return end

    local outfitList = (sex == 0) and femaleOutfits or maleOutfits

    local outfitCount = 0
    for _, looktype in ipairs(outfitList) do
        if player:hasOutfit(looktype, 3) then
            outfitCount = outfitCount + 1
        end
    end

    local mountCount = 0
    for i = 1, MAX_MOUNTS do
        if player:hasMount(i) then
            mountCount = mountCount + 1
        end
    end

    local total = outfitCount + mountCount
    local levels = math.floor(total / BONUS_RATE)
    if levels > MAX_LEVELS then levels = MAX_LEVELS end

    local v = vocBuff[vocType]

    local hpBonus   = v.hp * levels
    local mpBonus   = v.mp * levels
    local leech     = v.leech * levels
    local crit      = baseCrit * levels
    local loot      = baseLoot * levels
    local expBonus  = baseExp * levels

    local cond = Condition(CONDITION_ATTRIBUTES)
    cond:setParameter(CONDITION_PARAM_TICKS, -1)
    cond:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_DAMAGE, crit * 100)
    cond:setParameter(CONDITION_PARAM_SKILL_LIFE_LEECH_AMOUNT, leech * 100)
    cond:setParameter(CONDITION_PARAM_SKILL_MANA_LEECH_AMOUNT, leech * 100)

    if hpBonus > 0 then
        cond:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 100 + hpBonus)
    end
    if mpBonus > 0 then
        cond:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 100 + mpBonus)
    end

    player:addCondition(cond)
    player:setXpBoostPercent(expBonus)
end
