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
    local dmgMax = (lvl * 22) + (skill * 35) * 1.25
    local dmgMin = dmgMax / 1.15

    -- Posiciones para effects
    local fromPos = player:getPosition()
    local targetPos = target:getPosition()

    -- Effects
    fromPos:sendDistanceEffect(targetPos, CONST_ANI_INFERNALBOLT)

    -- Daño físico
    doTargetCombatHealth(player, target, COMBAT_PHYSICALDAMAGE, -dmgMin, -dmgMax)

	return boolean
end

viperStar:id(51248)
viperStar:attack(830)
viperStar:breakChance(0)
viperStar:level(15000)
viperStar:shootType(CONST_ANI_GREENSTAR)
viperStar:maxHitChance(100)
viperStar:register()
