-- Shield of Enforcement Spell
-- Crea un escudo con 10 cargas si el jugador tiene mana máxima y 250 soul points.

local spell = Spell("instant")

function spell.onCastSpell(player, variant)
    local soul = player:getSoul()
    local mana = player:getMana()
    local maxMana = player:getMaxMana()
    local pos = player:getPosition()
	local storage = 20008

    if player:getStorageValue(storage) <= 0 then
        player:sendCancelMessage("Sorry, you need complete Kalazur Quest.")
        return false
    end
	
    -- Requisitos
    if mana < maxMana then
        player:sendCancelMessage("Sorry, you do not have enough mana.")
        return false
    end

    if soul < 200 and not player:hasFlag(PlayerFlag_CanBroadcast) then
        player:sendCancelMessage("Sorry, you need 250 soul points.")
        return false
    end

    -- Crear escudo con 10 cargas
    local item = player:addItem(3426, 1, true)
    if not item then
        player:sendCancelMessage("You cannot carry any more items.")
        return false
    end

    -- Asignar 10 cargas usando actionid
    item:setActionId(110)
    item:setName("Scutum Coercitionis\n(Blocks: 10)")

    -- Efectos visuales
    pos:sendMagicEffect(CONST_ME_MAGIC_RED)
    player:sendTextMessage(MESSAGE_LOOT, "Forged!")

    -- Quitar recursos
    player:addSoul(-200)
    player:addMana(-maxMana)
	
    return true
end

-- Configuración del hechizo
spell:name("Shield of Enforcement")
spell:words("utamo scutum")
spell:group("support")
spell:vocation("knight;true")
spell:cooldown(5000)
spell:groupCooldown(5000)
spell:needLearn(true)
spell:needTarget(false)
spell:isAggressive(false)
spell:level(5000)
spell:mana(0)
spell:soul(0)
spell:register()