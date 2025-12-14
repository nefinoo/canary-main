-- ============================
-- AREA CONFIG
-- ============================
local area = createCombatArea({
	{ 0, 1, 1, 1, 0 },
	{ 1, 1, 1, 1, 1 },
	{ 1, 1, 3, 1, 1 },
	{ 1, 1, 1, 1, 1 },
	{ 0, 1, 1, 1, 0 },
})

-- ============================
-- COMBAT OBJECT
-- ============================
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_GREENSTAR)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setArea(area)

-- ============================
-- FORMULA (debe ser GLOBAL)
-- ============================
function onGetFormula(player, skill, attack, factor)
	local lvl = player:getLevel()
	local dist = player:getSkillLevel(SKILL_DISTANCE)

	local dmgMax = ((lvl * 3) + (dist * 35))
	local dmgMin = dmgMax / 1.5

	-- reducción del 45%
	dmgMax = dmgMax * 0.55
	dmgMin = dmgMin * 0.55

	return -dmgMin, -dmgMax
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormula")

-- ============================
-- WEAPON SCRIPT
-- ============================
local viperStar = Weapon(WEAPON_MISSILE)

function viperStar.onUseWeapon(player, variant)
    local target = player:getTarget()
    if not target then
        return true
    end

    player:getPosition():sendDistanceEffect(target:getPosition(), CONST_ANI_GREENSTAR)

    return combat:execute(player, variant)
end

viperStar:id(51087)
viperStar:attack(450)
viperStar:breakChance(0)
viperStar:shootType(CONST_ANI_GREENSTAR)
viperStar:maxHitChance(100)
viperStar:register()
