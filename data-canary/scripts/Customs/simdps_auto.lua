-- FROZEN HELL | !simdps demon [,cantidad] | AUTO SIMULATOR v3.4
-- Install only this file in data-canary/scripts/talkactions/ (prices embedded).
-- READ-ONLY: never removes items, creates monsters or changes player stats.
-- Based on existing Knight/EK spells and potion scripts in pr-level-limit (Nov 2026).
-- ATTENTION: approximate statistical model, not the full C++ combat engine.

local CFG = {
    command = '!simdps',
    maxSimMinutes = 120,          -- safety limit, NOT a hunt duration (stops when target defeated)
    maxTargets = 200,             -- optional: !simdps demon, 20
    timeStep = 0.5,               -- model resolution in seconds
    downtime = 1,                 -- walk/target-acquisition time between kills (approximation)
    maxLevel = 50000,
    userCooldown = 3,             -- seconds between reports for same player
    potionCooldown = 1,          -- approximate in-game action timing
    foodCooldown = 2,            -- food.lua reported exhaustion, simplified common timer
    includeDirectional = false,  -- exori min cannot be guaranteed to hit
    includeCustomSpells = false, -- custom quest / vocation spells not included
    allowOffensiveRunes = true,  -- rune only used as fallback between melee spells
    allowHealingRunes = true,
    useSuperFood = true,
    sampleStartFull = false,      -- FALSE: use currently observed HP/mana
    lootFactor = 1.0,             -- exact /loot script: generateLootRoll({factor=1.0,gut=false}, {}, player)
    maxLootLines = 25,            -- compact popup; full totals include all drops
    expFallback = 1,              -- used only when stage lookup unavailable
}

local function val(v, fallback) return tonumber(v) or fallback end
local function clamp(v, a, b) return math.max(a, math.min(b, v)) end
local function rounded(v) return math.floor(v + 0.5) end
local function f(v) return string.format('%.1f', v or 0) end
local function nf(v)
    local s = string.format('%.0f', v or 0)
    local rep
    repeat s, rep = s:gsub('^(-?%d+)(%d%d%d)', '%1,%2') until rep == 0
    return s
end
local function trim(s) return tostring(s or ''):gsub('^%s+', ''):gsub('%s+$', '') end
local function sample(lo, hi)
    lo, hi = math.min(lo,hi), math.max(lo,hi)
    -- approx. normal_random C++, not identical
    return lo + (hi-lo) * (math.random()+math.random())/2
end
local function call(obj, method, ...)
    if not obj then return nil end
    local ok, result = pcall(function(...) return obj[method](obj, ...) end, ...)
    if ok then return result end
    return nil
end
local function minmax(a,b) return math.min(a,b), math.max(a,b) end
local function expForLevel(lvl)
    return math.floor(((((lvl-6)*lvl+17)*lvl-12)/6))*100
end
local function getStages()
    if type(experienceStages) == 'table' and #experienceStages > 0 then return experienceStages end
    local ok = pcall(dofile, 'data/stages.lua')
    if ok and type(experienceStages) == 'table' and #experienceStages > 0 then return experienceStages end
    return nil
end
local EXP_STAGES = getStages()
local function expRate(level)
    if EXP_STAGES then
        for _,s in ipairs(EXP_STAGES) do
            local low = val(s.minlevel or s.minLevel, 1)
            local high = val(s.maxlevel or s.maxLevel, math.huge)
            if level >= low and level <= high then return val(s.multiplier, CFG.expFallback) end
        end
    end
    return CFG.expFallback
end

