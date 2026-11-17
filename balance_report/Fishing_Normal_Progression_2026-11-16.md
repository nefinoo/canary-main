# Frozen Hell — balance de Fishing normal (16 noviembre 2026)

Repositorio: nefinoo/canary-main, rama pr-level-limit.

## Alcance
19 monstruos desde Fish a Deepling Elite. Se crearon MonsterTypes **Fishing ...** exclusivos y se cambiaron solo las referencias de spawn de agua en `Fishing.lua`. No se modifican los MonsterTypes normales que pueden existir en respawns del mapa. No se modifican Wyrm ni jefes posteriores, pesca de lava, pantano o alquitrán.

La configuración actual del repositorio es `rateUseStages = true` y `data/stages.lua` establece experiencia x1 para todos los niveles. Se eligieron valores de EXP base conforme a esa configuración (sin multiplicador 1000).

## Tabla de balance
| Monstruo | Nivel en Fishing | HP original | HP Fishing | EXP original | EXP Fishing |
|---|---:|---:|---:|---:|---:|
| Fish | 8 | 400 | 320 | 500000 | 40000 |
| Calamary | 50 | 1500 | 2900 | 1900000 | 1200000 |
| Northern Pike | 100 | 2000 | 5000 | 5100000 | 2700000 |
| Jellyfish | 150 | 3000 | 6000 | 7500000 | 4200000 |
| Shark | 250 | 6700 | 9500 | 22500000 | 7000000 |
| Crab | 350 | 8000 | 12000 | 28500000 | 10000000 |
| Water Elemental | 500 | 12000 | 17500 | 36000000 | 31000000 |
| Blood Crab | 650 | 18000 | 22000 | 46500000 | 52000000 |
| Massive Water Elemental | 750 | 25000 | 26000 | 91950000 | 78000000 |
| Quara Constrictor | 1000 | 35000 | 30000 | 650000000 | 125000000 |
| Quara Hydromancer | 1300 | 40000 | 29000 | 1100000000 | 220000000 |
| Quara Mantassin | 1500 | 50000 | 33000 | 1600000000 | 300000000 |
| Quara Pincher | 1750 | 65000 | 37000 | 2000000000 | 410000000 |
| Quara Predator | 2000 | 200000 | 42000 | 2500000000 | 550000000 |
| Deepling Scout | 2200 | 240000 | 45000 | 3000000000 | 700000000 |
| Deepling Brawler | 2400 | 380000 | 49000 | 4000000000 | 840000000 |
| Deepling Spellsinger | 2600 | 850000 | 54000 | 4750000000 | 1000000000 |
| Deepling Guard | 2800 | 1900000 | 60000 | 5000000000 | 1150000000 |
| Deepling Elite | 3000 | 3200000 | 68000 | 6000000000 | 1400000000 |

## Objetivos y criterios
- Objetivo de 30–45 segundos de lucha individual, con el equipo adecuado y rotación de spells + básicos. **Orientativo**, no validado en juego.
- Las spells de los monstruos se preservan por tipo (hielo, tierra, energía, drenaje, etc), pero se reducen rangos excesivos; ataques de gran área o habilidades peligrosas se activan con menor frecuencia.
- Curaciones del Water Elemental, Massive Water Elemental, Quara Predator, Deepling Guard y Deepling Elite se limitan para evitar que la regeneración supere el DPS del jugador.
- Loot en los 19 MonsterTypes Fishing: Fish (3578), Salmon (3579), Northern Pike (3580), Shrimp (3581), Green Perch (7159), Rainbow Trout (7158) según tier; se añaden solo productos existentes en items.xml, monedas moderadas y Experience Scroll muy raro.
- No aparece Yalahari Set en Fishing normal. Reservado para Wyrm y semijefes mayores, posterior balanceo.
- No se modificó el script Superfood.lua ni el nivel de pesca requerido por tabla.
- Los MonstersType dedicados se registran bajo `data-canary/monster/Fish/fishing_*.lua`; por ejemplo `Fishing Quara Predator`. `Fishing.lua` preserva el nombre mostrado en el comando de requisitos y estadisticas mediante la propiedad `name`, y usa `spawnName` al crear una criatura.
- El registro de capturas continúa usando las mismas keys por especie, sin duplicación, y los comandos !fishing y /testfish resuelven el tipo de spawn correcto.
- Reiniciar Canary para que registre los nuevos MonsterTypes y scripts. Si el servidor no puede encontrarlos, revisar el orden de carga de monstruos frente a scripts.
- **Pendiente**: pruebas dentro del servidor del TTK, DPS entrante por vocación, consumo de maná y EXP/h. Eliminar o ajustar outliers al recibir mediciones.

