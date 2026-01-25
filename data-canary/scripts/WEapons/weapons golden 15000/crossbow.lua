local viperStar = Weapon(WEAPON_MISSILE)

function viperStar.onUseWeapon(player, variant)
	local target = player:getTarget()
    if not target then
        return true
    end

    -- Datos del jugador
    local lvl = player:getLevel()
    local skill = player:getSkillLevel(SKILL_DISTANCE)

    -- Daño físico
    local dmgMax = ((lvl * 4.05) + (skill * 65)) * 1.55
    local dmgMin = dmgMax / 1.5

    -- Daño holy
    local holyMax = lvl
    local holyMin = lvl / 2

    -- Posiciones para effects
    local fromPos = player:getPosition()
    local targetPos = target:getPosition()

    -- Effects
    fromPos:sendDistanceEffect(targetPos, CONST_ANI_INFERNALBOLT)

    -- Daño físico
    doTargetCombatHealth(player, target, COMBAT_PHYSICALDAMAGE, -dmgMin, -dmgMax)

    -- Daño holy
    doTargetCombatHealth(player, target, COMBAT_HOLYDAMAGE, -holyMin, -holyMax)

	return boolean
end

viperStar:id(51921)
viperStar:attack(830)
viperStar:breakChance(0)
viperStar:level(15000)
viperStar:shootType(CONST_ANI_GREENSTAR)
viperStar:maxHitChance(100)
viperStar:register()
