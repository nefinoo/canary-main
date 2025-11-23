local deadlyHolyStrike = {
    -- Sorcerer vocations (5, 9, 13)
    [1] = {
        mana = 400,
        combat = {
            close = Combat(),
            distance = Combat()
        }
    },
    -- Druid vocations (6, 10, 14)
    [2] = {
        mana = 400,
        combat = {
            close = Combat(),
            distance = Combat()
        }
    },
    -- Paladin vocations (7, 11, 15)
    [3] = {
        mana = 200,
        combat = {
            close = Combat(),
            distance = Combat()
        }
    },
    -- Knight vocations (8, 12, 16)
    [4] = {
        mana = 200,
        combat = {
            close = Combat(),
            distance = Combat()
        }
    }
}

-- Configure combat parameters for each vocation group
for _, config in pairs(deadlyHolyStrike) do
    -- Close combat configuration
    config.combat.close:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
    config.combat.close:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREWORK_RED)
    
    -- Distance combat configuration
    config.combat.distance:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
    config.combat.distance:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREWORK_RED)
    config.combat.distance:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HOLY)
end

-- Sorcerer formulas
deadlyHolyStrike[1].combat.close:setFormula(COMBAT_FORMULA_LEVELMAGIC, -3.2, -30, -3.8, 0)
deadlyHolyStrike[1].combat.distance:setFormula(COMBAT_FORMULA_LEVELMAGIC, -3.2, -30, -3.8, 0)

-- Druid formulas
deadlyHolyStrike[2].combat.close:setFormula(COMBAT_FORMULA_LEVELMAGIC, -2.9, -30, -3.4, 0)
deadlyHolyStrike[2].combat.distance:setFormula(COMBAT_FORMULA_LEVELMAGIC, -2.9, -30, -3.4, 0)

-- Paladin formulas
deadlyHolyStrike[3].combat.close:setFormula(COMBAT_FORMULA_LEVELMAGIC, -2.0, 0, -2.5, 0)
deadlyHolyStrike[3].combat.distance:setFormula(COMBAT_FORMULA_LEVELMAGIC, -2.0, 0, -2.5, 0)

-- Knight formulas (using SKILL formula as in original)
deadlyHolyStrike[4].combat.close:setFormula(COMBAT_FORMULA_SKILL, 1.5, 0, 2.0, 0)
deadlyHolyStrike[4].combat.distance:setFormula(COMBAT_FORMULA_SKILL, 1.5, 0, 2.0, 0)

local spell = Spell(SPELL_INSTANT)

function spell.onCastSpell(creature, variant)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    local vocationId = player:getVocation():getId()
    local config
    
    --- Determine which vocation group
    if vocationId == 1 or vocationId == 5 then
        config = deadlyHolyStrike[1] -- Deadly Wizard
    elseif vocationId == 2 or vocationId == 6 then
        config = deadlyHolyStrike[2] -- Deadly Priest
    elseif vocationId == 3 or vocationId == 7 then
        config = deadlyHolyStrike[3] -- Deadly Archer
    elseif vocationId == 4 or vocationId == 8 then
        config = deadlyHolyStrike[4] -- Deadly Berserker
    else
        player:sendCancelMessage("Sorry, you must get your first promotion first.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    -- Check mana
    if player:getMana() < config.mana then
        player:sendCancelMessage("You do not have enough mana.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    -- Deduct mana
    player:addMana(-config.mana)
    player:addManaSpent(config.mana)

    -- Determine if it's a distance attack and execute combat
    local combatType = (variant:getNumber() ~= 0) and config.combat.distance or config.combat.close
    
    return combatType:execute(creature, variant)
end

-- Spell configuration
spell:name("Deadly Holy Strike")
spell:words("exevo san")
spell:group("attack")
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(false)
spell:isPremium(true)
spell:level(500)
spell:mana(0) -- We handle mana manually in the script
spell:range(5)
spell:needCasterTargetOrDirection(true)
spell:cooldown(2000) -- exhaustion in milliseconds
spell:vocation("sorcerer;true")
spell:vocation("druid;true")
spell:vocation("paladin;true")
spell:vocation("knight;true")

spell:register()