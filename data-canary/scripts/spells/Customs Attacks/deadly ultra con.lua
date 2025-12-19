local spell = Spell("instant")

-- Create combat objects during loading
local closeCombat = Combat()
closeCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
closeCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
closeCombat:setFormula(COMBAT_FORMULA_SKILL, 2.5, 0, 3.0, 0) -- Ajusta estos valores

local distanceCombat = Combat()
distanceCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
distanceCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
distanceCombat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SPEAR)
distanceCombat:setFormula(COMBAT_FORMULA_SKILL, 2.5, 0, 3.0, 0) -- Misma fórmula

function spell.onCastSpell(creature, variant)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check promotion (Paladin vocations)
    local vocationId = player:getVocation():getId()
    if vocationId ~= 3 and vocationId ~= 11 and vocationId ~= 15 then
        player:sendCancelMessage("Only Deadly Archers can use this spell.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    -- Check mana (200 mana como en tu ejemplo)
    if player:getMana() < 200 then
        player:sendCancelMessage("You do not have enough mana.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    -- Deduct mana
    player:addMana(-200)
    player:addManaSpent(200)

    -- Determine if it's a distance attack
    local combatType = (variant:getNumber() ~= 0) and distanceCombat or closeCombat
    
    return combatType:execute(creature, variant)
end

spell:name("Deadly Ethereal Spear")
spell:words("exevo ultra con")
spell:group("attack")
spell:vocation("paladin;true", "royal paladin;true")
spell:id(100) -- Cambia este ID por uno único
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(250)
spell:mana(200)
spell:isPremium(true)
spell:needTarget(true)
spell:isAggressive(true)
spell:blockWalls(true)
spell:range(5)
spell:needCasterTargetOrDirection(true)
spell:needWeapon(false)
spell:register()