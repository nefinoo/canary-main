-- Frozen Hell | /balance MULTICREATURE v2.4 (reporte desplazable)
-- Basado directamente en BalanceoLootMonsters(3).lua, tabla NPC y generateLootRoll.
-- /balance rat, 16, cave rat, 10, slime, 6, slug, 4
-- /balance lvl 300, rat, 16, cave rat, 10
-- NO crea criaturas, no entrega items, no modifica HP/EXP del jugador.
local simulateLoot = TalkAction("/balance")

local npcPrices = {
    { itemName = "cowbell", clientId = 21204, sell = 210 },
	{ itemName = "execowtioner mask", clientId = 21201, sell = 240 },
	{ itemName = "giant pacifier", clientId = 21199, sell = 170 },
	{ itemName = "glob of glooth", clientId = 21182, sell = 125 },
	{ itemName = "glooth injection tube", clientId = 21103, sell = 350 },	
	{ itemName = "metal jaw", clientId = 21193, sell = 260 },
	{ itemName = "metal toe", clientId = 21198, sell = 430 },
	{ itemName = "mooh'tah shell", clientId = 21202, sell = 110 },
	{ itemName = "moohtant horn", clientId = 21200, sell = 140 },
	{ itemName = "necromantic rust", clientId = 21196, sell = 390 },
	{ itemName = "poisoned fang", clientId = 21195, sell = 130 },
	{ itemName = "seacrest hair", clientId = 21801, sell = 260 },
	{ itemName = "seacrest pearl", clientId = 21747, sell = 400 },
	{ itemName = "seacrest scale", clientId = 21800, sell = 150 },
	{ itemName = "slime heart", clientId = 21194, sell = 160 },
	{ itemName = "slimy leaf tentacle", clientId = 21197, sell = 320 },

    --Alesar--
	{ itemName = "black shield", clientId = 3429, sell = 800 },
	{ itemName = "bonebreaker", clientId = 7428, sell = 10000 },
	{ itemName = "dragon hammer", clientId = 3322, sell = 2000 },
	{ itemName = "dreaded cleaver", clientId = 7419, sell = 15000 },
	{ itemName = "giant sword", clientId = 3281, sell = 17000 },
	{ itemName = "haunted blade", clientId = 7407, sell = 8000 },
	{ itemName = "knight armor", clientId = 3370, sell = 5000 },
	{ itemName = "knight axe", clientId = 3318, sell = 2000 },
	{ itemName = "knight legs", clientId = 3371, sell = 5000 },
	{ itemName = "mystic turban", clientId = 3574, sell = 150 },
	{ itemName = "onyx flail", clientId = 7421, sell = 22000 },
	{ itemName = "ornamented axe", clientId = 7411, sell = 20000 },
	{ itemName = "poison dagger", clientId = 3299, sell = 50 },
	{ itemName = "scimitar", clientId = 3307, sell = 150 },
	{ itemName = "skull staff", clientId = 3324, sell = 6000 },
	{ itemName = "strange helmet", clientId = 3373, sell = 500 },
	{ itemName = "titan axe", clientId = 7413, sell = 4000 },
	{ itemName = "tower shield", clientId = 3428, sell = 8000 },
	{ itemName = "vampire shield", clientId = 3434, sell = 15000 },
	{ itemName = "warrior helmet", clientId = 3369, sell = 5000 },
	
	--Haroun--
	{ itemName = "axe ring", clientId = 3092, sell = 100 },
	{ itemName = "bronze amulet", clientId = 3056, sell = 50, count = 200 },
	{ itemName = "club ring", clientId = 3093, sell = 100 },
	{ itemName = "elven amulet", clientId = 3082, sell = 100, count = 50 },
	{ itemName = "garlic necklace", clientId = 3083, sell = 50 },
	{ itemName = "life crystal", clientId = 4840, sell = 50 },
	{ itemName = "magic light wand", clientId = 3046, sell = 35 },
	{ itemName = "mind stone", clientId = 3062, sell = 100 },
	{ itemName = "orb", clientId = 3060, sell = 750 },
	{ itemName = "power ring", clientId = 3050, sell = 50 },
	{ itemName = "stealth ring", clientId = 3049, sell = 200 },
	{ itemName = "stone skin amulet", clientId = 3081, sell = 500, count = 5 },
	{ itemName = "sword ring", clientId = 3091, sell = 100 },
	{ itemName = "wand of cosmic energy", clientId = 3073, sell = 2000 },
	{ itemName = "wand of decay", clientId = 3072, sell = 1000 },
	{ itemName = "wand of defiance", clientId = 16096, sell = 6500 },
	{ itemName = "wand of draconia", clientId = 8093, sell = 1500 },
	{ itemName = "wand of dragonbreath", clientId = 3075, sell = 200 },
	{ itemName = "wand of everblazing", clientId = 16115, sell = 6000 },
	{ itemName = "wand of inferno", clientId = 3071, sell = 3000 },
	{ itemName = "wand of starstorm", clientId = 8092, sell = 3600 },
	{ itemName = "wand of voodoo", clientId = 8094, sell = 4400 },
	{ itemName = "wand of vortex", clientId = 3074, sell = 100 },
	
	--flint--
	{ itemName = "crest of the deep seas", clientId = 21892, sell = 10000 },
	{ itemName = "cowtana", clientId = 21177, sell = 2500 },
	{ itemName = "gearwheel chain", clientId = 21170, sell = 5000 },
	{ itemName = "glooth amulet", clientId = 21183, sell = 2000 },
	{ itemName = "glooth axe", clientId = 21180, sell = 1500 },
	{ itemName = "glooth blade", clientId = 21179, sell = 1500 },
	{ itemName = "glooth cap", clientId = 21164, sell = 7000 },
	{ itemName = "glooth club", clientId = 21178, sell = 1500 },
	{ itemName = "glooth whip", clientId = 21172, sell = 2500 },
	{ itemName = "mooh'tah plate", clientId = 21166, sell = 6000 },
	{ itemName = "moohtant cudgel", clientId = 21173, sell = 14000 },
	{ itemName = "metal bat", clientId = 21171, sell = 9000 },
	{ itemName = "metal spats", clientId = 21169, sell = 2000 },
	{ itemName = "mino lance", clientId = 21174, sell = 7000 },
	{ itemName = "mino shield", clientId = 21175, sell = 3000 },
	{ itemName = "rubber cap", clientId = 21165, sell = 11000 },
	{ itemName = "heat core", clientId = 21167, sell = 10000 },
	{ itemName = "alloy legs", clientId = 21168, sell = 11000 },
	{ itemName = "execowtioner axe", clientId = 21176, sell = 12000 },
	
	--nah'bob--
	{ itemName = "angelic axe", clientId = 7436, sell = 5000 },
	{ itemName = "blue robe", clientId = 3567, sell = 10000 },
	{ itemName = "bonelord shield", clientId = 3418, sell = 1200 },
	{ itemName = "boots of haste", clientId = 3079, sell = 30000 },
	{ itemName = "broadsword", clientId = 3301, sell = 500 },
	{ itemName = "butcher's axe", clientId = 7412, sell = 18000 },
	{ itemName = "crown armor", clientId = 3381, sell = 12000 },
	{ itemName = "crown helmet", clientId = 3385, sell = 2500 },
	{ itemName = "crown legs", clientId = 3382, sell = 12000 },
	{ itemName = "crown shield", clientId = 3419, sell = 8000 },
	{ itemName = "crusader helmet", clientId = 3391, sell = 6000 },
	{ itemName = "dragon lance", clientId = 3302, sell = 9000 },
	{ itemName = "dragon shield", clientId = 3416, sell = 4000 },
	{ itemName = "fire axe", clientId = 3320, sell = 8000 },
	{ itemName = "glorious axe", clientId = 7454, sell = 3000 },
	{ itemName = "guardian shield", clientId = 3415, sell = 2000 },
	{ itemName = "ice rapier", clientId = 3284, sell = 1000 },
	{ itemName = "noble armor", clientId = 3380, sell = 900 },
	{ itemName = "obsidian lance", clientId = 3313, sell = 500 },
	{ itemName = "phoenix shield", clientId = 3439, sell = 16000 },
	{ itemName = "queen's sceptre", clientId = 7410, sell = 20000 },
	{ itemName = "royal helmet", clientId = 3392, sell = 30000 },
	{ itemName = "shadow sceptre", clientId = 7451, sell = 10000 },
	{ itemName = "thaian sword", clientId = 7391, sell = 16000 },
	{ itemName = "war hammer", clientId = 3279, sell = 1200 },
	
	--yaman--
	{ itemName = "ankh", clientId = 3077, sell = 100 },
	{ itemName = "dragon necklace", clientId = 3085, sell = 100, count = 200 },
	{ itemName = "dwarven ring", clientId = 3097, sell = 100 },
	{ itemName = "energy ring", clientId = 3051, sell = 100 },
	{ itemName = "glacial rod", clientId = 16118, sell = 6500 },
	{ itemName = "hailstorm rod", clientId = 3067, sell = 3000 },
	{ itemName = "life ring", clientId = 3052, sell = 50 },
	{ itemName = "might ring", clientId = 3048, sell = 250, count = 20 },
	{ itemName = "moonlight rod", clientId = 3070, sell = 200 },
	{ itemName = "muck rod", clientId = 16117, sell = 6000 },
	{ itemName = "mysterious fetish", clientId = 3078, sell = 50 },
	{ itemName = "necrotic rod", clientId = 3069, sell = 1000 },
	{ itemName = "northwind rod", clientId = 8083, sell = 1500 },
	{ itemName = "protection amulet", clientId = 3084, sell = 100, count = 250 },
	{ itemName = "ring of healing", clientId = 3098, sell = 100 },
	{ itemName = "silver amulet", clientId = 3054, sell = 50, count = 200 },
	{ itemName = "snakebite rod", clientId = 3066, sell = 100 },
	{ itemName = "springsprout rod", clientId = 8084, sell = 3600 },
	{ itemName = "strange talisman", clientId = 3045, sell = 30, count = 200 },
	{ itemName = "terra rod", clientId = 3065, sell = 2000 },
	{ itemName = "time ring", clientId = 3053, sell = 100 },
	{ itemName = "underworld rod", clientId = 8082, sell = 4400 },
	
	--talila--
	{ itemName = "butterfly ring", clientId = 25698, sell = 2000 },
	{ itemName = "heavy blossom staff", clientId = 25700, sell = 5000 },
	{ itemName = "wooden spellbook", clientId = 25699, sell = 12000 },
	{ itemName = "wood cape", clientId = 3575, sell = 5000 },

	
	--esrik--
	{ itemName = "club", clientId = 3270, sell = 1 },
	{ itemName = "coat", clientId = 3562, sell = 1 },
	{ itemName = "jacket", clientId = 3561, sell = 1 },
	{ itemName = "dagger", clientId = 3267, sell = 2 },
	{ itemName = "leather boots", clientId = 3552, sell = 2 },
	{ itemName = "throwing knife", clientId = 3298, sell = 2 },
	{ itemName = "doublet", clientId = 3379, sell = 3 },
	{ itemName = "sickle", clientId = 3293, sell = 3 },
	{ itemName = "hand axe", clientId = 3268, sell = 4 },
	{ itemName = "leather helmet", clientId = 3355, sell = 4 },
	{ itemName = "bone club", clientId = 3337, sell = 5 },
	{ itemName = "rapier", clientId = 3272, sell = 5 },
	{ itemName = "small axe", clientId = 3462, sell = 5 },
	{ itemName = "wooden shield", clientId = 3412, sell = 5 },
	{ itemName = "axe", clientId = 3274, sell = 7 },
	{ itemName = "leather legs", clientId = 3559, sell = 9 },
	{ itemName = "short sword", clientId = 3294, sell = 10 },
	{ itemName = "studded club", clientId = 3336, sell = 10 },
	{ itemName = "leather armor", clientId = 3361, sell = 12 },
	{ itemName = "sabre", clientId = 3273, sell = 12 },
	{ itemName = "studded legs", clientId = 3362, sell = 15 },
	{ itemName = "soldier helmet", clientId = 3375, sell = 16 },
	{ itemName = "studded shield", clientId = 3426, sell = 16 },
	{ itemName = "chain helmet", clientId = 3352, sell = 17 },
	{ itemName = "bone sword", clientId = 3338, sell = 20 },
	{ itemName = "studded helmet", clientId = 3376, sell = 20 },
	{ itemName = "legion helmet", clientId = 3374, sell = 22 },
	{ itemName = "brass shield", clientId = 3411, sell = 25 },
	{ itemName = "chain legs", clientId = 3558, sell = 25 },
	{ itemName = "hatchet", clientId = 3276, sell = 25 },
	{ itemName = "studded armor", clientId = 3378, sell = 25 },
	{ itemName = "sword", clientId = 3264, sell = 25 },
	{ itemName = "brass helmet", clientId = 3354, sell = 30 },
	{ itemName = "mace", clientId = 3286,  sell = 30 },
	{ itemName = "katana", clientId = 3300, sell = 35 },
	{ itemName = "swampling club", clientId = 17824, sell = 40 },
	{ itemName = "plate shield", clientId = 3410, sell = 45 },
	{ itemName = "brass legs", clientId = 3372, sell = 49 },
	{ itemName = "copper shield", clientId = 3430, sell = 50 },
	{ itemName = "crowbar", clientId = 3304, sell = 50 },
	{ itemName = "longsword", clientId = 3285, sell = 51 },
	{ itemName = "viking helmet", clientId = 3367, sell = 66 },
	{ itemName = "chain armor", clientId = 3358, sell = 70 },
	{ itemName = "scale armor", clientId = 3377, sell = 75 },
	{ itemName = "battle axe", clientId = 3266, sell = 80 },
	{ itemName = "steel shield", clientId = 3409, sell = 80 },
	{ itemName = "viking shield", clientId = 3431, sell = 85 },
	{ itemName = "battle shield", clientId = 3413, sell = 95 },
	{ itemName = "dwarven shield", clientId = 3425, sell = 100 },
	{ itemName = "morning star", clientId = 3282, sell = 100 },
	{ itemName = "plate legs", clientId = 3557, sell = 115 },
	{ itemName = "carlin sword", clientId = 3283, sell = 118 },
	{ itemName = "battle hammer", clientId = 3305, sell = 120 },
	{ itemName = "brass armor", clientId = 3359, sell = 150 },
	{ itemName = "iron helmet", clientId = 3353, sell = 150 },
	{ itemName = "spike sword", clientId = 3271, sell = 240 },
	{ itemName = "red lantern", clientId = 10289, sell = 250 },
	{ itemName = "double axe", clientId = 3275, sell = 260 },
	{ itemName = "steel helmet", clientId = 3351, sell = 293 },
	{ itemName = "orcish axe", clientId = 3316, sell = 350 },
	{ itemName = "halberd", clientId = 3269, sell = 400 },
	{ itemName = "plate armor", clientId = 3357, sell = 400 },
	{ itemName = "two handed sword", clientId = 3265, sell = 450 },
	{ itemName = "fire sword", clientId = 3280, sell = 1000 },
	{ itemName = "broken halberd", clientId = 10418, sell = 100 },
	{ itemName = "spiked iron ball", clientId = 10408, sell = 100 },
	{ itemName = "Broken Slicer", clientId = 11661, sell = 120 },
	{ itemName = "high guard's shoulderplates", clientId = 10416, sell = 130 },
	{ itemName = "zaogun's shoulderplates", clientId = 10414, sell = 150 },
	{ itemName = "warmaster's wristguards", clientId = 10405, sell = 200 },
	{ itemName = "cursed shoulder spikes", clientId = 10410, sell = 320 },
	{ itemName = "draken wristbands", clientId = 11659, sell = 430 },
	{ itemName = "twin hooks", clientId = 10392, sell = 500 },
	{ itemName = "zaoan halberd", clientId = 10406, sell = 500 },
	{ itemName = "wailing widow's necklace", clientId = 10412, sell = 3000 },
	{ itemName = "zaoan shoes", clientId = 10386, sell = 5000 },
	{ itemName = "drachaku", clientId = 10391, sell = 10000 },
	{ itemName = "drakinata", clientId = 10388, sell = 10000 },
	{ itemName = "zaoan armor", clientId = 10384, sell = 14000 },
	{ itemName = "zaoan legs", clientId = 10387, sell = 14000 },
	{ itemName = "sai", clientId = 10389, sell = 16500 },
	{ itemName = "twiceslicer", clientId = 11657, sell = 28000 },
	{ itemName = "zaoan sword", clientId = 10390, sell = 30000 },
	{ itemName = "guardian boots", clientId = 10323, sell = 35000 },
	{ itemName = "draken boots", clientId = 4033, sell = 40000 },
	{ itemName = "zaoan helmet", clientId = 10385, sell = 45000 },
	{ itemName = "Elite Draken Mail", clientId = 11651, sell = 50000 },
	
	--hanna--
		{ itemName = "amber", clientId = 32626, sell = 20000 },
	{ itemName = "amber with a bug", clientId = 32624, sell = 41000 },
	{ itemName = "amber with a dragonfly", clientId = 32625, sell = 56000 },
	{ itemName = "ancient coin", clientId = 24390, sell = 350 },
	{ itemName = "bar of gold", clientId = 14112, sell = 10000 },
	{ itemName = "black pearl", clientId = 3027, sell = 280 },
	{ itemName = "soul orb", clientId = 5944, sell = 25 },
	{ itemName = "blue crystal shard", clientId = 16119, sell = 1500 },
	{ itemName = "blue crystal splinter", clientId = 16124, sell = 400 },
	{ itemName = "brown crystal splinter", clientId = 16123, sell = 400 },
	{ itemName = "coral brooch", clientId = 24391, sell = 750 },
	{ itemName = "crunor idol", clientId = 30055, sell = 30000 },
	{ itemName = "cyan crystal fragment", clientId = 16125, sell = 800 },
	{ itemName = "diamond", clientId = 32770, sell = 15000 },
	{ itemName = "dragon figurine", clientId = 30053, sell = 45000 },
	{ itemName = "eldritch crystal", clientId = 36835, sell = 48000 },
	{ itemName = "fiery tear", clientId = 39040, sell = 1070000 },
	{ itemName = "gemmed figurine", clientId = 24392, sell = 3500 },
	{ itemName = "giant amethyst", clientId = 30061, sell = 60000 },
	{ itemName = "giant emerald", clientId = 30060, sell = 90000 },
	{ itemName = "giant ruby", clientId = 30059, sell = 70000 },
	{ itemName = "giant sapphire", clientId = 30061, sell = 50000 },
	{ itemName = "giant shimmering pearl", clientId = 281, sell = 3000 }, -- green
	{ itemName = "giant shimmering pearl", clientId = 282, sell = 3000 }, -- brown
	{ itemName = "giant topaz", clientId = 32623, sell = 80000 },
	{ itemName = "gold ingot", clientId = 9058, sell = 5000 },
	{ itemName = "gold nugget", clientId = 3040, sell = 850 },
	{ itemName = "golden figurine", clientId = 5799, sell = 3000 },
	{ itemName = "green crystal fragment", clientId = 16127, sell = 800 },
	{ itemName = "green crystal shard", clientId = 16121, sell = 1500 },
	{ itemName = "green crystal splinter", clientId = 16122, sell = 400 },
	{ itemName = "hexagonal ruby", clientId = 30180, sell = 30000 },
	{ itemName = "lion figurine", clientId = 33781, sell = 10000 },
	{ itemName = "moonstone", clientId = 32771, sell = 13000 },
	{ itemName = "onyx chip", clientId = 22193, sell = 400 },
	{ itemName = "opal", clientId = 22194, sell = 500 },
	{ itemName = "ornate locket", clientId = 30056, sell = 18000 },
	{ itemName = "prismatic quartz", clientId = 24962, sell = 450 },
	{ itemName = "rainbow querz", clientId = 25737, sell = 500 },
	{ itemName = "red crystal fragment", clientId = 16126, sell = 800 },
	{ itemName = "royal almandine", clientId = 39038, sell = 460000 },
	{ itemName = "shimmering beetles", clientId = 25693, sell = 150 },
	{ itemName = "skull coin", clientId = 32583, sell = 12000 },
	{ itemName = "small amethyst", clientId = 3033, sell = 200 },
	{ itemName = "small diamond", clientId = 3028, sell = 300 },
	{ itemName = "small emerald", clientId = 3032, sell = 250 },
	{ itemName = "small enchanted amethyst", clientId = 678, sell = 200 },
	{ itemName = "small enchanted emerald", clientId = 677, sell = 250 },
	{ itemName = "small enchanted ruby", clientId = 676, sell = 250 },
	{ itemName = "small enchanted sapphire", clientId = 675, sell = 250 },
	{ itemName = "small ruby", clientId = 3030, sell = 250 },
	{ itemName = "small sapphire", clientId = 3029, sell = 250 },
	{ itemName = "small topaz", clientId = 9057, sell = 200 },
	{ itemName = "tiger eye", clientId = 24961, sell = 350 },
	{ itemName = "unicorn figurine", clientId = 30054, sell = 50000 },
	{ itemName = "violet crystal shard", clientId = 16120, sell = 1500 },
	{ itemName = "watermelon tourmaline", clientId = 33780, sell = 230000 },
	{ itemName = "watermelon touraline slice", clientId = 33779, sell = 30000 },
	{ itemName = "white silk flower", clientId = 34008, sell = 9000 },
	{ itemName = "wedding ring", clientId = 3004, sell = 100 },
	{ itemName = "white pearl", clientId = 3026, sell = 160 },
	{ itemName = "orichalcum pearl", clientId = 3026, sell = 80 },
	
	--lailene--
	{ itemName = "batwing hat", clientId = 9103, sell = 8000 },
	{ itemName = "ethno coat", clientId = 8064, sell = 200 },
	{ itemName = "focus cape", clientId = 8043, sell = 6000 },
	{ itemName = "jade hat", clientId = 10451, sell = 9000 },
	{ itemName = "spellweavers rob", clientId = 10438, sell = 12000 },
	{ itemName = "spirit cloak", clientId = 8042, sell = 350 },
	{ itemName = "zaoan robe", clientId = 10439, sell = 12000 },

	--alexander--
	{ itemName = "spellbook of enlightenment", clientId = 8072, sell = 4000 },
	{ itemName = "spellbook of lost souls", clientId = 8075, sell = 19000 },
	{ itemName = "spellbook of mind control", clientId = 8074, sell = 13000 },
	{ itemName = "spellbook of warding", clientId = 8073, sell = 8000 },
	
	--rashid--
		{ itemName = "abyss hammer", clientId = 7414, sell = 20000 },
	{ itemName = "albino plate", clientId = 19358, sell = 1500 },
	{ itemName = "ancient amulet", clientId = 3025, sell = 200 },
	{ itemName = "assassin dagger", clientId = 7404, sell = 20000 },
	{ itemName = "bandana", clientId = 5917, sell = 150 },
	{ itemName = "beastslayer axe", clientId = 3344, sell = 1500 },
	{ itemName = "beetle necklace", clientId = 10457, sell = 1500 },
	{ itemName = "berserker", clientId = 7403, sell = 40000 },
	{ itemName = "blacksteel sword", clientId = 7406, sell = 6000 },
	{ itemName = "blessed sceptre", clientId = 7429, sell = 40000 },
	{ itemName = "bone shield", clientId = 3441, sell = 80 },
	{ itemName = "bonelord helmet", clientId = 3408, sell = 7500 },
	{ itemName = "brutetamer's staff", clientId = 7379, sell = 1500 },
	{ itemName = "buckle", clientId = 17829, sell = 7000 },
	{ itemName = "castle shield", clientId = 3435, sell = 5000 },
	{ itemName = "chain bolter", clientId = 8022, sell = 40000 },
	{ itemName = "chaos mace", clientId = 7427, sell = 9000 },
	{ itemName = "cobra crown", clientId = 11674, sell = 50000 },
	{ itemName = "coconut shoes", clientId = 9017, sell = 500 },
	{ itemName = "composite hornbow", clientId = 8027, sell = 25000 },
	{ itemName = "crocodile boots", clientId = 3556, sell = 1000 },
	{ itemName = "crystal crossbow", clientId = 16163, sell = 35000 },
	{ itemName = "crystal mace", clientId = 3333, sell = 12000 },
	{ itemName = "crystal necklace", clientId = 3008, sell = 400 },
	{ itemName = "crystal ring", clientId = 3007, sell = 250 },
	{ itemName = "crystal sword", clientId = 7449, sell = 600 },
	{ itemName = "crystalline armor", clientId = 8050, sell = 16000 },
	{ itemName = "daramian mace", clientId = 3327, sell = 110 },
	{ itemName = "daramian waraxe", clientId = 3328, sell = 1000 },
	{ itemName = "dark shield", clientId = 3421, sell = 400 },
	{ itemName = "death ring", clientId = 6299, sell = 1000 },
	{ itemName = "demon shield", clientId = 3420, sell = 30000 },
	{ itemName = "demonbone amulet", clientId = 3019, sell = 32000 },
	{ itemName = "demonrage sword", clientId = 7382, sell = 36000 },
	{ itemName = "devil helmet", clientId = 3356, sell = 1000 },
	{ itemName = "diamond sceptre", clientId = 7387, sell = 3000 },
	{ itemName = "divine plate", clientId = 8057, sell = 55000 },
	{ itemName = "djinn blade", clientId = 3339, sell = 15000 },
	{ itemName = "doll", clientId = 2991, sell = 200 },
	{ itemName = "dragon scale mail", clientId = 3386, sell = 40000 },
	{ itemName = "dragon slayer", clientId = 7402, sell = 15000 },
	{ itemName = "dragonbone staff", clientId = 7430, sell = 3000 },
	{ itemName = "dwarven armor", clientId = 3397, sell = 30000 },
	{ itemName = "elvish bow", clientId = 7438, sell = 2000 },
	{ itemName = "emerald bangle", clientId = 3010, sell = 800 },
	{ itemName = "epee", clientId = 3326, sell = 8000 },
	{ itemName = "flower dress", clientId = 9015, sell = 1000 },
	{ itemName = "flower wreath", clientId = 9013, sell = 500 },
	{ itemName = "fur boots", clientId = 7457, sell = 2000 },
	{ itemName = "furry club", clientId = 7432, sell = 1000 },
	{ itemName = "glacier amulet", clientId = 815, sell = 1500 },
	{ itemName = "glacier kilt", clientId = 823, sell = 11000 },
	{ itemName = "glacier mask", clientId = 829, sell = 2500 },
	{ itemName = "glacier robe", clientId = 824, sell = 11000 },
	{ itemName = "glacier shoes", clientId = 819, sell = 2500 },
	{ itemName = "gold ring", clientId = 3063, sell = 8000 },
	{ itemName = "golden armor", clientId = 3360, sell = 20000 },
	{ itemName = "golden legs", clientId = 3364, sell = 30000 },
	{ itemName = "goo shell", clientId = 19372, sell = 4000 },
	{ itemName = "griffin shield", clientId = 3433, sell = 3000 },
	{ itemName = "guardian halberd", clientId = 3315, sell = 11000 },
	{ itemName = "hammer of wrath", clientId = 3332, sell = 30000 },
	{ itemName = "headchopper", clientId = 7380, sell = 6000 },
	{ itemName = "heavy mace", clientId = 3340, sell = 50000 },
	{ itemName = "heavy machete", clientId = 3330, sell = 90 },
	{ itemName = "heavy trident", clientId = 12683, sell = 2000 },
	{ itemName = "helmet of the lost", clientId = 17852, sell = 2000 },
	{ itemName = "heroic axe", clientId = 7389, sell = 30000 },
	{ itemName = "hibiscus dress", clientId = 8045, sell = 3000 },
	{ itemName = "hieroglyph banner", clientId = 12482, sell = 500 },
	{ itemName = "horn", clientId = 19359, sell = 300 },
	{ itemName = "jade hammer", clientId = 7422, sell = 25000 },
	{ itemName = "krimhorn helmet", clientId = 7461, sell = 200 },
	{ itemName = "lavos armor", clientId = 8049, sell = 16000 },
	{ itemName = "leaf legs", clientId = 9014, sell = 500 },
	{ itemName = "leopard armor", clientId = 3404, sell = 1000 },
	{ itemName = "leviathan's amulet", clientId = 9303, sell = 3000 },
	{ itemName = "light shovel", clientId = 5710, sell = 300 },
	{ itemName = "lightning boots", clientId = 820, sell = 2500 },
	{ itemName = "lightning headband", clientId = 828, sell = 2500 },
	{ itemName = "lightning legs", clientId = 822, sell = 11000 },
	{ itemName = "lightning pendant", clientId = 816, sell = 1500 },
	{ itemName = "lightning robe", clientId = 825, sell = 11000 },
	{ itemName = "lunar staff", clientId = 7424, sell = 5000 },
	{ itemName = "magic plate armor", clientId = 3366, sell = 90000 },
	{ itemName = "magma amulet", clientId = 817, sell = 1500 },
	{ itemName = "magma boots", clientId = 818, sell = 2500 },
	{ itemName = "magma coat", clientId = 826, sell = 11000 },
	{ itemName = "magma legs", clientId = 821, sell = 11000 },
	{ itemName = "magma monocle", clientId = 827, sell = 2500 },
	{ itemName = "mammoth fur cape", clientId = 7463, sell = 6000 },
	{ itemName = "mammoth fur shorts", clientId = 7464, sell = 850 },
	{ itemName = "mammoth whopper", clientId = 7381, sell = 300 },
	{ itemName = "mastermind shield", clientId = 3414, sell = 50000 },
	{ itemName = "medusa shield", clientId = 3436, sell = 9000 },
	{ itemName = "mercenary sword", clientId = 7386, sell = 12000 },
	{ itemName = "model ship", clientId = 2994, sell = 1000 },
	{ itemName = "mycological bow", clientId = 16164, sell = 35000 },
	{ itemName = "mystic blade", clientId = 7384, sell = 30000 },
	{ itemName = "naginata", clientId = 3314, sell = 2000 },
	{ itemName = "nightmare blade", clientId = 7418, sell = 35000 },
	{ itemName = "noble axe", clientId = 7456, sell = 10000 },
	{ itemName = "norse shield", clientId = 7460, sell = 1500 },
	{ itemName = "onyx pendant", clientId = 22195, sell = 3500 },
	{ itemName = "orcish maul", clientId = 7392, sell = 6000 },
	{ itemName = "oriental shoes", clientId = 21981, sell = 15000 },
	{ itemName = "pair of iron fists", clientId = 17828, sell = 4000 },
	{ itemName = "paladin armor", clientId = 8063, sell = 15000 },
	{ itemName = "patched boots", clientId = 3550, sell = 2000 },
	{ itemName = "pharaoh banner", clientId = 12483, sell = 1000 },
	{ itemName = "pharaoh sword", clientId = 3334, sell = 23000 },
	{ itemName = "pirate boots", clientId = 5461, sell = 3000 },
	{ itemName = "pirate hat", clientId = 6096, sell = 1000 },
	{ itemName = "pirate knee breeches", clientId = 5918, sell = 200 },
	{ itemName = "pirate shirt", clientId = 6095, sell = 500 },
	{ itemName = "pirate voodoo doll", clientId = 5810, sell = 500 },
	{ itemName = "platinum amulet", clientId = 3055, sell = 2500 },
	{ itemName = "ragnir helmet", clientId = 7462, sell = 400 },
	{ itemName = "relic sword", clientId = 7383, sell = 25000 },
	{ itemName = "rift bow", clientId = 22866, sell = 45000 },
	{ itemName = "rift crossbow", clientId = 22867, sell = 45000 },
	{ itemName = "rift lance", clientId = 22727, sell = 30000 },
	{ itemName = "rift shield", clientId = 22726, sell = 50000 },
	{ itemName = "ring of the sky", clientId = 3006, sell = 30000 },
	{ itemName = "royal axe", clientId = 7434, sell = 40000 },
	{ itemName = "ruby necklace", clientId = 3016, sell = 2000 },
	{ itemName = "ruthless axe", clientId = 6553, sell = 45000 },
	{ itemName = "sacred tree amulet", clientId = 9302, sell = 3000 },
	{ itemName = "scarab amulet", clientId = 3018, sell = 200 },
	{ itemName = "scarab shield", clientId = 3440, sell = 2000 },
	{ itemName = "shockwave amulet", clientId = 9304, sell = 3000 },
	{ itemName = "silver brooch", clientId = 3017, sell = 150 },
	{ itemName = "silver dagger", clientId = 3290, sell = 500 },
	{ itemName = "skull helmet", clientId = 5741, sell = 40000 },
	{ itemName = "skullcracker armor", clientId = 8061, sell = 18000 },
	{ itemName = "spiked squelcher", clientId = 7452, sell = 5000 },
	{ itemName = "steel boots", clientId = 3554, sell = 30000 },
	{ itemName = "swamplair armor", clientId = 8052, sell = 16000 },
	{ itemName = "taurus mace", clientId = 7425, sell = 500 },
	{ itemName = "tempest shield", clientId = 3442, sell = 35000 },
	{ itemName = "terra amulet", clientId = 814, sell = 1500 },
	{ itemName = "terra boots", clientId = 813, sell = 2500 },
	{ itemName = "terra hood", clientId = 830, sell = 2500 },
	{ itemName = "terra legs", clientId = 812, sell = 11000 },
	{ itemName = "terra mantle", clientId = 811, sell = 11000 },
	{ itemName = "tortoise shield", clientId = 6131, sell = 150 },
	{ itemName = "vile axe", clientId = 7388, sell = 30000 },
	{ itemName = "voodoo doll", clientId = 3002, sell = 400 },
	{ itemName = "war axe", clientId = 3342, sell = 12000 },
	{ itemName = "war horn", clientId = 2958, sell = 8000 },
	{ itemName = "witch hat", clientId = 9653, sell = 5000 },
	{ itemName = "wyvern fang", clientId = 7408, sell = 1500 },
	
	--rock in a hard place--
	{ itemName = "axe", clientId = 3274, sell = 7 },
	{ itemName = "battle axe", clientId = 3266, sell = 80 },
	{ itemName = "battle hammer", clientId = 3305, sell = 120 },
	{ itemName = "battle shield", clientId = 3413, sell = 95 },
	{ itemName = "bone club", clientId = 3337, sell = 5 },
	{ itemName = "bone sword", clientId = 3338, sell = 20 },
	{ itemName = "bow", clientId = 3350, sell = 100 },
	{ itemName = "brass armor", clientId = 3359, sell = 150 },
	{ itemName = "brass helmet", clientId = 3354, sell = 30 },
	{ itemName = "brass legs", clientId = 3372, sell = 49 },
	{ itemName = "brass shield", clientId = 3411, sell = 25 },
	{ itemName = "calopteryx cape", clientId = 14086, sell = 15000 },
	{ itemName = "carapace shield", clientId = 14088, sell = 32000 },
	{ itemName = "carlin sword", clientId = 3283, sell = 118 },
	{ itemName = "chain armor", clientId = 3358, sell = 70 },
	{ itemName = "chain helmet", clientId = 3352, sell = 17 },
	{ itemName = "chain legs", clientId = 3558, sell = 25 },
	{ itemName = "closed trap", clientId = 3481, sell = 75 },
	{ itemName = "club", clientId = 3270, sell = 1 },
	{ itemName = "coat", clientId = 3562, sell = 1 },
	{ itemName = "compound eye", clientId = 14083, sell = 150 },
	{ itemName = "copper shield", clientId = 3430, sell = 50 },
	{ itemName = "crawler head plating", clientId = 14079, sell = 210 },
	{ itemName = "crossbow", clientId = 3349, sell = 120 },
	{ itemName = "crowbar", clientId = 3304, sell = 50 },
	{ itemName = "dagger", clientId = 3267, sell = 2 },
	{ itemName = "deepling axe", clientId = 13991, sell = 40000 },
	{ itemName = "deepling breaktime snack", clientId = 14011, sell = 90 },
	{ itemName = "deepling claw", clientId = 14044, sell = 430 },
	{ itemName = "deepling guard belt buckle", clientId = 14010, sell = 230 },
	{ itemName = "deepling ridge", clientId = 14041, sell = 360 },
	{ itemName = "deepling scales", clientId = 14017, sell = 80 },
	{ itemName = "deepling squelcher", clientId = 14250, sell = 7000 },
	{ itemName = "deepling staff", clientId = 13987, sell = 4000 },
	{ itemName = "deepling warts", clientId = 14012, sell = 180 },
	{ itemName = "deeptags", clientId = 14013, sell = 290 },
	{ itemName = "depth calcei", clientId = 13997, sell = 25000 },
	{ itemName = "depth galea", clientId = 13995, sell = 35000 },
	{ itemName = "depth lorica", clientId = 13994, sell = 30000 },
	{ itemName = "depth ocrea", clientId = 13996, sell = 16000 },
	{ itemName = "depth scutum", clientId = 13998, sell = 36000 },
	{ itemName = "double axe", clientId = 3275, sell = 260 },
	{ itemName = "doublet", clientId = 3379, sell = 3 },
	{ itemName = "dung ball", clientId = 14225, sell = 130 },
	{ itemName = "dwarven shield", clientId = 3425, sell = 100 },
	{ itemName = "empty potion flask", clientId = 283, sell = 5 },
	{ itemName = "empty potion flask", clientId = 284, sell = 5 },
	{ itemName = "empty potion flask", clientId = 285, sell = 5 },
	{ itemName = "eye of a deepling", clientId = 12730, sell = 150 },
	{ itemName = "fire sword", clientId = 3280, sell = 1000 },
	{ itemName = "fishing rod", clientId = 3483, sell = 40 },
	{ itemName = "grasshopper legs", clientId = 14087, sell = 15000 },
	{ itemName = "guardian axe", clientId = 14043, sell = 9000 },
	{ itemName = "halberd", clientId = 3269, sell = 400 },
	{ itemName = "hand axe", clientId = 3268, sell = 4 },
	{ itemName = "hatchet", clientId = 3276, sell = 25 },
	{ itemName = "hive bow", clientId = 14246, sell = 28000 },
	{ itemName = "hive scythe", clientId = 14089, sell = 17000 },
	{ itemName = "iron helmet", clientId = 3353, sell = 150 },
	{ itemName = "jacket", clientId = 3561, sell = 1 },
	{ itemName = "katana", clientId = 3300, sell = 35 },
	{ itemName = "key to the drowned library", clientId = 14009, sell = 330 },
	{ itemName = "kollos shell", clientId = 14077, sell = 420 },
	{ itemName = "leather armor", clientId = 3361, sell = 12 },
	{ itemName = "leather boots", clientId = 3552, sell = 2 },
	{ itemName = "leather helmet", clientId = 3355, sell = 4 },
	{ itemName = "leather legs", clientId = 3559, sell = 9 },
	{ itemName = "legion helmet", clientId = 3374, sell = 22 },
	{ itemName = "longsword", clientId = 3285, sell = 51 },
	{ itemName = "mace", clientId = 3286, sell = 30 },
	{ itemName = "machete", clientId = 3308, sell = 6 },
	{ itemName = "morning star", clientId = 3282, sell = 100 },
	{ itemName = "necklace of the deep", clientId = 13990, sell = 3000 },
	{ itemName = "orcish axe", clientId = 3316, sell = 350 },
	{ itemName = "ornate chestplate", clientId = 13993, sell = 60000 },
	{ itemName = "ornate crossbow", clientId = 14247, sell = 12000 },
	{ itemName = "ornate legs", clientId = 13999, sell = 40000 },
	{ itemName = "ornate mace", clientId = 14001, sell = 42000 },
	{ itemName = "ornate shield", clientId = 14000, sell = 42000 },
	{ itemName = "pick", clientId = 3456, sell = 15 },
	{ itemName = "plate armor", clientId = 3357, sell = 400 },
	{ itemName = "plate legs", clientId = 3557, sell = 115 },
	{ itemName = "plate shield", clientId = 3410, sell = 45 },
	{ itemName = "rapier", clientId = 3272, sell = 5 },
	{ itemName = "rope", clientId = 3003, sell = 15 },
	{ itemName = "sabre", clientId = 3273, sell = 12 },
	{ itemName = "scale armor", clientId = 3377, sell = 75 },
	{ itemName = "scythe", clientId = 3453, sell = 10 },
	{ itemName = "short sword", clientId = 3294, sell = 10 },
	{ itemName = "shovel", clientId = 3457, sell = 8 },
	{ itemName = "sickle", clientId = 3293, sell = 3 },
	{ itemName = "small axe", clientId = 3462, sell = 5 },
	{ itemName = "soldier helmet", clientId = 3375, sell = 16 },
	{ itemName = "spear", clientId = 3277, sell = 3 },
	{ itemName = "spellsinger's seal", clientId = 14008, sell = 280 },
	{ itemName = "spidris mandible", clientId = 14082, sell = 450 },
	{ itemName = "spike sword", clientId = 3271, sell = 240 },
	{ itemName = "spitter nose", clientId = 14078, sell = 340 },
	{ itemName = "steel helmet", clientId = 3351, sell = 293 },
	{ itemName = "steel shield", clientId = 3409, sell = 80 },
	{ itemName = "studded armor", clientId = 3378, sell = 25 },
	{ itemName = "studded club", clientId = 3336, sell = 10 },
	{ itemName = "studded helmet", clientId = 3376, sell = 20 },
	{ itemName = "studded legs", clientId = 3362, sell = 15 },
	{ itemName = "studded shield", clientId = 3426, sell = 16 },
	{ itemName = "swampling club", clientId = 17824, sell = 40 },
	{ itemName = "swarmer antenna", clientId = 14076, sell = 130 },
	{ itemName = "sword", clientId = 3264, sell = 25 },
	{ itemName = "throwing knife", clientId = 3298, sell = 2 },
	{ itemName = "two handed sword", clientId = 3265, sell = 450 },
	{ itemName = "vial", clientId = 2874, sell = 5 },
	{ itemName = "viking helmet", clientId = 3367, sell = 66 },
	{ itemName = "viking shield", clientId = 3431, sell = 85 },
	{ itemName = "war hammer", clientId = 3279, sell = 470 },
	{ itemName = "warrior's axe", clientId = 14040, sell = 11000 },
	{ itemName = "warrior's shield", clientId = 14042, sell = 9000 },
	{ itemName = "waspoid claw", clientId = 14080, sell = 320 },
	{ itemName = "waspoid wing", clientId = 14081, sell = 190 },
	{ itemName = "watch", clientId = 2906, sell = 6 },
	{ itemName = "wooden hammer", clientId = 3459, sell = 15 },
	{ itemName = "wooden shield", clientId = 3412, sell = 5 },
	
	--tamoril--
	{ itemName = "blue gem", clientId = 3041, sell = 5000 },
	{ itemName = "golden mug", clientId = 2903, sell = 250 },
	{ itemName = "green gem", clientId = 3038, sell = 5000 },
	{ itemName = "red gem", clientId = 3039, sell = 1000 },
	{ itemName = "violet gem", clientId = 3036, sell = 10000 },
	{ itemName = "white gem", clientId = 32769, sell = 12000 },
	{ itemName = "yellow gem", clientId = 3037, sell = 1000 },

	--fadil
	
	{ itemName = "ring of blue plasma", clientId = 23529, sell = 8000 },
	{ itemName = "ring of green plasma", clientId = 23531, sell = 8000 },
	{ itemName = "ring of red plasma", clientId = 23533, sell = 8000 },
	{ itemName = "collar of blue plasma", clientId = 23542, sell = 6000 },
	{ itemName = "collar of green plasma", clientId = 23543, sell = 6000 },
	{ itemName = "collar of red plasma", clientId = 23544, sell = 6000 },
	
	--yasir--
	{ itemName = "abomination's tail", clientId = 36791, sell = 700000 },
	{ itemName = "abomination's tongue", clientId = 36793, sell = 900000 },
	{ itemName = "abomination's eye", clientId = 36792, sell = 650000 },
	{ itemName = "afflicted strider head", clientId = 36789, sell = 900 },
	{ itemName = "afflicted strider worms", clientId = 36790, sell = 500 },
	{ itemName = "acorn", clientId = 10296, sell = 10 },
	{ itemName = "alptramun's toothbrush", clientId = 29943, sell = 270000 },
	{ itemName = "ancient belt buckle", clientId = 24384, sell = 260 },
	{ itemName = "ancient liche bone", clientId = 31588, sell = 28000 },
	{ itemName = "angel figurine", clientId = 32589, sell = 36000 },
	{ itemName = "antlers", clientId = 10297, sell = 50 },
	{ itemName = "ape fur", clientId = 5883, sell = 120 },
	{ itemName = "apron", clientId = 33933, sell = 1300 },
	{ itemName = "badger fur", clientId = 903, sell = 15 },
	{ itemName = "bamboo stick", clientId = 11445, sell = 30 },
	{ itemName = "banana sash", clientId = 11511, sell = 55 },
	{ itemName = "basalt fetish", clientId = 17856, sell = 210 },
	{ itemName = "basalt figurine", clientId = 17857, sell = 160 },
	{ itemName = "basalt core", clientId = 43859, sell = 5800 },
	{ itemName = "basalt crumbs", clientId = 43858, sell = 3000 },
	{ itemName = "bat decoration", clientId = 6491, sell = 2000 },
	{ itemName = "bat wing", clientId = 5894, sell = 50 },
	{ itemName = "bashmu fang", clientId = 36820, sell = 600 },
	{ itemName = "bashmu feather", clientId = 36823, sell = 350 },
	{ itemName = "bashmu tongue", clientId = 36821, sell = 400 },
	{ itemName = "bear paw", clientId = 5896, sell = 100 },
	{ itemName = "beast's nightmare-cushion", clientId = 29946, sell = 630000 },
	{ itemName = "bed of nails", clientId = 25743, sell = 500 },
	{ itemName = "beer tap", clientId = 32114, sell = 50 },
	{ itemName = "beetle carapace", clientId = 24381, sell = 200 },
	{ itemName = "behemoth claw", clientId = 5930, sell = 2000 },
	{ itemName = "black hood", clientId = 9645, sell = 190 },
	{ itemName = "black wool", clientId = 11448, sell = 300 },
	{ itemName = "blazing bone", clientId = 16131, sell = 610 },
	{ itemName = "blemished spawn abdomen", clientId = 36779, sell = 550 },
	{ itemName = "blemished spawn head", clientId = 36778, sell = 800 },
	{ itemName = "blemished spawn tail", clientId = 36780, sell = 1000 },
	{ itemName = "bloated maggot", clientId = 43856, sell = 5200 },
	{ itemName = "blood preservation", clientId = 11449, sell = 320 },
	{ itemName = "blood tincture in a vial", clientId = 18928, sell = 360 },
	{ itemName = "blooded worm", clientId = 43857, sell = 4700 },
	{ itemName = "bloody dwarven beard", clientId = 17827, sell = 110 },
	{ itemName = "bloody pincers", clientId = 9633, sell = 100 },
	{ itemName = "bloody tears", clientId = 32594, sell = 70000 },
	{ itemName = "blue glass plate", clientId = 29345, sell = 60 },
	{ itemName = "blue goanna scale", clientId = 31559, sell = 230 },
	{ itemName = "blue piece of cloth", clientId = 5912, sell = 200 },
	{ itemName = "boggy dreads", clientId = 9667, sell = 200 },
	{ itemName = "bola", clientId = 17809, sell = 35 },
	{ itemName = "bone fetish", clientId = 17831, sell = 150 },
	{ itemName = "bone shoulderplate", clientId = 10404, sell = 150 },
	{ itemName = "bone toothpick", clientId = 24380, sell = 150 },
	{ itemName = "bonecarving knife", clientId = 17830, sell = 190 },
	{ itemName = "bonelord eye", clientId = 5898, sell = 80 },
	{ itemName = "bones of zorvorax", clientId = 24942, sell = 10000 },
	{ itemName = "bony tail", clientId = 10277, sell = 210 },
	{ itemName = "book of necromantic rituals", clientId = 10320, sell = 180 },
	{ itemName = "book of prayers", clientId = 9646, sell = 120 },
	{ itemName = "book page", clientId = 28569, sell = 640 },
	{ itemName = "bowl of terror sweat", clientId = 20204, sell = 500 },
	{ itemName = "brain head's giant neuron", clientId = 32578, sell = 100000 },
	{ itemName = "brain head's left hemisphere", clientId = 32579, sell = 90000 },
	{ itemName = "brain head's right hemisphere", clientId = 32580, sell = 50000 },
	{ itemName = "brainstealer's brain", clientId = 36795, sell = 300000 },
	{ itemName = "brainstealer's brainwave", clientId = 36796, sell = 440000 },
	{ itemName = "brainstealer's tissue", clientId = 36794, sell = 240000 },
	{ itemName = "bright bell", clientId = 30324, sell = 220 },
	{ itemName = "brimstone fangs", clientId = 11702, sell = 380 },
	{ itemName = "brimstone shell", clientId = 11703, sell = 210 },
	{ itemName = "broken bell", clientId = 30185, sell = 150 },
	{ itemName = "broken crossbow", clientId = 11451, sell = 30 },
	{ itemName = "broken draken mail", clientId = 11660, sell = 340 },
	{ itemName = "broken helmet", clientId = 11453, sell = 20 },
	{ itemName = "broken iks cuirass", clientId = 40533, sell = 640 },
	{ itemName = "broken iks faulds", clientId = 40531, sell = 530 },
	{ itemName = "broken iks headpiece", clientId = 40532, sell = 560 },
	{ itemName = "broken iks sandals", clientId = 40534, sell = 440 },
	{ itemName = "broken key ring", clientId = 11652, sell = 8000 },
	{ itemName = "broken longbow", clientId = 34161, sell = 130 },
	{ itemName = "broken macuahuitl", clientId = 40530, sell = 1000 },
	{ itemName = "broken ring of ending", clientId = 12737, sell = 4000 },
	{ itemName = "broken shamanic staff", clientId = 11452, sell = 35 },
	{ itemName = "broken throwing axe", clientId = 17851, sell = 230 },
	{ itemName = "broken visor", clientId = 20184, sell = 1900 },
	{ itemName = "brooch of embracement", clientId = 34023, sell = 14000 },
	{ itemName = "brown piece of cloth", clientId = 5913, sell = 100 },
	{ itemName = "bunch of troll hair", clientId = 9689, sell = 30 },
	{ itemName = "bundle of cursed straw", clientId = 9688, sell = 800 },
	{ itemName = "capricious heart", clientId = 34138, sell = 2100 },
	{ itemName = "capricious robe", clientId = 34145, sell = 1200 },
	{ itemName = "carniphila seeds", clientId = 10300, sell = 50 },
	{ itemName = "carnisylvan bark", clientId = 36806, sell = 230 },
	{ itemName = "carnisylvan finger", clientId = 36805, sell = 250 },
	{ itemName = "carnivostrich feather", clientId = 40586, sell = 630 },
	{ itemName = "carrion worm fang", clientId = 10275, sell = 35 },
	{ itemName = "cat's paw", clientId = 5479, sell = 2000 },
	{ itemName = "cave chimera head", clientId = 36787, sell = 1200 },
	{ itemName = "cave chimera leg", clientId = 36788, sell = 650 },
	{ itemName = "cave devourer eyes", clientId = 27599, sell = 550 },
	{ itemName = "cave devourer eyes", clientId = 27599, sell = 550 },
	{ itemName = "cave devourer legs", clientId = 27601, sell = 350 },
	{ itemName = "cave devourer maw", clientId = 27600, sell = 600 },
	{ itemName = "centipede leg", clientId = 10301, sell = 28 },
	--Chargoz igneous obsidian falta
	{ itemName = "chasm spawn abdomen", clientId = 27603, sell = 240 },
	{ itemName = "chasm spawn head", clientId = 27602, sell = 850 },
	{ itemName = "chasm spawn tail", clientId = 27604, sell = 120 },
	{ itemName = "cheese cutter", clientId = 17817, sell = 50 },
	{ itemName = "cheesy figurine", clientId = 17818, sell = 150 },
	{ itemName = "cheesy membership card", clientId = 35614, sell = 120000 },
	{ itemName = "chicken feather", clientId = 5890, sell = 30 },
	{ itemName = "chitinous mouth", clientId = 27626, sell = 10000 },
	{ itemName = "cliff strider claw", clientId = 16134, sell = 800 },
	{ itemName = "closed pocket sundial", clientId = 43888, sell = 5000 },
	{ itemName = "cobra crest", clientId = 31678, sell = 650 },
	{ itemName = "cobra tongue", clientId = 9634, sell = 15 },
	{ itemName = "colourful feather", clientId = 11514, sell = 110 },
	{ itemName = "colourful feathers", clientId = 25089, sell = 400 },
	{ itemName = "colourful snail shell", clientId = 25696, sell = 250 },
	{ itemName = "compass", clientId = 10302, sell = 45 },
	{ itemName = "compound eye", clientId = 14083, sell = 150 },
	{ itemName = "condensed energy", clientId = 23501, sell = 260 },
	{ itemName = "coral branch", clientId = 39406, sell = 360 },
	{ itemName = "corrupt naga scales", clientId = 39415, sell = 570 },
	{ itemName = "corrupted flag", clientId = 10409, sell = 700 },
	{ itemName = "countess sorrow's frozen tear", clientId = 6536, sell = 50000 },
	{ itemName = "cow bell", clientId = 32012, sell = 120 },
	{ itemName = "crab man claws", clientId = 40582, sell = 550 },
	{ itemName = "crab pincers", clientId = 10272, sell = 35 },
	{ itemName = "cracked alabaster vase", clientId = 24385, sell = 180 },
	{ itemName = "crawler head plating", clientId = 14079, sell = 210 },
	{ itemName = "crawler's essence", clientId = 33982, sell = 3700 },
	{ itemName = "crown", clientId = 33935, sell = 2700 },
	{ itemName = "cruelty's chest", clientId = 33923, sell = 720000 },
	{ itemName = "cruelty's claw", clientId = 33922, sell = 640000 },
	{ itemName = "cry-stal", clientId = 39394, sell = 3200 },
	{ itemName = "crystal bone", clientId = 23521, sell = 250 },
	{ itemName = "crystallized anger", clientId = 23507, sell = 400 },
	{ itemName = "cultish mask", clientId = 9638, sell = 280 },
	{ itemName = "cultish robe", clientId = 9639, sell = 150 },
	{ itemName = "cultish symbol", clientId = 11455, sell = 500 },
	{ itemName = "curl of hair", clientId = 36809, sell = 320000 },
	{ itemName = "curious matter", clientId = 23511, sell = 430 },
	{ itemName = "cursed bone", clientId = 32774, sell = 6000 },
	{ itemName = "cursed shoulder spikes", clientId = 10410, sell = 320 },
	{ itemName = "cyclops toe", clientId = 9657, sell = 55 },
	{ itemName = "damaged armor plates", clientId = 28822, sell = 280 },
	{ itemName = "damaged worm head", clientId = 27620, sell = 8000 },
	{ itemName = "damselfly eye", clientId = 17463, sell = 25 },
	{ itemName = "damselfly wing", clientId = 17458, sell = 20 },
	{ itemName = "dandelion seeds", clientId = 25695, sell = 200 },
	{ itemName = "dangerous proto matter", clientId = 23515, sell = 300 },
	{ itemName = "dark bell", clientId = 32596, sell = 310000 },
	{ itemName = "dark obsidian splinter", clientId = 43850, sell = 4400 },
	{ itemName = "dark rosary", clientId = 10303, sell = 48 },
	{ itemName = "darklight basalt chunk", clientId = 43852, sell = 3800 },
-- darklight figurine falta
	{ itemName = "darklight core", clientId = 43853, sell = 4100 },
	{ itemName = "darklight matter", clientId = 43851, sell = 5500 },
	{ itemName = "decayed finger bone", clientId = 43846, sell = 5100 },
	{ itemName = "dead weight", clientId = 20202, sell = 450 },
	{ itemName = "deepling breaktime snack", clientId = 14011, sell = 90 },
	{ itemName = "deepling claw", clientId = 14044, sell = 430 },
	{ itemName = "deepling guard belt buckle", clientId = 14010, sell = 230 },
	{ itemName = "deepling ridge", clientId = 14041, sell = 360 },
	{ itemName = "deepling scales", clientId = 14017, sell = 80 },
	{ itemName = "deepling warts", clientId = 14012, sell = 180 },
	{ itemName = "deeptags", clientId = 14013, sell = 290 },
	{ itemName = "deepworm jaws", clientId = 27594, sell = 500 },
	{ itemName = "deepworm spike roots", clientId = 27593, sell = 650 },
	{ itemName = "deepworm spikes", clientId = 27592, sell = 800 },
	{ itemName = "demon dust", clientId = 5526, sell = 300 },
	{ itemName = "demon horn", clientId = 5954, sell = 1000 },
	{ itemName = "demonic finger", clientId = 12541, sell = 1000 },
	{ itemName = "demonic skeletal hand", clientId = 9647, sell = 80 },
	{ itemName = "demonic essence", clientId = 6499, sell = 1000 },
	{ itemName = "diabolic skull", clientId = 34025, sell = 19000 },
	{ itemName = "diremaw brainpan", clientId = 27597, sell = 350 },
	{ itemName = "diremaw legs", clientId = 27598, sell = 270 },
	{ itemName = "dirty turban", clientId = 11456, sell = 120 },
	{ itemName = "distorted heart", clientId = 34142, sell = 2100 },
	{ itemName = "distorted robe", clientId = 34149, sell = 1200 },
	{ itemName = "downy feather", clientId = 11684, sell = 20 },
	{ itemName = "dowser", clientId = 19110, sell = 35 },
	{ itemName = "dracola's eye", clientId = 6546, sell = 50000 },
	{ itemName = "dracoyle statue", clientId = 9034, sell = 5000 },
	{ itemName = "dragon blood", clientId = 24937, sell = 700 },
	{ itemName = "dragon claw", clientId = 5919, sell = 8000 },
	{ itemName = "dragon priest's wandtip", clientId = 10444, sell = 175 },
	{ itemName = "dragon tongue", clientId = 24938, sell = 550 },
	{ itemName = "dragon's tail", clientId = 11457, sell = 100 },
	{ itemName = "draken sulphur", clientId = 11658, sell = 550 },
	{ itemName = "draken wristbands", clientId = 11659, sell = 430 },
	{ itemName = "dream essence egg", clientId = 30005, sell = 205 },
	{ itemName = "dung ball", clientId = 14225, sell = 130 },
	{ itemName = "earflap", clientId = 17819, sell = 40 },
	{ itemName = "elder bonelord tentacle", clientId = 10276, sell = 150 },
	{ itemName = "elven astral observer", clientId = 11465, sell = 90 },
	{ itemName = "elven hoof", clientId = 18994, sell = 115 },
	{ itemName = "elven scouting glass", clientId = 11464, sell = 50 },
	{ itemName = "elvish talisman", clientId = 9635, sell = 45 },
	{ itemName = "emerald tortoise shell", clientId = 39379, sell = 2150 },
	{ itemName = "empty honey glass", clientId = 31331, sell = 270 },
	{ itemName = "enchanted chicken wing", clientId = 5891, sell = 20000 },
	{ itemName = "energy ball", clientId = 23523, sell = 300 },
	{ itemName = "energy vein", clientId = 23508, sell = 270 },
	{ itemName = "ensouled essence", clientId = 32698, sell = 820 },
	{ itemName = "essence of a bad dream", clientId = 10306, sell = 360 },
	{ itemName = "eye of a deepling", clientId = 12730, sell = 150 },
	{ itemName = "eye of a weeper", clientId = 16132, sell = 650 },
	{ itemName = "eyeless devourer legs", clientId = 36776, sell = 650 },
	{ itemName = "eyeless devourer maw", clientId = 36775, sell = 420 },
	{ itemName = "eyeless devourer tongue", clientId = 36777, sell = 900 },
	{ itemName = "eye of corruption", clientId = 11671, sell = 390 },
	{ itemName = "fafnar symbol", clientId = 31443, sell = 950 },
	{ itemName = "fairy wings", clientId = 25694, sell = 200 },
	{ itemName = "falcon crest", clientId = 28823, sell = 650 },
	{ itemName = "fern", clientId = 3737, sell = 20 },
	{ itemName = "fiery heart", clientId = 9636, sell = 375 },
	{ itemName = "fig leaf", clientId = 25742, sell = 200 },
	{ itemName = "figurine of bakragore", clientId = 43963, sell = 5400000 },
	{ itemName = "figurine of cruelty", clientId = 34019, sell = 3100000 },
	{ itemName = "figurine of greed", clientId = 34021, sell = 2900000 },
	{ itemName = "figurine of hatred", clientId = 34020, sell = 2700000 },
	{ itemName = "figurine of malice", clientId = 34018, sell = 2800000 },
	{ itemName = "figurine of megalomania", clientId = 33953, sell = 5000000 },
	{ itemName = "figurine of spite", clientId = 33952, sell = 3000000 },
	{ itemName = "fir cone", clientId = 19111, sell = 25 },
	{ itemName = "fish fin", clientId = 5895, sell = 150 },
	{ itemName = "flask of embalming fluid", clientId = 11466, sell = 30 },
	{ itemName = "flask of warrior's sweat", clientId = 5885, sell = 10000 },
	{ itemName = "flotsam", clientId = 39407, sell = 330 },
	{ itemName = "fox paw", clientId = 27462, sell = 100 },
	{ itemName = "frazzle skin", clientId = 20199, sell = 400 },
	{ itemName = "frazzle tongue", clientId = 20198, sell = 700 },
	{ itemName = "frost giant pelt", clientId = 9658, sell = 160 },
	{ itemName = "frosty ear of a troll", clientId = 9648, sell = 30 },
	{ itemName = "frosty heart", clientId = 9661, sell = 280 },
	{ itemName = "frozen lightning", clientId = 23519, sell = 270 },
	{ itemName = "fur shred", clientId = 34164, sell = 200 },
	{ itemName = "gauze bandage", clientId = 9649, sell = 90 },
	{ itemName = "geomancer's robe", clientId = 11458, sell = 80 },
	{ itemName = "geomancer's staff", clientId = 11463, sell = 120 },
	{ itemName = "ghastly dragon head", clientId = 10449, sell = 700 },
	{ itemName = "ghostly tissue", clientId = 9690, sell = 90 },
	{ itemName = "ghoul snack", clientId = 11467, sell = 60 },
	{ itemName = "giant eye", clientId = 10280, sell = 380 },
	{ itemName = "giant tentacle", clientId = 27619, sell = 10000 },
	{ itemName = "girlish hair decoration", clientId = 11443, sell = 30 },
	{ itemName = "girtabilu warrior carapace", clientId = 36971, sell = 520 },
	{ itemName = "gland", clientId = 8143, sell = 500 },
	{ itemName = "glistening bone", clientId = 23522, sell = 250 },
	{ itemName = "glob of acid slime", clientId = 9054, sell = 25 },
	{ itemName = "glob of mercury", clientId = 9053, sell = 20 },
	{ itemName = "glob of tar", clientId = 9055, sell = 30 },
	{ itemName = "gloom wolf fur", clientId = 22007, sell = 70 },
	{ itemName = "glowing rune", clientId = 28570, sell = 350 },
	{ itemName = "goanna claw", clientId = 31561, sell = 260 },
	{ itemName = "goanna meat", clientId = 31560, sell = 190 },
	{ itemName = "goblet of gloom", clientId = 34022, sell = 12000 },
	{ itemName = "goblin ear", clientId = 11539, sell = 20 },
	{ itemName = "golden brush", clientId = 25689, sell = 250 },
	{ itemName = "golden cheese wedge", clientId = 35581, sell = 6000 },
	{ itemName = "golden dustbin", clientId = 35579, sell = 7000 },
	{ itemName = "golden lotus brooch", clientId = 21974, sell = 270 },
	{ itemName = "golden mask", clientId = 31324, sell = 38000 },
	{ itemName = "golden skull", clientId = 35580, sell = 9000 },
	{ itemName = "goosebump leather", clientId = 20205, sell = 650 },
	{ itemName = "gore horn", clientId = 39377, sell = 2900 },
	{ itemName = "gorerilla mane", clientId = 39392, sell = 2750 },
	{ itemName = "gorerilla tail", clientId = 39393, sell = 2650 },
	{ itemName = "grant of arms", clientId = 28824, sell = 950 },
	{ itemName = "grappling hook", clientId = 35588, sell = 150 },
	{ itemName = "greed's arm", clientId = 33924, sell = 950000 },
	{ itemName = "green bandage", clientId = 25697, sell = 180 },
	{ itemName = "green dragon leather", clientId = 5877, sell = 100 },
	{ itemName = "green dragon scale", clientId = 5920, sell = 100 },
	{ itemName = "green glass plate", clientId = 29346, sell = 180 },
	{ itemName = "green piece of cloth", clientId = 5910, sell = 200 },
	{ itemName = "grimace", clientId = 32593, sell = 120000 },
	{ itemName = "gruesome fan", clientId = 34024, sell = 15000 },
	{ itemName = "guidebook", clientId = 25745, sell = 200 },
	{ itemName = "hair of a banshee", clientId = 11446, sell = 350 },
	{ itemName = "half-digested piece of meat", clientId = 10283, sell = 55 },
	{ itemName = "half-digested stones", clientId = 27369, sell = 40 },
	{ itemName = "half-eaten brain", clientId = 9659, sell = 85 },
	{ itemName = "hand", clientId = 33936, sell = 1450 },
	{ itemName = "hardened bone", clientId = 5925, sell = 70 },
	{ itemName = "harpoon of a giant snail", clientId = 27625, sell = 15000 },
	{ itemName = "hatched rorc egg", clientId = 18997, sell = 30 },
	{ itemName = "haunted piece of wood", clientId = 9683, sell = 115 },
	{ itemName = "hazardous heart", clientId = 34140, sell = 5000 },
	{ itemName = "hazardous robe", clientId = 34147, sell = 3000 },
	{ itemName = "head", clientId = 33937, sell = 3500 },
	{ itemName = "head many", clientId = 33932, sell = 3200 },
	{ itemName = "headpecker beak", clientId = 39387, sell = 2998 },
	{ itemName = "headpecker feather", clientId = 39388, sell = 1300 },
	{ itemName = "heaven blossom", clientId = 3657, sell = 50 },
	{ itemName = "hellhound slobber", clientId = 9637, sell = 500 },
	{ itemName = "hellspawn tail", clientId = 10304, sell = 475 },
	{ itemName = "hemp rope", clientId = 20206, sell = 350 },
	{ itemName = "hideous chunk", clientId = 16140, sell = 510 },
	{ itemName = "high guard flag", clientId = 10415, sell = 550 },
	{ itemName = "high guard shoulderplates", clientId = 10416, sell = 130 },
	{ itemName = "holy ash", clientId = 17850, sell = 160 },
	{ itemName = "holy orchid", clientId = 5922, sell = 90 },
	{ itemName = "honeycomb", clientId = 5902, sell = 40 },
	{ itemName = "horn of kalyassa", clientId = 24941, sell = 10000 },
	{ itemName = "horoscope", clientId = 18926, sell = 40 },
	{ itemName = "huge shell", clientId = 27621, sell = 15000 },
	{ itemName = "huge spiky snail shell", clientId = 27627, sell = 8000 },
	{ itemName = "humongous chunk", clientId = 16139, sell = 540 },
	{ itemName = "hunter's quiver", clientId = 11469, sell = 80 },
	{ itemName = "hydra head", clientId = 10282, sell = 600 },
	{ itemName = "hydrophytes", clientId = 39410, sell = 220 },
	{ itemName = "ice flower", clientId = 30058, sell = 370 },
	{ itemName = "ichgahal's fungal infestation", clientId = 43964, sell = 900000 },
	{ itemName = "incantation notes", clientId = 18929, sell = 90 },
	{ itemName = "infernal heart", clientId = 34139, sell = 2100 },
	{ itemName = "infernal robe", clientId = 34146, sell = 1200 },
	{ itemName = "inkwell", clientId = 28568, sell = 720 },
	{ itemName = "instable proto matter", clientId = 23516, sell = 300 },
	{ itemName = "iron ore", clientId = 5880, sell = 500 },
	{ itemName = "ivory carving", clientId = 33945, sell = 300 },
	{ itemName = "ivory comb", clientId = 32773, sell = 8000 },
	{ itemName = "izcandar's snow globe", clientId = 29944, sell = 180000 },
	{ itemName = "izcandar's sundial", clientId = 29945, sell = 225000 },
	{ itemName = "jagged sickle", clientId = 32595, sell = 150000 },
	{ itemName = "jaws", clientId = 34014, sell = 3900 },
	{ itemName = "jewelled belt", clientId = 11470, sell = 180 },
	{ itemName = "jungle moa claw", clientId = 39404, sell = 160 },
	{ itemName = "jungle moa egg", clientId = 39405, sell = 250 },
	{ itemName = "jungle moa feather", clientId = 39403, sell = 140 },
	{ itemName = "katex' blood", clientId = 34100, sell = 210 },
	{ itemName = "key to the drowned library", clientId = 14009, sell = 330 },
	{ itemName = "kollos shell", clientId = 14077, sell = 420 },
	{ itemName = "kongra's shoulderpad", clientId = 11471, sell = 100 },
	{ itemName = "lamassu hoof", clientId = 31441, sell = 330 },
	{ itemName = "lamassu horn", clientId = 31442, sell = 240 },
	{ itemName = "lancer beetle shell", clientId = 10455, sell = 80 },
	{ itemName = "lancet", clientId = 18925, sell = 90 },
	{ itemName = "lavafungus head", clientId = 36785, sell = 900 },
	{ itemName = "lavafungus ring", clientId = 36786, sell = 390 },
	{ itemName = "lavaworm jaws", clientId = 36771, sell = 1100 },
	{ itemName = "lavaworm spike roots", clientId = 36769, sell = 600 },
	{ itemName = "lavaworm spikes", clientId = 36770, sell = 750 },
	{ itemName = "legionnaire flags", clientId = 10417, sell = 500 },
	{ itemName = "lion cloak patch", clientId = 34162, sell = 190 },
	{ itemName = "liodile fang", clientId = 40583, sell = 480 },
	{ itemName = "lion crest", clientId = 34160, sell = 270 },
	{ itemName = "lion seal", clientId = 34163, sell = 210 },
	{ itemName = "lion's mane", clientId = 9691, sell = 60 },
	{ itemName = "little bowl of myrrh", clientId = 25697, sell = 500 },
	{ itemName = "lizard essence", clientId = 11680, sell = 300 },
	{ itemName = "lizard heart", clientId = 31340, sell = 530 },
	{ itemName = "lizard leather", clientId = 5876, sell = 150 },
	{ itemName = "lizard scale", clientId = 5881, sell = 120 },
	{ itemName = "longing eyes", clientId = 27624, sell = 8000 },
	{ itemName = "lost basher's spike", clientId = 17826, sell = 280 },
	{ itemName = "lost bracers", clientId = 17853, sell = 140 },
	{ itemName = "lost husher's staff", clientId = 17848, sell = 250 },
	{ itemName = "lost soul", clientId = 32227, sell = 120 },
	{ itemName = "luminescent crystal pickaxe", clientId = 32711, sell = 50 },
	{ itemName = "luminous orb", clientId = 11454, sell = 1000 },
	{ itemName = "lump of dirt", clientId = 9692, sell = 10 },
	{ itemName = "lump of earth", clientId = 10305, sell = 130 },
	{ itemName = "mad froth", clientId = 17854, sell = 80 },
	{ itemName = "magic sulphur", clientId = 5904, sell = 8000 },
	{ itemName = "makara fin", clientId = 39401, sell = 350 },
	{ itemName = "makara tongue", clientId = 39402, sell = 320 },
	{ itemName = "malice's horn", clientId = 33920, sell = 620000 },
	{ itemName = "malice's spine", clientId = 33921, sell = 850000 },
	{ itemName = "malofur's lunchbox", clientId = 30088, sell = 240000 },
	{ itemName = "mammoth tusk", clientId = 10321, sell = 100 },
	{ itemName = "mantassin tail", clientId = 11489, sell = 280 },
	{ itemName = "manticore ear", clientId = 31440, sell = 310 },
	{ itemName = "manticore tail", clientId = 31439, sell = 220 },
	{ itemName = "mantosaurus jaw", clientId = 39386, sell = 2998 },
	{ itemName = "marsh stalker beak", clientId = 17461, sell = 65 },
	{ itemName = "marsh stalker feather", clientId = 17462, sell = 50 },
	{ itemName = "maxxenius head", clientId = 29942, sell = 500000 },
	{ itemName = "meat hammer", clientId = 32093, sell = 60 },
	{ itemName = "medal of valiance", clientId = 31591, sell = 410000 },
	{ itemName = "megalomania's essence", clientId = 33928, sell = 1900000 },
	{ itemName = "megalomania's skull", clientId = 33925, sell = 1500000 },
	{ itemName = "mercurial wing", clientId = 39395, sell = 2500 },
	{ itemName = "milk churn", clientId = 32011, sell = 100 },
	{ itemName = "minotaur horn", clientId = 11472, sell = 75 },
	{ itemName = "minotaur leather", clientId = 5878, sell = 80 },
	{ itemName = "miraculum", clientId = 11474, sell = 60 },
	{ itemName = "moon compass", clientId = 43739, sell = 5000 },
	{ itemName = "moon pin", clientId = 43736, sell = 18000 },
	{ itemName = "morbid tapestry", clientId = 34170, sell = 30000 },
	{ itemName = "morshabaal's brain", clientId = 37613, sell = 5000000 },
	{ itemName = "morshabaal's extract", clientId = 37810, sell = 3250000 },
	{ itemName = "mould heart", clientId = 34141, sell = 2100 },
	{ itemName = "mould robe", clientId = 34148, sell = 1200 },
	{ itemName = "mouldy powder", clientId = 35596, sell = 200 },
	{ itemName = "mr. punish's handcuffs", clientId = 6537, sell = 50000 },
	{ itemName = "murcion's mycelium", clientId = 43965, sell = 950000 },
	{ itemName = "mutated bat ear", clientId = 9662, sell = 420 },
	{ itemName = "mutated flesh", clientId = 10308, sell = 50 },
	{ itemName = "mutated rat tail", clientId = 9668, sell = 150 },
	{ itemName = "mystical hourglass", clientId = 9660, sell = 700 },
	{ itemName = "naga archer scales", clientId = 39413, sell = 340 },
	{ itemName = "naga arming", clientId = 39411, sell = 390 },
	{ itemName = "naga earring", clientId = 39412, sell = 380 },
	{ itemName = "naga warrior scales", clientId = 39414, sell = 340 },
	{ itemName = "necromantic robe", clientId = 11475, sell = 250 },
	{ itemName = "nettle blossom", clientId = 10314, sell = 75 },
	{ itemName = "nettle spit", clientId = 11476, sell = 25 },
	{ itemName = "nighthuner wing", clientId = 39381, sell = 2000 },
	{ itemName = "noble amulet", clientId = 31595, sell = 430000 },
	{ itemName = "noble cape", clientId = 31593, sell = 425000 },
	{ itemName = "noble turban", clientId = 11486, sell = 430 },
	{ itemName = "nose ring", clientId = 5804, sell = 2000 },
	{ itemName = "odd organ", clientId = 23510, sell = 410 },
	{ itemName = "ogre ear stud", clientId = 22188, sell = 180 },
	{ itemName = "ogre nose ring", clientId = 22189, sell = 210 },
	{ itemName = "old girtablilu carapace", clientId = 36972, sell = 570 },
	{ itemName = "old royal diary", clientId = 36808, sell = 220000 },
	{ itemName = "one of timira's many heads", clientId = 39399, sell = 215000 },
	{ itemName = "orc leather", clientId = 11479, sell = 30 },
	{ itemName = "orc tooth", clientId = 10196, sell = 150 },
	{ itemName = "orcish gear", clientId = 11477, sell = 85 },
	{ itemName = "pair of hellflayer horns", clientId = 22729, sell = 1300 },
	{ itemName = "pair of old bracers", clientId = 32705, sell = 500 },
	{ itemName = "pale worm's scalp", clientId = 32598, sell = 489000 },
	{ itemName = "parder fur", clientId = 39418, sell = 150 },
	{ itemName = "parder tooth", clientId = 39417, sell = 150 },
	{ itemName = "patch of fine cloth", clientId = 28821, sell = 1350 },
	{ itemName = "peacock feather fan", clientId = 21975, sell = 350 },
	{ itemName = "pelvis bone", clientId = 11481, sell = 30 },
	{ itemName = "percht horns", clientId = 30186, sell = 200 },
	{ itemName = "perfect behemoth fang", clientId = 5893, sell = 250 },
	{ itemName = "petrified scream", clientId = 10420, sell = 250 },
	{ itemName = "phantasmal hair", clientId = 32704, sell = 500 },
	{ itemName = "piece of archer armor", clientId = 11483, sell = 20 },
	{ itemName = "piece of crocodile leather", clientId = 10279, sell = 15 },
	{ itemName = "piece of dead brain", clientId = 9663, sell = 420 },
	{ itemName = "piece of massacre's shell", clientId = 6540, sell = 50000 },
	{ itemName = "piece of scarab shell", clientId = 9641, sell = 45 },
	{ itemName = "piece of swampling wood", clientId = 17823, sell = 30 },
	{ itemName = "piece of timira's sensors", clientId = 39400, sell = 150000 },
	{ itemName = "piece of warrior armor", clientId = 11482, sell = 50 },
	{ itemName = "pieces of magic chalk", clientId = 18930, sell = 210 },
	{ itemName = "pig foot", clientId = 9693, sell = 10 },
	{ itemName = "pile of grave earth", clientId = 11484, sell = 25 },
	{ itemName = "pirat's tail", clientId = 35573, sell = 180 },
	{ itemName = "pirate coin", clientId = 35572, sell = 110 },
	{ itemName = "plagueroot offshoot", clientId = 30087, sell = 280000 },
	{ itemName = "plasma pearls", clientId = 23506, sell = 250 },
	{ itemName = "plasmatic lightning", clientId = 23520, sell = 270 },
	{ itemName = "poison gland", clientId = 29348, sell = 210 },
	{ itemName = "poison spider shell", clientId = 11485, sell = 10 },
	{ itemName = "poisonous slime", clientId = 9640, sell = 50 },
	{ itemName = "polar bear paw", clientId = 9650, sell = 30 },
	{ itemName = "pool of chitinous glue", clientId = 20207, sell = 480 },
	{ itemName = "porcelain mask", clientId = 25088, sell = 2000 },
	{ itemName = "powder herb", clientId = 3739, sell = 10 },
	{ itemName = "prehemoth claw", clientId = 39383, sell = 2300 },
	{ itemName = "prehemoth horns", clientId = 39382, sell = 3000 },
	{ itemName = "pristine worm head", clientId = 27618, sell = 15000 },
	{ itemName = "protective charm", clientId = 11444, sell = 60 },
	{ itemName = "purified soul", clientId = 32228, sell = 260 },
	{ itemName = "purple robe", clientId = 11473, sell = 110 },
--	{ itemName = "putrefactive figurine", clientId = , sell = 3200000 },
	{ itemName = "quara bone", clientId = 11491, sell = 500 },
	{ itemName = "quara eye", clientId = 11488, sell = 350 },
	{ itemName = "quara pincers", clientId = 11490, sell = 410 },
	{ itemName = "quara tentacle", clientId = 11487, sell = 140 },
	{ itemName = "quill", clientId = 28567, sell = 1100 },
	{ itemName = "rare earth", clientId = 27301, sell = 80 },
	{ itemName = "ratmiral's hat", clientId = 35613, sell = 150000 },
	{ itemName = "ravenous circlet", clientId = 32597, sell = 220000 },
	{ itemName = "red dragon leather", clientId = 5948, sell = 200 },
	{ itemName = "red dragon scale", clientId = 5882, sell = 200 },
	{ itemName = "red goanna scale", clientId = 31558, sell = 270 },
	{ itemName = "red hair dye", clientId = 17855, sell = 40 },
	{ itemName = "red piece of cloth", clientId = 5911, sell = 300 },
	{ itemName = "rhindeer antlers", clientId = 40587, sell = 680 },
	{ itemName = "rhino hide", clientId = 24388, sell = 175 },
	{ itemName = "rhino horn", clientId = 24389, sell = 265 },
	{ itemName = "rhino horn carving", clientId = 24386, sell = 300 },
	{ itemName = "ripptor claw", clientId = 39389, sell = 2000 },
	{ itemName = "ripptor scales", clientId = 39391, sell = 1200 },
	{ itemName = "rod", clientId = 33929, sell = 2200 },
	{ itemName = "rogue naga scales", clientId = 39416, sell = 570 },
	{ itemName = "roots", clientId = 33938, sell = 1200 },
	{ itemName = "rope belt", clientId = 11492, sell = 66 },
	{ itemName = "rorc egg", clientId = 18996, sell = 120 },
	{ itemName = "rorc feather", clientId = 18993, sell = 70 },
	{ itemName = "rotten heart", clientId = 31589, sell = 74000 },
	{ itemName = "rotten piece of cloth", clientId = 10291, sell = 30 },
	{ itemName = "rotten vermin ichor", clientId = 43849, sell = 4500 },
	{ itemName = "rotten roots", clientId = 43849, sell = 3800 },
	{ itemName = "sabretooth", clientId = 10311, sell = 400 },
	{ itemName = "sabretooth fur", clientId = 39378, sell = 2500 },
	{ itemName = "safety pin", clientId = 11493, sell = 120 },
	{ itemName = "sample of monster blood", clientId = 27874, sell = 250 },
	{ itemName = "sandcrawler shell", clientId = 10456, sell = 20 },
	{ itemName = "scale of corruption", clientId = 11673, sell = 680 },
	{ itemName = "scale of gelidrazah", clientId = 24939, sell = 10000 },
	{ itemName = "scarab pincers", clientId = 9631, sell = 280 },
	{ itemName = "scorpion tail", clientId = 9651, sell = 25 },
	{ itemName = "scroll of heroic deeds", clientId = 11510, sell = 230 },
	{ itemName = "scythe leg", clientId = 10312, sell = 450 },
	{ itemName = "sea horse figurine", clientId = 31323, sell = 42000 },
	{ itemName = "sea serpent scale", clientId = 9666, sell = 520 },
	{ itemName = "seeds", clientId = 647, sell = 150 },
	{ itemName = "shaggy tail", clientId = 10407, sell = 25 },
	{ itemName = "shamanic hood", clientId = 11478, sell = 45 },
	{ itemName = "shamanic talisman", clientId = 22184, sell = 200 },
	{ itemName = "shark fins", clientId = 35574, sell = 250 },
	{ itemName = "shimmering beetles", clientId = 25686, sell = 150 },
	{ itemName = "sight of surrender's eye", clientId = 20183, sell = 3000 },
	{ itemName = "signet ring", clientId = 31592, sell = 480000 },
	{ itemName = "silencer claws", clientId = 20200, sell = 390 },
	{ itemName = "silencer resonating chamber", clientId = 20201, sell = 600 },
	{ itemName = "silken bookmark", clientId = 28566, sell = 1300 },
	{ itemName = "silky fur", clientId = 10292, sell = 35 },
	{ itemName = "silver foxmouse coin", clientId = 43733, sell = 11000 },
	{ itemName = "silver moon coin", clientId = 43732, sell = 11000 },
	{ itemName = "silver hand mirror", clientId = 32772, sell = 10000 },
	{ itemName = "single human eye", clientId = 25696, sell = 1000 },
	{ itemName = "skeleton decoration", clientId = 6525, sell = 3000 },
	{ itemName = "skull belt", clientId = 11480, sell = 80 },
	{ itemName = "skull fetish", clientId = 22191, sell = 250 },
	{ itemName = "skull shatterer", clientId = 17849, sell = 170 },
	{ itemName = "skunk tail", clientId = 10274, sell = 50 },
	{ itemName = "slimy leg", clientId = 27623, sell = 4500 },
	{ itemName = "small energy ball", clientId = 23524, sell = 250 },
	{ itemName = "small flask of eyedrops", clientId = 11512, sell = 95 },
	{ itemName = "small notebook", clientId = 11450, sell = 480 },
	{ itemName = "small oil lamp", clientId = 2933, sell = 150 },
	{ itemName = "small pitchfork", clientId = 11513, sell = 70 },
	{ itemName = "small treasure chest", clientId = 35571, sell = 500 },
	{ itemName = "small tropical fish", clientId = 39408, sell = 380 },
	{ itemName = "smoldering eye", clientId = 39543, sell = 470000 },
	{ itemName = "snake skin", clientId = 9694, sell = 400 },
	{ itemName = "sniper gloves", clientId = 5875, sell = 2000 },
	{ itemName = "solid rage", clientId = 23517, sell = 310 },
	{ itemName = "some grimeleech wings", clientId = 22730, sell = 1200 },
	{ itemName = "soul stone", clientId = 5809, sell = 6000 },
	{ itemName = "spark sphere", clientId = 23518, sell = 350 },
	{ itemName = "sparkion claw", clientId = 23502, sell = 290 },
	{ itemName = "sparkion legs", clientId = 23504, sell = 310 },
	{ itemName = "sparkion stings", clientId = 23505, sell = 280 },
	{ itemName = "sparkion tail", clientId = 23503, sell = 300 },
	{ itemName = "spectral gold nugget", clientId = 32724, sell = 500 },
	{ itemName = "spectral silver nugget", clientId = 32725, sell = 250 },
	{ itemName = "spellsinger's seal", clientId = 14008, sell = 280 },
	{ itemName = "sphinx feather", clientId = 31437, sell = 470 },
	{ itemName = "sphinx tiara", clientId = 31438, sell = 360 },
	{ itemName = "spider fangs", clientId = 8031, sell = 10 },
	{ itemName = "spider silk", clientId = 5879, sell = 100 },
	{ itemName = "spidris mandible", clientId = 14082, sell = 450 },
	{ itemName = "spiked iron ball", clientId = 10408, sell = 100 },
	{ itemName = "spirit container", clientId = 5884, sell = 40000 },
	{ itemName = "spite's spirit", clientId = 33926, sell = 840000 },
	{ itemName = "spitter nose", clientId = 14078, sell = 340 },
	{ itemName = "spooky blue eye", clientId = 9642, sell = 95 },
	{ itemName = "srezz' eye", clientId = 34103, sell = 300 },
	{ itemName = "stalking seeds", clientId = 39384, sell = 1800 },
	{ itemName = "star herb", clientId = 3736, sell = 15 },
	{ itemName = "stone herb", clientId = 3735, sell = 20 },
	{ itemName = "stone wing", clientId = 10278, sell = 120 },
	{ itemName = "stonerefiner's skull", clientId = 27606, sell = 100 },
	{ itemName = "strand of medusa hair", clientId = 10309, sell = 600 },
	{ itemName = "strange proto matter", clientId = 23513, sell = 300 },
	{ itemName = "strange symbol", clientId = 3058, sell = 200 },
	{ itemName = "streaked devourer eyes", clientId = 36772, sell = 500 },
	{ itemName = "streaked devourer legs", clientId = 36774, sell = 600 },
	{ itemName = "streaked devourer maw", clientId = 36773, sell = 400 },
	{ itemName = "striped fur", clientId = 10293, sell = 50 },
	{ itemName = "sulphider shell", clientId = 39375, sell = 2200 },
	{ itemName = "sulphur powder", clientId = 39376, sell = 1900 },
	{ itemName = "sun brooch", clientId = 43737, sell = 18000 },
	{ itemName = "swamp grass", clientId = 9686, sell = 20 },
	{ itemName = "swampling moss", clientId = 17822, sell = 20 },
	{ itemName = "swarmer antenna", clientId = 14076, sell = 130 },
	{ itemName = "tail of corruption", clientId = 11672, sell = 240 },
	{ itemName = "tarantula egg", clientId = 10281, sell = 80 },
	{ itemName = "tarnished rhino figurine", clientId = 24387, sell = 320 },
	{ itemName = "tattered piece of robe", clientId = 9684, sell = 120 },
	{ itemName = "telescope eye", clientId = 33934, sell = 1600 },
	{ itemName = "tentacle of tentugly", clientId = 35611, sell = 27000 },
	{ itemName = "tentacle piece", clientId = 11666, sell = 5000 },
	{ itemName = "tentugly's eye", clientId = 35610, sell = 52000 },
	{ itemName = "tentugly's jaws", clientId = 35612, sell = 80000 },
	{ itemName = "terramite eggs", clientId = 10453, sell = 50 },
	{ itemName = "terramite legs", clientId = 10454, sell = 60 },
	{ itemName = "terramite shell", clientId = 10452, sell = 170 },
	{ itemName = "terrorbird beak", clientId = 10273, sell = 95 },
	{ itemName = "the handmaiden's protector", clientId = 6539, sell = 50000 },
	{ itemName = "the imperor's trident", clientId = 6534, sell = 50000 },
	{ itemName = "the plasmother's remains", clientId = 6535, sell = 50000 },
	{ itemName = "thick fur", clientId = 10307, sell = 150 },
	{ itemName = "thorn", clientId = 9643, sell = 100 },
	{ itemName = "tiara", clientId = 35578, sell = 11000 },
	{ itemName = "token of love", clientId = 31594, sell = 440000 },
	{ itemName = "tooth file", clientId = 18924, sell = 60 },
	{ itemName = "tooth of tazhadur", clientId = 24940, sell = 10000 },
	{ itemName = "torn shirt", clientId = 25744, sell = 250 },
	{ itemName = "trapped bad dream monster", clientId = 20203, sell = 900 },
	{ itemName = "tremendous tyrant head", clientId = 36783, sell = 930 },
	{ itemName = "tremendous tyrant shell", clientId = 36784, sell = 740 },
	{ itemName = "troll green", clientId = 3741, sell = 25 },
	{ itemName = "trollroot", clientId = 11515, sell = 50 },
	{ itemName = "tunnel tyrant head", clientId = 27595, sell = 500 },
	{ itemName = "tunnel tyrant shell", clientId = 27596, sell = 700 },
	{ itemName = "turtle shell", clientId = 5899, sell = 90 },
	{ itemName = "tusk", clientId = 3044, sell = 100 },
	{ itemName = "two-headed turtle heads", clientId = 39409, sell = 460 },
	{ itemName = "undead heart", clientId = 10450, sell = 200 },
	{ itemName = "undertaker fangs", clientId = 39380, sell = 2700 },
	{ itemName = "unholy bone", clientId = 10316, sell = 480 },
	{ itemName = "urmahlullus mane", clientId = 31623, sell = 490000 },
	{ itemName = "urmahlullus paws", clientId = 31624, sell = 245000 },
	{ itemName = "urmahlullus tail", clientId = 31622, sell = 210000 },
	{ itemName = "utua's poison", clientId = 34101, sell = 230 },
	{ itemName = "vampire dust", clientId = 5905, sell = 100 },
	{ itemName = "vampire teeth", clientId = 9685, sell = 275 },
	{ itemName = "vampire's cape chain", clientId = 18927, sell = 150 },
	{ itemName = "varnished diremaw brainpan", clientId = 36781, sell = 750 },
	{ itemName = "varnished diremaw legs", clientId = 36782, sell = 670 },
	{ itemName = "veal", clientId = 32009, sell = 40 },
--	{ itemName = "vemiath's infused basalt", clientId = , sell = 1000000 },
	{ itemName = "venison", clientId = 18995, sell = 55 },
	{ itemName = "vexclaw talon", clientId = 22728, sell = 1100 },
	{ itemName = "vial of hatred", clientId = 33927, sell = 737000 },
	{ itemName = "vibrant heart", clientId = 34143, sell = 2100 },
	{ itemName = "vibrant robe", clientId = 34144, sell = 1200 },
	{ itemName = "violet glass plate", clientId = 29347, sell = 2150 },
	{ itemName = "volatile proto matter", clientId = 23514, sell = 300 },
	{ itemName = "warmaster's wristguards", clientId = 10405, sell = 200 },
	{ itemName = "warwolf fur", clientId = 10318, sell = 30 },
	{ itemName = "waspoid claw", clientId = 14080, sell = 320 },
	{ itemName = "waspoid wing", clientId = 14081, sell = 190 },
	{ itemName = "weaver's wandtip", clientId = 10397, sell = 250 },
	{ itemName = "werebadger claws", clientId = 22051, sell = 160 },
	{ itemName = "werebadger skull", clientId = 22055, sell = 185 },
	{ itemName = "werebear fur", clientId = 22057, sell = 85 },
	{ itemName = "werebear skull", clientId = 22056, sell = 195 },
	{ itemName = "wereboar hooves", clientId = 22053, sell = 175 },
	{ itemName = "wereboar tusks", clientId = 22054, sell = 165 },
	{ itemName = "werecrocodile tongue", clientId = 43729, sell = 570 },
	{ itemName = "werefox tail", clientId = 27463, sell = 200 },
	{ itemName = "werehyaena nose", clientId = 33943, sell = 220 },
	{ itemName = "werehyaena talisman", clientId = 33944, sell = 350 },
	{ itemName = "werepanther claw", clientId = 43731, sell = 280 },
	{ itemName = "werewolf fangs", clientId = 22052, sell = 180 },
	{ itemName = "werewolf fur", clientId = 10317, sell = 380 },
	{ itemName = "white piece of cloth", clientId = 5909, sell = 100 },
	{ itemName = "widow's mandibles", clientId = 10411, sell = 110 },
	{ itemName = "wild flowers", clientId = 25691, sell = 120 },
	{ itemName = "wimp tooth chain", clientId = 17847, sell = 120 },
	{ itemName = "winged tail", clientId = 10313, sell = 800 },
	{ itemName = "winter wolf fur", clientId = 10295, sell = 20 },
	{ itemName = "witch broom", clientId = 9652, sell = 60 },
	{ itemName = "withered pauldrons", clientId = 27607, sell = 850 },
	{ itemName = "withered scalp", clientId = 27608, sell = 900 },
	{ itemName = "wolf paw", clientId = 5897, sell = 70 },
	{ itemName = "wood", clientId = 5901, sell = 5 },
	{ itemName = "wool", clientId = 10319, sell = 15 },
	{ itemName = "worm sponge", clientId = 43848, sell = 4200 },
	{ itemName = "writhing brain", clientId = 32600, sell = 370000 },
	{ itemName = "writhing heart", clientId = 32599, sell = 185000 },
	{ itemName = "wyrm scale", clientId = 9665, sell = 400 },
	{ itemName = "wyvern talisman", clientId = 9644, sell = 265 },
	{ itemName = "yellow piece of cloth", clientId = 5914, sell = 150 },
	{ itemName = "yielowax", clientId = 12742, sell = 600 },
	{ itemName = "yirkas' egg", clientId = 34102, sell = 280 },
	{ itemName = "young lich worm", clientId = 31590, sell = 25000 },
	{ itemName = "zaogun flag", clientId = 10413, sell = 600 },
	{ itemName = "zaogun shoulderplates", clientId = 10414, sell = 150 },
	{ itemName = "serpent sword", clientId = 3297, sell = 900 },	
	{ itemName = "snake god's wristguard", clientId = 11691, sell = 90000 },	
	
	--Customs
	{ itemName = "experience scroll", clientId = 51670, sell = 50000 },	
	{ itemName = "silver token", clientId = 22516, sell = 100000 },	
	
	{ itemName = "arcane staff", clientId = 3341, sell = 100000 },	
	{ itemName = "thunder hammer", clientId = 3309, sell = 100000 },
	{ itemName = "stonecutter axe", clientId = 3319, sell = 100000 },
	{ itemName = "magic sword", clientId = 3288, sell = 100000 },
	{ itemName = "throwing star", clientId = 3287, sell = 100000 },
	
	{ itemName = "amber staff", clientId = 7426, sell = 200000 },	
	{ itemName = "sapphire hammer", clientId = 7437, sell = 200000 },
	{ itemName = "reaper's axe", clientId = 7420, sell = 200000 },
	{ itemName = "warlord sword", clientId = 3296, sell = 200000 },
	{ itemName = "viper star", clientId = 7366, sell = 200000 },
	
	{ itemName = "deadly wand", clientId = 895, sell = 300000 },	
	{ itemName = "cranial basher", clientId = 7415, sell = 300000 },
	{ itemName = "great axe", clientId = 3303, sell = 300000 },
	{ itemName = "justice seeker", clientId = 7390, sell = 300000 },
	{ itemName = "assassin star", clientId = 7368, sell = 300000 },
	
	{ itemName = "demon helmet", clientId = 3387, sell = 50000 },	
	{ itemName = "demon armor", clientId = 3388, sell = 50000 },
	{ itemName = "demon legs", clientId = 3389, sell = 50000 },
	{ itemName = "new pair soft boots", clientId = 6529, sell = 50000 },
	
	{ itemName = "green demon helmet", clientId = 37609, sell = 300000 },	
	{ itemName = "green demon armor", clientId = 37608, sell = 300000 },
	{ itemName = "green demon legs", clientId = 37607, sell = 300000 },
	{ itemName = "green demon slippers", clientId = 37610, sell = 300000 },
	{ itemName = "nightmare shield", clientId = 7368, sell = 300000 },
}

