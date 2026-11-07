-- FROZEN HELL | KNIGHT COMBAT REWORK v1.0
-- Archivo: data-canary/scripts/spells/knight_rework/frozenhell_knight_spells.lua
-- Se registra exclusivamente para Knight / Elite Knight.
-- Reutilizar FrozenHellKnightBalance desde futuros simuladores para evitar formulas duplicadas.
-- IMPORTANTE: estos parametros son la BASE INICIAL de balanceo, no valores finales.

local balance = {
    version = "1.0",
    damageFactor = 0.085,
    damageVariation = 0.15, -- 85% al 115% del promedio
    healingVariation = 0.05, -- 95% al 105% de la curacion base
    attackGroupCooldown = 2000,
    healingGroupCooldown = 1000,
    attacks = {
        { key = "steel_fang", name = "Steel Fang", words = "exori fang", level = 8,
          multiplier = 0.95, manaBase = 25, manaPct = 0.005, cooldown = 3000,
          target = true, effect = CONST_ME_HITAREA, callback = "frozenHellSteelFangDamage" },
        { key = "frost_cleave", name = "Frost Cleave", words = "exori frost", level = 100,
          multiplier = 0.60, manaBase = 65, manaPct = 0.012, cooldown = 5000,
          target = false, effect = CONST_ME_ICETORNADO, callback = "frozenHellFrostCleaveDamage" },
        { key = "frost_breaker", name = "Frost Breaker", words = "exori breaker", level = 250,
          multiplier = 1.65, manaBase = 100, manaPct = 0.016, cooldown = 8000,
          target = true, effect = CONST_ME_HITAREA, callback = "frozenHellFrostBreakerDamage" },
        { key = "glacial_storm", name = "Glacial Storm", words = "exori storm", level = 500,
          multiplier = 0.78, manaBase = 150, manaPct = 0.024, cooldown = 9000,
          target = false, effect = CONST_ME_ICETORNADO, callback = "frozenHellGlacialStormDamage" },
        { key = "frozen_execution", name = "Frozen Execution", words = "exori execute", level = 1000,
          multiplier = 2.40, manaBase = 220, manaPct = 0.035, cooldown = 15000,
          target = true, effect = CONST_ME_HITAREA, callback = "frozenHellFrozenExecutionDamage" },
    },
    heals = {
        { key = "second_wind", name = "Second Wind", words = "exura wind", level = 8,
          hpPct = 0.06, mlFactor = 4.5, mlCapPct = 0.02,
          manaBase = 30, manaPct = 0.008, cooldown = 1500,
          effect = CONST_ME_MAGIC_BLUE, callback = "frozenHellSecondWindHeal" },
        { key = "frozen_recovery", name = "Frozen Recovery", words = "utura frost", level = 100,
          regenPct = 0.01, regenTicks = 8, regenInterval = 1000,
          manaBase = 80, manaPct = 0.02, cooldown = 25000,
          effect = CONST_ME_MAGIC_GREEN },
        { key = "frost_mend", name = "Frost Mend", words = "exura frost", level = 300,
          hpPct = 0.12, mlFactor = 7, mlCapPct = 0.03,
          manaBase = 85, manaPct = 0.018, cooldown = 3000,
          effect = CONST_ME_MAGIC_BLUE, callback = "frozenHellFrostMendHeal" },
        { key = "last_bastion", name = "Last Bastion", words = "exura bastion", level = 1000,
          hpPct = 0.22, mlFactor = 12, mlCapPct = 0.04,
          manaBase = 140, manaPct = 0.045, cooldown = 14000,
          effect = CONST_ME_MAGIC_BLUE, callback = "frozenHellLastBastionHeal" },
    },
}

function balance.getManaCost(maxMana, spell)
    return math.max(1, math.floor(spell.manaBase + maxMana * spell.manaPct + 0.5))
end

function balance.getDamageRange(level, skill, weaponAttack, multiplier)
    local power = level / 5 + balance.damageFactor * math.max(0, skill) * math.max(0, weaponAttack)
    local average = power * multiplier
    return -math.max(1, math.floor(average * (1 - balance.damageVariation) + 0.5)),
           -math.max(1, math.floor(average * (1 + balance.damageVariation) + 0.5))
end

function balance.getHealRange(maxHealth, magicLevel, spell)
    local magicBonus = math.min(math.max(0, magicLevel) * spell.mlFactor, maxHealth * spell.mlCapPct)
    local average = maxHealth * spell.hpPct + magicBonus
    return math.max(1, math.floor(average * (1 - balance.healingVariation) + 0.5)),
           math.max(1, math.floor(average * (1 + balance.healingVariation) + 0.5))
end

-- Interfaz publica para !simdps y las futuras pruebas de balance.
FrozenHellKnightBalance = balance

local A = balance.attacks
local H = balance.heals

