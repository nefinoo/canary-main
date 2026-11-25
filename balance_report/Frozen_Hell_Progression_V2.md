# Frozen Hell - nuevo balance PvE de las cuatro vocaciones

## 01 - Respawn inicial (nivel 8 a 15-20)

Rama pr-level-limit, datapack data-canary. Configuracion existente: rateUseStages=true, EXP x1 (las criaturas tienen EXP personalizada), skill x10 y magic x10 inicialmente. No se alteran tasas globales, equipo, spells ni loot. Equipo inicial confirmado en data/scripts/creaturescripts/player/send_first_items.lua. Knight con Brass Set y Dwarven Shield; Paladin con Spear, Ranger's Cloak, Ranger Legs e Iron Helmet; Sorcerer con Wand of Vortex; Druid con Snakebite Rod. Personajes sin entrenamiento previo ni promociones.

| Criatura | Cantidad | HP | EXP base | Melee max cada 2s | Defensa | Armadura |
|---|---:|---:|---:|---:|---:|---:|
| Rat | 16 | 25 | 1000 | 8 | 0 | 0 |
| Cave Rat | 10 | 35 | 1500 | 12 | 1 | 1 |
| Slime | 6 | 50 | 2500 | 18 | 2 | 1 |
| Slug | 4 | 70 | 3500 | 24 | 3 | 2 |

EXP total: 60000, nivel 17 desde 4200 EXP; con 50% adicional, nivel 19 (sin otras bonificaciones). Resistencias fisico, energia, tierra y fuego neutralizadas; ratas no huyen; Slime ya no aplica veneno de 90 ni usa skill/attack en melee; Slug conserva ataque tierra 4-8 con 15% cada 2s, alcance 3. No se modifican otras criaturas. Los cambios afectan todas las apariciones de estos tipos.

Pendiente: validar en servidor con cada vocacion, tiempo de caza, consumo de pociones y mana, durabilidad de spear, daño y nivel final. Los valores de combate son propuestas, no mediciones. Siguiente zona: Orcs, tras verificar el primer respawn.

## 02 - Orcs (nivel 15-30)

Cantidades de referencia del conteo anterior del administrador, no verificadas en mapa actual: 96 criaturas. Entrada habitual nivel 17, con equipo inicial, sin suponer drops ni entrenamiento. Se mantienen hechizos, armas, equipo, loot y tasas. Plate set sigue siendo drop raro. No se alteran otros tipos.

| Criatura | Cantidad | HP | EXP | Melee min-max | Defensa | Armadura |
|---|---:|---:|---:|---:|---:|---:|
| orc | 6 | 75 | 1800 | 4-20 | 3 | 2 |
| war wolf | 2 | 85 | 2000 | 5-24 | 4 | 2 |
| orc spearman | 19 | 85 | 2200 | 3-16 | 4 | 2 |
| orc warrior | 13 | 105 | 2500 | 6-28 | 5 | 3 |
| orc rider | 1 | 115 | 2800 | 6-30 | 5 | 3 |
| orc shaman | 21 | 100 | 2700 | 2-14 | 3 | 2 |
| orc berserker | 7 | 130 | 3200 | 8-34 | 4 | 3 |
| orc leader | 10 | 155 | 3700 | 8-36 | 7 | 4 |
| orc warlord | 15 | 185 | 4300 | 10-42 | 8 | 5 |
| orclops_ravager | 1 | 260 | 6500 | 10-44 | 9 | 5 |
| orclops_doomhauler | 1 | 320 | 8000 | 12-48 | 10 | 6 |

Melee 2s excepto Berserker 1.5s. Spearman conserva ataque a distancia; Shaman conserva dos ataques magicos, elimina invocaciones y reduce curacion a 5-10 con 20% cada 4s; Ravager cura 10-18 con 20% cada 5s. Se neutralizan resistencias de dano directo para las cuatro vocaciones. Rider y Berserker tienen aceleraciones reducidas; Warlord no usa invisibilidad. Orcs no huyen con poca vida. Los dos Orclops son semibosses, recomendados al final de la zona.

