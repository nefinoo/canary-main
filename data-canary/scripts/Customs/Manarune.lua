local manaRune = Action()

function manaRune.onUse(player, item, fromPos, target, toPos, isHotkey)
    -- Usar el jugador como objetivo
    local targetPlayer = player
    if target and target:isPlayer() then
        targetPlayer = target
    end
    
    -- Cálculos idénticos al script original
    local mana = targetPlayer:getMaxMana()
    local maxheal = (mana * 0.005)
    local minHeal = 250 + targetPlayer:getLevel() * 0.4 + maxheal
    local maxHeal = 500 + targetPlayer:getLevel() * 0.6 + maxheal
    
    -- Bonus por exhaust
    if targetPlayer:getStorageValue(1990) > os.time() then
        minHeal = minHeal * 1.25
        maxHeal = maxHeal * 1.25
    end
    
    local manaToAdd = math.random(minHeal, maxHeal)
    
    -- Efecto visual
    targetPlayer:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    
    -- Añadir mana
    targetPlayer:addMana(manaToAdd)
    
    -- Mensaje de depuración en consola
    print(string.format("[MANA RUNE] %s +%d mana (nivel: %d, manaMax: %d)", 
          targetPlayer:getName(), manaToAdd, targetPlayer:getLevel(), mana))
    
    -- Establecer exhaust (2 segundos)
    player:setStorageValue(1990, os.time() + 2)
    
    -- Consumir runa
    item:remove(1)
    return true
end

manaRune:id(3157)
manaRune:register()