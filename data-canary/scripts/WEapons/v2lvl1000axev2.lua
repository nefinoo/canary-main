local customSword = Weapon(WEAPON_AXE)

function customSword.onUseWeapon(player, variant)
	local target = player:getTarget()
    if not target then
        return true
    end

    local lvl = player:getLevel()
    local skill = player:getSkillLevel(SKILL_AXE)

    local dmgMax = ((lvl * 3) + (skill * 35)) / 1.45
    local dmgMin = dmgMax / 1.5

    doTargetCombatHealth(player, target, COMBAT_PHYSICALDAMAGE, -dmgMin, -dmgMax)
	return boolean
end

customSword:id(52365)
customSword:attack(310)
customSword:defense(140)
customSword:level(1500)
customSword:register()