EXP vuelta 287000 sin bonus; nivel 29 desde 64200 EXP tras primera zona; nivel 33 si ambas zonas reciben +50%. EXP x1. El menor EXP de Orcs basicos respecto a Slug refleja mayor densidad y dificultad por recorrido, no una regla de monotonía por especie. Los cambios afectan todas las apariciones de estos tipos. No se ha probado in-game; validar skills, magic level, consumo, cantidad de criaturas, disponibilidad de spears y tiempos. Siguiente: Minotaurs.

### 02.1 - Revision de EXP y loot (conteo confirmado)

Esta revision sustituye los valores de EXP y loot de la seccion 02; HP, ataques y defensas se mantienen. El administrador confirmo 96 criaturas y solicito salida nivel 30-40, sin armas ni equipo. La EXP se duplica a 574000 por vuelta. Desde nivel 17 con 64200 EXP: nivel 35 (638200 EXP total); si ambas zonas tienen +50%: nivel 40 (955200 EXP total). No se modifican las tasas globales.

| Criatura | Cantidad | EXP nueva | Oro max (100%) | HP potion % | MP potion % | Comida | Chance comida % |
|---|---:|---:|---:|---:|---:|---|---:|
| orc | 6 | 3600 | 8 | 8 | 8 | meat | 30 |
| war wolf | 2 | 4000 | 10 | 8 | 8 | ham | 35 |
| orc spearman | 19 | 4400 | 12 | 10 | 10 | meat | 35 |
| orc warrior | 13 | 5000 | 14 | 12 | 10 | meat | 35 |
| orc rider | 1 | 5600 | 16 | 12 | 12 | meat | 40 |
| orc shaman | 21 | 5400 | 15 | 8 | 18 | corncob | 35 |
| orc berserker | 7 | 6400 | 18 | 16 | 10 | ham | 40 |
| orc leader | 10 | 7400 | 22 | 18 | 16 | fish | 40 |
| orc warlord | 15 | 8600 | 26 | 20 | 18 | fish | 45 |
| orclops_ravager | 1 | 13000 | 40 | 30 | 30 | red mushroom | 50 |
| orclops_doomhauler | 1 | 16000 | 50 | 35 | 35 | red mushroom | 55 |

Loot: oro, health/mana potion basicas, comida, y creature products de los archivos vanilla equivalentes en data-otservbr-global. Se conservan sus probabilidades originales; excluidos equipos, armas, bolsa de addon 12413, gemas, trofeos, decoraciones y otros objetos no incluidos en las categorias solicitadas. Pair of iron fists es creature product en la version de referencia 12.56 (no un arma de monk). Oro medio teorico 865.5, 12.47 health potions, 13.39 mana potions por vuelta, sin precios NPC ni bonuses. No se cambia el loot de la primera zona en esta revision. Validacion in-game pendiente. Siguiente: Minotaurs, entrada 35 aprox.

### 02.2 - Meta definitiva de Orcs: nivel 20-35

La imagen actual confirma las 96 criaturas. El administrador solicita nivel final aproximado 20-35 y exclusivamente gold coins, health/mana potions, comida y creature products normales. Esta revision sustituye solo la EXP de 02.1; el loot de 02.1 permanece verificado, sin equipos, armas ni bolsa 12413. El combate queda como en 02. No se toca la zona anterior ni la configuracion global.

| Criatura | Cantidad | EXP nueva | EXP total |
|---|---:|---:|---:|
| orc | 6 | 2600 | 15600 |
| war wolf | 2 | 2800 | 5600 |
| orc spearman | 19 | 2900 | 55100 |
| orc warrior | 13 | 3200 | 41600 |
| orc rider | 1 | 3600 | 3600 |
| orc shaman | 21 | 3500 | 73500 |
| orc berserker | 7 | 4100 | 28700 |
| orc leader | 10 | 4700 | 47000 |
| orc warlord | 15 | 5500 | 82500 |
| orclops_ravager | 1 | 8300 | 8300 |
| orclops_doomhauler | 1 | 10000 | 10000 |

