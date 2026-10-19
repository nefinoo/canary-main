local customSword = Weapon(WEAPON_SWORD)

function customSword.onUseWeapon(player, variant)
	local target = player:getTarget()
    if not target then
        return true
    end

    local lvl = player:getLevel()
    local skill = player:getSkillLevel(SKILL_SWORD)

    local dmgMax = ((lvl * 3) + (skill * 35)) / 1.65
    local dmgMin = dmgMax / 1.5

    doTargetCombatHealth(player, target, COMBAT_PHYSICALDAMAGE, -dmgMin, -dmgMax)
	return boolean
end

customSword:id(7390)
customSword:attack(340)
customSword:defense(50)
customSword:level(1000)
customSword:register()
