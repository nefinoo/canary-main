-- NAME OF THE MONSTERS THAT THE USER WILL BE ABLE TO SELECT IN GAME
local config = {
    "Rat",
    "Cave Rat",
    "Slime",
    "Orc",
    "orc spearman",
    "orc rider",
    "orc warrior",
    "orc shaman",
    "orc berserker",
    "orc leader",
    "orc warlord",
    "Orclops Ravager",
    "Orclops Doomhauler",
    "Dragon",
    "Demon"
}

local activeMonster = "" -- USED TO STORE THE NAME OF THE MONSTER THAT IS SELECTED TO RESPAWN
local monstersCounter = 0 -- COUNTER THAT THE MONSTER WILL SAY THE QUANTITY
local userCounter = 0 -- COUNTER THAT THE USER WILL SAY THE QUANTITY
local position = Position(505, 808, 6) -- POSITION WHERE THE MONSTER WILL SPAWN AND RESPAWN WHEN USING THE ACTION ID ITEM

-- FUNCTION TO RESTORE THE LIFE OF THE MONSTER AND SAY THE QUANTITY OF MONSTERS KILLED
local restoreFullHealth = CreatureEvent("restoreFullHealth")
function restoreFullHealth.onPrepareDeath(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    creature:setHealth(creature:getMaxHealth())

    if (creature:isMonster()) then
        monstersCounter = monstersCounter + 1
        creature:say("Already killed " .. monstersCounter .. " " .. activeMonster .. "s", TALKTYPE_MONSTER_SAY)
    elseif (creature:isPlayer()) then
        userCounter = userCounter + 1
        creature:say("Player died " .. userCounter .. " times", TALKTYPE_MONSTER_SAY)
    end
    return false
end
restoreFullHealth:register()

local healPlayerOnDeath = MoveEvent()
function healPlayerOnDeath.onStepIn(creature)
    local player = creature:getPlayer()

    if not player then return nil end

    player:say("Entrando...", TALKTYPE_MONSTER_SAY)

    player:registerEvent("restoreFullHealth")
end
healPlayerOnDeath:position(Position(496, 807, 6))
healPlayerOnDeath:register()

local revokeHealPlayerOnDeath = MoveEvent()
function revokeHealPlayerOnDeath.onStepOut(creature)
    local player = creature:getPlayer()

    if not player then return nil end

    player:say("Saindo...", TALKTYPE_MONSTER_SAY)
    player:setHealth(player:getMaxHealth())
    player:unregisterEvent("restoreFullHealth")
    
    local creatures = Tile(position):getCreatures()
    if (creatures and #creatures > 0) then
        for _, creature in pairs(creatures) do
            if (creature:isMonster()) then
                creature:remove()
            end
        end
    end
end
revokeHealPlayerOnDeath:position(Position(496, 807, 6))
revokeHealPlayerOnDeath:register()


-- REGISTERING THE ACTION TO SHOW THE CHOICES TO THE PLAYER TO SELECT THE MONSTER
local action = Action()
function action.onUse(player)
    if not player then return false end

    local modal = ModalWindow{
        title = "Monster spawn",
        message = "Select monster to keep spawning"
    }

    for _, monsterName in pairs(config) do
        modal:addChoice(
            monsterName,
            function(player, button, choice)
                if (button.name == 'Cancelar') then return end

                local modal = ModalWindow{
                    title = "Quantidade",
                    message = "Selecione a quantidade"
                }

                for i = 1, 8 do
                    modal:addChoice(
                        "" .. i,
                        function(player, button, choice)
                            local tile = Tile(position)
                            local creatures = tile:getCreatures()
                            if (creatures and #creatures > 0) then
                                for _, creature in pairs(creatures) do
                                    if (creature:isMonster()) then
                                        creature:remove()
                                    end
                                end
                            end

                            -- RESET THE COUNTER AND ADD A NEW MONSTER, THEN SET THE RESTORE_FULL_HEALTH TO THIS ESPECIFIC MOSNTER
                            monstersCounter = 0
                            userCounter = 0
                            for j = 1, i do
                                local monster = Game.createMonster(monsterName, position, true, true)
                                monster:registerEvent("restoreFullHealth")
                                activeMonster = monsterName
                                monster:setHealth(monster:getMaxHealth())
                            end
            
                            player:setHealth(player:getMaxHealth())
                        end
                    )
                end

                modal:addButton('Selecionar')
                modal:addButton('Cancelar')

                modal:sendToPlayer(player)
            end
        )
    end

    modal:addButton('Selecionar')
    modal:addButton('Cancelar')

    modal:sendToPlayer(player)

    return true
end
-- ACTION ID USED IN THE ITEM THAT THE USER WILL USE IN GAME IN ORDER TO SHOW THE MODAL WINDOW
action:aid(9999)
action:register()