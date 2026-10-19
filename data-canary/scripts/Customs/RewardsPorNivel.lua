-- level_rewards.lua
-- Script para Canary: da rewards por level (onLogin + comando manual)
-- Coloca este archivo en: data-canary/scripts/player/level_rewards.lua
-- Registra en creaturescripts.xml (ejemplo abajo).

local storageBase = 220391 -- base para storages (cambia si choca con otros storages)
local STORAGE_CLAIMED_PREFIX = storageBase

-- Configura aquí las recompensas por nivel.
-- Para cada nivel: puede contener items = {{id = X, count = Y}, ...}, money = cantidad (en gold),
-- exp = cantidad de experiencia (opcional), text = texto que el jugador verá al recibirlo.
local levelRewards = {
    [20] = { items = {{id = 3043, count = 1}}, money = 0, exp = 0, text = "Reward for reaching level 50." },
    [50] = { items = {{id = 3043, count = 5}}, money = 0, exp = 0, text = "Congratulations on reaching level 50 — here's a reward for you." },
    [100] = { items = {{id = 3043, count = 10}}, money = 0, exp = 0, text = "Level 100 reached: keep it up!" },
    -- Agrega más niveles según necesites
}

-- Función auxiliar: devuelve storage key para un level
local function getStorageKey(level)
    return STORAGE_CLAIMED_PREFIX + level
end

-- Entrega la recompensa de un nivel a un player (objeto player)
local rewardsEvent = CreatureEvent("RewardsPorNivel")

function rewardsEvent.onAdvance(player, skill, oldLevel, newLevel)
    if skill ~= SKILL_LEVEL then
        return true
    end

    for level, reward in pairs(levelRewards) do
        if newLevel >= level then
            local storage = storageBase + level

            -- ya recibió la recompensa?
            if player:getStorageValue(storage) ~= 1 then

                -- dar items
                if reward.items then
                    for _, it in ipairs(reward.items) do
                        player:addItem(it.id, it.count or 1)
                    end
                end

                -- dinero
                if reward.money and reward.money > 0 then
                    player:addMoney(reward.money)
                end

                -- exp extra
                if reward.exp and reward.exp > 0 then
                    player:addExperience(reward.exp)
                end

                -- mensaje
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, reward.text or ("Has ganado la recompensa del nivel ".. level))

                -- marcar como entregado
                player:setStorageValue(storage, 1)
            end
        end
    end

    return true
end

rewardsEvent:register()