local CONFIG = {
    maxMonsterTypes = 20,
    maxPerType = 1000,
    maxTotalKills = 2000,
    previewSeconds = 10,
    armorReduction = 0.7125, -- punto medio entre 0.475 y 0.95 del /monsterdps original
    shieldReduction = 0.50,  -- aproximacion, no bloqueo real de Canary
    autoHitChance = 0.85, -- estimacion del ataque basico; nunca se presenta como dato exacto
    -- En la rama pr-level-limit actualmente data/stages.lua tiene una unica etapa x1.
    fallbackStages = { {minlevel = 1, multiplier = 1} },
    fallbackRateUseStages = true,
    fallbackRateExp = 1000,
    lootConfig = { factor = 1.0, gut = false }
}

local function clamp(v, low, high)
    v = tonumber(v) or 0
    return math.max(low, math.min(high, v))
end

local function round(v)
    return math.floor((tonumber(v) or 0) + 0.5)
end

local function fmt(v)
    local s = tostring(math.floor((tonumber(v) or 0) + 0.5))
    local sign = ""
    if s:sub(1,1) == "-" then sign, s = "-", s:sub(2) end
    return sign .. s:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
end

local function trim(s)
    return tostring(s or ""):match("^%s*(.-)%s*$")
end

-- Compatible con Lua 5.1/LuaJIT, Lua 5.3 y Lua 5.4.
-- IMPORTANTE: pcall(fn, object, ...) evita table.unpack (ausente en Lua 5.1).
-- Devuelve (resultado, error). Los datos obligatorios se validan antes del reporte.
local function safeCallWithError(object, method, fallback, ...)
    if object == nil or object == false then
        return fallback, "objeto inexistente para " .. tostring(method)
    end
    local okMethod, fn = pcall(function() return object[method] end)
    if not okMethod then return fallback, "no se puede acceder a " .. tostring(method) .. ": " .. tostring(fn) end
    if type(fn) ~= "function" then return fallback, "metodo no disponible: " .. tostring(method) end
    local ok, value = pcall(fn, object, ...)
    if ok and value ~= nil then return value, nil end
    return fallback, ok and ("resultado nil de " .. tostring(method)) or ("fallo en " .. tostring(method) .. ": " .. tostring(value))
