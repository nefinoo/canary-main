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
    local dmgMax = (lvl * 3) + (skill * 35)
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

viperStar:id(8023)
viperStar:attack(500)
viperStar:breakChance(0)
viperStar:shootType(CONST_ANI_GREENSTAR)
viperStar:maxHitChance(100)
viperStar:register()
