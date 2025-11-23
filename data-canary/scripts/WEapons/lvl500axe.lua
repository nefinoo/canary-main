local customSword = Weapon(WEAPON_SWORD)

function customSword.onUseWeapon(player, variant)
	local target = player:getTarget()
    if not target then
        return true
    end

    local lvl = player:getLevel()
    local skill = player:getSkillLevel(SKILL_SWORD)

    local dmgMax = ((lvl * 3) + (skill * 35)) / 2.90
    local dmgMin = dmgMax / 1.5

    doTargetCombatHealth(player, target, COMBAT_PHYSICALDAMAGE, -dmgMin, -dmgMax)
	return boolean
end

customSword:id(7420)
customSword:attack(195)
customSword:defense(35)
customSword:level(500)
customSword:register()