Total 371500 EXP a x1 por vuelta. Desde 4200 EXP de nivel 8 y 60000 EXP de ratas, nivel 31 (435700 EXP total). Con +50% en ambas zonas, nivel 35 (651450 EXP total). No se presupone loot de equipo ni armas. Siguiente zona Minotaurs, referencia nivel 31-35. Validacion de combate en servidor pendiente; revisar abastecimiento de spears en NPC, pues no caen armas en esta zona.

## 03 - Minotaurs (nivel 35-50)

Conteo confirmado por imagen: 88. Entrada esperada 31-35 segun bonus anterior; zona recomendada 35+. No se presupone equipo raro ni compra de armas. Spells de referencia: Knight exori ico y exori (35), Paladin exori con y exura san (35), Druid/Sorcerer strikes elementales y exura vita (30). Se mantienen los scripts de spells y equipo vanilla sin modificar sus atributos. Armas vanilla superiores de NPC/quest son opcionales; ninguna arma ni municion se agrega al loot. Los nombres de items se verifican con referencias vanilla; items.xml del repo excede el limite de lectura, verificar atributos/restricciones reales y nombres al cargar el servidor.

| Criatura | Cant | HP | EXP | Melee 2s | Def | Arm | Oro max (100%) | HP% | MP% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Minotaur | 34 | 170 | 8000 | 10-36 | 8 | 5 | 14 | 16 | 16 |
| Minotaur Archer | 15 | 190 | 9000 | 6-24 | 7 | 4 | 16 | 17 | 17 |
| Minotaur Guard | 26 | 260 | 11000 | 14-52 | 13 | 8 | 20 | 21 | 17 |
| Minotaur Mage | 8 | 220 | 10500 | 4-20 | 6 | 4 | 18 | 16 | 27 |
| Modified Gnarlhound | 4 | 280 | 12000 | 12-54 | 10 | 7 | 20 | 22 | 22 |
| Deepsea Blood Crab | 1 | 360 | 16000 | 16-65 | 15 | 10 | 26 | 30 | 30 |

Archer: fisico 10-32, 75% cada 2s, alcance 5. Mage: energia 8-28, 50% cada 2s y fuego 10-32, 35% cada 3s, alcance 5; sin energyfield. Neutralizadas resistencias de daño directo (fisico, energia, tierra, fuego, hielo, sagrado y muerte), especialmente Gnarlhound y Crab. Crab es enemigo fuerte individual. Se elimina huida por poca vida. No se cambia comportamiento de montura/quest salvo que estas definiciones afectan todas las apariciones del tipo.

### Loot

Oro equivalente por criatura a Orcs (aprox 8.943181818181818 vs 9.015625), pociones algo mas frecuentes, comida. Se reconstruye loot sin armas/municion ni bolsa 12413. Se mantienen chances existentes de minotaur leather y bloody pincers; se restauran horn, broken crossbow y piezas de armadura que son creature products no equipables, con chances vanilla de data-otservbr-global. Gnarlhound vanilla no tiene creature products. Equipo raro seleccionado:

- Minotaur: steel helmet 0.45%, plate legs 0.45%, paladin armor 0.40%, focus cape 0.40%.
- Minotaur Archer: paladin armor 0.75%, blue legs 0.65%, bonelord shield 0.45%, hat of the mad 0.40%.
- Minotaur Guard: plate armor 0.65%, bonelord shield 0.55%, plate legs 0.50%, blue legs 0.45%.
- Minotaur Mage: focus cape 1.00%, hat of the mad 1.00%, spellbook of enlightenment 0.90%, blue legs 0.70%.
- Modified Gnarlhound: steel helmet 0.60%, paladin armor 0.60%, spellbook of enlightenment 0.60%.
- Deepsea Blood Crab: plate armor 1.00%, paladin armor 1.00%, focus cape 1.00%, spellbook of enlightenment 1.00%.

