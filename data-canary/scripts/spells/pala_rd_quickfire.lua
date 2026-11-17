-- =====================================================
-- Spirit Assassins (Paladin)
-- =====================================================

local config = {
    assassins = 3,          -- quantidade visual de espíritos
    damageMultiplier = 1.6 -- MULTIPLICADOR DE DANO (EDITÁVEL)
}

-- ================================
-- Combat (SINGLE TARGET)
-- ================================
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 0)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 0)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)

-- NÃO usar callback aqui (estabilidade PvP)
-- cálculo manual antes do execute

-- ================================
-- Offsets ATRÁS do caster (base)
-- ================================
local backOffsets = {
    [DIRECTION_NORTH] = { { -1, 1 }, { 0, 1 }, { 1, 1 } },
    [DIRECTION_EAST]  = { { -1, -1 }, { -1, 0 }, { -1, 1 } },
    [DIRECTION_SOUTH] = { { -1, -1 }, { 0, -1 }, { 1, -1 } },
    [DIRECTION_WEST]  = { { 1, -1 }, { 1, 0 }, { 1, 1 } },
}

-- ================================
-- Spell
-- ================================
local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
    local player = creature:getPlayer()
    if not player then return false end

    local target = player:getTarget()
    if not target then return false end

    local pos   = player:getPosition()
    local dir   = player:getDirection()
    local level = player:getLevel()
    local dist  = player:getSkillLevel(SKILL_DISTANCE)

    -- ============================
    -- DANO BASE PALADIN + MULTIPLICADOR
    -- ============================
    local minBase = (level / 5) + (dist + 5) / 3
    local maxBase = (level / 5) + dist + 25

    local min = -(minBase * config.damageMultiplier)
    local max = -(maxBase * config.damageMultiplier)

    combat:setFormula(COMBAT_FORMULA_DAMAGE, min, 0, max, 0)

    -- ============================
    -- VISUAL DOS ASSASSINS
    -- ============================
    local offsets = backOffsets[dir]
    if offsets then
        local count = math.min(config.assassins, #offsets)

        for i = 1, count do
            local off = offsets[i]
            local assassinPos = Position(
                pos.x + off[1],
                pos.y + off[2],
                pos.z
            )

            assassinPos:sendMagicEffect(CONST_ME_ASSASSIN)
            assassinPos:sendDistanceEffect(
                target:getPosition(),
                CONST_ANI_REDSTAR
            )
        end
    end

    -- ============================
    -- DANO SINGLE TARGET (GARANTIDO)
    -- ============================
    combat:execute(player, Variant(target:getId()))

    return true
end

spell:group("attack")
spell:id(61)
spell:name("Spirit Assassins")
spell:words("palari sini")
spell:level(75)
spell:mana(120)
spell:isAggressive(true)
spell:needTarget(true)
spell:range(6)
spell:blockWalls(true)
spell:cooldown(15 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("paladin;true", "royal paladin;true")
spell:register()