end

-- Contrato anterior: UN solo valor. Evita que tonumber(x, error) tome el
-- segundo retorno como base numerica e interrumpa la simulacion.
local function safeCall(object, method, fallback, ...)
    local value = safeCallWithError(object, method, fallback, ...)
    return value
end

local priceByName, priceById = {}, {}
for _, item in ipairs(npcPrices) do
    local name = item.itemName:lower()
    -- Mantener el comportamiento del /balance original: si hay nombres
    -- duplicados, conservar el primer precio registrado.
    if priceByName[name] == nil then priceByName[name] = item.sell end
    if item.clientId and priceById[item.clientId] == nil then
        priceById[item.clientId] = item.sell
    end
end

local function getNpcPrice(itemId)
    local itemType = ItemType(itemId)
    local name = itemType and safeCall(itemType, "getName", "") or ""
    name = tostring(name):lower()
    if name == "gold coin" or itemId == 3031 then return 1, true end
    if name == "platinum coin" or itemId == 3035 then return 100, true end
    if name == "crystal coin" or itemId == 3043 then return 10000, true end
    if priceByName[name] ~= nil then return priceByName[name], true end
    if priceById[itemId] ~= nil then return priceById[itemId], true end
    return 0, false
end

local function itemName(itemId)
    local itemType = ItemType(itemId)
    local name = itemType and safeCall(itemType, "getName", nil)
    if name and name ~= "" then return name end
    return "item ID " .. tostring(itemId)