Total esperado por vuelta: 841000 EXP, nivel 44 desde 435700 EXP y nivel 50 con +50% en todas las zonas; 787 gp, 15.91 HP potions, 15.75 MP potions, 1.87 piezas de equipo raro en promedio. Sin bonus de loot, ni venta de productos. No se cambian tasas ni otros archivos de criaturas. Validacion in-game pendiente (skills, ML, dps, TTK, abastecimiento, nombre de items y posibles restricciones de nivel). Siguiente: Cyclops.

## 04 - Cyclops (nivel 50-75)

Mapa activo frozen: data-canary/world/frozen-monster.xml. Por agrupacion de proximidad (15 casillas, diferencia vertical <=2), zona de referencia x568-619/y823-881/z12-16: 35 Cyclops, 14 Drone, 7 Smith (56). Otro grupo x1642-1739/y181-268/z14-18: 50/6/7 (63). Se usa el primer grupo por cercania al conteo anterior del administrador (35/15/7); no se confirma que todas las criaturas sean accesibles en una sola vuelta. Las definiciones cambian globalmente para los tres tipos; no se modifica mapa.

| Criatura | Cant | HP | EXP | Melee 2s | Def | Arm | Oro max 100% | HP% | MP% |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Cyclops | 35 | 380 | 45000 | 18-64 | 14 | 9 | 16 | 20 | 20 |
| Cyclops Drone | 14 | 480 | 55000 | 22-78 | 17 | 11 | 18 | 24 | 22 |
| Cyclops Smith | 7 | 620 | 70000 | 26-94 | 20 | 13 | 22 | 28 | 26 |

Drone: roca 12-40, 35% cada 3s, alcance 5; Smith: ataque fisico 16-50, 40% cada 3s, alcance 5, embriaguez 15 por 3s con 8% cada 6s. Se neutralizan resistencias de dano directo principales, se elimina huida del Drone. Se preservan los demas flags e identidad. Equipo opcional: mismo set raro de Minotaurs; Knight exori/exori ico, Paladin exori con y exevo mas san (50, 160 mana), Druid/Sorcerer strikes y exura vita; Druid exori gran tera (70). El exori gran de Knight en el repositorio exige 90 y no se presupone. No se modifican spells, armas, equipo ni tasas globales. No se han medido DPS reales de jugadores; valores propuestos para pruebas.

### Loot

Se reconstruye loot: oro, health/mana potions basicas, comida, cyclops toe vanilla (4.93/6.75/10.28%), mismo conjunto de 9 equipos de Minotaurs con chances por objeto ligeramente por encima de sus maximos anteriores. Sin armas, municion, bolsa 12413 ni equipo adicional. Se mantiene oro medio comparable con Minotaurs, pociones algo mas frecuentes por criatura.

- Cyclops: steel helmet 0.75%, plate legs 0.65%, paladin armor 1.15%, focus cape 1.15%.
- Cyclops Drone: plate armor 1.15%, bonelord shield 0.70%, blue legs 0.85%, hat of the mad 1.15%, spellbook of enlightenment 1.15%.
- Cyclops Smith: plate armor 1.25%, paladin armor 1.25%, focus cape 1.25%, hat of the mad 1.25%, spellbook of enlightenment 1.25%, blue legs 0.95%.

EXP grupo 56: 2835000, salida nivel 64 desde acumulado normal de Minotaurs y 73 con +50% en todas las zonas; desde nivel 50 exacto, 67 sin bonus / 73 con +50% en esta zona. Grupo 63: 3070000, salida 65/75 desde la progresion anterior. Loot esperado grupo 56: 511 gp, 12.32 health, 11.90 mana, 2.50 piezas raras, 3.39 cyclops toes. Se conserva la seleccion de items previamente introducida; atributos/restricciones y resolucion de nombres pendientes de validar en servidor. Siguiente zona por confirmar.

