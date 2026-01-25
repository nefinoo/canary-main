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
    local dmgMax = ((lvl * 3) + (skill * 35) ) * 1.55
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

customSword:id(51918)
customSword:attack(805)
customSword:defense(75)
customSword:level(15000)
customSword:register()
