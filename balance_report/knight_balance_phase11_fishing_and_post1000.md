# Frozen Hell — Fase 11: progresión post-Deathpincer y Fishing avanzado

Rama `balance-frozen-hell-knight-100-200`, PR #2 en borrador. No fusionar ni desplegar sin aprobación. Documento de diseño + cambios concretos en Fishing (NO implica pruebas de runtime).

## Dirección confirmada
- Deathpincer (registro real del monster en `data-canary/monster/Custom/Insects/ancient scarab.lua`) es boss ~1000, su Green Demon Set lvl1000 universal prepara la transición a criaturas 1000+. Equipo anterior lvl850 debe mantener viabilidad: más lento, más consumo de spells/pociones/Super Food, pero factible.
- El siguiente boss principal llega aproximadamente al **nivel 2000**, y a partir de él comenzarían sets propios para Knight/Paladin/Druid/Sorcerer. No reciclar automáticamente los sets con requerimientos de nivel5000 ni inventar loot/IDs antes de inspeccionarlos.
- Curación permitida para balance: spells vanilla, pociones y Super Food; excluir Mana Rune y Knight Heal Rune. Se conserva el cooldown compartido de 2s para potions y Super Food implementado en fase7, pendiente validar en Canary.
- Super Food proviene del circuito de pesca y es una vía adicional de sustento. Pesca recompensa EXP/loot extra por tiempo y rareza; balancear por EXP/hora incluyendo intentos fallidos y costes.

## Cambios de probabilidad aplicados al agua (Fishing.lua)
Los `chance` son umbrales acumulados, NO porcentajes de aparición independientes. Criterio: niveles mayores con menor umbral, restringido por nivel de personaje y Fishing. Modificados:
Quara Constrictor 18000→11000 (lvl1000, Fishing45)
Quara Hydromancer 16500→9000 (1300, 50)
Quara Mantassin 15000→7500 (1500, 55)
Quara Pincher 13500→6000 (1750, 58)
Quara Predator 11000→4500 (2000, Fishing **60→65**)
Deepling Scout 5000→3800 (2200,63)
Deepling Brawler 4800→3400 (2400,65)
Deepling Spellsinger 4600→3000 (2600,68)
Deepling Guard 4400→2600 (2800,70)
Deepling Elite 4200→2200 (3000,72)
Wyrm 4000→1900 (3500,75)
Sea Serpent 3500→1550 (5000,77)
Ryujin 3000→1250 (7500,80)
El comando `!fishing` ahora indica Fishing65 en Quara Predator.

**Mecánica importante**: `realMonsterChance = floor(100000 * max(0.50, 2.10 - fishingSkill / 100 - bonusRod))`. Se produce un único roll y se recorre una tabla ordenada de alto nivel a bajo. El primer candidato que cumpla requisitos y `roll <= chance` aparece. Ejemplo si Fishing65 y caña 3483: denominador 145000; Quara Predator lvl2000 recibe un umbral 4500/145000 (≈3.10% por intento) siempre que criaturas de mayor nivel sean inelegibles. A nivel 2000 no son elegibles los Deeplings. Un jugador sobreleveleado con más Fishing puede tener mayor probabilidad.

## Próximas verificaciones necesarias
- Prueba Monte Carlo / 10000+ intentos por combinación (level, skill, rod), reportar tasas por especie, Super Food e EXP/hora; considerar los 2s y la pérdida de worm.
- Revisar flags `scroll=true` sin comprobación efectiva antes de retocar rarezas endgame.
- Revisar Lava/Swamp/Tar: muchas criaturas tienen `chance=20000` / `chance=100000` repetidas con requisitos Fishing120, lo que puede destruir la progresión prevista. Necesitan rediseño por separado y tests de spawn.
- Validar que nombres registrados son exactos (`Leaviathan` vs `Leviathan.lua`) y que `castEffects[item.itemid]` siempre existe.
- Comparar equipo lvl850 y Green Demon lvl1000, HP real, absorb, tiempo hasta matar, mana y supervivencia con monsters 1000–2000. No asumir que suma de armor nominal equivale a reducción lineal real.
- Identificar boss nivel2000 y loot real antes de editar sets por vocación.

## Estado
Probabilidades agua fase11 y skill/UI de Predator **editados en rama**. Sin cambios nuevos a monstruos de caza, HP, EXP, armas, Green Demon ni quests; pendientes de pruebas en servidor.
