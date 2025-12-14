local dpsData = {}

local DPS_EVENT_TIME = 10  -- segundos
local TIMEOUT = 5          -- segundos sin atacar → reset

local DamageDps = CreatureEvent("DamageSum")

-- Enviar DPS al jugador
local function sendDPS(monsterId, playerId)
    local monster = Monster(monsterId)
    local player = Player(playerId)

    if not monster or not player then
        return
    end

    local key = monsterId .. "_" .. playerId
    local info = dpsData[key]

    if not info then
        return
    end

    local dps = math.floor(info.total / DPS_EVENT_TIME)

    if dps < 0 then dps = 0 end

    monster:say(player:getName() .. " DPS: " .. dps, TALKTYPE_MONSTER_SAY)

    -- Reset después de mostrar DPS
    info.total = 0

    -- Reprogramar el evento para la siguiente ventana
    addEvent(sendDPS, DPS_EVENT_TIME * 1000, monsterId, playerId)
end

--------------------------------------------------------------------
-- EVENT: when monster receives damage
--------------------------------------------------------------------
function DamageDps.onHealthChange(monster, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    -- Debe ser daño (Canary envía daño como valor NEGATIVO)
    if primaryDamage >= 0 then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    -- Solo registrar daño de jugadores
    if not attacker or not attacker:isPlayer() then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    local monsterId = monster:getId()
    local playerId = attacker:getId()
    local key = monsterId .. "_" .. playerId

    local now = os.time()

    -- Inicializar data
    if not dpsData[key] then
        dpsData[key] = { total = 0, lastHit = now }

        -- Programar primer DPS
        addEvent(sendDPS, DPS_EVENT_TIME * 1000, monsterId, playerId)
    end

    local info = dpsData[key]

    -- Reset si el jugador dejó de atacar por más de TIMEOUT
    if now - info.lastHit > TIMEOUT then
        info.total = 0
    end

    -- Registrar daño (positivo)
    local dmg = math.abs(primaryDamage + secondaryDamage)
    info.total = info.total + dmg
    info.lastHit = now

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

DamageDps:register()
