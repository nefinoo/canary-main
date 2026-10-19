local deadlyFireStrike = {
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
for _, config in pairs(deadlyFireStrike) do
    -- Close combat configuration
    config.combat.close:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
    config.combat.close:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREWORK_RED)
    
    -- Distance combat configuration
    config.combat.distance:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
    config.combat.distance:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREWORK_RED)
    config.combat.distance:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
end

-- Sorcerer formulas
deadlyFireStrike[1].combat.close:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.6, -30, -1.9, 0)
deadlyFireStrike[1].combat.distance:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.6, -30, -1.9, 0)

-- Druid formulas
deadlyFireStrike[2].combat.close:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.45, -30, -1.7, 0)
deadlyFireStrike[2].combat.distance:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.45, -30, -1.7, 0)

-- Paladin formulas
deadlyFireStrike[3].combat.close:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.0, 0, -1.25, 0)
deadlyFireStrike[3].combat.distance:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.0, 0, -1.25, 0)

-- Knight formulas (using SKILL formula as in original)
deadlyFireStrike[4].combat.close:setFormula(COMBAT_FORMULA_SKILL, 0.75, 0, 1.0, 0)
deadlyFireStrike[4].combat.distance:setFormula(COMBAT_FORMULA_SKILL, 0.75, 0, 1.0, 0)

local spell = Spell(SPELL_INSTANT)

function spell.onCastSpell(creature, variant)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    local vocationId = player:getVocation():getId()
    local config
    
    -- Determine which vocation group
    if vocationId == 1 or vocationId == 5 then
        config = deadlyFireStrike[1] -- Deadly Wizard
    elseif vocationId == 2 or vocationId == 6 then
        config = deadlyFireStrike[2] -- Deadly Priest
    elseif vocationId == 3 or vocationId == 7 then
        config = deadlyFireStrike[3] -- Deadly Archer
    elseif vocationId == 4 or vocationId == 8 then
        config = deadlyFireStrike[4] -- Deadly Berserker
    else
        player:sendCancelMessage("Sorry, you must get your first promotion first.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

	-- costmana = player:getMaxMana() * 0.1
	costmana = 400
	 
    -- Check mana (200 mana como en tu ejemplo)
    if player:getMana() < costmana then
        player:sendCancelMessage("You do not have enough mana.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    -- Deduct mana
    player:addMana(-costmana)
    player:addManaSpent(costmana)

    -- Determine if it's a distance attack and execute combat
    local combatType = (variant:getNumber() ~= 0) and config.combat.distance or config.combat.close
    
    return combatType:execute(creature, variant)
end

-- Spell configuration
spell:name("Deadly Fire Strike")
spell:words("exevo flam")
spell:group("attack")
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(false)
spell:isPremium(true)
spell:level(250)
spell:mana(60) -- We handle mana manually in the script
spell:range(5)
spell:needCasterTargetOrDirection(true)
spell:cooldown(2000) -- exhaustion in milliseconds
spell:vocation("sorcerer;true")

spell:register()