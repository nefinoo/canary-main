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
