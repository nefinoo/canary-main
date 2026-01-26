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
    local dmgMax = (lvl * 18.5) + (skill * 35) * 1.225
    local dmgMin = dmgMax / 1.15

    -- Daño físico
    doTargetCombatHealth(player, target, COMBAT_PHYSICALDAMAGE, -dmgMin, -dmgMax)

	return boolean
end

customSword:id(50970)
customSword:attack(800)
customSword:defense(70)
customSword:level(15000)
customSword:register()