end

local function parseInput(param)
    local parts = {}
    for token in (tostring(param or "") .. ","):gmatch("(.-),") do
        parts[#parts + 1] = trim(token)
    end
    if #parts == 0 or parts[1] == "" then
        return nil, nil, "Ejemplo: /balance rat, 16, cave rat, 10, slime, 6, slug, 4"
    end
    local levelOverride
    local override = parts[1]:lower():match("^@(%d+)$")
        or parts[1]:lower():match("^lvl%s*=?%s*(%d+)$")
        or parts[1]:lower():match("^level%s*=?%s*(%d+)$")
        or parts[1]:lower():match("^nivel%s*=?%s*(%d+)$")
    if override then
        levelOverride = tonumber(override)
        table.remove(parts, 1)
        if levelOverride < 1 or levelOverride > 100000 then
            return nil, nil, "Nivel personalizado fuera de rango (1-100000)."
        end
    end
    if #parts == 0 or #parts % 2 ~= 0 then
        return nil, nil, "Cada nombre debe tener una cantidad. Ejemplo: /balance rat, 16, cave rat, 10"
    end
    local result, byName = {}, {}
    local total = 0
    for index = 1, #parts, 2 do
        local name, countText = parts[index], parts[index + 1]
        if name == "" or not countText:match("^%d+$") then
            return nil, nil, "Nombre o cantidad invalida cerca de '" .. name .. "'."
        end
        local count = tonumber(countText)
        if count < 1 or count > CONFIG.maxPerType then
            return nil, nil, "Cantidad por criatura permitida: 1-" .. CONFIG.maxPerType .. "."
        end
        local key = name:lower()
        if byName[key] then
            byName[key].count = byName[key].count + count
            if byName[key].count > CONFIG.maxPerType then
                return nil, nil, "Demasiados ejemplares de " .. name .. "."
            end
        else
            local monsterType = MonsterType(name)
            if not monsterType then return nil, nil, "Criatura no encontrada: '" .. name .. "'." end
            local entry = { name = safeCall(monsterType, "name", name), type = monsterType, count = count, loot = {}, lootGp = 0, unknown = {} }
            -- Algunas versiones usan :getName() y otras :name().
            if entry.name == "" then entry.name = name end
            result[#result + 1] = entry
            byName[key] = entry
            if #result > CONFIG.maxMonsterTypes then
                return nil, nil, "Maximo " .. CONFIG.maxMonsterTypes .. " tipos de criaturas por comando."
            end
        end
        total = total + count
        if total > CONFIG.maxTotalKills then
            return nil, nil, "Maximo " .. CONFIG.maxTotalKills .. " criaturas por simulacion (seguridad de rendimiento)."
        end
    end
    return result, levelOverride, nil
end

-- Lectura de equipamento: respeta Item::getArmor/getDefense/getAttack de Canary.
-- IMPORTANTE: item:getAttribute("armor") devuelve 0 aunque NO exista override.
-- Por eso primero hay que comprobar item:hasAttribute("armor").
local EQUIPMENT_SLOTS = {
    {constant = "CONST_SLOT_HEAD",     id = 1,  label = "Helmet",        armor = true},
    {constant = "CONST_SLOT_NECKLACE", id = 2,  label = "Amulet",        armor = true},
    {constant = "CONST_SLOT_ARMOR",    id = 4,  label = "Armor",         armor = true},
    {constant = "CONST_SLOT_LEGS",     id = 7,  label = "Legs",          armor = true},
    {constant = "CONST_SLOT_FEET",     id = 8,  label = "Boots",         armor = true},
    {constant = "CONST_SLOT_RING",     id = 9,  label = "Ring",          armor = true},
    {constant = "CONST_SLOT_AMMO",     id = 10, label = "Ammo",          armor = true},
    {constant = "CONST_SLOT_RIGHT",    id = 5,  label = "Mano derecha", hand = true},
    {constant = "CONST_SLOT_LEFT",     id = 6,  label = "Mano izquierda",hand = true},
}

-- Retorna el valor REAL efectivo de la instancia: override solo si existe.
-- Los atributos omitidos usan el valor base de ItemType, igual que Item::getArmor.
local function effectiveItemStat(item, itemType, key, itemTypeMethod)
    local base = tonumber(safeCall(itemType, itemTypeMethod, 0)) or 0
    local overridden = safeCall(item, "hasAttribute", false, key) == true
    if overridden then
        local custom = tonumber(safeCall(item, "getAttribute", nil, key))
        if custom ~= nil then return custom, base, true end
    end
    return base, base, false
end

local function getGear(player)
    local gear = {
        armor = 0, shield = 0, attack = 0, skill = 0, shielding = 0,
        weapon = "sin arma", shieldName = "sin escudo", weaponType = nil,
        weaponDefense = 0, weaponExtraDefense = 0, attackInterval = 2000,
        items = {}, warnings = {}, fightMode = "desconocido", attackFactor = 1,
        blockDefense = 0, armorAvgReduction = 0
    }
    local found = 0
    for _, spec in ipairs(EQUIPMENT_SLOTS) do
        -- Fallback Tibia de posiciones, por si una constante no es global.
        local slot = _G[spec.constant]
        if type(slot) ~= "number" then slot = spec.id end
        local equipped, slotErr = safeCallWithError(player, "getSlotItem", nil, slot)
        local row = {slot = spec.label, id = 0, name = "[vacio]", armor = 0, defense = 0,
                     attack = 0, extraDefense = 0, customized = false}
        if equipped and equipped ~= false then
            local id = tonumber(safeCall(equipped, "getId", nil))
            if id and id > 0 then
                local itemType = ItemType(id)
                if itemType then
                    found = found + 1
                    row.id = id
                    row.name = tostring(safeCall(itemType, "getName", "ID " .. id))
                    row.armor, _, row.armChanged = effectiveItemStat(equipped, itemType, "armor", "getArmor")
                    row.defense, _, row.defChanged = effectiveItemStat(equipped, itemType, "defense", "getDefense")
                    row.attack, _, row.atkChanged = effectiveItemStat(equipped, itemType, "attack", "getAttack")
                    row.extraDefense, _, row.extChanged = effectiveItemStat(equipped, itemType, "extradefense", "getExtraDefense")
                    row.customized = row.armChanged or row.defChanged or row.atkChanged or row.extChanged
                    local wt = tonumber(safeCall(itemType, "getWeaponType", -1)) or -1
                    if spec.armor then
                        -- Canary Player::getArmor solo suma estas siete ranuras, sin manos.
                        gear.armor = gear.armor + math.max(0, row.armor)
                    end
                    if spec.hand then
                        if wt == WEAPON_SHIELD then
                            if row.defense >= gear.shield then
                                gear.shield = math.max(0, row.defense)
                                gear.shieldName = row.name
                                gear.shieldId = id
                            end
                        elseif wt == WEAPON_SWORD or wt == WEAPON_AXE or wt == WEAPON_CLUB
                            or wt == WEAPON_DISTANCE then
                            if row.attack >= gear.attack then
                                gear.attack = math.max(0, row.attack)
                                gear.weapon = row.name
                                gear.weaponType = wt
                                gear.weaponDefense = math.max(0, row.defense)
                                gear.weaponExtraDefense = math.max(0, row.extraDefense)
                                gear.weaponId = id
                            end
                        end
                    end
                else
                    row.name = "[ItemType no encontrado: " .. id .. "]"
                    gear.warnings[#gear.warnings+1] = "ItemType no encontrado en " .. spec.label .. ": " .. id
                end
            else
                row.name = "[getId no reconocido]"
                gear.warnings[#gear.warnings+1] = "No se pudo leer el ID de " .. spec.label
            end
        elseif slotErr and slotErr:find("metodo no disponible", 1, true) then
            gear.warnings[#gear.warnings+1] = "Player:getSlotItem no esta disponible"
        end
        gear.items[#gear.items+1] = row
    end
    gear.itemsDetected = found

    local skillType
    if gear.weaponType == WEAPON_SWORD then skillType = SKILL_SWORD
    elseif gear.weaponType == WEAPON_AXE then skillType = SKILL_AXE
    elseif gear.weaponType == WEAPON_CLUB then skillType = SKILL_CLUB
    elseif gear.weaponType == WEAPON_DISTANCE then skillType = SKILL_DISTANCE end
    if skillType ~= nil then
        gear.skill = tonumber(safeCall(player, "getEffectiveSkillLevel", nil, skillType)
                  or safeCall(player, "getSkillLevel", 0, skillType)) or 0
    end
    local shieldSkillId = SKILL_SHIELD
    if shieldSkillId == nil then shieldSkillId = 5 end
    gear.shielding = tonumber(safeCall(player, "getEffectiveSkillLevel", nil, shieldSkillId)
                    or safeCall(player, "getSkillLevel", 0, shieldSkillId)) or 0

    local vocation = safeCall(player, "getVocation", nil)
    local interval = tonumber(safeCall(vocation, "getAttackSpeed", 2000)) or 2000
    gear.attackInterval = math.max(500, interval)

    -- Modos de combate: mismos factores que Player::getAttackFactor() y
    -- Player::getDefenseFactor(true); usando una referencia estable para el reporte.
    local mode = tonumber(safeCall(player, "getFightMode", nil))
    local attackMode = _G.FIGHTMODE_ATTACK or 1
    local balancedMode = _G.FIGHTMODE_BALANCED or 2
    local defenseMode = _G.FIGHTMODE_DEFENSE or 3
    local blockFactor = 0.75
    if mode == attackMode then
        gear.fightMode, gear.attackFactor, blockFactor = "ataque", 1.0, 0.5
    elseif mode == balancedMode then
        gear.fightMode, gear.attackFactor, blockFactor = "balanceado", 0.75, 0.75
    elseif mode == defenseMode then
        gear.fightMode, gear.attackFactor, blockFactor = "defensivo", 0.5, 1.0
    else
        gear.fightMode, gear.attackFactor = "no identificado", 1.0
    end

    -- Defensa del escudo NO es solo el numero Def del objeto: interviene el skill.
    -- Formula de Player::getDefense() de esta rama (sin vocaciones/rueda/bonos).
    local hasShield = gear.shieldId ~= nil
    local hasWeapon = gear.weaponId ~= nil
    local defenseSkill = hasShield and gear.shielding or (hasWeapon and gear.skill or 0)
    local defenseValue = hasShield and (gear.shield + (hasWeapon and gear.weaponExtraDefense or 0))
        or (hasWeapon and (gear.weaponDefense + gear.weaponExtraDefense) or 7)
    local scaling = hasShield and 0.16 or ((hasWeapon and gear.weaponDefense > 0) and 0.146 or 0.15)
    gear.blockDefense = math.max(0, (defenseSkill / 4 + 2.23) * defenseValue * blockFactor * scaling)
    if defenseSkill <= 0 then gear.blockDefense = mode == defenseMode and 2 or 1 end

    -- Creature::blockHit: si armor > 3, resta uniforme(armor/2, armor - (armor%2 + 1)).
    if gear.armor > 3 then
        gear.armorAvgReduction = (math.floor(gear.armor / 2) + gear.armor - (gear.armor % 2 + 1)) / 2
    elseif gear.armor > 0 then
        gear.armorAvgReduction = 1
    end
    if found == 0 then
        gear.warnings[#gear.warnings + 1] = "No se detecto equipo en las ranuras; ejecuta /balance debug"
    end
    return gear
end
-- Basado en Weapons::getMaxWeaponDamage de los sources de Canary:
-- max = 0.085 * factor * atk * skill + level/5 (melee).
-- Aqui usamos factor neutro y promedio entre min(level/5) y max,
-- sin criticos, augments, spells ni exactitud de hit chance.
local function playerBasicDps(level, gear)
    if gear.attack <= 0 or gear.skill <= 0 then return 0 end
    local minValue = level / 5
    local maxValue = (gear.weaponType == WEAPON_DISTANCE and 0.09 or 0.085) * (gear.attackFactor or 1) * gear.attack * gear.skill + level / 5
    local mean = (minValue + maxValue) / 2
    return mean * CONFIG.autoHitChance / (gear.attackInterval / 1000)
end

local function incomingDamage(monsterType, armor, blockDefense)
    local attacks = safeCall(monsterType, "getAttackList", {})
    local rawDps, soloDps, noShieldDps, avgHit, hitRate = 0, 0, 0, 0, 0
    local meleeDps, rangedDps, hasMelee = 0, 0, false
    local armorReduction = 0
    if armor > 3 then
        armorReduction = (math.floor(armor / 2) + armor - (armor % 2 + 1)) / 2
    elseif armor > 0 then armorReduction = 1 end
    -- Creature::blockHit() calcula la defensa variable entre defense/2 y defense.
    -- Para /balance usamos su valor medio; la probabilidad de bloqueo y el tipo
    -- elemental no son conocidos por MonsterType:getAttackList().
    local blockReduction = math.max(0, blockDefense or 0) * 0.75
    for _, attack in ipairs(attacks or {}) do
        local low = math.abs(tonumber(attack.minCombatValue) or 0)
        local high = math.abs(tonumber(attack.maxCombatValue) or 0)
        if low > high then low, high = high, low end
        local avg = (low + high) / 2
        local speed = tonumber(attack.speed) or 2000
        if speed <= 0 then speed = 2000 end
        local chance = clamp(attack.chance or 100, 0, 100) / 100
        local procsPerSecond = 1000 / speed * chance
        local melee = attack.isMelee == 1 or attack.isMelee == true
        if procsPerSecond > 0 and avg > 0 then
            local afterArmor = melee and math.max(0, avg - armorReduction) or avg
            local afterShield = melee and math.max(0, afterArmor - blockReduction) or afterArmor
            rawDps = rawDps + avg * procsPerSecond
            noShieldDps = noShieldDps + afterArmor * procsPerSecond
            soloDps = soloDps + afterShield * procsPerSecond
            avgHit = avgHit + afterShield * procsPerSecond
            hitRate = hitRate + procsPerSecond
            if melee then
                hasMelee = true
                meleeDps = meleeDps + afterShield * procsPerSecond
            else rangedDps = rangedDps + afterShield * procsPerSecond end
        end
    end
    return {raw = rawDps, solo = soloDps, noShield = noShieldDps,
            avgHit = hitRate > 0 and avgHit / hitRate or 0,
            melee = meleeDps, special = rangedDps, attacks = #attacks, hasMelee = hasMelee}
end
local function expRequired(level)
    -- Canary expone Game.getExperienceForLevel(level) como funcion estatica:
    -- NO pasar Game como primer argumento, a diferencia de Player:getLevel().
    if Game and type(Game.getExperienceForLevel) == "function" then
        local ok, result = pcall(Game.getExperienceForLevel, level)
        if ok and tonumber(result) then return tonumber(result) end
    end
    return (50 * level * level * level - 300 * level * level + 850 * level - 600) / 3
end

local function stageMultiplier(level)
    local stages = experienceStages
    if type(stages) ~= "table" or #stages == 0 then stages = CONFIG.fallbackStages end
    local selected = 1
    for _, stage in ipairs(stages) do
        local minLevel = tonumber(stage.minlevel) or 1
        local maxLevel = tonumber(stage.maxlevel) or math.huge
        if level >= minLevel and level <= maxLevel then
            selected = tonumber(stage.multiplier) or 1
            break
        end
    end
    return selected
end

local function gainXp(level, monsterBaseXp)
    -- Esta version de Frozen Hell usa rateUseStages=true (una etapa x1).
    -- Si se cambia data/stages.lua, mantener este archivo actualizado.
    if CONFIG.fallbackRateUseStages then
        return round(monsterBaseXp * stageMultiplier(level))
    end
    return round(monsterBaseXp * CONFIG.fallbackRateExp)
end

local function addLoot(target, id, count)
    target[id] = (target[id] or 0) + count
end

local function newReport(player, entries, overriddenLevel)
    local actualLevelRaw, levelError = safeCallWithError(player, "getLevel", nil)
    local actualLevel = tonumber(actualLevelRaw)
    if not actualLevel or actualLevel < 1 then
        return nil, "Canary no pudo leer Player:getLevel(): " .. tostring(levelError)
    end
    local currentMaxHP, hpError = safeCallWithError(player, "getMaxHealth", nil)
    if tonumber(currentMaxHP) == nil or tonumber(currentMaxHP) <= 0 then
        return nil, "Canary no pudo leer Player:getMaxHealth(): " .. tostring(hpError)
    end
    local level = overriddenLevel or actualLevel
    local startingXP
    if overriddenLevel then startingXP = expRequired(level)
    else
        local readXP, xpError = safeCallWithError(player, "getExperience", nil)
        startingXP = tonumber(readXP)
        if not startingXP then
            return nil, "Canary no pudo leer Player:getExperience(): " .. tostring(xpError)
        end
    end
    local xp = startingXP
    local totalBaseXp, totalXp, totalKills = 0, 0, 0
    local gear = getGear(player)
    local initialBasicDps = playerBasicDps(level, gear)
    local totalLoot, totalLootGp, unsoldCount, groupSoloDps, groupNoShieldDps = {}, 0, 0, 0, 0
    local totalSequentialDamage, totalSequentialSeconds, canEstimateSequence = 0, 0, initialBasicDps > 0
    local groupShieldCredit, meleeEnemies = 0, 0
    for _, entry in ipairs(entries) do
        local monsterType = entry.type
        local monsterHP, hpIssue = safeCallWithError(monsterType, "maxHealth", nil)
        if monsterHP == nil then monsterHP, hpIssue = safeCallWithError(monsterType, "health", nil) end
        entry.health = tonumber(monsterHP)
        if not entry.health or entry.health <= 0 then
            return nil, "No se pudo leer el HP de '" .. tostring(entry.name) .. "' (maxHealth/health): " .. tostring(hpIssue)
        end
        local monsterXP, expIssue = safeCallWithError(monsterType, "experience", nil)
        entry.baseXp = tonumber(monsterXP)
        if entry.baseXp == nil or entry.baseXp < 0 then
            return nil, "No se pudo leer la experiencia de '" .. tostring(entry.name) .. "': " .. tostring(expIssue)
        end
        local attacks, attackIssue = safeCallWithError(monsterType, "getAttackList", nil)
        if type(attacks) ~= "table" then
            return nil, "No se pudo leer getAttackList de '" .. tostring(entry.name) .. "': " .. tostring(attackIssue)
        end
        entry.attackCount = #attacks
        entry.damage = incomingDamage(monsterType, gear.armor, gear.blockDefense)
        entry.damage10 = entry.damage.solo * CONFIG.previewSeconds
        groupSoloDps = groupSoloDps + entry.damage.solo * entry.count
        groupNoShieldDps = groupNoShieldDps + entry.damage.noShield * entry.count
        groupShieldCredit = groupShieldCredit + (entry.damage.noShield - entry.damage.solo) * entry.count
        if entry.damage.hasMelee then meleeEnemies = meleeEnemies + entry.count end
        local playerDpsOnMob = initialBasicDps
        -- Estimamos reduccion por armadura del monstruo, sin conocer todo su combate.
        local mobArmor = tonumber(safeCall(monsterType, "armor", 0)) or 0
        local mobMitigation = tonumber(safeCall(monsterType, "mitigation", 0)) or 0
        if mobMitigation > 1 then mobMitigation = mobMitigation / 100 end
        playerDpsOnMob = math.max(0, playerDpsOnMob - mobArmor * CONFIG.armorReduction / (gear.attackInterval / 1000))
        playerDpsOnMob = playerDpsOnMob * (1 - clamp(mobMitigation, 0, 0.95))
        entry.outgoingDps = playerDpsOnMob
        entry.killSeconds = (entry.health > 0 and playerDpsOnMob > 0)
            and math.max(gear.attackInterval / 1000, entry.health / playerDpsOnMob) or nil
        if not entry.killSeconds then canEstimateSequence = false
        else
            totalSequentialDamage = totalSequentialDamage + entry.killSeconds * entry.damage.solo * entry.count
            totalSequentialSeconds = totalSequentialSeconds + entry.killSeconds * entry.count
        end

        for _ = 1, entry.count do
            local ok, rolls = pcall(function()
                return monsterType:generateLootRoll(CONFIG.lootConfig, {}, player)
            end)
            if not ok or type(rolls) ~= "table" then
                return nil, "No se pudo generar el loot de " .. entry.name .. ". generateLootRoll: " .. tostring(rolls)
            end
            for itemId, dropped in pairs(rolls) do
                local id = tonumber(itemId)
                local count = type(dropped) == "table" and tonumber(dropped.count) or 0
                if id and count and count > 0 then
                    addLoot(entry.loot, id, count)
                    addLoot(totalLoot, id, count)
                end
            end
            totalKills = totalKills + 1
            totalBaseXp = totalBaseXp + entry.baseXp
            local earned = gainXp(level, entry.baseXp)
            totalXp = totalXp + earned
            entry.xpEarned = (entry.xpEarned or 0) + earned
            xp = xp + earned
            -- Avanzar etapa cuando aumenta el nivel, aplicando el orden solicitado.
            local safety = 0
            while xp >= expRequired(level + 1) and safety < 100000 do
                level = level + 1
                safety = safety + 1
            end
        end
        entry.lootGp = 0
        entry.unknownCount = 0
        for id, count in pairs(entry.loot) do
            local price, known = getNpcPrice(id)
            if known then entry.lootGp = entry.lootGp + count * price
            else entry.unknownCount = entry.unknownCount + count end
        end
        totalLootGp = totalLootGp + entry.lootGp
        unsoldCount = unsoldCount + entry.unknownCount
    end
    return {
        actualLevel=actualLevel, startingLevel=overriddenLevel or actualLevel, finalLevel=level,
        startingXP=startingXP, finalXP=xp, totalBaseXp=totalBaseXp,totalXp=totalXp,
        kills=totalKills, gear=gear, initialBasicDps=initialBasicDps,
        loot=totalLoot, lootGp=totalLootGp, unknownCount=unsoldCount,
        groupSoloDps=groupSoloDps,
        groupConcurrentDps = math.max(0,groupNoShieldDps - groupShieldCredit * math.min(1, 2 / math.max(1,meleeEnemies))),
        groupNoShieldDps=groupNoShieldDps,
        sequentialDamage=canEstimateSequence and totalSequentialDamage or nil,
        sequentialSeconds=canEstimateSequence and totalSequentialSeconds or nil
    }
end

local function getSortedLoot(loot)
    local rows = {}
    for id, count in pairs(loot) do
        local price, known = getNpcPrice(id)
        rows[#rows + 1] = {id=id, count=count, name=itemName(id),price=price,known=known, subtotal=count*price}
    end
    table.sort(rows,function(a,b)
        if a.subtotal ~= b.subtotal then return a.subtotal > b.subtotal end
        if a.count ~= b.count then return a.count > b.count end
        return a.name < b.name
    end)
    return rows
end

local function formatReport(player, entries, report, overriddenLevel)
    local lines = {}
    local function say(line) lines[#lines+1] = line end
    say("FROZEN HELL | BALANCE MULTI v2.4")
    say("LOOT + DPS DE GRUPO")
    say("================================")
    say("Jugador: " .. safeCall(player, "getName", "Player") .. " | Lv " .. report.startingLevel
        .. (overriddenLevel and " (nivel simulado)" or " (nivel actual)"))
    say("HP: " .. fmt(safeCall(player,"getHealth",0)) .. "/" .. fmt(safeCall(player,"getMaxHealth",0))
        .. " | ARMADURA TOTAL " .. fmt(report.gear.armor))
    say("Escudo: " .. report.gear.shieldName .. " | Def " .. fmt(report.gear.shield)
        .. " | Shielding " .. fmt(report.gear.shielding))
    say(string.format("Defensa de bloqueo estimada: %.1f | Bloqueo medio ~%.1f (si aplica)",
        report.gear.blockDefense, report.gear.blockDefense * 0.75))
    say(string.format("Reduccion media de armadura: %.1f por golpe fisico (si aplica)",
        report.gear.armorAvgReduction))
    say("Arma: " .. report.gear.weapon .. " (Atk " .. fmt(report.gear.attack) .. ", skill " .. fmt(report.gear.skill) .. ")")
    say("Modo combate: " .. report.gear.fightMode)
    say("Criaturas: " .. fmt(report.kills))
    say("")
    say("EQUIPO DETECTADO EN CANARY:")
    for _, piece in ipairs(report.gear.items) do
        if piece.id > 0 then
            local properties = {}
            if piece.armor > 0 then properties[#properties + 1] = "Arm " .. fmt(piece.armor) end
            if piece.defense > 0 then properties[#properties + 1] = "Def " .. fmt(piece.defense) end
            if piece.attack > 0 then properties[#properties + 1] = "Atk " .. fmt(piece.attack) end
            say("- " .. piece.slot .. ": " .. piece.name .. " (" .. fmt(piece.id) .. ")"
                .. (#properties > 0 and " | " .. table.concat(properties, ", ") or "")
                .. (piece.customized and " [ATTR MODIFICADO]" or ""))
        else
            say("- " .. piece.slot .. ": " .. piece.name)
        end
    end
    for _, warning in ipairs(report.gear.warnings) do say("AVISO EQUIPO: " .. warning) end
    say("")
    say("1) ATAQUES Y DPS RECIBIDO (ESTIMADO)")
    for _, e in ipairs(entries) do
        say(string.format("%s x%d | HP %s | DPS 1: %.1f | Hit medio: %.1f",
            e.name, e.count, fmt(e.health), e.damage.solo, e.damage.avgHit))
        say(string.format("   DPS sin defensa %.1f -> con armadura %.1f -> con bloqueo %.1f",
            e.damage.raw, e.damage.noShield, e.damage.solo))
        say(string.format("   DPS simultaneo x%d: %.1f | Dmg 10s (una): %.0f | Ataques: %d", e.count,
            e.damage.solo * e.count, e.damage10, e.attackCount or 0))
        if (e.attackCount or 0) == 0 then say("   [Sin ataques declarados en MonsterType:getAttackList()]") end
    end
    say(string.format("TOTAL si atacan TODOS juntos: %.1f DPS", report.groupConcurrentDps))
    say(string.format("Dano en %ds (todos a la vez): %s HP", CONFIG.previewSeconds,
        fmt(report.groupConcurrentDps * CONFIG.previewSeconds)))
    if report.groupNoShieldDps > report.groupConcurrentDps + 0.001 then
        say(string.format("Sin aplicar escudo: %.1f DPS simultaneo", report.groupNoShieldDps))
    end
    local health = tonumber(safeCall(player,"getHealth",0)) or 0
    if report.groupConcurrentDps > 0 and health > 0 then
        say(string.format("Resistencia sin curarte, todos juntos: %.1fs",health/report.groupConcurrentDps))
    end
    say("")
    say("2) DANO DEL JUGADOR (SOLO ATAQUES BASICOS)")
    if report.initialBasicDps > 0 then
        say(string.format("DPS basico aproximado: %.1f | sin spells", report.initialBasicDps))
        for _, e in ipairs(entries) do
            if e.killSeconds then
                say(string.format("%s | DPS jugador %.1f | aprox %.1fs/mob | dano recibido %.0f HP/mob",
                    e.name, e.outgoingDps, e.killSeconds, e.killSeconds * e.damage.solo))
            end
        end
        if report.sequentialDamage then
            say("Dano acumulado estimado, uno por uno: " .. fmt(report.sequentialDamage) .. " HP")
            say(string.format("Duracion estimada uno por uno: %.1fs", report.sequentialSeconds))
        end
    else
        say("No se pudo estimar DPS de autoataques: arma o skill no reconocidos.")
        say("Verifica el arma equipada y el tipo de weapon en items.xml.")
    end
    say("")
    say("3) EXPERIENCIA Y NIVEL")
    for _, e in ipairs(entries) do
        say(e.name .. " x" .. e.count .. " | XP base: " .. fmt(e.baseXp) .. " c/u | XP estimada: " .. fmt(e.xpEarned or 0))
    end
    say("EXP BASE total: " .. fmt(report.totalBaseXp))
    say("EXP con stages estimada: " .. fmt(report.totalXp))
    say("Nivel inicial -> final estimado: " .. report.startingLevel .. " -> " .. report.finalLevel)
    say("XP restante al siguiente nivel: " .. fmt(math.max(0, expRequired(report.finalLevel + 1) - report.finalXP)))
    say("")
    say("4) LOOT REALMENTE SORTEADO")
    for _, e in ipairs(entries) do
        say(e.name .. " x" .. e.count .. ": " .. fmt(e.lootGp) .. " gp"
            .. (e.unknownCount > 0 and (" (sin precio: " .. fmt(e.unknownCount) .. " uds.)") or ""))
    end
    say("--------------------------------")
    local lootRows = getSortedLoot(report.loot)
    for _, item in ipairs(lootRows) do
        say(string.format("%sx %s: %s gp%s", fmt(item.count), item.name, fmt(item.subtotal),
            item.known and "" or " [SIN PRECIO NPC]"))
    end
    if #lootRows == 0 then say("No cayo ningun objeto en las tiradas.") end
    say("--------------------------------")
    say("LOOT VALORADO TOTAL: " .. fmt(report.lootGp) .. " gp")
    if report.unknownCount > 0 then say("Loot sin precio: " .. fmt(report.unknownCount) .. " unidades") end
    say("")
    say("NOTAS:")
    say("- Loot: " .. report.kills .. " tiradas generateLootRoll (factor 1, gut false).")
    say("- DPS/dano: aproximaciones fisicas, sin buffs, imbuements, augments ni resists elementales.")
    say("- Armor efectiva se lee del item base o atributo personalizado, por ranura.")
    say("- Defensa del escudo incluye shielding y modo de combate (formula aproximada Canary).")
    say("- El bloqueo depende de ataques entrantes: no se modelan todas las probabilidades.")
    say("- Armor total es suma del equipo; multiplicadores de vocacion no se consultan.")
    say("- La API getAttackList no expone el tipo elemental de cada hechizo.")
    say("- Algunos hechizos de mana drain/DoT no se distinguen del dano HP en esta API.")
    say("- DPS simultaneo supone TODAS las criaturas atacando a la vez; bloqueos aprox max 2.")
    say("- La estimacion 1x1 usa solo autoataques; sin spells ni curacion.")
    say("- EXP: usa experienceStages si estan cargados o el stage de respaldo x1.")
    say("- No aplica stamina, prey, boosts ni bono de EXP de nivel bajo.")
    if overriddenLevel then say("- Nivel personalizado empieza en 0% de ese nivel; equipo real del personaje.") end
    say("- Comando de solo lectura, no altera al personaje.")
    return table.concat(lines,"\n")
end

-- Ventana desplazable en cliente Tibia. Solo muestra texto, no modifica el jugador.
-- Canary admite un item por nombre y permite pasar longitud explicita del texto.
local function showScrollableReport(player, message)
    local reportText = tostring(message or "")
    local ok, result = pcall(function()
        return player:showTextDialog("book", reportText, false, #reportText)
    end)
    if ok and result then return true end

    -- Respaldo: ID empleado en las versiones anteriores del reporte.
    ok, result = pcall(function()
        return player:showTextDialog(3043, reportText, false, #reportText)
    end)
    if ok and result then return true end

    player:sendCancelMessage("No se pudo abrir la ventana de reporte. Comprueba Player:showTextDialog().")
    return false
end

function simulateLoot.onSay(player, words, param)
    local requested = trim(param):lower()
    if requested == "diagnostico" or requested == "debug" then
        local lines = {"FROZEN HELL | /balance diagnostico v2.4"}
        local methods = {"getName", "getLevel", "getExperience", "getHealth", "getMaxHealth"}
        for _, method in ipairs(methods) do
            local value, issue = safeCallWithError(player, method, nil)
            lines[#lines + 1] = method .. ": " .. tostring(value) .. (issue and (" [" .. issue .. "]") or "")
        end
        local rat = MonsterType("rat")
        if rat then
            for _, method in ipairs({"name", "health", "maxHealth", "experience", "getAttackList"}) do
                local value, issue = safeCallWithError(rat, method, nil)
                if method == "getAttackList" and type(value) == "table" then value = #value .. " ataques" end
                lines[#lines + 1] = "rat:" .. method .. ": " .. tostring(value) .. (issue and (" [" .. issue .. "]") or "")
            end
        else
            lines[#lines + 1] = "MonsterType('rat'): no disponible"
        end
        local gear = getGear(player)
        lines[#lines + 1] = "Equipo: " .. gear.weapon .. ", ataque=" .. gear.attack .. ", skill=" .. gear.skill
        lines[#lines + 1] = "Armadura total=" .. gear.armor .. " | Escudo=" .. gear.shieldName .. " Def " .. gear.shield
            .. " | Skill shield=" .. gear.shielding .. " | Bloqueo aprox=" .. string.format("%.1f", gear.blockDefense)
        lines[#lines + 1] = "MODO COMBATE: " .. gear.fightMode
        for _, piece in ipairs(gear.items) do
            lines[#lines+1] = piece.slot .. ": " .. piece.name .. " [" .. piece.id .. "] Arm " .. piece.armor
                .. " Def " .. piece.defense .. " Atk " .. piece.attack
                .. (piece.customized and " (custom)" or "")
        end
        for _, warning in ipairs(gear.warnings) do lines[#lines+1] = "AVISO: " .. warning end
        showScrollableReport(player, table.concat(lines, "\n"))
        return true
    end
    if requested == "version" or requested == "ayuda" or requested == "help" then
        showScrollableReport(player, 
            "FROZEN HELL | BALANCE MULTI v2.4\n" ..
            "Comando multi-criatura ACTIVO.\n\n" ..
            "Diagnostico: /balance debug\n" ..
            "Ejemplos:\n" ..
            "/balance rat, 16, cave rat, 10, slime, 6, slug, 4\n" ..
            "/balance lvl 300, rat, 16, cave rat, 10\n\n" ..
            "Aviso: elimina TODAS las versiones viejas que registren /balance."
        )
        return true
    end
    local entries, override, err = parseInput(param)
    if not entries then
        player:sendCancelMessage(err)
        return true
    end
    local result, reportOrError, msg = pcall(newReport, player, entries, override)
    if not result then
        player:sendCancelMessage("/balance error interno: " .. tostring(reportOrError))
        return true
    end
    if reportOrError == nil then
        player:sendCancelMessage(msg or "No se pudo simular loot.")
        return true
    end
    local report = formatReport(player, entries, reportOrError, override)
    -- Siempre mostrar un unico reporte completo con scroll vertical.
    showScrollableReport(player, report)
    return true
end

simulateLoot:separator(" ")
simulateLoot:groupType("god") -- Igual que tu script original; cambia a "normal" si quieres que todos lo usen.
simulateLoot:register()

-- Comando de verificacion independiente: confirma si ESTA version fue cargada.
-- Si /balancecheck funciona pero /balance usa otro formato,
-- algun otro archivo antiguo sigue registrando /balance.
local checkLoot = TalkAction("/balancecheck")
function checkLoot.onSay(player, words, param)
    showScrollableReport(player, 
        "FROZEN HELL | BALANCE MULTI v2.4\n" ..
        "Script nuevo cargado correctamente.\n" ..
        "Diagnostico: /balance debug\n" ..
        "Para probar /balance:\n" ..
        "/balance rat, 16, cave rat, 10, slime, 6, slug, 4\n" ..
        "/balance lvl 300, rat, 16, cave rat, 10\n\n" ..
        "Si aparece otro formato, revisa scripts antiguos que registren /balance."
    )
    return true
end
checkLoot:separator(" ")
checkLoot:groupType("god")
checkLoot:register()
