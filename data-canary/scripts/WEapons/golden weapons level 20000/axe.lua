local customSword = Weapon(WEAPON_AXE)

function customSword.onUseWeapon(player, variant)
	local target = player:getTarget()
    if not target then
        return true
    end

    -- Datos del jugador
    local lvl = player:getLevel()
    local skill = player:getSkillLevel(SKILL_AXE)

    -- Daño físico
    local dmgMax = ((lvl * 3) + (skill * 35) ) * 2.0
    local dmgMin = dmgMax / 1.5

    -- Daño holy
    local fireMax = lvl
    local fireMin = lvl / 2

    -- Daño físico
    doTargetCombatHealth(player, target, COMBAT_PHYSICALDAMAGE, -dmgMin, -dmgMax)

    -- Daño holy
    doTargetCombatHealth(player, target, COMBAT_HOLYDAMAGE, -fireMin, -fireMax)

	return boolean
end

customSword:id(53065)
customSword:attack(1005)
customSword:defense(105)
customSword:level(20000)
customSword:register()
