local customSword = Weapon(WEAPON_CLUB)

function customSword.onUseWeapon(player, variant)
	local target = player:getTarget()
    if not target then
        return true
    end

    local lvl = player:getLevel()
    local skill = player:getSkillLevel(SKILL_CLUB)

    local dmgMax = ((lvl * 3) + (skill * 35)) / 2.90
    local dmgMin = dmgMax / 1.5

    doTargetCombatHealth(player, target, COMBAT_PHYSICALDAMAGE, -dmgMin, -dmgMax)
	return boolean
end

customSword:id(7437)
customSword:attack(200)
customSword:defense(30)
customSword:level(500)
customSword:register()
