local manaRune = Action()

local reqml = 8            -- Magic level required to use
local reqlvl = 250          -- Level required to use

local error_ml = "You don't have the required magic level to use that rune."
local error_lvl = "You don't have the required level to use that rune."
local error_voc = "You don't are Paladin, Sorcerer or Druid."

function manaRune.onUse(player, item, fromPos, target, toPos, isHotkey)
    -- Usar el jugador como objetivo por defecto
    local targetPlayer = player
    if target and target:isPlayer() then
        targetPlayer = target
    end

    if player:getLevel() < reqlvl then
        player:sendCancelMessage(error_lvl)
        fromPos:sendMagicEffect(CONST_ME_POFF)
        return true
    end

    -- if not player:isDruid() and not player:isPaladin() and not player:isSorcerer() then
        -- player:sendCancelMessage(error_voc)
        -- fromPos:sendMagicEffect(CONST_ME_POFF)
        -- return true
    -- end

    if player:getMagicLevel() < reqml then
        player:sendCancelMessage(error_ml)
        fromPos:sendMagicEffect(CONST_ME_POFF)
        return true
    end

    ----------------------------------------------------------------------
    -- Calcular el mana base del jugador (sin contar equipo ni buffs)
    ----------------------------------------------------------------------
    local manaPerLevel = 0

    if targetPlayer:isSorcerer() or targetPlayer:isDruid() then
        manaPerLevel = 3.0
    elseif targetPlayer:isPaladin() then
        manaPerLevel = 15
    elseif targetPlayer:isKnight() then
        manaPerLevel = 0.715
    end

    -- Mana base obtenido desde nivel 8
    local baseMana = math.max(0, (targetPlayer:getLevel() - 8) * manaPerLevel)

    -- Cura entre el 14% y el 16% del mana base
    local manaToAdd = math.random(
        math.floor(baseMana * 0.7),
        math.floor(baseMana * 0.8)
    )

    -- Efecto visual
    targetPlayer:getPosition():sendMagicEffect(564)

    -- Agregar mana
    targetPlayer:addMana(manaToAdd)

    -- Debug
    -- print(string.format(
        -- "[MANA RUNE] %s +%d mana (Nivel: %d | Mana Base: %d)",
        -- targetPlayer:getName(),
        -- manaToAdd,
        -- targetPlayer:getLevel(),
        -- baseMana
    -- ))

    -- Exhaust de 2 segundos
    player:setStorageValue(1990, os.time() + 2)

    -- Consumir la runa
    item:remove(1)

    return true
end

manaRune:id(3157)
manaRune:register()