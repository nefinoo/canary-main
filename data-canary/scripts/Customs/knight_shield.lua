-- Shield of Enforcement (ID 2529)
-- Bloquea daño y consume 1 carga por golpe bloqueado.
-- Cuando se agotan las cargas, el ítem se destruye.

local SHIELD_ID = 3426
local EXHAUST_STORAGE = 1988

local event = CreatureEvent("ShieldOfEnforcement")

function event.onHealthChange(player, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not player or not player:isPlayer() then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    if primaryType == COMBAT_HEALING then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    -- Evitar spam del evento
    if player:getStorageValue(EXHAUST_STORAGE) > os.time() then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    local pos = player:getPosition()
    local left = player:getSlotItem(CONST_SLOT_LEFT)
    local right = player:getSlotItem(CONST_SLOT_RIGHT)

    local shield = nil
    if right and right:getId() == SHIELD_ID then
        shield = right
    elseif left and left:getId() == SHIELD_ID then
        shield = left
    end

    if not shield then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    -- Revisar cargas usando actionid (como en tu script original)
    local charges = shield:getActionId()
	
    if charges < 101 then
        shield:remove(1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your shield crumbles as its energy fades.")
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    -- Bloquea daño
    charges = charges - 1
    shield:setActionId(charges)

    local newCount = (charges - 100)
    shield:setName("Shield of Enforcement\n(Blocks: " .. newCount .. ")")

    -- pos:sendAnimatedText("-Blocked-", TEXTCOLOR_RED)
    player:say("-Blocked-", TALKTYPE_MONSTER_SAY)
    pos:sendMagicEffect(CONST_ME_PRISMATIC_SPARK)

    player:setStorageValue(EXHAUST_STORAGE, os.time() + 1)

    -- Anula daño
    return 0, primaryType, 0, secondaryType
end

event:register()

-- Registrar evento en el login del jugador
local login = CreatureEvent("ShieldOfEnforcementLogin")

function login.onLogin(player)
    player:registerEvent("ShieldOfEnforcement")
    return true
end

login:register()
