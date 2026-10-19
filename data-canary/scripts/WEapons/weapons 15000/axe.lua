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
    local dmgMax = (lvl * 18.5) + (skill * 35) * 1.25
    local dmgMin = dmgMax / 1.15


    -- Daño físico
    doTargetCombatHealth(player, target, COMBAT_PHYSICALDAMAGE, -dmgMin, -dmgMax)


	return boolean
end

customSword:id(50972)
customSword:attack(805)
customSword:defense(75)
customSword:level(15000)
customSword:register()
