# Frozen Hell — Fase 7: Super Food, pociones y Quara 1000–2000

Rama: `balance-frozen-hell-knight-100-200`, commit de pruebas sin merge. Se conserva el balance previo de equipos y bosses.

## Exhaust compartido

En `src/lua/creature/actions.cpp`, los objetos de tipo poción usan `setNextPotionAction` y Super Food usa la acción normal. Ya que el exhaust antiguo de Super Food era independiente, se añade una condición en **ambos** scripts: `Condition(CONDITION_EXHAUST_HEAL, CONDITIONID_COMBAT, 620096)` de **2000 ms**. El subId es reservado a HP/mana consumibles, para no sustituir el cooldown vanilla de curaciones. Se comprueba antes del uso y se aplica al usuario después. No se cambian fórmulas de curación, condiciones de vocación ni niveles de pociones. Buff potions sin HP/mana siguen sin este bloqueo. Mana Runes no se consideran.

## Experiencia, daño y alimentos de monstruos pescados

| Monstruo | Nivel requerido | HP final | EXP antes → después | DPS bruto aproximado antes → después | Rainbow Trout | Green Perch |
|---|---:|---:|---|---|---:|---:|
| Quara Constrictor | 1000 | 35,000 | 85M → 85M | 1500 → 760 | 4.5% | 6% |
| Quara Hydromancer | 1300 | 40,000 | 125M → 125M | 2965 → 880 | 5% | 6.5% |
| Quara Mantassin | 1500 | 50,000 | 1600M → 175M | 4250 → 1267 | 7% | 9% |
| Quara Pincher | 1750 | 65,000 | 2000M → 225M | 4750 → 1467 | 9% | 11% |
| Quara Predator | 2000 | 105,000 (antes 200,000) | 2500M → 285M | 5125 → 1791 | 11% | 13% |

La estimación de DPS es puramente aritmética: media de daño × probabilidad × 1000 / intervalo, sumada por ataques. **No representa DPS real medido**: hay defensas, movimiento, resistencias, daño de área, alcance y comportamiento de Canary.

- El Quara Predator ya no se cura 10–15k cada segundo con 25% de probabilidad; ahora su autocuración es 1200–1800 cada 4 segundos con 30% de probabilidad (≈113 HP/s teórico).
- La ralentización de Quara Pincher es menos intensa y frecuente.
- Se conservan los objetos valiosos, resto de loot, chances de Fishing, stages globales y equipo anterior. Solo suben los drops de Rainbow Trout y Green Perch.
- No se alteran bosses, quests, niveles ni sets exclusivos futuros.

## Validación pendiente dentro de Canary

1. Probar poción → Super Food y Super Food → poción antes de 2 segundos; comprobar que rechaza sin consumir HP/mana ni objetos, y que funciona pasados 2 segundos.
2. Probar con Knight, Paladin, Druid y Sorcerer, incluido uso de pociones sobre aliados y curaciones por spells vanilla.
3. Medir supervivencia, experiencia por hora, tiempos de combate y consumibles con 10 capturas por especie en niveles 1000, 1300, 1500, 1750 y 2000.
4. Revisar comportamiento al reconectar durante la condición de 2 segundos.
5. Ejecutar `python3 balance_report/validate_phase7.py`, y posteriormente iniciar Canary para comprobar que Lua se carga correctamente.