## 05 - Auditoria economica de loot con Nephy

Regla permanente: antes de agregar o modificar loot, verificar precio sell (oro que recibe el jugador) en data-canary/npc/Nephy.lua. Dentro de cada categoria comparable, objetos mas caros tienen menor chance, con ajuste moderado segun dificultad y densidad del respawn. Mantener equipo de utilidad para las cuatro vocaciones; si un objeto caro se vuelve demasiado dificil de conseguir, considerar revisar el precio NPC con autorizacion del administrador, no aumentar automaticamente el drop. No se modifican precios NPC. Calcular valor esperado por vuelta = suma de cantidad de monstruos * probabilidad * cantidad media * precio sell. Separar oro directo, consumibles y objetos sin precio. No asignar precio cero ni inventar precio de mercado a objetos ausentes en Nephy.

Precios confirmados: plate legs 115, steel helmet 293, plate armor 400, bonelord shield 1200, spellbook of enlightenment 4000, focus cape 6000, paladin armor 15000. Blue legs y hat of the mad no figuran en Nephy; se conservan sus chances y quedan pendientes de precio. Reinvigorating seeds y bug meat tampoco figuran. Rat/Cave Rat/Slime/Slug no tienen equipo ni productos con precio confirmado en Nephy; loot intacto. Se mantienen todas las especies de productos y se ajustan inversiones importantes en Orcs/Minotaurs. Pair of iron fists (4000 gp) queda como drop unico raro de ambos Orclops (sin maxCount 3). No se modifican HP, EXP, ataques, oro, comida, pociones ni NPC.

Cambios (chance Lua, 100000=100%):
- Custom/Orcs/orc shaman.lua: orc leather 10300.
- Custom/Orcs/orc berserker.lua: orcish gear 3800.
- Custom/Orcs/orclops_ravager.lua: #17828 350.
- Custom/Orcs/orclops_doomhauler.lua: #17828 450.
- Custom/Minotaurs/minotaur.lua: minotaur horn 10000, steel helmet 1000, plate legs 1200, paladin armor 150, focus cape 280.
- Custom/Minotaurs/minotaur archer.lua: minotaur horn 5000, piece of archer armor 15400, paladin armor 180, bonelord shield 650.
- Custom/Minotaurs/minotaur guard.lua: piece of warrior armor 8330, plate armor 950, bonelord shield 750, plate legs 1400.
- Custom/Minotaurs/minotaur mage.lua: minotaur horn 5000, focus cape 350, spellbook of enlightenment 450.
- Monturas/modified_gnarlhound.lua: steel helmet 1200, paladin armor 200, spellbook of enlightenment 500.
- Custom/Crustaceans/deepsea_blood_crab.lua: plate armor 1100, paladin armor 220, focus cape 400, spellbook of enlightenment 550.
- Custom/Giants/cyclops.lua: steel helmet 1450, plate legs 1650, paladin armor 260, focus cape 480.
- Custom/Giants/cyclops drone.lua: plate armor 1300, bonelord shield 900, spellbook of enlightenment 650.
- Custom/Giants/cyclops smith.lua: plate armor 1450, paladin armor 280, focus cape 500, spellbook of enlightenment 700.

Valor esperado de equipo con precio confirmado (sin Blue Legs y Hat of the Mad): Minotaurs 6426.11 -> 2988.86 gp/vuelta; Cyclops 11604.07 -> 3916.71 gp/vuelta. Equipos medios totales (incluyendo sin precio) Minotaurs 1.87 -> 2.40, Cyclops 2.50 -> 2.38. Los cambios de esta seccion sustituyen las chances afectadas de secciones anteriores. Validar economia real y suministro por vocacion en servidor.
