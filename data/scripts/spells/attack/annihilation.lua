local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

-- Frozen Hell V2: damage grows with level AND the equipped weapon (skill * attack).
-- This makes future loot and weapon upgrades directly affect time-to-kill.
function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()
    local gear = math.max(0, skill) * math.max(0, attack)
    local minimum = (level * 0.22 + gear * 0.105 + 55) * 1.00
    local maximum = (level * 0.32 + gear * 0.15 + 95) * 1.00
    return -minimum, -maximum
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(62)
spell:name("Annihilation")
spell:words("exori gran ico")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_ANNIHILATION)
spell:level(110)
spell:mana(150)
spell:isPremium(true)
spell:range(1)
spell:needTarget(true)
spell:blockWalls(true)
spell:needWeapon(true)
spell:cooldown(12000)
spell:groupCooldown(2000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()
