
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

-- Frozen Hell V2: damage grows with level AND the equipped weapon (skill * attack).
-- This makes future loot and weapon upgrades directly affect time-to-kill.
function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()
    local gear = math.max(0, skill) * math.max(0, attack)
    local minimum = (level * 0.11 + gear * 0.048 + 20) * 1.35
    local maximum = (level * 0.17 + gear * 0.074 + 32) * 1.35
    return -minimum, -maximum
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
    return combat:execute(creature, var)
end

spell:group("attack")
spell:id(105)
spell:name("Fierce Berserk")
spell:words("exori gran")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_FIERCE_BERSERK)
spell:level(90)
spell:mana(120)
spell:isPremium(true)
spell:needWeapon(true)
spell:cooldown(6000)
spell:groupCooldown(2000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()