function frozenHellSteelFangDamage(player, skill, attack, factor)
    return balance.getDamageRange(player:getLevel(), skill, attack, A[1].multiplier)
end
function frozenHellFrostCleaveDamage(player, skill, attack, factor)
    return balance.getDamageRange(player:getLevel(), skill, attack, A[2].multiplier)
end
function frozenHellFrostBreakerDamage(player, skill, attack, factor)
    return balance.getDamageRange(player:getLevel(), skill, attack, A[3].multiplier)
end
function frozenHellGlacialStormDamage(player, skill, attack, factor)
    return balance.getDamageRange(player:getLevel(), skill, attack, A[4].multiplier)
end
function frozenHellFrozenExecutionDamage(player, skill, attack, factor)
    return balance.getDamageRange(player:getLevel(), skill, attack, A[5].multiplier)
end
function frozenHellSecondWindHeal(player, level, magicLevel)
    return balance.getHealRange(player:getMaxHealth(), magicLevel, H[1])
end
function frozenHellFrostMendHeal(player, level, magicLevel)
    return balance.getHealRange(player:getMaxHealth(), magicLevel, H[3])
end
function frozenHellLastBastionHeal(player, level, magicLevel)
    return balance.getHealRange(player:getMaxHealth(), magicLevel, H[4])
end

local function checkAndChargeMana(player, spellData)
    local mana = balance.getManaCost(player:getMaxMana(), spellData)
    if player:getMana() < mana then
        player:sendCancelMessage("Not enough mana (" .. mana .. " required).")
        return false
    end
    return mana
end

local function chargeMana(player, mana)
    player:addMana(-mana)
    player:addManaSpent(mana)
end

for _, data in ipairs(balance.attacks) do
    local d = data
    local combat = Combat()
    combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
    combat:setParameter(COMBAT_PARAM_EFFECT, d.effect)
    combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
    if not d.target then
        combat:setArea(createCombatArea(AREA_SQUARE1X1)) -- Area 3x3, centrada en el caster.
    end
    combat:setCallback(CALLBACK_PARAM_SKILLVALUE, d.callback)

    local spell = Spell("instant")
    function spell.onCastSpell(creature, variant)
        local player = creature:getPlayer()
        if not player then return false end
        local mana = checkAndChargeMana(player, d)
        if not mana then return false end
        if not combat:execute(creature, variant) then return false end
        chargeMana(player, mana)
        return true
    end
    spell:name(d.name)
    spell:words(d.words)
    spell:group("attack")
    spell:level(d.level)
    spell:mana(0) -- Coste real cobrado en onCastSpell (dependiente del maxMana).
    spell:cooldown(d.cooldown)
    spell:groupCooldown(balance.attackGroupCooldown)
    spell:needWeapon(true)
    spell:isAggressive(true)
    spell:needLearn(false)
    spell:isPremium(false)
    if d.target then
        spell:needTarget(true)
        spell:range(1)
        spell:blockWalls(true)
    else
        spell:needTarget(false)
    end
    spell:vocation("knight;true", "elite knight;true")
    spell:register()
end

for _, data in ipairs(balance.heals) do
    local d = data
    local spell = Spell("instant")
    local combat = nil

    if d.callback then
        combat = Combat()
        combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
        combat:setParameter(COMBAT_PARAM_EFFECT, d.effect)
        combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
        combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, d.callback)
    end

    function spell.onCastSpell(creature, variant)
        local player = creature:getPlayer()
        if not player then return false end
        local mana = checkAndChargeMana(player, d)
        if not mana then return false end

        if combat then
            if not combat:execute(creature, variant) then return false end
        else
            -- Frozen Recovery: 1% HP maximo por segundo, durante 8 segundos.
            -- SUBID separado para no reemplazar regeneraciones ajenas.
            local healPerTick = math.max(1, math.floor(player:getMaxHealth() * d.regenPct + 0.5))
            local condition = Condition(CONDITION_REGENERATION)
            condition:setParameter(CONDITION_PARAM_TICKS, d.regenInterval * d.regenTicks)
            condition:setParameter(CONDITION_PARAM_HEALTHGAIN, healPerTick)
            condition:setParameter(CONDITION_PARAM_HEALTHTICKS, d.regenInterval)
            condition:setParameter(CONDITION_PARAM_SUBID, 54101)
            condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
            player:addCondition(condition)
            player:getPosition():sendMagicEffect(d.effect)
        end
        chargeMana(player, mana)
        return true
    end

    spell:name(d.name)
    spell:words(d.words)
    spell:group("healing")
    spell:level(d.level)
    spell:mana(0)
    spell:cooldown(d.cooldown)
    spell:groupCooldown(balance.healingGroupCooldown)
    spell:isSelfTarget(true)
    spell:isAggressive(false)
    spell:needLearn(false)
    spell:isPremium(false)
    spell:vocation("knight;true", "elite knight;true")
    spell:register()
end