## Continuación
1. Prueba de nivel 50/250/750/1500/3000; medir /simdps y tiempo de combate contra Fishing ...
2. Ajustar escala de loot/Super Food y EXP/h.
3. Después balancear semijefes desde Wyrm en adelante sin tocar estos monstruos normales.

## Revisión de EXP inicial (16 de noviembre de 2026)
Se corrigió la experiencia de cinco monstruos normales de Fishing, sin cambiar HP, ataques, loot ni requisitos. La comparación con monstruos regulares mostró que `outlawed warrior` tiene 4600 HP y 1750000 EXP, mientras `outlawed ranger` tiene 5000 HP y 2000000 EXP. Northern Pike capturado tiene 5000 HP, así que sus 500000 EXP eran insuficientes. Su recompensa ahora es 2700000 EXP (+54% frente a warrior, +35% frente a ranger). Se ajustaron Fish 4000→40000, Calamary 150000→1200000, Jellyfish 1400000→4200000 y Shark 5250000→7000000 para mantener una progresión ascendente hasta Crab (10000000). Estos cambios son una corrección provisional basada en HP, nivel y EXP comparables; pendientes pruebas de tiempo de captura, matanza, recursos consumidos y EXP/h.

## Límite de alcance actual: Fishing nivel 8 a 1000
El usuario indicó que solamente están balanceados los monstruos de los respawns normales hasta nivel 1000. Por ello no se editarán criaturas de Fishing superiores a nivel 1000 ni el Yalahari Set hasta continuar la progresión principal. Este límite es de **trabajo**, no una restricción para capturar monstruos en el juego.

Comparaciones confirmadas en archivos de Canary de la rama: Outlawed Warrior (4600 HP, 1750000 EXP), Salazaari Defender (6200 HP, 3750000 EXP), Valick (11500 HP, 7500000 EXP), Mummy (10000 HP, 6750000 EXP), Undead Mage / Necromancer (13500 HP, 15000000 EXP), Hell Soldier / Demon Skeleton (17500 HP, 12500000 EXP) y Deathpincer / Ancient Scarab (110000 HP, 250000000 EXP), que es un jefe especial, no un monstruo normal.

Se corrigió la vida de Fishing Quara Constrictor de 25000 a 30000 (HP y maxHealth); permanecen iguales EXP 125000000, ataques, loot, Fishing requerido 45 y nivel requerido 1000. Motivo: el Quara de nivel 1000 tenía menos HP que Fishing Massive Water Elemental de nivel 750 (26000 HP) sin una ventaja mecánica que justificara esa inversión de progresión. La nueva cifra de 30000 HP es preliminar. Pendiente: medir tiempo real para matarlo, DPS entrante y EXP/h con un Knight nivel 1000 y equipamiento de su etapa.

## Incremento de experiencia del 30% (16 de noviembre de 2026)

Se incrementa exactamente el 30% de experiencia de los diez MonsterTypes exclusivos de Fishing con requisito de nivel 8–1000. Las criaturas normales de respawn, los semijefes desde Wyrm y las capturas de otros biomas no se modifican. Vida, ataques, loot, requisito de nivel, fishing skill y probabilidades permanecen iguales.

| Monstruo Fishing | EXP anterior | EXP nueva (+30%) |
|---|---:|---:|
| Fish | 40000 | 52000 |
| Calamary | 1200000 | 1560000 |
| Northern Pike | 2700000 | 3510000 |
| Jellyfish | 4200000 | 5460000 |
| Shark | 7000000 | 9100000 |
| Crab | 10000000 | 13000000 |
| Water Elemental | 31000000 | 40300000 |
| Blood Crab | 52000000 | 67600000 |
| Massive Water Elemental | 78000000 | 101400000 |
| Quara Constrictor | 125000000 | 162500000 |

Pendiente: validar EXP por hora y frecuencia de capturas en el servidor.
