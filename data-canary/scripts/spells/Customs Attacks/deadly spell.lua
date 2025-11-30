local deadlyReckoning = {
    -- Deadly Wizard (9, 13)
    [1] = {
        mana = 1000,
        combat = Combat(),
        area = createCombatArea(AREA_CIRCLE3X3),

        baseA = -3.2,
        baseB = -30,
        baseC = -3.7,
        baseD = 0
    },

    -- Deadly Priest (10, 14)
    [2] = {
        mana = 1000,
        combat = Combat(),
        area = createCombatArea(AREA_CIRCLE3X3),

        baseA = -3.1,
        baseB = -50,
        baseC = -3.5,
        baseD = 0
    },

    -- Deadly Archer (11, 15)
    [3] = {
        mana = 400,
        combat = Combat(),
        area = createCombatArea(AREA_CIRCLE3X3),

        baseA = -4.3,
        baseB = 0,
        baseC = -5.4,
        baseD = 0
    },

    -- Deadly Berserker (12, 16)
    [4] = {
        mana = 400,
        combat = Combat(),
        area = createCombatArea(AREA_SQUARE2X2),

        baseA = -3.5,
        baseB = 0,
        baseC = -5.4,
        baseD = 0
    },

    -- Gamemaster
    [5] = {
        combat = Combat(),
        area = createCombatArea(AREA_WHOLESCREEN),

        baseA = -10.0,
        baseB = -500000,
        baseC = -10.0,
        baseD = -600000
    }
}

----------------------------------------------------------
-- CONFIGURACIÓN DE CADA COMBAT
----------------------------------------------------------

-- Wizard
deadlyReckoning[1].combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
deadlyReckoning[1].combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STUN)
deadlyReckoning[1].combat:setArea(deadlyReckoning[1].area)
deadlyReckoning[1].combat:setFormula(
    COMBAT_FORMULA_LEVELMAGIC,
    deadlyReckoning[1].baseA, deadlyReckoning[1].baseB,
    deadlyReckoning[1].baseC, deadlyReckoning[1].baseD
)

-- Priest
deadlyReckoning[2].combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
deadlyReckoning[2].combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
deadlyReckoning[2].combat:setArea(deadlyReckoning[2].area)
deadlyReckoning[2].combat:setFormula(
    COMBAT_FORMULA_LEVELMAGIC,
    deadlyReckoning[2].baseA, deadlyReckoning[2].baseB,
    deadlyReckoning[2].baseC, deadlyReckoning[2].baseD
)

-- Archer
deadlyReckoning[3].combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
deadlyReckoning[3].combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
deadlyReckoning[3].combat:setArea(deadlyReckoning[3].area)
deadlyReckoning[3].combat:setFormula(
    COMBAT_FORMULA_LEVELMAGIC,
    deadlyReckoning[3].baseA, deadlyReckoning[3].baseB,
    deadlyReckoning[3].baseC, deadlyReckoning[3].baseD
)

-- Berserker
deadlyReckoning[4].combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
deadlyReckoning[4].combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
deadlyReckoning[4].combat:setParameter(COMBAT_PARAM_USECHARGES, true)
deadlyReckoning[4].combat:setArea(deadlyReckoning[4].area)
deadlyReckoning[4].combat:setFormula(
    COMBAT_FORMULA_LEVELMAGIC,
    deadlyReckoning[4].baseA, deadlyReckoning[4].baseB,
    deadlyReckoning[4].baseC, deadlyReckoning[4].baseD
)

-- Gamemaster
deadlyReckoning[5].combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
deadlyReckoning[5].combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STUN)
deadlyReckoning[5].combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)
deadlyReckoning[5].combat:setArea(deadlyReckoning[5].area)
deadlyReckoning[5].combat:setFormula(
    COMBAT_FORMULA_LEVELMAGIC,
    deadlyReckoning[5].baseA, deadlyReckoning[5].baseB,
    deadlyReckoning[5].baseC, deadlyReckoning[5].baseD
)

----------------------------------------------------------
-- SPELL
----------------------------------------------------------

local spell = Spell(SPELL_INSTANT)

function spell.onCastSpell(creature, variant)
    local player = creature:getPlayer()
    if not player then return false end

    -- GM
    if player:getGroup():getAccess() then
        return deadlyReckoning[5].combat:execute(creature, variant)
    end

    -- Vocations
    local voc = player:getVocation():getId()
    local config =
        (voc == 1 or voc == 5) and deadlyReckoning[1] or
        (voc == 2 or voc == 6) and deadlyReckoning[2] or
        (voc == 3 or voc == 7) and deadlyReckoning[3] or
        (voc == 4 or voc == 8) and deadlyReckoning[4]

    if not config then
        player:sendCancelMessage("Sorry, you must get your second promotion (500) first.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    -- Mana
    if config.mana and player:getMana() < config.mana then
        player:sendCancelMessage("You do not have enough mana.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    ------------------------------------------------------
    -- ⚔ OBTENER EL ATAQUE DEL ARMA (CANARY 100% CORRECTO)
    ------------------------------------------------------
    local weapon = player:getSlotItem(CONST_SLOT_LEFT)
    if not weapon then
        weapon = player:getSlotItem(CONST_SLOT_RIGHT)
    end

    local weaponAttack = 0

    if weapon then
        local itemType = weapon:getType()
        if itemType then
            weaponAttack = itemType:getAttack() or 0
        end
    end

    -- Escala mínima
    local weaponScale = weaponAttack / 1000

    ------------------------------------------------------
    -- RECONSTRUIR FORMULA ESCALADA
    ------------------------------------------------------
	print(weaponAttack)
	print(weaponScale)
	print(config.baseA)
	print(config.baseB)
	print(config.baseC)
	print(config.baseD)
    local a = config.baseA * (1 + weaponScale)
    local b = config.baseB * (1 + weaponScale)
    local c = config.baseC * (1 + weaponScale)
    local d = config.baseD * (1 + weaponScale)
	print(a)
	print(b)
	print(c)
	print(d)

    config.combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, a, b, c, d)

    -- Consumir mana
    if config.mana then
        player:addMana(-config.mana)
        player:addManaSpent(1000)
    end

    return config.combat:execute(creature, variant)
end

-- Spell config
spell:name("Deadly Reckoning")
spell:words("exevo mort")
spell:group("attack")
spell:isAggressive(true)
spell:needTarget(false)
spell:needWeapon(false)
spell:isPremium(true)
spell:level(500)
spell:mana(0)
spell:cooldown(2000)
spell:needLearn(false)
spell:isSelfTarget(true)

spell:vocation("sorcerer;true")
spell:vocation("druid;true")
spell:vocation("paladin;true")
spell:vocation("knight;true")

spell:register()
