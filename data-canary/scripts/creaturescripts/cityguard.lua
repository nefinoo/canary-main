local ignoredMonsters = {
    ["City Guardian"] = true,
    ["Monsters"] = true,
    ["Rabbit"] = true,
    ["Training Monk"] = true,
    ["Training Monks"] = true,
}

local guardHome = {}

local event = CreatureEvent("CityGuardianThink")

function event.onThink(creature, interval)
    local id = creature:getId()
    local pos = creature:getPosition()

    -- Guardar posición original una sola vez
    if not guardHome[id] then
        guardHome[id] = Position(pos.x, pos.y, pos.z)
    end

    local home = guardHome[id]

    -- Buscar enemigos cerca
    local spectators = Game.getSpectators(pos, false, false, 7, 7, 7, 7)
    local foundTarget = false

    for _, target in ipairs(spectators) do
        if target:isMonster() and not ignoredMonsters[target:getName()] then
            foundTarget = true

            -- Lo persigue
            creature:setTarget(target)

            -- Le pega
            local damage = math.random(5000, 10000)
            target:addHealth(-damage)

            pos:sendMagicEffect(CONST_ME_HITAREA)

            break
        end
    end

    -- Si no hay enemigos, volver al puesto
    if not foundTarget then
        if pos:getDistance(home) > 1 then
            creature:teleportTo(home)
        end
    end

    return true
end

event:register()