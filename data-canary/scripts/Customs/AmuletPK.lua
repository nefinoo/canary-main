-- CONFIG
-- local AMULET_ID = 3080

-- local immortal = CreatureEvent("ImmortalAmulet")

-- function immortal.onPrepareDeath(creature, killer)
    -- local player = creature:getPlayer()
    -- if not player then
        -- return true
    -- end

    -- local amulet = player:getSlotItem(CONST_SLOT_AMULET)
    -- if not amulet or amulet.itemid ~= AMULET_ID then
        -- return true -- muerte normal
    -- end

    -- SALVAR VIDA
    -- player:addHealth(player:getMaxHealth())
    -- player:addMana(player:getMaxMana())
    -- player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your amulet saved your life!")

    -- ELIMINAR AMULETO
    -- amulet:remove(1)

    -- BLOQUEAR COMPLETAMENTE LA MUERTE
    -- player:setDropLoot(false)    -- evita loot
    -- player:setDropSkull(false)   -- evita castigos por skull
    -- player:setDropBless(false)   -- evita perder blessings
    -- player:setDropInventory(false)
    -- player:setDropEquipment(false)

    -- return false -- extremadamente importante
-- end

-- AÚN ASÍ CANARY A VECES EJECUTA onDeath → LO BLOQUEAMOS
-- function immortal.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified)
    -- local player = creature:getPlayer()
    -- if not player then
        -- return true
    -- end

    -- si tenía el amuleto, evitamos por completo el proceso post-muerte
    -- local amulet = player:getSlotItem(CONST_SLOT_AMULET)
    -- if amulet and amulet.itemid == AMULET_ID then
        -- return false -- no generar corpse ni seguir flujo de muerte
    -- end

    -- return true
-- end

-- immortal:register()
