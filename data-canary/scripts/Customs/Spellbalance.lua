function getBalancedSpellAverageDamage(player)
    local level = player:getLevel()
    local magic = player:getMagicLevel()

    -- MISMA fórmula que la spell
    local min = (level * -5.0) + (magic * -0.05) - 30
    local max = (level * -5.0) + (magic * -0.05)

    return math.abs((min + max) / 2)
end