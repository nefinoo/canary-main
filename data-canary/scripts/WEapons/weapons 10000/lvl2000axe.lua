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
    local dmgMax = (lvl * 10.5) + (skill * 35) * 1.25
    local dmgMin = dmgMax / 1.15

    -- Daño holy
    -- local fireMax = lvl
    -- local fireMin = lvl / 2

    -- Daño físico
    doTargetCombatHealth(player, target, COMBAT_PHYSICALDAMAGE, -dmgMin, -dmgMax)

    -- Daño holy
    -- doTargetCombatHealth(player, target, COMBAT_HOLYDAMAGE, -fireMin, -fireMax)

	return boolean
end

customSword:id(51069)
customSword:attack(505)
customSword:defense(145)
customSword:level(10000)
customSword:register()
