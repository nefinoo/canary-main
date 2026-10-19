local customSword = Weapon(WEAPON_SWORD)

function customSword.onUseWeapon(player, variant)
	local target = player:getTarget()
    if not target then
        return true
    end

    -- Datos del jugador
    local lvl = player:getLevel()
    local skill = player:getSkillLevel(SKILL_DISTANCE)

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

customSword:id(53284)
customSword:attack(1500)
customSword:defense(150)
customSword:level(30000)
customSword:register()
