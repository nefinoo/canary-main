local deadlyReckoning = {
    -- Deadly Wizard (9, 13)
    [1] = {
        mana = 1000,
        combat = Combat(),
        area = createCombatArea(AREA_CIRCLE3X3)
    },
    -- Deadly Priest (10, 14)
    [2] = {
        mana = 1000,
        combat = Combat(),
        area = createCombatArea(AREA_CIRCLE3X3)
    },
    -- Deadly Archer (11, 15)
    [3] = {
        mana = 400,
        combat = Combat(),
        area = createCombatArea(AREA_CIRCLE3X3)
    },
    -- Deadly Berserker (12, 16)
    [4] = {
        mana = 400,
        combat = Combat(),
        area = createCombatArea(AREA_SQUARE2X2)
    },
    -- Gamemaster
    [5] = {
        combat = Combat(),
        area = createCombatArea(AREA_WHOLESCREEN)
    }
}

-- Deadly Wizard configuration (Death Damage)
deadlyReckoning[1].combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
deadlyReckoning[1].combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STUN)
deadlyReckoning[1].combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -3.2, -30, -3.7, 0)
deadlyReckoning[1].combat:setArea(deadlyReckoning[1].area)

-- Deadly Priest configuration (Ice Damage)
deadlyReckoning[2].combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
deadlyReckoning[2].combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
deadlyReckoning[2].combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -3.1, -50, -3.5, 0)
deadlyReckoning[2].combat:setArea(deadlyReckoning[2].area)

-- Deadly Archer configuration (Holy Damage)
deadlyReckoning[3].combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
deadlyReckoning[3].combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
deadlyReckoning[3].combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -4.3, 0, -5.4, 0)
deadlyReckoning[3].combat:setArea(deadlyReckoning[3].area)

-- Deadly Berserker configuration (Physical Damage)
deadlyReckoning[4].combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
deadlyReckoning[4].combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
deadlyReckoning[4].combat:setParameter(COMBAT_PARAM_USECHARGES, true)
deadlyReckoning[4].combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -3.5, 0, -5.4, 0)
deadlyReckoning[4].combat:setArea(deadlyReckoning[4].area)

-- Gamemaster configuration (Physical Damage - Whole Screen)
deadlyReckoning[5].combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
deadlyReckoning[5].combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STUN)
deadlyReckoning[5].combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)
deadlyReckoning[5].combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -10.0, -500000, -10.0, -600000)
deadlyReckoning[5].combat:setArea(deadlyReckoning[5].area)

local spell = Spell(SPELL_INSTANT)

function spell.onCastSpell(creature, variant)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check for Gamemaster first
    if player:getGroup():getAccess() then
        return deadlyReckoning[5].combat:execute(creature, variant)
    end

    local vocationId = player:getVocation():getId()
    local config

    -- Determine which vocation group
    if vocationId == 1 or vocationId == 5 then
        config = deadlyReckoning[1] -- Deadly Wizard
    elseif vocationId == 2 or vocationId == 6 then
        config = deadlyReckoning[2] -- Deadly Priest
    elseif vocationId == 3 or vocationId == 7 then
        config = deadlyReckoning[3] -- Deadly Archer
    elseif vocationId == 4 or vocationId == 8 then
        config = deadlyReckoning[4] -- Deadly Berserker
    else
        player:sendCancelMessage("Sorry, you must get your second promotion (500) first.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    -- Check mana
    if player:getMana() < config.mana then
        player:sendCancelMessage("You do not have enough mana.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    -- Deduct mana and add mana spent
    player:addMana(-config.mana)
    player:addManaSpent(1000) -- Always add 1000 spent mana as in original

    return config.combat:execute(creature, variant)
end

-- Spell configuration
spell:name("Deadly Reckoning")
spell:words("exevo mort")
spell:group("attack")
spell:isAggressive(true)
spell:needTarget(false)
spell:needWeapon(false)
spell:isPremium(true)
spell:level(500)
spell:mana(0) -- We handle mana manually in the script
spell:cooldown(2000) -- exhaustion in milliseconds
spell:needLearn(false)
spell:isSelfTarget(true)
spell:vocation("sorcerer;true")
spell:vocation("druid;true")
spell:vocation("paladin;true")
spell:vocation("knight;true")

spell:register()