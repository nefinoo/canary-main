local viperStar = Weapon(WEAPON_MISSILE)

function viperStar.onUseWeapon(player, variant)
	 local target = player:getTarget()
    if not target then
        return true
    end

    local lvl = player:getLevel()
    local skill = player:getSkillLevel(SKILL_DISTANCE)

    local dmgMax = ((lvl * 3.85) + (skill * 55)) / 1.2
    local dmgMin = dmgMax / 1.5

    local fromPos = player:getPosition()
    local targetPos = target:getPosition()

    -- efecto distance
    fromPos:sendDistanceEffect(targetPos, CONST_ANI_REDSTAR)

    -- daño
    doTargetCombatHealth(player, target, COMBAT_PHYSICALDAMAGE, -dmgMin, -dmgMax)
	return boolean
end

viperStar:id(50730)
viperStar:attack(380)
viperStar:breakChance(0)
viperStar:shootType(CONST_ANI_GREENSTAR)
viperStar:maxHitChance(100)
viperStar:register()
