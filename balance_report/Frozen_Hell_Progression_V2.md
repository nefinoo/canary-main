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
