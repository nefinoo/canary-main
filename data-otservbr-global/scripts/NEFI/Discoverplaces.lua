-- Define the discovery event handler
local discovery = MoveEvent()

function discovery.onStepIn(player, item, position, fromPosition)

 if not player:isPlayer() then
        return true -- If it's not a player, do nothing
    end

    local discoveries = {
        {aid = 3500, name = "Salamander cave"},
        {aid = 3501, name = "Troll Cave"},
        {aid = 3502, name = "Rotworm Cave"},
        {aid = 3503, name = "Dworc Cave"},
        {aid = 3504, name = "Nomads Hideout"},
        {aid = 3505, name = "Amazons Hideout"},
        {aid = 3506, name = "Dwarfs Mines"},
        {aid = 3507, name = "Minotaur Bastion"},
        {aid = 3508, name = "Graveyard"},
        {aid = 3509, name = "Elves Fire Hideout"},
        {aid = 3510, name = "Testudines Sand"},
        {aid = 3511, name = "Tarantula Burrows"},
        {aid = 3512, name = "Jungle Secret Place"},
        {aid = 3513, name = "Gargolyes"},
        {aid = 3514, name = "Dark Cathedral"},
        {aid = 3515, name = "Lair of the Cyclops"},
        {aid = 3516, name = "Mad Scientists Laboratory"},
        {aid = 3517, name = "Orcs Fortress"},
        {aid = 3518, name = "Pirats Isles"},
        {aid = 3519, name = "Elder's Vandura"},
        {aid = 3520, name = "Corym Hideout"},
        {aid = 3521, name = "Lich Hell"},
        {aid = 3522, name = "Stonerefiner"},
        {aid = 3523, name = "Ramoa"},
        {aid = 3524, name = "Dragon Lair"},
        {aid = 3525, name = "Vampire Catacombs"},
        {aid = 3526, name = "Ancient Undergrounds"},
        {aid = 3527, name = "Cave Mutated Rats"},
        {aid = 3528, name = "Fossil Undergrounds"},
        {aid = 3529, name = "Green Mutant Caves"},
        {aid = 3530, name = "Ancient Gladiator Arena"},
        {aid = 3531, name = "Brims Bugs Cave"},
        {aid = 3532, name = "Spider Ootheca"},
        {aid = 3533, name = "Bowels of the Dark Cult"},
        {aid = 3534, name = "Sands of Rotten Mummies"},
        {aid = 3535, name = "Place of Fallen Heroes"},
        {aid = 3536, name = "Underground Factories"},
        {aid = 3537, name = "Iks Ruins"},
        {aid = 3538, name = "Dimensional Laboratory"},
        {aid = 3539, name = "Minos Cults Barracks"},
        {aid = 3540, name = "Exotic Poison Caves"},
        {aid = 3541, name = "Wyrm Lairs"},
        {aid = 3542, name = "Oramond Courtyards"},
        {aid = 3543, name = "Lizard Headquarters"},
        {aid = 3544, name = "Bandit Den"},
        {aid = 3545, name = "Weres Lair Barracks"},
        {aid = 3546, name = "Carnivor Caves"},
        {aid = 3547, name = "Fnatic Undergrounds"},
        {aid = 3548, name = "Behemot Hostel"},
    }

    for _, discovery in pairs(discoveries) do
        if item.actionid == discovery.aid then
            local storageValue = player:getStorageValue(discovery.aid)
            if storageValue <= 0 then
                player:setStorageValue(discovery.aid, 1)
                player:sendTextMessage(MESSAGE_LOOK, "You have discovered " .. discovery.name .. ".")
            end
            break
        end
    end

    return true
end

-- Register the discovery events
local discoveries = {
        {aid = 3500, name = "Salamander cave"},
        {aid = 3501, name = "Troll Cave"},
        {aid = 3502, name = "Rotworm Cave"},
        {aid = 3503, name = "Dworc Cave"},
        {aid = 3504, name = "Nomads Hideout"},
        {aid = 3505, name = "Amazons Hideout"},
        {aid = 3506, name = "Dwarfs Mines"},
        {aid = 3507, name = "Minotaur Bastion"},
        {aid = 3508, name = "Graveyard"},
        {aid = 3509, name = "Elves Fire Hideout"},
        {aid = 3510, name = "Testudines Sand"},
        {aid = 3511, name = "Tarantula Burrows"},
        {aid = 3512, name = "Jungle Secret Place"},
        {aid = 3513, name = "Gargolyes"},
        {aid = 3514, name = "Dark Cathedral"},
        {aid = 3515, name = "Lair of the Cyclops"},
        {aid = 3516, name = "Mad Scientists Laboratory"},
        {aid = 3517, name = "Orcs Fortress"},
        {aid = 3518, name = "Pirats Isles"},
        {aid = 3519, name = "Elder's Vandura"},
        {aid = 3520, name = "Corym Hideout"},
        {aid = 3521, name = "Lich Hell"},
        {aid = 3522, name = "Stonerefiner"},
        {aid = 3523, name = "Ramoa"},
        {aid = 3524, name = "Dragon Lair"},
        {aid = 3525, name = "Vampire Catacombs"},
        {aid = 3526, name = "Ancient Undergrounds"},
        {aid = 3527, name = "Cave Mutated Rats"},
        {aid = 3528, name = "Fossil Undergrounds"},
        {aid = 3529, name = "Green Mutant Caves"},
        {aid = 3530, name = "Ancient Gladiator Arena"},
        {aid = 3531, name = "Brims Bugs Cave"},
        {aid = 3532, name = "Spider Ootheca"},
        {aid = 3533, name = "Bowels of the Dark Cult"},
        {aid = 3534, name = "Sands of Rotten Mummies"},
        {aid = 3535, name = "Place of Fallen Heroes"},
        {aid = 3536, name = "Underground Factories"},
        {aid = 3537, name = "Iks Ruins"},
        {aid = 3538, name = "Dimensional Laboratory"},
        {aid = 3539, name = "Minos Cults Barracks"},
        {aid = 3540, name = "Exotic Poison Caves"},
        {aid = 3541, name = "Wyrm Lairs"},
        {aid = 3542, name = "Oramond Courtyards"},
        {aid = 3543, name = "Lizard Headquarters"},
        {aid = 3544, name = "Bandit Den"},
        {aid = 3545, name = "Weres Lair Barracks"},
        {aid = 3546, name = "Carnivor Caves"},
        {aid = 3547, name = "Fnatic Undergrounds"},
        {aid = 3548, name = "Behemot Hostel"},
    }

for _, d in ipairs(discoveries) do
    discovery:aid(d.aid)
end

discovery:type("stepin")
discovery:register()