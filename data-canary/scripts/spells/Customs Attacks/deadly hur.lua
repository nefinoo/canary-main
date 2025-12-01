local spell = Spell("instant")

-- Create combat objects during loading
local closeCombat = Combat()
closeCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
closeCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
closeCombat:setFormula(COMBAT_FORMULA_SKILL, 3.0, 0, 3.5, 0) -- Knight tiene más multiplicador

local distanceCombat = Combat()
distanceCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
distanceCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
distanceCombat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WHIRLWINDSWORD)
distanceCombat:setFormula(COMBAT_FORMULA_SKILL, 3.0, 0, 3.5, 0)

function spell.onCastSpell(creature, variant)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check promotion (Knight vocations)
    local vocationId = player:getVocation():getId()
    if vocationId ~= 4 and vocationId ~= 12 and vocationId ~= 16 then
        player:sendCancelMessage("Only Deadly Berserkers can use this spell.")
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

spell:name("Deadly Physical Strike")
spell:words("exevo gran hur")
spell:group("attack")
spell:vocation("knight;true", "elite knight;true")
spell:id(101) -- Cambia este ID por uno único
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(250)
spell:mana(200)
spell:isPremium(true)
spell:needTarget(false)
spell:isAggressive(true)
spell:blockWalls(true)
spell:range(5)
spell:needCasterTargetOrDirection(true)
spell:needWeapon(true)
spell:register()