local customSword = Weapon(WEAPON_SWORD)

function customSword.onUseWeapon(player, variant)
	local target = player:getTarget()
    if not target then
        return true
    end

    local lvl = player:getLevel()
    local skill = player:getSkillLevel(SKILL_SWORD)

    local dmgMax = ((lvl * 7.5) + (skill * 35)) * 1.275
    local dmgMin = dmgMax / 1.15

    doTargetCombatHealth(player, target, COMBAT_PHYSICALDAMAGE, -dmgMin, -dmgMax)
	return boolean
end

customSword:id(52376)
customSword:attack(300)
customSword:defense(150)
customSword:level(5000)
customSword:register()