-- Original server formulas from data/scripts/spells/attack/*.lua.
local ATTACK = {
    {key='exori gran ico', level=110, mana=300, cd=30, fn=function(l,s,a) return (s*a*.17+13+l/5)*1.28,(s*a*.20+34+l/5)*1.28 end},
    {key='exori gran', level=90, mana=340, cd=6, fn=function(l,s,a) return (l/5+(s+a)*.5)*1.43,(l/5+(s+a)*1.5)*1.43 end},
    {key='exori ico', level=16, mana=30, cd=6, fn=function(l,s,a) return (s*a*.02+4+l/5)*1.28,(s*a*.04+9+l/5)*1.28 end},
    {key='exori', level=35, mana=115, cd=4, fn=function(l,s,a) return (l/5+(s+a)*.5)*1.10,(l/5+(s+a)*1.5)*1.10 end},
    {key='exori mas', level=33, mana=160, cd=8, fn=function(l,s,a) return (l/5+(s+a)*.5)*1.28,(l/5+(s+a)*1.1)*1.28 end},
    {key='exori hur', level=28, mana=40, cd=6, fn=function(l,s,a) return (l/5+(s+a)/3)*1.28,(l/5+s+a)*1.28 end},
}
local DIRECTIONAL = {key='exori min',level=70,mana=200,cd=6,fn=function(l,s,a) return ((s*a*.04+31)+l/5)*1.1, ((s*a*.08+45)+l/5)*1.1 end}
if CFG.includeDirectional then ATTACK[#ATTACK+1]=DIRECTIONAL end
local HEALS = {
    {key='exura gran ico',level=80,mana=200,cd=600,fn=function(l,ml) return l*.2+ml*70+438,l*.2+ml*92+544 end},
    {key='exura med ico',level=300,mana=90,cd=1,fn=function(l,ml) return (l*.2+ml*4+25)*2,(l*.2+ml*7.95+51)*2 end},
    {key='exura ico',level=8,mana=40,cd=1,fn=function(l,ml) return l*.2+ml*4+25,l*.2+ml*7.95+51 end},
}

-- Exact potion level gates and healing ranges from data/scripts/actions/items/potions.lua.
-- Purchase prices from data-canary/npc/Malak.lua; names in Malak may differ from item names.
local POTIONS = {
    [266]={name='Health Potion',kind='hp',req=1,lo=125,hi=175,cost=50},
    [236]={name='Strong Health',kind='hp',req=50,lo=250,hi=350,cost=115},
    [239]={name='Great Health',kind='hp',req=80,lo=425,hi=575,cost=225},
    [7643]={name='Ultimate Health',kind='hp',req=130,lo=650,hi=850,cost=379},
    [23375]={name='Supreme Health',kind='hp',req=200,lo=875,hi=1125,cost=625},
    [51246]={name='Angelic Health',kind='hp',req=500,lo=1875,hi=2025,cost=738},
    [50965]={name='Extreme Spirit (Knight HP)',kind='hp',req=1000,lo=2575,hi=2925,cost=938},
    [51702]={name='Obscure Health',kind='hp',req=2500,lo=4875,hi=5125,cost=1379},
    [53144]={name='Eternal Health',kind='hp',req=5000,lo=6875,hi=7125,cost=1579},
    [50384]={name='Legendary Health',kind='hp',req=10000,lo=10875,hi=11125,cost=1779},
    [268]={name='Mana Potion',kind='mana',req=1,lo=75,hi=125,cost=56},
    [237]={name='Strong Mana Potion',kind='mana',req=50,lo=115,hi=185,cost=93},
}
-- Exact Superfood.hp + HP% and mana + mana% from Customs/Superfood.lua.
local FOOD = {
    [3578]={name='Fish',hp=50,hpPct=1,mana=50,manaPct=1,cost=nil},
    [3579]={name='Salmon',hp=200,hpPct=3,mana=200,manaPct=3,cost=nil},
    [3580]={name='Northern Pike',hp=150,hpPct=2,mana=100,manaPct=1.5,cost=nil},
    [3581]={name='Shrimp',hp=400,hpPct=4,mana=250,manaPct=2.5,cost=nil},
    [7159]={name='Green Perch',hp=350,hpPct=3.5,mana=500,manaPct=5,cost=nil},
    [7158]={name='Rainbow Trout',hp=550,hpPct=6,mana=550,manaPct=6,cost=nil},
}
-- Supported attack/healing runes with real level and magic level restrictions.
-- Additional runes in backpack are counted but not simulated until formula verified.
local RUNES = {
    [3155]={name='Sudden Death',kind='attack',level=45,ml=15,cost=135,element='death',fn=function(l,ml) return l/5+ml*4.605+28,l/5+ml*7.395+46 end},
    [3161]={name='Avalanche',kind='attack',level=30,ml=4,cost=57,element='ice',fn=function(l,ml) return l/5+ml*1.2+7,l/5+ml*2.8+17 end},
    [3191]={name='Great Fireball',kind='attack',level=30,ml=4,cost=57,element='fire',fn=function(l,ml) return l/5+ml*1.2+7,l/5+ml*2.8+17 end},
    [3175]={name='Stone Shower',kind='attack',level=28,ml=4,cost=37,element='earth',fn=function(l,ml) return l/5+ml*1+6,l/5+ml*2.6+16 end},
    [3202]={name='Thunderstorm',kind='attack',level=28,ml=4,cost=47,element='energy',fn=function(l,ml) return l/5+ml*1+6,l/5+ml*2.6+16 end},
    [3158]={name='Icicle',kind='attack',level=28,ml=4,cost=30,element='ice',fn=function(l,ml) return l/5+ml*1.81+10,l/5+ml*3+18 end},
    [3198]={name='Heavy Magic Missile',kind='attack',level=25,ml=3,cost=12,element='energy',fn=function(l,ml) return l/5+ml*.4+2,l/5+ml*1.59+10 end},
    [3160]={name='Ultimate Healing Rune',kind='heal',level=24,ml=4,cost=175,fn=function(l,ml) return l/5+ml*7.3+42,l/5+ml*12.4+90 end},
    [3152]={name='Intense Healing Rune',kind='heal',level=15,ml=1,cost=95,fn=function(l,ml) return l/5+ml*3.2+20,l/5+ml*5.4+40 end},
}

-- SELF-CONTAINED NPC PRICES, generated from the /loot script uploaded by the server owner.
-- Name first, unique clientId fallback when the ItemType name has been customized.
 -- Missing prices remain unknown; no values are invented.
local NPC_PRICES = {
    ["abomination's eye"] = 650000,
    ["abomination's tail"] = 700000,
    ["abomination's tongue"] = 900000,
    ["abyss hammer"] = 20000,
    ["acorn"] = 10,
    ["afflicted strider head"] = 900,
    ["afflicted strider worms"] = 500,
    ["albino plate"] = 1500,
    ["alloy legs"] = 11000,
    ["alptramun's toothbrush"] = 270000,
    ["amber"] = 20000,
    ["amber staff"] = 200000,
    ["amber with a bug"] = 41000,
    ["amber with a dragonfly"] = 56000,
    ["ancient amulet"] = 200,
    ["ancient belt buckle"] = 260,
    ["ancient coin"] = 350,
    ["ancient liche bone"] = 28000,
    ["angel figurine"] = 36000,
    ["angelic axe"] = 5000,
    ["ankh"] = 100,
    ["antlers"] = 50,
    ["ape fur"] = 120,
    ["apron"] = 1300,
    ["arcane staff"] = 100000,
    ["assassin dagger"] = 20000,
    ["assassin star"] = 300000,
    ["axe"] = 7,
    ["axe ring"] = 100,
    ["badger fur"] = 15,
    ["bamboo stick"] = 30,
    ["banana sash"] = 55,
    ["bandana"] = 150,
    ["bar of gold"] = 10000,
    ["basalt core"] = 5800,
    ["basalt crumbs"] = 3000,
    ["basalt fetish"] = 210,
    ["basalt figurine"] = 160,
    ["bashmu fang"] = 600,
    ["bashmu feather"] = 350,
    ["bashmu tongue"] = 400,
    ["bat decoration"] = 2000,
    ["bat wing"] = 50,
    ["battle axe"] = 80,
    ["battle hammer"] = 120,
    ["battle shield"] = 95,
    ["batwing hat"] = 8000,
    ["bear paw"] = 100,
    ["beast's nightmare-cushion"] = 630000,
    ["beastslayer axe"] = 1500,
    ["bed of nails"] = 500,
    ["beer tap"] = 50,
    ["beetle carapace"] = 200,
    ["beetle necklace"] = 1500,
    ["behemoth claw"] = 2000,
    ["berserker"] = 40000,
    ["black hood"] = 190,
    ["black pearl"] = 280,
    ["black shield"] = 800,
    ["black wool"] = 300,
    ["blacksteel sword"] = 6000,
    ["blazing bone"] = 610,
    ["blemished spawn abdomen"] = 550,
    ["blemished spawn head"] = 800,
    ["blemished spawn tail"] = 1000,
    ["blessed sceptre"] = 40000,
    ["bloated maggot"] = 5200,
    ["blood preservation"] = 320,
    ["blood tincture in a vial"] = 360,
    ["blooded worm"] = 4700,
    ["bloody dwarven beard"] = 110,
    ["bloody pincers"] = 100,
    ["bloody tears"] = 70000,
    ["blue crystal shard"] = 1500,
    ["blue crystal splinter"] = 400,
    ["blue gem"] = 5000,
    ["blue glass plate"] = 60,
    ["blue goanna scale"] = 230,
    ["blue piece of cloth"] = 200,
    ["blue robe"] = 10000,
    ["boggy dreads"] = 200,
    ["bola"] = 35,
    ["bone club"] = 5,
    ["bone fetish"] = 150,
    ["bone shield"] = 80,
    ["bone shoulderplate"] = 150,
    ["bone sword"] = 20,
    ["bone toothpick"] = 150,
    ["bonebreaker"] = 10000,
    ["bonecarving knife"] = 190,
    ["bonelord eye"] = 80,
    ["bonelord helmet"] = 7500,
    ["bonelord shield"] = 1200,
    ["bones of zorvorax"] = 10000,
    ["bony tail"] = 210,
    ["book of necromantic rituals"] = 180,
    ["book of prayers"] = 120,
    ["book page"] = 640,
    ["boots of haste"] = 30000,
    ["bow"] = 100,
    ["bowl of terror sweat"] = 500,
    ["brain head's giant neuron"] = 100000,
    ["brain head's left hemisphere"] = 90000,
    ["brain head's right hemisphere"] = 50000,
    ["brainstealer's brain"] = 300000,
    ["brainstealer's brainwave"] = 440000,
    ["brainstealer's tissue"] = 240000,
    ["brass armor"] = 150,
    ["brass helmet"] = 30,
    ["brass legs"] = 49,
    ["brass shield"] = 25,
    ["bright bell"] = 220,
    ["brimstone fangs"] = 380,
    ["brimstone shell"] = 210,
    ["broadsword"] = 500,
    ["broken bell"] = 150,
    ["broken crossbow"] = 30,
    ["broken draken mail"] = 340,
    ["broken halberd"] = 100,
    ["broken helmet"] = 20,
    ["broken iks cuirass"] = 640,
    ["broken iks faulds"] = 530,
    ["broken iks headpiece"] = 560,
    ["broken iks sandals"] = 440,
    ["broken key ring"] = 8000,
    ["broken longbow"] = 130,
    ["broken macuahuitl"] = 1000,
    ["broken ring of ending"] = 4000,
    ["broken shamanic staff"] = 35,
    ["broken slicer"] = 120,
    ["broken throwing axe"] = 230,
    ["broken visor"] = 1900,
    ["bronze amulet"] = 50,
    ["brooch of embracement"] = 14000,
    ["brown crystal splinter"] = 400,
    ["brown piece of cloth"] = 100,
    ["brutetamer's staff"] = 1500,
    ["buckle"] = 7000,
    ["bunch of troll hair"] = 30,
    ["bundle of cursed straw"] = 800,
    ["butcher's axe"] = 18000,
    ["butterfly ring"] = 2000,
    ["calopteryx cape"] = 15000,
    ["capricious heart"] = 2100,
    ["capricious robe"] = 1200,
    ["carapace shield"] = 32000,
    ["carlin sword"] = 118,
    ["carniphila seeds"] = 50,
    ["carnisylvan bark"] = 230,
    ["carnisylvan finger"] = 250,
    ["carnivostrich feather"] = 630,
    ["carrion worm fang"] = 35,
    ["castle shield"] = 5000,
    ["cat's paw"] = 2000,
    ["cave chimera head"] = 1200,
    ["cave chimera leg"] = 650,
    ["cave devourer eyes"] = 550,
    ["cave devourer legs"] = 350,
    ["cave devourer maw"] = 600,
    ["centipede leg"] = 28,
    ["chain armor"] = 70,
    ["chain bolter"] = 40000,
    ["chain helmet"] = 17,
    ["chain legs"] = 25,
    ["chaos mace"] = 9000,
    ["chasm spawn abdomen"] = 240,
    ["chasm spawn head"] = 850,
    ["chasm spawn tail"] = 120,
    ["cheese cutter"] = 50,
    ["cheesy figurine"] = 150,
    ["cheesy membership card"] = 120000,
    ["chicken feather"] = 30,
    ["chitinous mouth"] = 10000,
    ["cliff strider claw"] = 800,
    ["closed pocket sundial"] = 5000,
    ["closed trap"] = 75,
    ["club"] = 1,
    ["club ring"] = 100,
    ["coat"] = 1,
    ["cobra crest"] = 650,
    ["cobra crown"] = 50000,
    ["cobra tongue"] = 15,
    ["coconut shoes"] = 500,
    ["collar of blue plasma"] = 6000,
    ["collar of green plasma"] = 6000,
    ["collar of red plasma"] = 6000,
    ["colourful feather"] = 110,
    ["colourful feathers"] = 400,
    ["colourful snail shell"] = 250,
    ["compass"] = 45,
    ["composite hornbow"] = 25000,
    ["compound eye"] = 150,
    ["condensed energy"] = 260,
    ["copper shield"] = 50,
    ["coral branch"] = 360,
    ["coral brooch"] = 750,
    ["corrupt naga scales"] = 570,
    ["corrupted flag"] = 700,
    ["countess sorrow's frozen tear"] = 50000,
    ["cow bell"] = 120,
    ["cowbell"] = 210,
    ["cowtana"] = 2500,
    ["crab man claws"] = 550,
    ["crab pincers"] = 35,
    ["cracked alabaster vase"] = 180,
    ["cranial basher"] = 300000,
    ["crawler head plating"] = 210,
    ["crawler's essence"] = 3700,
    ["crest of the deep seas"] = 10000,
    ["crocodile boots"] = 1000,
    ["crossbow"] = 120,
    ["crowbar"] = 50,
    ["crown"] = 2700,
    ["crown armor"] = 12000,
    ["crown helmet"] = 2500,
    ["crown legs"] = 12000,
    ["crown shield"] = 8000,
    ["cruelty's chest"] = 720000,
    ["cruelty's claw"] = 640000,
    ["crunor idol"] = 30000,
    ["crusader helmet"] = 6000,
    ["cry-stal"] = 3200,
    ["crystal bone"] = 250,
    ["crystal crossbow"] = 35000,
    ["crystal mace"] = 12000,
    ["crystal necklace"] = 400,
    ["crystal ring"] = 250,
    ["crystal sword"] = 600,
    ["crystalline armor"] = 16000,
    ["crystallized anger"] = 400,
    ["cultish mask"] = 280,
    ["cultish robe"] = 150,
    ["cultish symbol"] = 500,
    ["curious matter"] = 430,
    ["curl of hair"] = 320000,
    ["cursed bone"] = 6000,
    ["cursed shoulder spikes"] = 320,
    ["cyan crystal fragment"] = 800,
    ["cyclops toe"] = 55,
    ["dagger"] = 2,
    ["damaged armor plates"] = 280,
    ["damaged worm head"] = 8000,
    ["damselfly eye"] = 25,
    ["damselfly wing"] = 20,
    ["dandelion seeds"] = 200,
    ["dangerous proto matter"] = 300,
    ["daramian mace"] = 110,
    ["daramian waraxe"] = 1000,
    ["dark bell"] = 310000,
    ["dark obsidian splinter"] = 4400,
    ["dark rosary"] = 48,
    ["dark shield"] = 400,
    ["darklight basalt chunk"] = 3800,
    ["darklight core"] = 4100,
    ["darklight matter"] = 5500,
    ["dead weight"] = 450,
    ["deadly wand"] = 300000,
    ["death ring"] = 1000,
    ["decayed finger bone"] = 5100,
    ["deepling axe"] = 40000,
    ["deepling breaktime snack"] = 90,
    ["deepling claw"] = 430,
    ["deepling guard belt buckle"] = 230,
    ["deepling ridge"] = 360,
    ["deepling scales"] = 80,
    ["deepling squelcher"] = 7000,
    ["deepling staff"] = 4000,
    ["deepling warts"] = 180,
    ["deeptags"] = 290,
    ["deepworm jaws"] = 500,
    ["deepworm spike roots"] = 650,
    ["deepworm spikes"] = 800,
    ["demon armor"] = 50000,
    ["demon dust"] = 300,
    ["demon helmet"] = 50000,
    ["demon horn"] = 1000,
    ["demon legs"] = 50000,
    ["demon shield"] = 30000,
    ["demonbone amulet"] = 32000,
    ["demonic essence"] = 1000,
    ["demonic finger"] = 1000,
    ["demonic skeletal hand"] = 80,
    ["demonrage sword"] = 36000,
    ["depth calcei"] = 25000,
    ["depth galea"] = 35000,
    ["depth lorica"] = 30000,
    ["depth ocrea"] = 16000,
    ["depth scutum"] = 36000,
    ["devil helmet"] = 1000,
    ["diabolic skull"] = 19000,
    ["diamond"] = 15000,
    ["diamond sceptre"] = 3000,
    ["diremaw brainpan"] = 350,
    ["diremaw legs"] = 270,
    ["dirty turban"] = 120,
    ["distorted heart"] = 2100,
    ["distorted robe"] = 1200,
    ["divine plate"] = 55000,
    ["djinn blade"] = 15000,
    ["doll"] = 200,
    ["double axe"] = 260,
    ["doublet"] = 3,
    ["downy feather"] = 20,
    ["dowser"] = 35,
    ["drachaku"] = 10000,
    ["dracola's eye"] = 50000,
    ["dracoyle statue"] = 5000,
    ["dragon blood"] = 700,
    ["dragon claw"] = 8000,
    ["dragon figurine"] = 45000,
    ["dragon hammer"] = 2000,
    ["dragon lance"] = 9000,
    ["dragon necklace"] = 100,
    ["dragon priest's wandtip"] = 175,
    ["dragon scale mail"] = 40000,
    ["dragon shield"] = 4000,
    ["dragon slayer"] = 15000,
    ["dragon tongue"] = 550,
    ["dragon's tail"] = 100,
    ["dragonbone staff"] = 3000,
    ["draken boots"] = 40000,
    ["draken sulphur"] = 550,
    ["draken wristbands"] = 430,
    ["drakinata"] = 10000,
    ["dreaded cleaver"] = 15000,
    ["dream essence egg"] = 205,
    ["dung ball"] = 130,
    ["dwarven armor"] = 30000,
    ["dwarven ring"] = 100,
    ["dwarven shield"] = 100,
    ["earflap"] = 40,
    ["elder bonelord tentacle"] = 150,
    ["eldritch crystal"] = 48000,
    ["elite draken mail"] = 50000,
    ["elven amulet"] = 100,
    ["elven astral observer"] = 90,
    ["elven hoof"] = 115,
    ["elven scouting glass"] = 50,
    ["elvish bow"] = 2000,
    ["elvish talisman"] = 45,
    ["emerald bangle"] = 800,
    ["emerald tortoise shell"] = 2150,
    ["empty honey glass"] = 270,
    ["empty potion flask"] = 5,
    ["enchanted chicken wing"] = 20000,
    ["energy ball"] = 300,
    ["energy ring"] = 100,
    ["energy vein"] = 270,
    ["ensouled essence"] = 820,
    ["epee"] = 8000,
    ["essence of a bad dream"] = 360,
    ["ethno coat"] = 200,
    ["execowtioner axe"] = 12000,
    ["execowtioner mask"] = 240,
    ["experience scroll"] = 50000,
    ["eye of a deepling"] = 150,
    ["eye of a weeper"] = 650,
    ["eye of corruption"] = 390,
    ["eyeless devourer legs"] = 650,
    ["eyeless devourer maw"] = 420,
    ["eyeless devourer tongue"] = 900,
    ["fafnar symbol"] = 950,
    ["fairy wings"] = 200,
    ["falcon crest"] = 650,
    ["fern"] = 20,
    ["fiery heart"] = 375,
    ["fiery tear"] = 1070000,
    ["fig leaf"] = 200,
    ["figurine of bakragore"] = 5400000,
    ["figurine of cruelty"] = 3100000,
    ["figurine of greed"] = 2900000,
    ["figurine of hatred"] = 2700000,
    ["figurine of malice"] = 2800000,
    ["figurine of megalomania"] = 5000000,
    ["figurine of spite"] = 3000000,
    ["fir cone"] = 25,
    ["fire axe"] = 8000,
    ["fire sword"] = 1000,
    ["fish fin"] = 150,
    ["fishing rod"] = 40,
    ["flask of embalming fluid"] = 30,
    ["flask of warrior's sweat"] = 10000,
    ["flotsam"] = 330,
    ["flower dress"] = 1000,
    ["flower wreath"] = 500,
    ["focus cape"] = 6000,
    ["fox paw"] = 100,
    ["frazzle skin"] = 400,
    ["frazzle tongue"] = 700,
    ["frost giant pelt"] = 160,
    ["frosty ear of a troll"] = 30,
    ["frosty heart"] = 280,
    ["frozen lightning"] = 270,
    ["fur boots"] = 2000,
    ["fur shred"] = 200,
    ["furry club"] = 1000,
    ["garlic necklace"] = 50,
    ["gauze bandage"] = 90,
    ["gearwheel chain"] = 5000,
    ["gemmed figurine"] = 3500,
    ["geomancer's robe"] = 80,
    ["geomancer's staff"] = 120,
    ["ghastly dragon head"] = 700,
    ["ghostly tissue"] = 90,
    ["ghoul snack"] = 60,
    ["giant amethyst"] = 60000,
    ["giant emerald"] = 90000,
    ["giant eye"] = 380,
    ["giant pacifier"] = 170,
    ["giant ruby"] = 70000,
    ["giant sapphire"] = 50000,
    ["giant shimmering pearl"] = 3000,
    ["giant sword"] = 17000,
    ["giant tentacle"] = 10000,
    ["giant topaz"] = 80000,
    ["girlish hair decoration"] = 30,
    ["girtabilu warrior carapace"] = 520,
    ["glacial rod"] = 6500,
    ["glacier amulet"] = 1500,
    ["glacier kilt"] = 11000,
    ["glacier mask"] = 2500,
    ["glacier robe"] = 11000,
    ["glacier shoes"] = 2500,
    ["gland"] = 500,
    ["glistening bone"] = 250,
    ["glob of acid slime"] = 25,
    ["glob of glooth"] = 125,
    ["glob of mercury"] = 20,
    ["glob of tar"] = 30,
    ["gloom wolf fur"] = 70,
    ["glooth amulet"] = 2000,
    ["glooth axe"] = 1500,
    ["glooth blade"] = 1500,
    ["glooth cap"] = 7000,
    ["glooth club"] = 1500,
    ["glooth injection tube"] = 350,
    ["glooth whip"] = 2500,
    ["glorious axe"] = 3000,
    ["glowing rune"] = 350,
    ["goanna claw"] = 260,
    ["goanna meat"] = 190,
    ["goblet of gloom"] = 12000,
    ["goblin ear"] = 20,
    ["gold ingot"] = 5000,
    ["gold nugget"] = 850,
    ["gold ring"] = 8000,
    ["golden armor"] = 20000,
    ["golden brush"] = 250,
    ["golden cheese wedge"] = 6000,
    ["golden dustbin"] = 7000,
    ["golden figurine"] = 3000,
    ["golden legs"] = 30000,
    ["golden lotus brooch"] = 270,
    ["golden mask"] = 38000,
    ["golden mug"] = 250,
    ["golden skull"] = 9000,
    ["goo shell"] = 4000,
    ["goosebump leather"] = 650,
    ["gore horn"] = 2900,
    ["gorerilla mane"] = 2750,
    ["gorerilla tail"] = 2650,
    ["grant of arms"] = 950,
    ["grappling hook"] = 150,
    ["grasshopper legs"] = 15000,
    ["great axe"] = 300000,
    ["greed's arm"] = 950000,
    ["green bandage"] = 180,
    ["green crystal fragment"] = 800,
    ["green crystal shard"] = 1500,
    ["green crystal splinter"] = 400,
    ["green demon armor"] = 300000,
    ["green demon helmet"] = 300000,
    ["green demon legs"] = 300000,
    ["green demon slippers"] = 300000,
    ["green dragon leather"] = 100,
    ["green dragon scale"] = 100,
    ["green gem"] = 5000,
    ["green glass plate"] = 180,
    ["green piece of cloth"] = 200,
    ["griffin shield"] = 3000,
    ["grimace"] = 120000,
    ["gruesome fan"] = 15000,
    ["guardian axe"] = 9000,
    ["guardian boots"] = 35000,
    ["guardian halberd"] = 11000,
    ["guardian shield"] = 2000,
    ["guidebook"] = 200,
    ["hailstorm rod"] = 3000,
    ["hair of a banshee"] = 350,
    ["halberd"] = 400,
    ["half-digested piece of meat"] = 55,
    ["half-digested stones"] = 40,
    ["half-eaten brain"] = 85,
    ["hammer of wrath"] = 30000,
    ["hand"] = 1450,
    ["hand axe"] = 4,
    ["hardened bone"] = 70,
    ["harpoon of a giant snail"] = 15000,
    ["hatched rorc egg"] = 30,
    ["hatchet"] = 25,
    ["haunted blade"] = 8000,
    ["haunted piece of wood"] = 115,
    ["hazardous heart"] = 5000,
    ["hazardous robe"] = 3000,
    ["head"] = 3500,
    ["head many"] = 3200,
    ["headchopper"] = 6000,
    ["headpecker beak"] = 2998,
    ["headpecker feather"] = 1300,
    ["heat core"] = 10000,
    ["heaven blossom"] = 50,
    ["heavy blossom staff"] = 5000,
    ["heavy mace"] = 50000,
    ["heavy machete"] = 90,
    ["heavy trident"] = 2000,
    ["hellhound slobber"] = 500,
    ["hellspawn tail"] = 475,
    ["helmet of the lost"] = 2000,
    ["hemp rope"] = 350,
    ["heroic axe"] = 30000,
    ["hexagonal ruby"] = 30000,
    ["hibiscus dress"] = 3000,
    ["hideous chunk"] = 510,
    ["hieroglyph banner"] = 500,
    ["high guard flag"] = 550,
    ["high guard shoulderplates"] = 130,
    ["high guard's shoulderplates"] = 130,
    ["hive bow"] = 28000,
    ["hive scythe"] = 17000,
    ["holy ash"] = 160,
    ["holy orchid"] = 90,
    ["honeycomb"] = 40,
    ["horn"] = 300,
    ["horn of kalyassa"] = 10000,
    ["horoscope"] = 40,
    ["huge shell"] = 15000,
    ["huge spiky snail shell"] = 8000,
    ["humongous chunk"] = 540,
    ["hunter's quiver"] = 80,
    ["hydra head"] = 600,
    ["hydrophytes"] = 220,
    ["ice flower"] = 370,
    ["ice rapier"] = 1000,
    ["ichgahal's fungal infestation"] = 900000,
    ["incantation notes"] = 90,
    ["infernal heart"] = 2100,
    ["infernal robe"] = 1200,
    ["inkwell"] = 720,
    ["instable proto matter"] = 300,
    ["iron helmet"] = 150,
    ["iron ore"] = 500,
    ["ivory carving"] = 300,
    ["ivory comb"] = 8000,
    ["izcandar's snow globe"] = 180000,
    ["izcandar's sundial"] = 225000,
    ["jacket"] = 1,
    ["jade hammer"] = 25000,
    ["jade hat"] = 9000,
    ["jagged sickle"] = 150000,
    ["jaws"] = 3900,
    ["jewelled belt"] = 180,
    ["jungle moa claw"] = 160,
    ["jungle moa egg"] = 250,
    ["jungle moa feather"] = 140,
    ["justice seeker"] = 300000,
    ["katana"] = 35,
    ["katex' blood"] = 210,
    ["key to the drowned library"] = 330,
    ["knight armor"] = 5000,
    ["knight axe"] = 2000,
    ["knight legs"] = 5000,
    ["kollos shell"] = 420,
    ["kongra's shoulderpad"] = 100,
    ["krimhorn helmet"] = 200,
    ["lamassu hoof"] = 330,
    ["lamassu horn"] = 240,
    ["lancer beetle shell"] = 80,
    ["lancet"] = 90,
    ["lavafungus head"] = 900,
    ["lavafungus ring"] = 390,
    ["lavaworm jaws"] = 1100,
    ["lavaworm spike roots"] = 600,
    ["lavaworm spikes"] = 750,
    ["lavos armor"] = 16000,
    ["leaf legs"] = 500,
    ["leather armor"] = 12,
    ["leather boots"] = 2,
    ["leather helmet"] = 4,
    ["leather legs"] = 9,
    ["legion helmet"] = 22,
    ["legionnaire flags"] = 500,
    ["leopard armor"] = 1000,
    ["leviathan's amulet"] = 3000,
    ["life crystal"] = 50,
    ["life ring"] = 50,
    ["light shovel"] = 300,
    ["lightning boots"] = 2500,
    ["lightning headband"] = 2500,
    ["lightning legs"] = 11000,
    ["lightning pendant"] = 1500,
    ["lightning robe"] = 11000,
    ["liodile fang"] = 480,
    ["lion cloak patch"] = 190,
    ["lion crest"] = 270,
    ["lion figurine"] = 10000,
    ["lion seal"] = 210,
    ["lion's mane"] = 60,
    ["little bowl of myrrh"] = 500,
    ["lizard essence"] = 300,
    ["lizard heart"] = 530,
    ["lizard leather"] = 150,
    ["lizard scale"] = 120,
    ["longing eyes"] = 8000,
    ["longsword"] = 51,
    ["lost basher's spike"] = 280,
    ["lost bracers"] = 140,
    ["lost husher's staff"] = 250,
    ["lost soul"] = 120,
    ["luminescent crystal pickaxe"] = 50,
    ["luminous orb"] = 1000,
    ["lump of dirt"] = 10,
    ["lump of earth"] = 130,
    ["lunar staff"] = 5000,
    ["mace"] = 30,
    ["machete"] = 6,
    ["mad froth"] = 80,
    ["magic light wand"] = 35,
    ["magic plate armor"] = 90000,
    ["magic sulphur"] = 8000,
    ["magic sword"] = 100000,
    ["magma amulet"] = 1500,
    ["magma boots"] = 2500,
    ["magma coat"] = 11000,
    ["magma legs"] = 11000,
    ["magma monocle"] = 2500,
    ["makara fin"] = 350,
    ["makara tongue"] = 320,
    ["malice's horn"] = 620000,
    ["malice's spine"] = 850000,
    ["malofur's lunchbox"] = 240000,
    ["mammoth fur cape"] = 6000,
    ["mammoth fur shorts"] = 850,
    ["mammoth tusk"] = 100,
    ["mammoth whopper"] = 300,
    ["mantassin tail"] = 280,
    ["manticore ear"] = 310,
    ["manticore tail"] = 220,
    ["mantosaurus jaw"] = 2998,
    ["marsh stalker beak"] = 65,
    ["marsh stalker feather"] = 50,
    ["mastermind shield"] = 50000,
    ["maxxenius head"] = 500000,
    ["meat hammer"] = 60,
    ["medal of valiance"] = 410000,
    ["medusa shield"] = 9000,
    ["megalomania's essence"] = 1900000,
    ["megalomania's skull"] = 1500000,
    ["mercenary sword"] = 12000,
    ["mercurial wing"] = 2500,
    ["metal bat"] = 9000,
    ["metal jaw"] = 260,
    ["metal spats"] = 2000,
    ["metal toe"] = 430,
    ["might ring"] = 250,
    ["milk churn"] = 100,
    ["mind stone"] = 100,
    ["mino lance"] = 7000,
    ["mino shield"] = 3000,
    ["minotaur horn"] = 75,
    ["minotaur leather"] = 80,
    ["miraculum"] = 60,
    ["model ship"] = 1000,
    ["mooh'tah plate"] = 6000,
    ["mooh'tah shell"] = 110,
    ["moohtant cudgel"] = 14000,
    ["moohtant horn"] = 140,
    ["moon compass"] = 5000,
    ["moon pin"] = 18000,
    ["moonlight rod"] = 200,
    ["moonstone"] = 13000,
    ["morbid tapestry"] = 30000,
    ["morning star"] = 100,
    ["morshabaal's brain"] = 5000000,
    ["morshabaal's extract"] = 3250000,
    ["mould heart"] = 2100,
    ["mould robe"] = 1200,
    ["mouldy powder"] = 200,
    ["mr. punish's handcuffs"] = 50000,
    ["muck rod"] = 6000,
    ["murcion's mycelium"] = 950000,
    ["mutated bat ear"] = 420,
    ["mutated flesh"] = 50,
    ["mutated rat tail"] = 150,
    ["mycological bow"] = 35000,
    ["mysterious fetish"] = 50,
    ["mystic blade"] = 30000,
    ["mystic turban"] = 150,
    ["mystical hourglass"] = 700,
    ["naga archer scales"] = 340,
    ["naga arming"] = 390,
    ["naga earring"] = 380,
    ["naga warrior scales"] = 340,
    ["naginata"] = 2000,
    ["necklace of the deep"] = 3000,
    ["necromantic robe"] = 250,
    ["necromantic rust"] = 390,
    ["necrotic rod"] = 1000,
    ["nettle blossom"] = 75,
    ["nettle spit"] = 25,
    ["new pair soft boots"] = 50000,
    ["nighthuner wing"] = 2000,
    ["nightmare blade"] = 35000,
    ["nightmare shield"] = 300000,
    ["noble amulet"] = 430000,
    ["noble armor"] = 900,
    ["noble axe"] = 10000,
    ["noble cape"] = 425000,
    ["noble turban"] = 430,
    ["norse shield"] = 1500,
    ["northwind rod"] = 1500,
    ["nose ring"] = 2000,
    ["obsidian lance"] = 500,
    ["odd organ"] = 410,
    ["ogre ear stud"] = 180,
    ["ogre nose ring"] = 210,
    ["old girtablilu carapace"] = 570,
    ["old royal diary"] = 220000,
    ["one of timira's many heads"] = 215000,
    ["onyx chip"] = 400,
    ["onyx flail"] = 22000,
    ["onyx pendant"] = 3500,
    ["opal"] = 500,
    ["orb"] = 750,
    ["orc leather"] = 30,
    ["orc tooth"] = 150,
    ["orcish axe"] = 350,
    ["orcish gear"] = 85,
    ["orcish maul"] = 6000,
    ["orichalcum pearl"] = 80,
    ["oriental shoes"] = 15000,
    ["ornamented axe"] = 20000,
    ["ornate chestplate"] = 60000,
    ["ornate crossbow"] = 12000,
    ["ornate legs"] = 40000,
    ["ornate locket"] = 18000,
    ["ornate mace"] = 42000,
    ["ornate shield"] = 42000,
    ["pair of hellflayer horns"] = 1300,
    ["pair of iron fists"] = 4000,
    ["pair of old bracers"] = 500,
    ["paladin armor"] = 15000,
    ["pale worm's scalp"] = 489000,
    ["parder fur"] = 150,
    ["parder tooth"] = 150,
    ["patch of fine cloth"] = 1350,
    ["patched boots"] = 2000,
    ["peacock feather fan"] = 350,
    ["pelvis bone"] = 30,
    ["percht horns"] = 200,
    ["perfect behemoth fang"] = 250,
    ["petrified scream"] = 250,
    ["phantasmal hair"] = 500,
    ["pharaoh banner"] = 1000,
    ["pharaoh sword"] = 23000,
    ["phoenix shield"] = 16000,
    ["pick"] = 15,
    ["piece of archer armor"] = 20,
    ["piece of crocodile leather"] = 15,
    ["piece of dead brain"] = 420,
    ["piece of massacre's shell"] = 50000,
    ["piece of scarab shell"] = 45,
    ["piece of swampling wood"] = 30,
    ["piece of timira's sensors"] = 150000,
    ["piece of warrior armor"] = 50,
    ["pieces of magic chalk"] = 210,
    ["pig foot"] = 10,
    ["pile of grave earth"] = 25,
    ["pirat's tail"] = 180,
    ["pirate boots"] = 3000,
    ["pirate coin"] = 110,
    ["pirate hat"] = 1000,
    ["pirate knee breeches"] = 200,
    ["pirate shirt"] = 500,
    ["pirate voodoo doll"] = 500,
    ["plagueroot offshoot"] = 280000,
    ["plasma pearls"] = 250,
    ["plasmatic lightning"] = 270,
    ["plate armor"] = 400,
    ["plate legs"] = 115,
    ["plate shield"] = 45,
    ["platinum amulet"] = 2500,
    ["poison dagger"] = 50,
    ["poison gland"] = 210,
    ["poison spider shell"] = 10,
    ["poisoned fang"] = 130,
    ["poisonous slime"] = 50,
    ["polar bear paw"] = 30,
    ["pool of chitinous glue"] = 480,
    ["porcelain mask"] = 2000,
    ["powder herb"] = 10,
    ["power ring"] = 50,
    ["prehemoth claw"] = 2300,
    ["prehemoth horns"] = 3000,
    ["prismatic quartz"] = 450,
    ["pristine worm head"] = 15000,
    ["protection amulet"] = 100,
    ["protective charm"] = 60,
    ["purified soul"] = 260,
    ["purple robe"] = 110,
    ["quara bone"] = 500,
    ["quara eye"] = 350,
    ["quara pincers"] = 410,
    ["quara tentacle"] = 140,
    ["queen's sceptre"] = 20000,
    ["quill"] = 1100,
    ["ragnir helmet"] = 400,
    ["rainbow querz"] = 500,
    ["rapier"] = 5,
    ["rare earth"] = 80,
    ["ratmiral's hat"] = 150000,
    ["ravenous circlet"] = 220000,
    ["reaper's axe"] = 200000,
    ["red crystal fragment"] = 800,
    ["red dragon leather"] = 200,
    ["red dragon scale"] = 200,
    ["red gem"] = 1000,
    ["red goanna scale"] = 270,
    ["red hair dye"] = 40,
    ["red lantern"] = 250,
    ["red piece of cloth"] = 300,
    ["relic sword"] = 25000,
    ["rhindeer antlers"] = 680,
    ["rhino hide"] = 175,
    ["rhino horn"] = 265,
    ["rhino horn carving"] = 300,
    ["rift bow"] = 45000,
    ["rift crossbow"] = 45000,
    ["rift lance"] = 30000,
    ["rift shield"] = 50000,
    ["ring of blue plasma"] = 8000,
    ["ring of green plasma"] = 8000,
    ["ring of healing"] = 100,
    ["ring of red plasma"] = 8000,
    ["ring of the sky"] = 30000,
    ["ripptor claw"] = 2000,
    ["ripptor scales"] = 1200,
    ["rod"] = 2200,
    ["rogue naga scales"] = 570,
    ["roots"] = 1200,
    ["rope"] = 15,
    ["rope belt"] = 66,
    ["rorc egg"] = 120,
    ["rorc feather"] = 70,
    ["rotten heart"] = 74000,
    ["rotten piece of cloth"] = 30,
    ["rotten roots"] = 3800,
    ["rotten vermin ichor"] = 4500,
    ["royal almandine"] = 460000,
    ["royal axe"] = 40000,
    ["royal helmet"] = 30000,
    ["rubber cap"] = 11000,
    ["ruby necklace"] = 2000,
    ["ruthless axe"] = 45000,
    ["sabre"] = 12,
    ["sabretooth"] = 400,
    ["sabretooth fur"] = 2500,
    ["sacred tree amulet"] = 3000,
    ["safety pin"] = 120,
    ["sai"] = 16500,
    ["sample of monster blood"] = 250,
    ["sandcrawler shell"] = 20,
    ["sapphire hammer"] = 200000,
    ["scale armor"] = 75,
    ["scale of corruption"] = 680,
    ["scale of gelidrazah"] = 10000,
    ["scarab amulet"] = 200,
    ["scarab pincers"] = 280,
    ["scarab shield"] = 2000,
    ["scimitar"] = 150,
    ["scorpion tail"] = 25,
    ["scroll of heroic deeds"] = 230,
    ["scythe"] = 10,
    ["scythe leg"] = 450,
    ["sea horse figurine"] = 42000,
    ["sea serpent scale"] = 520,
    ["seacrest hair"] = 260,
    ["seacrest pearl"] = 400,
    ["seacrest scale"] = 150,
    ["seeds"] = 150,
    ["serpent sword"] = 900,
    ["shadow sceptre"] = 10000,
    ["shaggy tail"] = 25,
    ["shamanic hood"] = 45,
    ["shamanic talisman"] = 200,
    ["shark fins"] = 250,
    ["shimmering beetles"] = 150,
    ["shockwave amulet"] = 3000,
    ["short sword"] = 10,
    ["shovel"] = 8,
    ["sickle"] = 3,
    ["sight of surrender's eye"] = 3000,
    ["signet ring"] = 480000,
    ["silencer claws"] = 390,
    ["silencer resonating chamber"] = 600,
    ["silken bookmark"] = 1300,
    ["silky fur"] = 35,
    ["silver amulet"] = 50,
    ["silver brooch"] = 150,
    ["silver dagger"] = 500,
    ["silver foxmouse coin"] = 11000,
    ["silver hand mirror"] = 10000,
    ["silver moon coin"] = 11000,
    ["silver token"] = 100000,
    ["single human eye"] = 1000,
    ["skeleton decoration"] = 3000,
    ["skull belt"] = 80,
    ["skull coin"] = 12000,
    ["skull fetish"] = 250,
    ["skull helmet"] = 40000,
    ["skull shatterer"] = 170,
    ["skull staff"] = 6000,
    ["skullcracker armor"] = 18000,
    ["skunk tail"] = 50,
    ["slime heart"] = 160,
    ["slimy leaf tentacle"] = 320,
    ["slimy leg"] = 4500,
    ["small amethyst"] = 200,
    ["small axe"] = 5,
    ["small diamond"] = 300,
    ["small emerald"] = 250,
    ["small enchanted amethyst"] = 200,
    ["small enchanted emerald"] = 250,
    ["small enchanted ruby"] = 250,
    ["small enchanted sapphire"] = 250,
    ["small energy ball"] = 250,
    ["small flask of eyedrops"] = 95,
    ["small notebook"] = 480,
    ["small oil lamp"] = 150,
    ["small pitchfork"] = 70,
    ["small ruby"] = 250,
    ["small sapphire"] = 250,
    ["small topaz"] = 200,
    ["small treasure chest"] = 500,
    ["small tropical fish"] = 380,
    ["smoldering eye"] = 470000,
    ["snake god's wristguard"] = 90000,
    ["snake skin"] = 400,
    ["snakebite rod"] = 100,
    ["sniper gloves"] = 2000,
    ["soldier helmet"] = 16,
    ["solid rage"] = 310,
    ["some grimeleech wings"] = 1200,
    ["soul orb"] = 25,
    ["soul stone"] = 6000,
    ["spark sphere"] = 350,
    ["sparkion claw"] = 290,
    ["sparkion legs"] = 310,
    ["sparkion stings"] = 280,
    ["sparkion tail"] = 300,
    ["spear"] = 3,
    ["spectral gold nugget"] = 500,
    ["spectral silver nugget"] = 250,
    ["spellbook of enlightenment"] = 4000,
    ["spellbook of lost souls"] = 19000,
    ["spellbook of mind control"] = 13000,
    ["spellbook of warding"] = 8000,
    ["spellsinger's seal"] = 280,
    ["spellweavers rob"] = 12000,
    ["sphinx feather"] = 470,
    ["sphinx tiara"] = 360,
    ["spider fangs"] = 10,
    ["spider silk"] = 100,
    ["spidris mandible"] = 450,
    ["spike sword"] = 240,
    ["spiked iron ball"] = 100,
    ["spiked squelcher"] = 5000,
    ["spirit cloak"] = 350,
    ["spirit container"] = 40000,
    ["spite's spirit"] = 840000,
    ["spitter nose"] = 340,
    ["spooky blue eye"] = 95,
    ["springsprout rod"] = 3600,
    ["srezz' eye"] = 300,
    ["stalking seeds"] = 1800,
    ["star herb"] = 15,
    ["stealth ring"] = 200,
    ["steel boots"] = 30000,
    ["steel helmet"] = 293,
    ["steel shield"] = 80,
    ["stone herb"] = 20,
    ["stone skin amulet"] = 500,
    ["stone wing"] = 120,
    ["stonecutter axe"] = 100000,
    ["stonerefiner's skull"] = 100,
    ["strand of medusa hair"] = 600,
    ["strange helmet"] = 500,
    ["strange proto matter"] = 300,
    ["strange symbol"] = 200,
    ["strange talisman"] = 30,
    ["streaked devourer eyes"] = 500,
    ["streaked devourer legs"] = 600,
    ["streaked devourer maw"] = 400,
    ["striped fur"] = 50,
    ["studded armor"] = 25,
    ["studded club"] = 10,
    ["studded helmet"] = 20,
    ["studded legs"] = 15,
    ["studded shield"] = 16,
    ["sulphider shell"] = 2200,
    ["sulphur powder"] = 1900,
    ["sun brooch"] = 18000,
    ["swamp grass"] = 20,
    ["swamplair armor"] = 16000,
    ["swampling club"] = 40,
    ["swampling moss"] = 20,
    ["swarmer antenna"] = 130,
    ["sword"] = 25,
    ["sword ring"] = 100,
    ["tail of corruption"] = 240,
    ["tarantula egg"] = 80,
    ["tarnished rhino figurine"] = 320,
    ["tattered piece of robe"] = 120,
    ["taurus mace"] = 500,
    ["telescope eye"] = 1600,
    ["tempest shield"] = 35000,
    ["tentacle of tentugly"] = 27000,
    ["tentacle piece"] = 5000,
    ["tentugly's eye"] = 52000,
    ["tentugly's jaws"] = 80000,
    ["terra amulet"] = 1500,
    ["terra boots"] = 2500,
    ["terra hood"] = 2500,
    ["terra legs"] = 11000,
    ["terra mantle"] = 11000,
    ["terra rod"] = 2000,
    ["terramite eggs"] = 50,
    ["terramite legs"] = 60,
    ["terramite shell"] = 170,
    ["terrorbird beak"] = 95,
    ["thaian sword"] = 16000,
    ["the handmaiden's protector"] = 50000,
    ["the imperor's trident"] = 50000,
    ["the plasmother's remains"] = 50000,
    ["thick fur"] = 150,
    ["thorn"] = 100,
    ["throwing knife"] = 2,
    ["throwing star"] = 100000,
    ["thunder hammer"] = 100000,
    ["tiara"] = 11000,
    ["tiger eye"] = 350,
    ["time ring"] = 100,
    ["titan axe"] = 4000,
    ["token of love"] = 440000,
    ["tooth file"] = 60,
    ["tooth of tazhadur"] = 10000,
    ["torn shirt"] = 250,
    ["tortoise shield"] = 150,
    ["tower shield"] = 8000,
    ["trapped bad dream monster"] = 900,
    ["tremendous tyrant head"] = 930,
    ["tremendous tyrant shell"] = 740,
    ["troll green"] = 25,
    ["trollroot"] = 50,
    ["tunnel tyrant head"] = 500,
    ["tunnel tyrant shell"] = 700,
    ["turtle shell"] = 90,
    ["tusk"] = 100,
    ["twiceslicer"] = 28000,
    ["twin hooks"] = 500,
    ["two handed sword"] = 450,
    ["two-headed turtle heads"] = 460,
    ["undead heart"] = 200,
    ["undertaker fangs"] = 2700,
    ["underworld rod"] = 4400,
    ["unholy bone"] = 480,
    ["unicorn figurine"] = 50000,
    ["urmahlullus mane"] = 490000,
    ["urmahlullus paws"] = 245000,
    ["urmahlullus tail"] = 210000,
    ["utua's poison"] = 230,
    ["vampire dust"] = 100,
    ["vampire shield"] = 15000,
    ["vampire teeth"] = 275,
    ["vampire's cape chain"] = 150,
    ["varnished diremaw brainpan"] = 750,
    ["varnished diremaw legs"] = 670,
    ["veal"] = 40,
    ["venison"] = 55,
    ["vexclaw talon"] = 1100,
    ["vial"] = 5,
    ["vial of hatred"] = 737000,
    ["vibrant heart"] = 2100,
    ["vibrant robe"] = 1200,
    ["viking helmet"] = 66,
    ["viking shield"] = 85,
    ["vile axe"] = 30000,
    ["violet crystal shard"] = 1500,
    ["violet gem"] = 10000,
    ["violet glass plate"] = 2150,
    ["viper star"] = 200000,
    ["volatile proto matter"] = 300,
    ["voodoo doll"] = 400,
    ["wailing widow's necklace"] = 3000,
    ["wand of cosmic energy"] = 2000,
    ["wand of decay"] = 1000,
    ["wand of defiance"] = 6500,
    ["wand of draconia"] = 1500,
    ["wand of dragonbreath"] = 200,
    ["wand of everblazing"] = 6000,
    ["wand of inferno"] = 3000,
    ["wand of starstorm"] = 3600,
    ["wand of voodoo"] = 4400,
    ["wand of vortex"] = 100,
    ["war axe"] = 12000,
    ["war hammer"] = 1200,
    ["war horn"] = 8000,
    ["warlord sword"] = 200000,
    ["warmaster's wristguards"] = 200,
    ["warrior helmet"] = 5000,
    ["warrior's axe"] = 11000,
    ["warrior's shield"] = 9000,
    ["warwolf fur"] = 30,
    ["waspoid claw"] = 320,
    ["waspoid wing"] = 190,
    ["watch"] = 6,
    ["watermelon touraline slice"] = 30000,
    ["watermelon tourmaline"] = 230000,
    ["weaver's wandtip"] = 250,
    ["wedding ring"] = 100,
    ["werebadger claws"] = 160,
    ["werebadger skull"] = 185,
    ["werebear fur"] = 85,
    ["werebear skull"] = 195,
    ["wereboar hooves"] = 175,
    ["wereboar tusks"] = 165,
    ["werecrocodile tongue"] = 570,
    ["werefox tail"] = 200,
    ["werehyaena nose"] = 220,
    ["werehyaena talisman"] = 350,
    ["werepanther claw"] = 280,
    ["werewolf fangs"] = 180,
    ["werewolf fur"] = 380,
    ["white gem"] = 12000,
    ["white pearl"] = 160,
    ["white piece of cloth"] = 100,
    ["white silk flower"] = 9000,
    ["widow's mandibles"] = 110,
    ["wild flowers"] = 120,
    ["wimp tooth chain"] = 120,
    ["winged tail"] = 800,
    ["winter wolf fur"] = 20,
    ["witch broom"] = 60,
    ["witch hat"] = 5000,
    ["withered pauldrons"] = 850,
    ["withered scalp"] = 900,
    ["wolf paw"] = 70,
    ["wood"] = 5,
    ["wood cape"] = 5000,
    ["wooden hammer"] = 15,
    ["wooden shield"] = 5,
    ["wooden spellbook"] = 12000,
    ["wool"] = 15,
    ["worm sponge"] = 4200,
    ["writhing brain"] = 370000,
    ["writhing heart"] = 185000,
    ["wyrm scale"] = 400,
    ["wyvern fang"] = 1500,
    ["wyvern talisman"] = 265,
    ["yellow gem"] = 1000,
    ["yellow piece of cloth"] = 150,
    ["yielowax"] = 600,
    ["yirkas' egg"] = 280,
    ["young lich worm"] = 25000,
    ["zaoan armor"] = 14000,
    ["zaoan halberd"] = 500,
    ["zaoan helmet"] = 45000,
    ["zaoan legs"] = 14000,
    ["zaoan robe"] = 12000,
    ["zaoan shoes"] = 5000,
    ["zaoan sword"] = 30000,
    ["zaogun flag"] = 600,
    ["zaogun shoulderplates"] = 150,
    ["zaogun's shoulderplates"] = 150,
}
local NPC_PRICES_ID = {
    [281] = 3000,
    [282] = 3000,
    [283] = 5,
    [284] = 5,
    [285] = 5,
    [647] = 150,
    [675] = 250,
    [676] = 250,
    [677] = 250,
    [678] = 200,
    [811] = 11000,
    [812] = 11000,
    [813] = 2500,
    [814] = 1500,
    [815] = 1500,
    [816] = 1500,
    [817] = 1500,
    [818] = 2500,
    [819] = 2500,
    [820] = 2500,
    [821] = 11000,
    [822] = 11000,
    [823] = 11000,
    [824] = 11000,
    [825] = 11000,
    [826] = 11000,
    [827] = 2500,
    [828] = 2500,
    [829] = 2500,
    [830] = 2500,
    [895] = 300000,
    [903] = 15,
    [2874] = 5,
    [2903] = 250,
    [2906] = 6,
    [2933] = 150,
    [2958] = 8000,
    [2991] = 200,
    [2994] = 1000,
    [3002] = 400,
    [3003] = 15,
    [3004] = 100,
    [3006] = 30000,
    [3007] = 250,
    [3008] = 400,
    [3010] = 800,
    [3016] = 2000,
    [3017] = 150,
    [3018] = 200,
    [3019] = 32000,
    [3025] = 200,
    [3027] = 280,
    [3028] = 300,
    [3029] = 250,
    [3030] = 250,
    [3032] = 250,
    [3033] = 200,
    [3036] = 10000,
    [3037] = 1000,
    [3038] = 5000,
    [3039] = 1000,
    [3040] = 850,
    [3041] = 5000,
    [3044] = 100,
    [3045] = 30,
    [3046] = 35,
    [3048] = 250,
    [3049] = 200,
    [3050] = 50,
    [3051] = 100,
    [3052] = 50,
    [3053] = 100,
    [3054] = 50,
    [3055] = 2500,
    [3056] = 50,
    [3058] = 200,
    [3060] = 750,
    [3062] = 100,
    [3063] = 8000,
    [3065] = 2000,
    [3066] = 100,
    [3067] = 3000,
    [3069] = 1000,
    [3070] = 200,
    [3071] = 3000,
    [3072] = 1000,
    [3073] = 2000,
    [3074] = 100,
    [3075] = 200,
    [3077] = 100,
    [3078] = 50,
    [3079] = 30000,
    [3081] = 500,
    [3082] = 100,
    [3083] = 50,
    [3084] = 100,
    [3085] = 100,
    [3091] = 100,
    [3092] = 100,
    [3093] = 100,
    [3097] = 100,
    [3098] = 100,
    [3264] = 25,
    [3265] = 450,
    [3266] = 80,
    [3267] = 2,
    [3268] = 4,
    [3269] = 400,
    [3270] = 1,
    [3271] = 240,
    [3272] = 5,
    [3273] = 12,
    [3274] = 7,
    [3275] = 260,
    [3276] = 25,
    [3277] = 3,
    [3280] = 1000,
    [3281] = 17000,
    [3282] = 100,
    [3283] = 118,
    [3284] = 1000,
    [3285] = 51,
    [3286] = 30,
    [3287] = 100000,
    [3288] = 100000,
    [3290] = 500,
    [3293] = 3,
    [3294] = 10,
    [3296] = 200000,
    [3297] = 900,
    [3298] = 2,
    [3299] = 50,
    [3300] = 35,
    [3301] = 500,
    [3302] = 9000,
    [3303] = 300000,
    [3304] = 50,
    [3305] = 120,
    [3307] = 150,
    [3308] = 6,
    [3309] = 100000,
    [3313] = 500,
    [3314] = 2000,
    [3315] = 11000,
    [3316] = 350,
    [3318] = 2000,
    [3319] = 100000,
    [3320] = 8000,
    [3322] = 2000,
    [3324] = 6000,
    [3326] = 8000,
    [3327] = 110,
    [3328] = 1000,
    [3330] = 90,
    [3332] = 30000,
    [3333] = 12000,
    [3334] = 23000,
    [3336] = 10,
    [3337] = 5,
    [3338] = 20,
    [3339] = 15000,
    [3340] = 50000,
    [3341] = 100000,
    [3342] = 12000,
    [3344] = 1500,
    [3349] = 120,
    [3350] = 100,
    [3351] = 293,
    [3352] = 17,
    [3353] = 150,
    [3354] = 30,
    [3355] = 4,
    [3356] = 1000,
    [3357] = 400,
    [3358] = 70,
    [3359] = 150,
    [3360] = 20000,
    [3361] = 12,
    [3362] = 15,
    [3364] = 30000,
    [3366] = 90000,
    [3367] = 66,
    [3369] = 5000,
    [3370] = 5000,
    [3371] = 5000,
    [3372] = 49,
    [3373] = 500,
    [3374] = 22,
    [3375] = 16,
    [3376] = 20,
    [3377] = 75,
    [3378] = 25,
    [3379] = 3,
    [3380] = 900,
    [3381] = 12000,
    [3382] = 12000,
    [3385] = 2500,
    [3386] = 40000,
    [3387] = 50000,
    [3388] = 50000,
    [3389] = 50000,
    [3391] = 6000,
    [3392] = 30000,
    [3397] = 30000,
    [3404] = 1000,
    [3408] = 7500,
    [3409] = 80,
    [3410] = 45,
    [3411] = 25,
    [3412] = 5,
    [3413] = 95,
    [3414] = 50000,
    [3415] = 2000,
    [3416] = 4000,
    [3418] = 1200,
    [3419] = 8000,
    [3420] = 30000,
    [3421] = 400,
    [3425] = 100,
    [3426] = 16,
    [3428] = 8000,
    [3429] = 800,
    [3430] = 50,
    [3431] = 85,
    [3433] = 3000,
    [3434] = 15000,
    [3435] = 5000,
    [3436] = 9000,
    [3439] = 16000,
    [3440] = 2000,
    [3441] = 80,
    [3442] = 35000,
    [3453] = 10,
    [3456] = 15,
    [3457] = 8,
    [3459] = 15,
    [3462] = 5,
    [3481] = 75,
    [3483] = 40,
    [3550] = 2000,
    [3552] = 2,
    [3554] = 30000,
    [3556] = 1000,
    [3557] = 115,
    [3558] = 25,
    [3559] = 9,
    [3561] = 1,
    [3562] = 1,
    [3567] = 10000,
    [3574] = 150,
    [3575] = 5000,
    [3657] = 50,
    [3735] = 20,
    [3736] = 15,
    [3737] = 20,
    [3739] = 10,
    [3741] = 25,
    [4033] = 40000,
    [4840] = 50,
    [5461] = 3000,
    [5479] = 2000,
    [5526] = 300,
    [5710] = 300,
    [5741] = 40000,
    [5799] = 3000,
    [5804] = 2000,
    [5809] = 6000,
    [5810] = 500,
    [5875] = 2000,
    [5876] = 150,
    [5877] = 100,
    [5878] = 80,
    [5879] = 100,
    [5880] = 500,
    [5881] = 120,
    [5882] = 200,
    [5883] = 120,
    [5884] = 40000,
    [5885] = 10000,
    [5890] = 30,
    [5891] = 20000,
    [5893] = 250,
    [5894] = 50,
    [5895] = 150,
    [5896] = 100,
    [5897] = 70,
    [5898] = 80,
    [5899] = 90,
    [5901] = 5,
    [5902] = 40,
    [5904] = 8000,
    [5905] = 100,
    [5909] = 100,
    [5910] = 200,
    [5911] = 300,
    [5912] = 200,
    [5913] = 100,
    [5914] = 150,
    [5917] = 150,
    [5918] = 200,
    [5919] = 8000,
    [5920] = 100,
    [5922] = 90,
    [5925] = 70,
    [5930] = 2000,
    [5944] = 25,
    [5948] = 200,
    [5954] = 1000,
    [6095] = 500,
    [6096] = 1000,
    [6131] = 150,
    [6299] = 1000,
    [6491] = 2000,
    [6499] = 1000,
    [6525] = 3000,
    [6529] = 50000,
    [6534] = 50000,
    [6535] = 50000,
    [6536] = 50000,
    [6537] = 50000,
    [6539] = 50000,
    [6540] = 50000,
    [6546] = 50000,
    [6553] = 45000,
    [7366] = 200000,
    [7368] = 300000,
    [7379] = 1500,
    [7380] = 6000,
    [7381] = 300,
    [7382] = 36000,
    [7383] = 25000,
    [7384] = 30000,
    [7386] = 12000,
    [7387] = 3000,
    [7388] = 30000,
    [7389] = 30000,
    [7390] = 300000,
    [7391] = 16000,
    [7392] = 6000,
    [7402] = 15000,
    [7403] = 40000,
    [7404] = 20000,
    [7406] = 6000,
    [7407] = 8000,
    [7408] = 1500,
    [7410] = 20000,
    [7411] = 20000,
    [7412] = 18000,
    [7413] = 4000,
    [7414] = 20000,
    [7415] = 300000,
    [7418] = 35000,
    [7419] = 15000,
    [7420] = 200000,
    [7421] = 22000,
    [7422] = 25000,
    [7424] = 5000,
    [7425] = 500,
    [7426] = 200000,
    [7427] = 9000,
    [7428] = 10000,
    [7429] = 40000,
    [7430] = 3000,
    [7432] = 1000,
    [7434] = 40000,
    [7436] = 5000,
    [7437] = 200000,
    [7438] = 2000,
    [7449] = 600,
    [7451] = 10000,
    [7452] = 5000,
    [7454] = 3000,
    [7456] = 10000,
    [7457] = 2000,
    [7460] = 1500,
    [7461] = 200,
    [7462] = 400,
    [7463] = 6000,
    [7464] = 850,
    [8022] = 40000,
    [8027] = 25000,
    [8031] = 10,
    [8042] = 350,
    [8043] = 6000,
    [8045] = 3000,
    [8049] = 16000,
    [8050] = 16000,
    [8052] = 16000,
    [8057] = 55000,
    [8061] = 18000,
    [8063] = 15000,
    [8064] = 200,
    [8072] = 4000,
    [8073] = 8000,
    [8074] = 13000,
    [8075] = 19000,
    [8082] = 4400,
    [8083] = 1500,
    [8084] = 3600,
    [8092] = 3600,
    [8093] = 1500,
    [8094] = 4400,
    [8143] = 500,
    [9013] = 500,
    [9014] = 500,
    [9015] = 1000,
    [9017] = 500,
    [9034] = 5000,
    [9053] = 20,
    [9054] = 25,
    [9055] = 30,
    [9057] = 200,
    [9058] = 5000,
    [9103] = 8000,
    [9302] = 3000,
    [9303] = 3000,
    [9304] = 3000,
    [9631] = 280,
    [9633] = 100,
    [9634] = 15,
    [9635] = 45,
    [9636] = 375,
    [9637] = 500,
    [9638] = 280,
    [9639] = 150,
    [9640] = 50,
    [9641] = 45,
    [9642] = 95,
    [9643] = 100,
    [9644] = 265,
    [9645] = 190,
    [9646] = 120,
    [9647] = 80,
    [9648] = 30,
    [9649] = 90,
    [9650] = 30,
    [9651] = 25,
    [9652] = 60,
    [9653] = 5000,
    [9657] = 55,
    [9658] = 160,
    [9659] = 85,
    [9660] = 700,
    [9661] = 280,
    [9662] = 420,
    [9663] = 420,
    [9665] = 400,
    [9666] = 520,
    [9667] = 200,
    [9668] = 150,
    [9683] = 115,
    [9684] = 120,
    [9685] = 275,
    [9686] = 20,
    [9688] = 800,
    [9689] = 30,
    [9690] = 90,
    [9691] = 60,
    [9692] = 10,
    [9693] = 10,
    [9694] = 400,
    [10196] = 150,
    [10272] = 35,
    [10273] = 95,
    [10274] = 50,
    [10275] = 35,
    [10276] = 150,
    [10277] = 210,
    [10278] = 120,
    [10279] = 15,
    [10280] = 380,
    [10281] = 80,
    [10282] = 600,
    [10283] = 55,
    [10289] = 250,
    [10291] = 30,
    [10292] = 35,
    [10293] = 50,
    [10295] = 20,
    [10296] = 10,
    [10297] = 50,
    [10300] = 50,
    [10301] = 28,
    [10302] = 45,
    [10303] = 48,
    [10304] = 475,
    [10305] = 130,
    [10306] = 360,
    [10307] = 150,
    [10308] = 50,
    [10309] = 600,
    [10311] = 400,
    [10312] = 450,
    [10313] = 800,
    [10314] = 75,
    [10316] = 480,
    [10317] = 380,
    [10318] = 30,
    [10319] = 15,
    [10320] = 180,
    [10321] = 100,
    [10323] = 35000,
    [10384] = 14000,
    [10385] = 45000,
    [10386] = 5000,
    [10387] = 14000,
    [10388] = 10000,
    [10389] = 16500,
    [10390] = 30000,
    [10391] = 10000,
    [10392] = 500,
    [10397] = 250,
    [10404] = 150,
    [10405] = 200,
    [10406] = 500,
    [10407] = 25,
    [10408] = 100,
    [10409] = 700,
    [10410] = 320,
    [10411] = 110,
    [10412] = 3000,
    [10413] = 600,
    [10414] = 150,
    [10415] = 550,
    [10416] = 130,
    [10417] = 500,
    [10418] = 100,
    [10420] = 250,
    [10438] = 12000,
    [10439] = 12000,
    [10444] = 175,
    [10449] = 700,
    [10450] = 200,
    [10451] = 9000,
    [10452] = 170,
    [10453] = 50,
    [10454] = 60,
    [10455] = 80,
    [10456] = 20,
    [10457] = 1500,
    [11443] = 30,
    [11444] = 60,
    [11445] = 30,
    [11446] = 350,
    [11448] = 300,
    [11449] = 320,
    [11450] = 480,
    [11451] = 30,
    [11452] = 35,
    [11453] = 20,
    [11454] = 1000,
    [11455] = 500,
    [11456] = 120,
    [11457] = 100,
    [11458] = 80,
    [11463] = 120,
    [11464] = 50,
    [11465] = 90,
    [11466] = 30,
    [11467] = 60,
    [11469] = 80,
    [11470] = 180,
    [11471] = 100,
    [11472] = 75,
    [11473] = 110,
    [11474] = 60,
    [11475] = 250,
    [11476] = 25,
    [11477] = 85,
    [11478] = 45,
    [11479] = 30,
    [11480] = 80,
    [11481] = 30,
    [11482] = 50,
    [11483] = 20,
    [11484] = 25,
    [11485] = 10,
    [11486] = 430,
    [11487] = 140,
    [11488] = 350,
    [11489] = 280,
    [11490] = 410,
    [11491] = 500,
    [11492] = 66,
    [11493] = 120,
    [11510] = 230,
    [11511] = 55,
    [11512] = 95,
    [11513] = 70,
    [11514] = 110,
    [11515] = 50,
    [11539] = 20,
    [11651] = 50000,
    [11652] = 8000,
    [11657] = 28000,
    [11658] = 550,
    [11659] = 430,
    [11660] = 340,
    [11661] = 120,
    [11666] = 5000,
    [11671] = 390,
    [11672] = 240,
    [11673] = 680,
    [11674] = 50000,
    [11680] = 300,
    [11684] = 20,
    [11691] = 90000,
    [11702] = 380,
    [11703] = 210,
    [12482] = 500,
    [12483] = 1000,
    [12541] = 1000,
    [12683] = 2000,
    [12730] = 150,
    [12737] = 4000,
    [12742] = 600,
    [13987] = 4000,
    [13990] = 3000,
    [13991] = 40000,
    [13993] = 60000,
    [13994] = 30000,
    [13995] = 35000,
    [13996] = 16000,
    [13997] = 25000,
    [13998] = 36000,
    [13999] = 40000,
    [14000] = 42000,
    [14001] = 42000,
    [14008] = 280,
    [14009] = 330,
    [14010] = 230,
    [14011] = 90,
    [14012] = 180,
    [14013] = 290,
    [14017] = 80,
    [14040] = 11000,
    [14041] = 360,
    [14042] = 9000,
    [14043] = 9000,
    [14044] = 430,
    [14076] = 130,
    [14077] = 420,
    [14078] = 340,
    [14079] = 210,
    [14080] = 320,
    [14081] = 190,
    [14082] = 450,
    [14083] = 150,
    [14086] = 15000,
    [14087] = 15000,
    [14088] = 32000,
    [14089] = 17000,
    [14112] = 10000,
    [14225] = 130,
    [14246] = 28000,
    [14247] = 12000,
    [14250] = 7000,
    [16096] = 6500,
    [16115] = 6000,
    [16117] = 6000,
    [16118] = 6500,
    [16119] = 1500,
    [16120] = 1500,
    [16121] = 1500,
    [16122] = 400,
    [16123] = 400,
    [16124] = 400,
    [16125] = 800,
    [16126] = 800,
    [16127] = 800,
    [16131] = 610,
    [16132] = 650,
    [16134] = 800,
    [16139] = 540,
    [16140] = 510,
    [16163] = 35000,
    [16164] = 35000,
    [17458] = 20,
    [17461] = 65,
    [17462] = 50,
    [17463] = 25,
    [17809] = 35,
    [17817] = 50,
    [17818] = 150,
    [17819] = 40,
    [17822] = 20,
    [17823] = 30,
    [17824] = 40,
    [17826] = 280,
    [17827] = 110,
    [17828] = 4000,
    [17829] = 7000,
    [17830] = 190,
    [17831] = 150,
    [17847] = 120,
    [17848] = 250,
    [17849] = 170,
    [17850] = 160,
    [17851] = 230,
    [17852] = 2000,
    [17853] = 140,
    [17854] = 80,
    [17855] = 40,
    [17856] = 210,
    [17857] = 160,
    [18924] = 60,
    [18925] = 90,
    [18926] = 40,
    [18927] = 150,
    [18928] = 360,
    [18929] = 90,
    [18930] = 210,
    [18993] = 70,
    [18994] = 115,
    [18995] = 55,
    [18996] = 120,
    [18997] = 30,
    [19110] = 35,
    [19111] = 25,
    [19358] = 1500,
    [19359] = 300,
    [19372] = 4000,
    [20183] = 3000,
    [20184] = 1900,
    [20198] = 700,
    [20199] = 400,
    [20200] = 390,
    [20201] = 600,
    [20202] = 450,
    [20203] = 900,
    [20204] = 500,
    [20205] = 650,
    [20206] = 350,
    [20207] = 480,
    [21103] = 350,
    [21164] = 7000,
    [21165] = 11000,
    [21166] = 6000,
    [21167] = 10000,
    [21168] = 11000,
    [21169] = 2000,
    [21170] = 5000,
    [21171] = 9000,
    [21172] = 2500,
    [21173] = 14000,
    [21174] = 7000,
    [21175] = 3000,
    [21176] = 12000,
    [21177] = 2500,
    [21178] = 1500,
    [21179] = 1500,
    [21180] = 1500,
    [21182] = 125,
    [21183] = 2000,
    [21193] = 260,
    [21194] = 160,
    [21195] = 130,
    [21196] = 390,
    [21197] = 320,
    [21198] = 430,
    [21199] = 170,
    [21200] = 140,
    [21201] = 240,
    [21202] = 110,
    [21204] = 210,
    [21747] = 400,
    [21800] = 150,
    [21801] = 260,
    [21892] = 10000,
    [21974] = 270,
    [21975] = 350,
    [21981] = 15000,
    [22007] = 70,
    [22051] = 160,
    [22052] = 180,
    [22053] = 175,
    [22054] = 165,
    [22055] = 185,
    [22056] = 195,
    [22057] = 85,
    [22184] = 200,
    [22188] = 180,
    [22189] = 210,
    [22191] = 250,
    [22193] = 400,
    [22194] = 500,
    [22195] = 3500,
    [22516] = 100000,
    [22726] = 50000,
    [22727] = 30000,
    [22728] = 1100,
    [22729] = 1300,
    [22730] = 1200,
    [22866] = 45000,
    [22867] = 45000,
    [23501] = 260,
    [23502] = 290,
    [23503] = 300,
    [23504] = 310,
    [23505] = 280,
    [23506] = 250,
    [23507] = 400,
    [23508] = 270,
    [23510] = 410,
    [23511] = 430,
    [23513] = 300,
    [23514] = 300,
    [23515] = 300,
    [23516] = 300,
    [23517] = 310,
    [23518] = 350,
    [23519] = 270,
    [23520] = 270,
    [23521] = 250,
    [23522] = 250,
    [23523] = 300,
    [23524] = 250,
    [23529] = 8000,
    [23531] = 8000,
    [23533] = 8000,
    [23542] = 6000,
    [23543] = 6000,
    [23544] = 6000,
    [24380] = 150,
    [24381] = 200,
    [24384] = 260,
    [24385] = 180,
    [24386] = 300,
    [24387] = 320,
    [24388] = 175,
    [24389] = 265,
    [24390] = 350,
    [24391] = 750,
    [24392] = 3500,
    [24937] = 700,
    [24938] = 550,
    [24939] = 10000,
    [24940] = 10000,
    [24941] = 10000,
    [24942] = 10000,
    [24961] = 350,
    [24962] = 450,
    [25088] = 2000,
    [25089] = 400,
    [25686] = 150,
    [25689] = 250,
    [25691] = 120,
    [25693] = 150,
    [25694] = 200,
    [25695] = 200,
    [25698] = 2000,
    [25699] = 12000,
    [25700] = 5000,
    [25737] = 500,
    [25742] = 200,
    [25743] = 500,
    [25744] = 250,
    [25745] = 200,
    [27301] = 80,
    [27369] = 40,
    [27462] = 100,
    [27463] = 200,
    [27592] = 800,
    [27593] = 650,
    [27594] = 500,
    [27595] = 500,
    [27596] = 700,
    [27597] = 350,
    [27598] = 270,
    [27599] = 550,
    [27600] = 600,
    [27601] = 350,
    [27602] = 850,
    [27603] = 240,
    [27604] = 120,
    [27606] = 100,
    [27607] = 850,
    [27608] = 900,
    [27618] = 15000,
    [27619] = 10000,
    [27620] = 8000,
    [27621] = 15000,
    [27623] = 4500,
    [27624] = 8000,
    [27625] = 15000,
    [27626] = 10000,
    [27627] = 8000,
    [27874] = 250,
    [28566] = 1300,
    [28567] = 1100,
    [28568] = 720,
    [28569] = 640,
    [28570] = 350,
    [28821] = 1350,
    [28822] = 280,
    [28823] = 650,
    [28824] = 950,
    [29345] = 60,
    [29346] = 180,
    [29347] = 2150,
    [29348] = 210,
    [29942] = 500000,
    [29943] = 270000,
    [29944] = 180000,
    [29945] = 225000,
    [29946] = 630000,
    [30005] = 205,
    [30053] = 45000,
    [30054] = 50000,
    [30055] = 30000,
    [30056] = 18000,
    [30058] = 370,
    [30059] = 70000,
    [30060] = 90000,
    [30087] = 280000,
    [30088] = 240000,
    [30180] = 30000,
    [30185] = 150,
    [30186] = 200,
    [30324] = 220,
    [31323] = 42000,
    [31324] = 38000,
    [31331] = 270,
    [31340] = 530,
    [31437] = 470,
    [31438] = 360,
    [31439] = 220,
    [31440] = 310,
    [31441] = 330,
    [31442] = 240,
    [31443] = 950,
    [31558] = 270,
    [31559] = 230,
    [31560] = 190,
    [31561] = 260,
    [31588] = 28000,
    [31589] = 74000,
    [31590] = 25000,
    [31591] = 410000,
    [31592] = 480000,
    [31593] = 425000,
    [31594] = 440000,
    [31595] = 430000,
    [31622] = 210000,
    [31623] = 490000,
    [31624] = 245000,
    [31678] = 650,
    [32009] = 40,
    [32011] = 100,
    [32012] = 120,
    [32093] = 60,
    [32114] = 50,
    [32227] = 120,
    [32228] = 260,
    [32578] = 100000,
    [32579] = 90000,
    [32580] = 50000,
    [32583] = 12000,
    [32589] = 36000,
    [32593] = 120000,
    [32594] = 70000,
    [32595] = 150000,
    [32596] = 310000,
    [32597] = 220000,
    [32598] = 489000,
    [32599] = 185000,
    [32600] = 370000,
    [32623] = 80000,
    [32624] = 41000,
    [32625] = 56000,
    [32626] = 20000,
    [32698] = 820,
    [32704] = 500,
    [32705] = 500,
    [32711] = 50,
    [32724] = 500,
    [32725] = 250,
    [32769] = 12000,
    [32770] = 15000,
    [32771] = 13000,
    [32772] = 10000,
    [32773] = 8000,
    [32774] = 6000,
    [33779] = 30000,
    [33780] = 230000,
    [33781] = 10000,
    [33920] = 620000,
    [33921] = 850000,
    [33922] = 640000,
    [33923] = 720000,
    [33924] = 950000,
    [33925] = 1500000,
    [33926] = 840000,
    [33927] = 737000,
    [33928] = 1900000,
    [33929] = 2200,
    [33932] = 3200,
    [33933] = 1300,
    [33934] = 1600,
    [33935] = 2700,
    [33936] = 1450,
    [33937] = 3500,
    [33938] = 1200,
    [33943] = 220,
    [33944] = 350,
    [33945] = 300,
    [33952] = 3000000,
    [33953] = 5000000,
    [33982] = 3700,
    [34008] = 9000,
    [34014] = 3900,
    [34018] = 2800000,
    [34019] = 3100000,
    [34020] = 2700000,
    [34021] = 2900000,
    [34022] = 12000,
    [34023] = 14000,
    [34024] = 15000,
    [34025] = 19000,
    [34100] = 210,
    [34101] = 230,
    [34102] = 280,
    [34103] = 300,
    [34138] = 2100,
    [34139] = 2100,
    [34140] = 5000,
    [34141] = 2100,
    [34142] = 2100,
    [34143] = 2100,
    [34144] = 1200,
    [34145] = 1200,
    [34146] = 1200,
    [34147] = 3000,
    [34148] = 1200,
    [34149] = 1200,
    [34160] = 270,
    [34161] = 130,
    [34162] = 190,
    [34163] = 210,
    [34164] = 200,
    [34170] = 30000,
    [35571] = 500,
    [35572] = 110,
    [35573] = 180,
    [35574] = 250,
    [35578] = 11000,
    [35579] = 7000,
    [35580] = 9000,
    [35581] = 6000,
    [35588] = 150,
    [35596] = 200,
    [35610] = 52000,
    [35611] = 27000,
    [35612] = 80000,
    [35613] = 150000,
    [35614] = 120000,
    [36769] = 600,
    [36770] = 750,
    [36771] = 1100,
    [36772] = 500,
    [36773] = 400,
    [36774] = 600,
    [36775] = 420,
    [36776] = 650,
    [36777] = 900,
    [36778] = 800,
    [36779] = 550,
    [36780] = 1000,
    [36781] = 750,
    [36782] = 670,
    [36783] = 930,
    [36784] = 740,
    [36785] = 900,
    [36786] = 390,
    [36787] = 1200,
    [36788] = 650,
    [36789] = 900,
    [36790] = 500,
    [36791] = 700000,
    [36792] = 650000,
    [36793] = 900000,
    [36794] = 240000,
    [36795] = 300000,
    [36796] = 440000,
    [36805] = 250,
    [36806] = 230,
    [36808] = 220000,
    [36809] = 320000,
    [36820] = 600,
    [36821] = 400,
    [36823] = 350,
    [36835] = 48000,
    [36971] = 520,
    [36972] = 570,
    [37607] = 300000,
    [37608] = 300000,
    [37609] = 300000,
    [37610] = 300000,
    [37613] = 5000000,
    [37810] = 3250000,
    [39038] = 460000,
    [39040] = 1070000,
    [39375] = 2200,
    [39376] = 1900,
    [39377] = 2900,
    [39378] = 2500,
    [39379] = 2150,
    [39380] = 2700,
    [39381] = 2000,
    [39382] = 3000,
    [39383] = 2300,
    [39384] = 1800,
    [39386] = 2998,
    [39387] = 2998,
    [39388] = 1300,
    [39389] = 2000,
    [39391] = 1200,
    [39392] = 2750,
    [39393] = 2650,
    [39394] = 3200,
    [39395] = 2500,
    [39399] = 215000,
    [39400] = 150000,
    [39401] = 350,
    [39402] = 320,
    [39403] = 140,
    [39404] = 160,
    [39405] = 250,
    [39406] = 360,
    [39407] = 330,
    [39408] = 380,
    [39409] = 460,
    [39410] = 220,
    [39411] = 390,
    [39412] = 380,
    [39413] = 340,
    [39414] = 340,
    [39415] = 570,
    [39416] = 570,
    [39417] = 150,
    [39418] = 150,
    [39543] = 470000,
    [40530] = 1000,
    [40531] = 530,
    [40532] = 560,
    [40533] = 640,
    [40534] = 440,
    [40582] = 550,
    [40583] = 480,
    [40586] = 630,
    [40587] = 680,
    [43729] = 570,
    [43731] = 280,
    [43732] = 11000,
    [43733] = 11000,
    [43736] = 18000,
    [43737] = 18000,
    [43739] = 5000,
    [43846] = 5100,
    [43848] = 4200,
    [43850] = 4400,
    [43851] = 5500,
    [43852] = 3800,
    [43853] = 4100,
    [43856] = 5200,
    [43857] = 4700,
    [43858] = 3000,
    [43859] = 5800,
    [43888] = 5000,
    [43963] = 5400000,
    [43964] = 900000,
    [43965] = 950000,
    [51670] = 50000,
}
local PRICES_LOADED = true -- embedded snapshot: no external dofile dependency.
local function npcPrice(id)
    local typ = ItemType(id)
    local name = typ and call(typ, 'getName') or ('ID '..tostring(id))
    name = (type(name)=='string' and name~='' and name) or ('ID '..tostring(id))
    local lower = trim(name):lower()
    if lower=='gold coin' then return 1,name,true end
    if lower=='platinum coin' then return 100,name,true end
    if lower=='crystal coin' then return 10000,name,true end
    local byName = NPC_PRICES[lower]
    if byName then return byName,name,true end
    local byId = NPC_PRICES_ID[id]
    if byId then return byId,name,true end
    return nil,name,false
end

local EQUIP_SLOTS = {
    CONST_SLOT_HEAD, CONST_SLOT_NECKLACE, CONST_SLOT_ARMOR, CONST_SLOT_RIGHT,
    CONST_SLOT_LEFT, CONST_SLOT_LEGS, CONST_SLOT_FEET, CONST_SLOT_RING, CONST_SLOT_AMMO,
}
local function itemNumber(item, kind, def)
    local byAttribute = call(item, 'getAttribute', kind)
    if type(byAttribute)=='number' and byAttribute>0 then return byAttribute end
    return val(def,0)
end
-- Inventory scanner v3.4: Canary Container:getItems(true) returns contents recursively.
-- The previous version silently swallowed scanner errors (call -> nil) and reported zero potions.
-- player:getItemCount(itemId) is implemented in src/creatures/players/player.cpp and
-- counts the complete carried inventory, including nested containers; NOT depots or stash.
-- This secondary source catches nonstandard backpack containers and scanner failures.
local function readBackpack(player)
    local backpack=call(player,'getSlotItem',CONST_SLOT_BACKPACK)
    local counts, unknownRunes, scannedCounts = {}, {}, {}
    local n=0
    local inventorySource='sin backpack'
    local container=backpack and call(backpack,'getContainer') or nil
    -- getContainer() can return false on non-container items.
    if container and container~=false then
        local contents=call(container,'getItems',true)
        if type(contents)=='table' then
            inventorySource='getItems(true) + getItemCount'
            for _,it in ipairs(contents) do
                n=n+1
                local id=tonumber(call(it,'getId'))
                if id and id>0 then
                    local amount=math.max(1,val(call(it,'getCount'),1))
                    -- Keep rune charges if a rune stack exposes charges rather than stack count.
                    local typ=ItemType(id)
                    if typ and call(typ,'isRune') then
                        local charges=val(call(it,'getCharges'),0)
                        if charges>amount and not call(typ,'isStackable') then amount=charges end
                    end
                    scannedCounts[id]=(scannedCounts[id] or 0)+amount
                end
            end
        else
            inventorySource='getItemCount (getItems recursivo no disponible)'
        end
    end
    for id,count in pairs(scannedCounts) do counts[id]=count end
    local detectedByEngine=0
    local mismatch={}
    local known={}
    for id in pairs(POTIONS) do known[id]=true end
    for id in pairs(FOOD) do known[id]=true end
    for id in pairs(RUNES) do known[id]=true end
    -- The C++ API is the authoritative count when reading a backpack fails;
    -- for well-formed scans it should be >= scan count (it also counts equipped slots).
    for id in pairs(known) do
        local engine=call(player,'getItemCount',id)
        if type(engine)=='number' and engine>=0 then
            detectedByEngine=detectedByEngine+1
            engine=math.floor(engine)
            local scanned=scannedCounts[id] or 0
            if engine~=scanned then
                mismatch[#mismatch+1]={id=id,scanner=scanned,engine=engine}
            end
            counts[id]=math.max(scanned,engine)
        end
    end
    if detectedByEngine==0 then
        inventorySource=container and 'getItems(true) (sin API getItemCount)' or 'no se pudo consultar inventario'
    end
    -- Unknown runes are measured from actual backpack contents where available.
    for id,amount in pairs(scannedCounts) do
        if not RUNES[id] then
            local typ=ItemType(id)
            if typ and call(typ,'isRune') then unknownRunes[id]=amount end
        end
    end
    local info={
        source=inventorySource,
        scans=n,
        checkedByEngine=detectedByEngine,
        discrepancies=mismatch,
        -- Special debug fields: expected consumables for the current bug report.
        supremeScan=scannedCounts[23375] or 0,
        supremeEngine=val(call(player,'getItemCount',23375),-1),
        manaScan=scannedCounts[237] or 0,
        manaEngine=val(call(player,'getItemCount',237),-1),
    }
    -- A real backpack may have no recognized content; do not invent counts.
    return counts,unknownRunes,n,backpack~=nil,info
end
local function capturePlayer(player)
    local vocation=call(player,'getVocation')
    local base=call(vocation,'getBaseId')
    if base~=4 then return nil,'El simulador automatico actual funciona con Knight / Elite Knight.' end
    local p={
        name=call(player,'getName') or 'Knight',
        vocation=call(vocation,'getName') or 'Knight',
        level=val(call(player,'getLevel'),8),
        xp=val(call(player,'getExperience'),0),
        maxHp=val(call(player,'getMaxHealth'),1),
        maxMana=val(call(player,'getMaxMana'),1),
        hp=val(call(player,'getHealth'),1),
        mana=val(call(player,'getMana'),0),
        ml=val(call(player,'getMagicLevel'),0),
        hpGain=val(call(vocation,'getHealthGain'),15),
        manaGain=val(call(vocation,'getManaGain'),5),
        hpTick=math.max(.5,val(call(vocation,'getHealthGainTicks'),4000)/1000),
        hpTickAmount=val(call(vocation,'getHealthGainAmount'),1),
        manaTick=math.max(.5,val(call(vocation,'getManaGainTicks'),6000)/1000),
        manaTickAmount=val(call(vocation,'getManaGainAmount'),2),
        attackInterval=math.max(.5,val(call(vocation,'getAttackSpeed'),1000)/1000),
        armor=0, shieldDefense=0, shielding=0, weaponAttack=0, skill=0,
        weaponName='none', skillName='none', gear={},
    }
    local wType, skillType
    for _,slot in ipairs(EQUIP_SLOTS) do
        local item=call(player,'getSlotItem',slot)
        if item then
            local id=call(item,'getId')
            local typ=id and ItemType(id)
            if typ then
                local name=call(typ,'getName') or ('ID '..tostring(id))
                p.gear[#p.gear+1]=name
                p.armor=p.armor+itemNumber(item,'armor',call(typ,'getArmor'))
                local typeId=call(typ,'getWeaponType')
                local atk=itemNumber(item,'attack',call(typ,'getAttack'))
                if (typeId==WEAPON_AXE or typeId==WEAPON_SWORD or typeId==WEAPON_CLUB) and atk>p.weaponAttack then
                    p.weaponAttack=atk; wType=typeId;p.weaponName=name
                elseif typeId==WEAPON_SHIELD then
                    p.shieldDefense=math.max(p.shieldDefense,itemNumber(item,'defense',call(typ,'getDefense')))
                end
            end
        end
    end
    if wType==WEAPON_AXE then skillType=SKILL_AXE;p.skillName='axe'
    elseif wType==WEAPON_SWORD then skillType=SKILL_SWORD;p.skillName='sword'
    elseif wType==WEAPON_CLUB then skillType=SKILL_CLUB;p.skillName='club' end
    if not skillType then return nil,'Equipa una espada, hacha o club. Fist fighting no se usa para el balance de Frozen Hell.' end
    p.skill=val(call(player,'getEffectiveSkillLevel',skillType),val(call(player,'getSkillLevel',skillType),10))
    p.shielding=val(call(player,'getEffectiveSkillLevel',SKILL_SHIELD),val(call(player,'getSkillLevel',SKILL_SHIELD),10))
    p.xp=math.max(p.xp,expForLevel(p.level))
    p.hp=clamp(CFG.sampleStartFull and p.maxHp or p.hp,1,p.maxHp)
    p.mana=clamp(CFG.sampleStartFull and p.maxMana or p.mana,0,p.maxMana)
    p.items,p.unknownRunes,p.backpackItems,p.hasBackpack,p.inventoryDiagnostic=readBackpack(player)
    return p
end

local ELEMENTS = {
    physical=COMBAT_PHYSICALDAMAGE, fire=COMBAT_FIREDAMAGE, ice=COMBAT_ICEDAMAGE,
    energy=COMBAT_ENERGYDAMAGE, earth=COMBAT_EARTHDAMAGE, death=COMBAT_DEATHDAMAGE,
}
local function captureMonster(name)
    local mt=MonsterType(trim(name))
    if not mt then return nil,'Monstruo no encontrado: '..trim(name) end
    local m={
        name=call(mt,'name') or trim(name),
        maxHp=val(call(mt,'maxHealth'),0),
        armor=val(call(mt,'armor'),0), defense=val(call(mt,'defense'),0),
        mitigation=clamp(val(call(mt,'mitigation'),0),0,100),
        exp=val(call(mt,'experience'),0),
        resist=call(mt,'getElementList') or {},
        immunities=call(mt,'combatImmunities') or {},
        attacks={},heals={},
        loot=call(mt,'getLoot') or {},
        monsterType=mt,            -- retain real MonsterType to invoke /loot engine roll
    }
    if m.maxHp<=0 then return nil,'El monstruo no tiene HP validos.' end
    for _,a in ipairs(call(mt,'getAttackList') or {}) do
        local lo,hi=minmax(math.abs(val(a.minCombatValue,0)),math.abs(val(a.maxCombatValue,0)))
        if hi>0 then m.attacks[#m.attacks+1]={lo=lo,hi=hi, period=math.max(.5,val(a.speed,2000)/1000),chance=clamp(val(a.chance,100)/100,0,1),melee=a.isMelee==true or a.isMelee==1} end
    end
    for _,h in ipairs(call(mt,'getDefenseList') or {}) do
        local lo,hi=minmax(val(h.minCombatValue,0),val(h.maxCombatValue,0))
        if lo>0 then m.heals[#m.heals+1]={lo=lo,hi=hi,period=math.max(.5,val(h.speed,2000)/1000),chance=clamp(val(h.chance,100)/100,0,1)} end
    end
    return m
end

local function monsterReduce(raw,m,element,auto)
    local combatType=ELEMENTS[element] or ELEMENTS.physical
    if m.immunities[combatType]==true or val(m.immunities[combatType],0)>0 then return 0 end
    local dmg=raw
    if element=='physical' then
        if auto and m.defense>0 and math.random()<.5 then dmg=dmg-sample(m.defense/2,m.defense) end
        dmg=dmg-(m.armor>3 and sample(m.armor/2,m.armor-(m.armor%2+1)) or (m.armor>0 and 1 or 0))
    end
    local res=clamp(val(m.resist[combatType],0),-100,100)
    return math.max(0,rounded(math.max(0,dmg)*(1-m.mitigation/100)*(1-res/100)))
end
local function playerReduce(raw,p,melee)
    local dmg=raw
    if melee then
        if p.shieldDefense>0 and math.random()<.50 then
            local d=((p.shielding/4+2.23)*p.shieldDefense*.5*.16)
            dmg=dmg-sample(d/2,d)
        end
        dmg=dmg-(p.armor>3 and sample(p.armor/2,p.armor-(p.armor%2+1)) or (p.armor>0 and 1 or 0))
    end
    return math.max(0,rounded(dmg))
end
local function chooseSupply(items, specs, kind, level, deficit)
    local best,bestScore
    for id,s in pairs(specs) do
        if s.kind==kind and level>=s.req and (items[id] or 0)>0 then
            local avg=(s.lo+s.hi)/2
            local effective=math.min(deficit,avg)
            -- largest effective restoration, penalize substantial waste
            local score=effective-0.15*math.max(0,avg-deficit)
            if not best or score>bestScore then best={id=id,info=s};bestScore=score end
        end
    end
    return best
end
local function chooseFood(items,maxHp,maxMana,hpDef,manaDef)
    local best,score=-1,-1
    for id,s in pairs(FOOD) do
        if (items[id] or 0)>0 then
            local hp=s.hp+maxHp*s.hpPct/100
            local mana=s.mana+maxMana*s.manaPct/100
            local value=math.min(hpDef,hp)+math.min(manaDef,mana)*.7
            if value>score then best=id;score=value end
        end
    end
    if best>0 then return best,FOOD[best],score end
end
local function availableRune(items,level,ml,kind,monster)
    local chosen,expected
    for id,s in pairs(RUNES) do
        if s.kind==kind and (items[id] or 0)>0 and level>=s.level and ml>=s.ml then
            local lo,hi=s.fn(level,ml)
            local potential=lo+hi
            if monster and kind=='attack' then
                local typ=ELEMENTS[s.element] or ELEMENTS.physical
                local immunity=monster.immunities[typ]
                if immunity==true or val(immunity,0)>0 then potential=0
                else potential=potential*(1-clamp(val(monster.resist[typ],0),-100,100)/100) end
            end
            if potential>0 and (not chosen or potential>expected) then chosen={id=id,info=s}; expected=potential end
        end
    end
    return chosen
end
local function copyMap(t)
    local out={} for k,v in pairs(t or {}) do out[k]=v end return out
end
local function runOnce(p,m,targets)
    local r={
        level=p.level,xp=p.xp,hp=p.hp,mana=p.mana,maxHp=p.maxHp,maxMana=p.maxMana,
        kills=0,exp=0,seconds=0,combatSeconds=0,damageDone=0,damageTaken=0,monsterHeals=0,
        manaSpent=0,manaPotRestored=0,regenMana=0,healSpell=0,healPotion=0,healFood=0,
        healRegen=0,healRune=0,manaFood=0,used={},spells={},byAttack={},cost=0,
        healSpellByName={},healPotionById={},manaPotionById={},healRuneById={},
        dead=false,failed=false,ttkTotal=0,levels=0,
    }
    local items=copyMap(p.items)
    local t=0;local dt=CFG.timeStep
    local monsterHP=m.maxHp;local monsterStart=0;local respawn=0
    local autoNext, attackNext, potionNext = p.attackInterval, 0, 0
    local healGroupNext=0
    local manaTick,hpTick = p.manaTick,p.hpTick
    local uturaExpiry, uturaTick, uturaNext, uturaAmount = -1, math.huge, 0, 0
    local nextAttack, nextHeal, cd={}, {}, {}
    local function initMonster(now)
        monsterHP=m.maxHp;monsterStart=now
        for i,a in ipairs(m.attacks) do nextAttack[i]=now+a.period end
        for i,h in ipairs(m.heals) do nextHeal[i]=now+h.period end
    end
    initMonster(0)
    local function consume(id,name,cost)
        if (items[id] or 0)<1 then return false end
        items[id]=items[id]-1
        r.used[id]=(r.used[id] or 0)+1
        r.cost=r.cost+(cost or 0)
        return true
    end
    local function spendMana(s)
        if r.mana<s.mana then return false end
        r.mana=r.mana-s.mana;r.manaSpent=r.manaSpent+s.mana
        r.spells[s.key]=(r.spells[s.key] or 0)+1
        return true
    end
    local function hit(raw,label,element,auto)
        if not monsterHP or monsterHP<=0 then return end
        local dmg=monsterReduce(raw,m,element or 'physical',auto)
        dmg=math.min(monsterHP,dmg)
        monsterHP=monsterHP-dmg
        r.damageDone=r.damageDone+dmg
        r.byAttack[label]=(r.byAttack[label] or 0)+dmg
    end
    local function gainHp(amount,kind)
        local gain=math.max(0,math.min(math.max(0,r.maxHp-r.hp),amount))
        r.hp=r.hp+gain
        r[kind]=r[kind]+gain
        return gain
    end
    local function gainMana(amount,kind)
        local gain=math.max(0,math.min(math.max(0,r.maxMana-r.mana),amount))
        r.mana=r.mana+gain
        r[kind]=r[kind]+gain
        return gain
    end
    while t+0.001<CFG.maxSimMinutes*60 and r.kills<targets and not r.dead do
        -- passive regen, no changes to actual character
        if t+0.001>=manaTick then
            gainMana(p.manaTickAmount,'regenMana');manaTick=manaTick+p.manaTick
        end
        if t+0.001>=hpTick then
            gainHp(p.hpTickAmount,'healRegen');hpTick=hpTick+p.hpTick
        end
        if t+0.001>=uturaTick and t<uturaExpiry then
            gainHp(uturaAmount,'healRegen');uturaTick=uturaTick+3
        end
        if monsterHP and monsterHP>0 then
            r.combatSeconds=r.combatSeconds+dt
            local hpDef=r.maxHp-r.hp
            local manaDef=r.maxMana-r.mana
            -- One common potion/food timer. Severe HP deficit has priority.
            if t+0.001>=potionNext then
                local hpPick=chooseSupply(items,POTIONS,'hp',r.level,hpDef)
                local manaPick=chooseSupply(items,POTIONS,'mana',r.level,manaDef)
                local lowHp=r.hp/r.maxHp<.43
                local hpDanger=hpDef>math.max(250,r.maxHp*.3)
                if hpPick and (lowHp or (hpDanger and r.mana<40)) then
                    local q=hpPick.info
                    consume(hpPick.id,q.name,q.cost)
                    local recovered=gainHp(sample(q.lo,q.hi),'healPotion')
                    r.healPotionById[hpPick.id]=(r.healPotionById[hpPick.id] or 0)+recovered
                    potionNext=t+CFG.potionCooldown
                elseif CFG.useSuperFood and (r.hp/r.maxHp<.36 or r.mana/r.maxMana<.22) then
                    local id,food,score=chooseFood(items,r.maxHp,r.maxMana,hpDef,manaDef)
                    if food and score>100 then
                        consume(id,food.name,food.cost)
                        gainHp(food.hp+r.maxHp*food.hpPct/100,'healFood')
                        gainMana(food.mana+r.maxMana*food.manaPct/100,'manaFood')
                        potionNext=t+CFG.foodCooldown
                    end
                elseif manaPick and manaDef>math.max(80,r.maxMana*.25) and (r.mana/r.maxMana<.65 or r.mana<340) then
                    local q=manaPick.info
                    consume(manaPick.id,q.name,q.cost)
                    local recovered=gainMana(sample(q.lo,q.hi),'manaPotRestored')
                    r.manaPotionById[manaPick.id]=(r.manaPotionById[manaPick.id] or 0)+recovered
                    potionNext=t+CFG.potionCooldown
                end
            end
            if t+0.001>=healGroupNext then
                local choice
                for _,s in ipairs(HEALS) do
                    if r.level>=s.level and r.mana>=s.mana and t+0.001>=(cd[s.key] or 0) then
                        local low,high=s.fn(r.level,p.ml)
                        local deficit=r.maxHp-r.hp
                        if deficit>(low+high)*.42 and (r.hp/r.maxHp<.85 or deficit>(low+high)*.85) then
                            choice=s;break
                        end
                    end
                end
                if choice then
                    local low,high=choice.fn(r.level,p.ml)
                    if spendMana(choice) then
                        local recovered=gainHp(sample(low,high),'healSpell')
                        r.healSpellByName[choice.key]=(r.healSpellByName[choice.key] or 0)+recovered
                        cd[choice.key]=t+choice.cd;healGroupNext=t+1
                    end
                elseif CFG.allowHealingRunes and r.hp/r.maxHp<.35 then
                    local rune=availableRune(items,r.level,p.ml,'heal')
                    if rune and consume(rune.id,rune.info.name,rune.info.cost) then
                        local low,high=rune.info.fn(r.level,p.ml)
                        local recovered=gainHp(sample(low,high),'healRune')
                        r.healRuneById[rune.id]=(r.healRuneById[rune.id] or 0)+recovered
                        healGroupNext=t+1
                    end
                end
            end
            if r.level>=50 and t+0.001>=uturaNext and r.hp<r.maxHp*.88 then
                local gran=r.level>=100
                local manaCost=gran and 165 or 75
                if r.mana>=manaCost then
                    spendMana({key=gran and 'utura gran' or 'utura',mana=manaCost})
                    uturaAmount=gran and 40 or 20
                    uturaExpiry=t+60;uturaTick=t+3;uturaNext=t+60
                end
            end
            -- offensive spells: exactly the old formulas with cooldowns and 2s group timer
            if t+0.001>=attackNext then
                local spell
                for _,s in ipairs(ATTACK) do
                    if r.level>=s.level and r.mana>=s.mana and t+0.001>=(cd[s.key] or 0) then spell=s;break end
                end
                if spell then
                    local lo,hi=spell.fn(r.level,p.skill,p.weaponAttack)
                    if spendMana(spell) then
                        hit(sample(lo,hi),spell.key,'physical',false)
                        cd[spell.key]=t+spell.cd;attackNext=t+2
                    end
                elseif CFG.allowOffensiveRunes then
                    local rune=availableRune(items,r.level,p.ml,'attack',m)
                    if rune and consume(rune.id,rune.info.name,rune.info.cost) then
                        local lo,hi=rune.info.fn(r.level,p.ml)
                        hit(sample(lo,hi),'rune: '..rune.info.name,rune.info.element,false)
                        attackNext=t+2
                    end
                end
            end
            if monsterHP>0 and t+0.001>=autoNext then
                local lo=r.level/5
                local hi=rounded(.085*p.weaponAttack*p.skill+r.level/5)
                hit(sample(lo,hi),'basic melee','physical',true)
                autoNext=t+p.attackInterval
            end
            -- monster heal actions from getDefenseList, positive numeric spells only.
            for i,h in ipairs(m.heals) do
                if monsterHP>0 and t+0.001>=nextHeal[i] then
                    nextHeal[i]=t+h.period
                    if math.random()<h.chance then
                        local gain=math.min(m.maxHp-monsterHP,sample(h.lo,h.hi))
                        monsterHP=monsterHP+gain;r.monsterHeals=r.monsterHeals+gain
                    end
                end
            end
            for i,a in ipairs(m.attacks) do
                if monsterHP>0 and t+0.001>=nextAttack[i] then
                    nextAttack[i]=t+a.period
                    if math.random()<a.chance then
                        local dmg=playerReduce(sample(a.lo,a.hi),p,a.melee)
                        r.hp=r.hp-dmg;r.damageTaken=r.damageTaken+dmg
                        if r.hp<=0 then r.hp=0;r.dead=true;break end
                    end
                end
            end
            if monsterHP<=0 and not r.dead then
                r.kills=r.kills+1
                r.ttkTotal=r.ttkTotal+(t+dt-monsterStart)
                local xp=math.floor(m.exp*expRate(r.level))
                r.exp=r.exp+xp;r.xp=r.xp+xp
                while r.level<CFG.maxLevel and r.xp>=expForLevel(r.level+1) do
                    r.level=r.level+1;r.levels=r.levels+1
                    r.maxHp=r.maxHp+p.hpGain;r.maxMana=r.maxMana+p.manaGain
                    r.hp=r.maxHp;r.mana=r.maxMana -- Canary refills on level up
                end
                monsterHP=nil;respawn=t+dt+CFG.downtime
            end
        elseif t+0.001>=respawn then
            initMonster(t)
        end
        t=t+dt
    end
    r.seconds=math.min(t,CFG.maxSimMinutes*60)
    r.completed=(r.kills>=targets)
    r.timeLimited=(not r.completed and not r.dead)
    r.dps=r.combatSeconds>0 and r.damageDone/r.combatSeconds or 0
    r.ttk=r.kills>0 and r.ttkTotal/r.kills or 0
    r.finalItems=items
    r.expToNext=math.max(0,expForLevel(r.level+1)-r.xp)
    r.levelProgress=100*(r.xp-expForLevel(r.level))/math.max(1,expForLevel(r.level+1)-expForLevel(r.level))
    return r
end

-- One independent virtual combat. No P10/P90, no hourly extrapolation.
-- The number of enemies is ONLY the second optional command argument.
local function formatTime(seconds)
    local n=math.max(0, math.floor(seconds+0.5))
    local h=math.floor(n/3600)
    local m=math.floor((n%3600)/60)
    local s=n%60
    if h>0 then return string.format('%dh %02dm %02ds',h,m,s) end
    if m>0 then return string.format('%dm %02ds',m,s) end
    return string.format('%ds',s)
end

-- LOOT REAL SIMULADO: misma API y configuracion que BalanceoLootMonsters(2).lua.
-- Una llamada a MonsterType:generateLootRoll por cada enemigo realmente derrotado.
-- No reconstruye a mano getLoot(): ese calculo producia loot fraccionario incorrecto.
-- Nunca se generan items en el mapa ni se modifica la backpack.
local function simulateLoot(m,kills,player)
    local output={ok=true,rows={},total=0,unpriced=0,unpricedTypes=0,items=0,rolls=0}
    if kills<=0 then return output end
    local mt=m.monsterType or MonsterType(m.name)
    if not mt then
        return {ok=false,error='MonsterType no disponible para simular loot.'}
    end
    local counts={}
    local lootConfig={factor=CFG.lootFactor,gut=false}
    for i=1,kills do
        local ok,drops=pcall(function()
            return mt:generateLootRoll(lootConfig, {}, player)
        end)
        if not ok or type(drops)~='table' then
            return {ok=false,error='generateLootRoll no disponible o retorno invalido. Verifica que /loot funcione en Canary.'}
        end
        output.rolls=output.rolls+1
        for itemId,dropData in pairs(drops) do
            local id=tonumber(itemId)
            local validCount,count=pcall(function() return tonumber(dropData.count) end)
            if not validCount or not id or id<=0 or id~=math.floor(id) or not count or count<0 or count~=math.floor(count) then
                return {ok=false,error='generateLootRoll devolvio un itemId/count invalido.'}
            end
            if count>0 then counts[id]=(counts[id] or 0)+count end
        end
    end
    for id,count in pairs(counts) do
        local unit,name,priced=npcPrice(id)
        local row={id=id,name=name,count=count,priced=priced,unit=unit,value=priced and count*unit or 0}
        output.rows[#output.rows+1]=row
        output.items=output.items+count
        if priced then output.total=output.total+row.value
        else
            output.unpriced=output.unpriced+count
            output.unpricedTypes=output.unpricedTypes+1
        end
    end
    table.sort(output.rows,function(a,b)
        if a.priced~=b.priced then return a.priced end
        if a.value~=b.value then return a.value>b.value end
        if a.count~=b.count then return a.count>b.count end
        return tostring(a.name)<tostring(b.name)
    end)
    return output
end

local function report(p,m,run,targets,player)
    local r=run
    local loot=simulateLoot(m,r.kills,player)
    local result
    if r.completed then result='VICTORIA'
    elseif r.dead then result='MUERTO'
    else result='TIEMPO LIMITE (120 min)' end

    local L={
        'FROZEN HELL | SIMDPS v3.4',
        '================================',
        'OBJETIVO: '..m.name..' x'..targets,
        'RESULTADO: '..result..' | '..r.kills..'/'..targets..' eliminados',
        'Tiempo real simulado: '..formatTime(r.seconds),
        '',
        '[PERSONAJE]',
        p.name..' | '..p.vocation..' Lv '..p.level..' | ML '..p.ml,
        p.weaponName..' (Atk '..p.weaponAttack..') | '..p.skillName..' '..p.skill,
        'Armor '..p.armor..' | Shield '..p.shieldDefense..' | Shielding '..p.shielding,
        '',
        '[COMBATE]',
        'DPS efectivo: '..nf(r.dps)..' | Tiempo/kill: '..(r.kills>0 and formatTime(r.ttk) or 'sin kill'),
        'Danio recibido: '..nf(r.damageTaken)..' | Cura monster: '..nf(r.monsterHeals),
        'HP final: '..nf(r.hp)..'/'..nf(r.maxHp)..' | Mana: '..nf(r.mana)..'/'..nf(r.maxMana),
    }

    local attackLines={}
    for _,s in ipairs(ATTACK) do
        local uses=r.spells[s.key] or 0
        if uses>0 then attackLines[#attackLines+1]=s.key..' x'..nf(uses) end
    end
    if #attackLines>0 then
        L[#L+1]='Ataques: '..table.concat(attackLines,', ')
    else
        L[#L+1]='Ataques: golpes basicos / runas si disponibles'
    end

    L[#L+1]=''
    L[#L+1]='[CURACION - SPELLS]'
    local healsShown=0
    for _,s in ipairs(HEALS) do
        local count=r.spells[s.key] or 0
        if count>0 then
            healsShown=healsShown+1
            L[#L+1]=s.key..' x'..nf(count)..' | +'..nf(r.healSpellByName[s.key] or 0)..' HP'
        end
    end
    for _,key in ipairs({'utura gran','utura'}) do
        local count=r.spells[key] or 0
        if count>0 then
            healsShown=healsShown+1
            L[#L+1]=key..' x'..nf(count)..' (regen incluida abajo)'
        end
    end
    if healsShown==0 then L[#L+1]='Sin spells curativas usadas' end
    L[#L+1]='HP spells: '..nf(r.healSpell)..' | HP regen: '..nf(r.healRegen)

    L[#L+1]=''
    L[#L+1]='[MOCHILA - CONSUMIBLES]'
    local invdiag=p.inventoryDiagnostic or {}
    L[#L+1]='Fuente: '..(invdiag.source or 'no disponible')
    L[#L+1]='Supreme Health Potion [23375]: '..nf(p.items[23375] or 0)..' detectadas'
    L[#L+1]='Strong Mana Potion [237]: '..nf(p.items[237] or 0)..' detectadas'
    if (p.items[23375] or 0)==0 or (p.items[237] or 0)==0 then
        L[#L+1]='Diagnostico (supreme, scanner/API): '..nf(invdiag.supremeScan or 0)..'/'..nf(invdiag.supremeEngine or 0)
        L[#L+1]='Diagnostico (strong mana, scanner/API): '..nf(invdiag.manaScan or 0)..'/'..nf(invdiag.manaEngine or 0)
        L[#L+1]='Comprueba los IDs reales de los objetos y el slot de mochila.'
    end
    if not p.hasBackpack and not next(p.items) then
        L[#L+1]='No hay backpack equipada ni consumibles detectados.'
    else
        local supplies={}
        for id,count in pairs(p.items) do
            local spec=POTIONS[id] or FOOD[id] or RUNES[id]
            if spec and count>0 then
                supplies[#supplies+1]={id=id,start=count,spec=spec,used=r.used[id] or 0}
            end
        end
        table.sort(supplies,function(a,b)
            if (a.used>0)~=(b.used>0) then return a.used>0 end
            if a.used~=b.used then return a.used>b.used end
            return a.id<b.id
        end)
        if #supplies==0 then L[#L+1]='No se detectaron pociones/runas/food modelados.' end
        for i=1,math.min(#supplies,12) do
            local s=supplies[i]
            local hp=(r.healPotionById[s.id] or 0)+(r.healRuneById[s.id] or 0)
            local mana=r.manaPotionById[s.id] or 0
            local extra=''
            if hp>0 then extra=extra..' | +'..nf(hp)..' HP' end
            if mana>0 then extra=extra..' | +'..nf(mana)..' mana' end
            L[#L+1]=s.spec.name..': '..nf(s.used)..'/'..nf(s.start)..' usados'..extra
        end
        if #supplies>12 then L[#L+1]='+'..(#supplies-12)..' tipos mas en mochila' end
        local unsupported=0
        for _,n in pairs(p.unknownRunes or {}) do unsupported=unsupported+n end
        if unsupported>0 then L[#L+1]=nf(unsupported)..' cargas de runas sin modelo (no utilizadas)' end
    end
    L[#L+1]='Mana en spells: '..nf(r.manaSpent)..' | Mana de pots: '..nf(r.manaPotRestored)
    L[#L+1]='HP de pots: '..nf(r.healPotion)..' | HP runas: '..nf(r.healRune)
    if r.healFood>0 or r.manaFood>0 then
        L[#L+1]='Super Food: +'..nf(r.healFood)..' HP / +'..nf(r.manaFood)..' mana'
    end

    L[#L+1]=''
    L[#L+1]='[EXP Y ECONOMIA]'
    L[#L+1]='EXP obtenida: '..nf(r.exp)..' | Lv final: '..r.level
    L[#L+1]='Coste consumibles conocidos: '..nf(r.cost)..' gp'
    if loot.ok then
        L[#L+1]='Loot obtenido (simulado): '..nf(loot.total)..' gp'
        if loot.unpriced>0 then
            L[#L+1]='Sin precio NPC: '..nf(loot.unpriced)..' unidades ('..loot.unpricedTypes..' tipos)'
        end
        L[#L+1]='Balance PARCIAL: '..nf(loot.total-r.cost)..' gp'
    else
        L[#L+1]='LOOT NO DISPONIBLE: '..loot.error
        L[#L+1]='Balance: no calculado (sin loot valido).'
    end

    L[#L+1]=''
    L[#L+1]='[LOOT DE MONSTRUOS DERROTADOS]'
    if r.kills==0 then
        L[#L+1]='No se derroto ningun monstruo: sin loot.'
    elseif loot.ok then
        L[#L+1]='Tiradas reales simuladas: '..loot.rolls..' (1 por kill)'
        if #loot.rows==0 then
            L[#L+1]='Ningun objeto cayo en estas tiradas.'
        else
            local shown=0
            for _,row in ipairs(loot.rows) do
                if shown>=CFG.maxLootLines then break end
                local money=row.priced and (nf(row.value)..' gp ('..nf(row.unit)..' c/u)') or 'SIN PRECIO NPC'
                L[#L+1]=nf(row.count)..'x '..row.name..' = '..money
                shown=shown+1
            end
            if #loot.rows>shown then
                L[#L+1]='+'..(#loot.rows-shown)..' tipos mas (incluidos en el total).'
            end
        end
    else
        L[#L+1]='No se inventan drops: revisa generateLootRoll.'
    end
    L[#L+1]=''
    L[#L+1]='Solo lectura: tiradas como /loot, no items reales.'
    L[#L+1]='Un roll por kill: resultado aleatorio, NO promedio.'
    L[#L+1]='Balance parcial: excluye loot sin precio y costos no tasados.'
    L[#L+1]='Combate estimado: sin summons/augments.'
    if r.timeLimited then L[#L+1]='No logro completar el objetivo antes del limite de seguridad.' end
    if r.dead then L[#L+1]='Simulacion terminada al morir el personaje.' end
    return table.concat(L,'\n')
end

local function parseCommand(param)
    local raw=trim(param)
    if raw=='' then return nil,nil,'Uso: !simdps demon  o  !simdps demon, 10' end
    local name,count=raw:match('^(.-)%s*,%s*(%d+)%s*$')
    if name then
        name=trim(name)
        count=tonumber(count)
    else
        if raw:find(',',1,true) then
            return nil,nil,'Cantidad invalida. Uso: !simdps demon, 10'
        end
        name=raw
        count=1
    end
    if name=='' or #name>70 then return nil,nil,'Nombre de monstruo invalido.' end
    if not count or count<1 or count>CFG.maxTargets then
        return nil,nil,'Cantidad permitida: 1 a '..CFG.maxTargets..' monstruos.'
    end
    return name,count
end

-- Inventory-only debug, so supplies can be validated without fighting a monster.
local function inventoryPopup(p)
    local d=p.inventoryDiagnostic or {}
    local L={
        'FROZEN HELL | !simdps mochila | v3.4',
        'Fuente: '..(d.source or 'no disponible'),
        'Backpack equipada: '..(p.hasBackpack and 'si' or 'no'),
        'Items recorridos: '..nf(d.scans or 0),
        '',
        'Supreme Health Potion [23375]',
        '  Detectadas: '..nf(p.items[23375] or 0),
        '  Lectura backpack: '..nf(d.supremeScan or 0),
        '  API player:getItemCount: '..nf(d.supremeEngine or 0),
        '',
        'Strong Mana Potion [237]',
        '  Detectadas: '..nf(p.items[237] or 0),
        '  Lectura backpack: '..nf(d.manaScan or 0),
        '  API player:getItemCount: '..nf(d.manaEngine or 0),
        '',
        'No consume ni retira items.',
    }
    if (p.items[23375] or 0)==0 or (p.items[237] or 0)==0 then
        L[#L+1]='Si ves 0, revisa IDs reales: 23375 y 237 son los del script potions.lua.'
    end
    return table.concat(L,'\n')
end

local lastUse={}
local sim=TalkAction(CFG.command)
function sim.onSay(player,words,param)
    if trim(param):lower()=='mochila' or trim(param):lower()=='backpack' then
        local p,error=capturePlayer(player)
        if not p then player:sendCancelMessage(error);return true end
        player:popupFYI(inventoryPopup(p))
        return true
    end
    local name,targets,err=parseCommand(param)
    if not name then player:sendCancelMessage(err);return true end
    local guid=call(player,'getGuid') or call(player,'getId') or 0
    local now=os.time()
    if (lastUse[guid] or 0)>now then
        player:sendCancelMessage('Vuelve a ejecutar !simdps en unos segundos.')
        return true
    end
    -- Do not consume the cooldown on invalid player/monster arguments.
    local p,pError=capturePlayer(player)
    if not p then player:sendCancelMessage(pError);return true end
    local m,mError=captureMonster(name)
    if not m then player:sendCancelMessage(mError);return true end
    lastUse[guid]=now+CFG.userCooldown
    local ok,res=pcall(function()
        local one=runOnce(p,m,targets)
        return report(p,m,one,targets,player)
    end)
    if not ok then
        player:sendCancelMessage('Error SimDPS. Revisa logs del servidor; no se ha consumido ningun item.')
        if logger and logger.error then logger.error('[SIMDPS AUTO] {}',tostring(res)) end
    else
        player:popupFYI(res)
    end
    return true
end
sim:separator(' ')
sim:groupType('normal')
sim:register()
