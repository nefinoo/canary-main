local customSword = Weapon(WEAPON_CLUB)

function customSword.onUseWeapon(player, variant)
	local target = player:getTarget()
    if not target then
        return true
    end

    -- Datos del jugador
    local lvl = player:getLevel()
    local skill = player:getSkillLevel(SKILL_CLUB)

    -- Daño físico
    local dmgMax = (lvl * 10.5) + (skill * 35) * 1.275
    local dmgMin = dmgMax / 1.15

    -- Daño holy
    local fireMax = lvl
    local fireMin = lvl / 2

    -- Daño físico
    doTargetCombatHealth(player, target, COMBAT_PHYSICALDAMAGE, -dmgMin, -dmgMax)

    -- Daño holy
    -- doTargetCombatHealth(player, target, COMBAT_HOLYDAMAGE, -fireMin, -fireMax)

	return boolean
end

customSword:id(51066)
customSword:attack(510)
customSword:defense(40)
customSword:level(10000)
customSword:register()
