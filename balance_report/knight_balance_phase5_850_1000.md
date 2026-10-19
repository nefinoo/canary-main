# Frozen Hell — Fase 5: nivel 850–1000, set raro y preparacion para Deathpincer

**Rama de pruebas:** `balance-frozen-hell-knight-100-200` (PR #2 en borrador). Esta fase no altera `pr-level-limit` ni fusiona el PR.

## Decision
Mantener el set raro de los IDs **3399 / 8095 / 3408** como recompensa especial de las cacerias avanzadas. Estas piezas se pueden obtener en Valick, Mummy y Deathwalker **normal** (650+) y en Hell Soldier/Undead Mage (850+). No se ponen en las cacerias previas a Salazaari ni se agregan como drops generales de los elfos. Los jugadores pueden reunir el set antes, pero equiparlo al **nivel 850** para prepararse para **Deathpincer**, previsto alrededor de nivel 1000.

**NO modificar** el Deathwalker de quest (`Custom/Custom/Deathwalker.lua`), quests de armas nivel 100, el Fist Fighting temporal, stages, Rat/Slime/Orcs, Hydra o `lowLevelBonusExp`.

## Elven Set raro: equipo real por ID
| ID | Nombre real | Antes | Fase 5 |
|---:|---|---|---|
| 3399 | Elven Mail | lvl650, armor35, +100 HP, fisico 3% | **lvl850, +600 HP**, mismas defensas |
| 8095 | Ranger Legs | lvl650, armor27, +50 HP y +50 mana, fisico 2% | **lvl850, +350 HP y +250 mana**, mismas defensas |
| 3408 | Bonelord Helmet | lvl650, armor25, +100 mana, fisico 2% | **lvl850, +350 mana**, mismas defensas |

**Conjunto total:** armor 87 (tres slots), +950 HP, +600 mana y reducciones fisicas configuradas de 3%+2%+2%. Las curaciones y el daño real deben confirmarse dentro de Canary.

**Augments:** no se alteran: Elven Mail (+12% Berserk y Fierce Berserk), Ranger Legs (+6% a ambos), Bonelord Helmet (+3% a ambos y los augments Deadly Core/Tornado originales). Se mantiene el aumento acumulado nominal de **+21 puntos porcentuales por spell** en estas tres piezas. No se crea probabilidad adicional de life/mana leech. La relacion base de Exori Gran (+30% sobre Exori) no cambia.

## Cacerias de nivel 850+
| Criatura | HP anterior → fase 5 | EXP anterior → fase 5 | Ataques ajustados | Drops del set raro (chance / 100 000) |
|---|---|---|---|---|
| Hell Soldier | 17 500 → **18 500** | 24.5M → **26M** | Fuego 50% → **45%** cada 3 s; melee y otras spells iguales | Mail 350, Legs 150, Helmet 120 |
| Undead Mage | 15 500 → **17 000** | 25M → **28M** | Death 60% → **50%** cada 3 s; mana drain 35% → **25%** cada 5 s | Mail 120, Legs 220, Helmet 350 |

350/100 000 = **0.35%**; sigue siendo extremadamente raro. La especializacion de drop promueve alternar Hell Soldier y Undead Mage, sin obligar a conseguir el conjunto entero para cazar.

Los monstruos de lvl650 y sus loot existentes quedan intactos. **Deathpincer** no se define aqui porque aun faltan su script real, looktype y recompensas para verificar; seria peligroso inventarlos. The Deathwalker (quest, 6 millones de HP) tampoco se modifica.

## Justificacion matematica
Knight normal lvl850: HP base 12 815; mana base 4300. Con el set completo: **13 765 HP** y **4900 mana**.
Knight normal lvl1000: HP base 15 065; mana base 5050. Con el set: **16 015 HP** y **5650 mana**, antes de otras bonificaciones.

En Tibia, el incremento de EXP requerida 850 → 1000 es aproximadamente **6 417 395 000**. Con 26M–28M EXP por criatura (antes de otros bonos) la etapa duraria en torno a **229–247 muertes**. Por eso las piezas especiales no pueden ser obligatorias: es posible terminar los niveles sin reunir las tres.

HP algo mayor da peso a estas cacerias. Para no hacerlas inviables con Knight en solitario, se reduce ligeramente la frecuencia de los ataques que mas causan picos o drenan mana. El balance de supervivencia definitivo debe medirse con el arma real de quest lvl500 y la curacion efectiva.

## Como se aplican los cambios
1. `balance_report/apply_elven_stage5.py` identifica items por **ID exacto** y los dos monster Lua por rutas fijas; nunca cambia otros monstruos.
2. GitHub Actions ejecuta primero las fases anteriores y luego esta fase, actualizando `items.xml` y los dos monstruos en la rama de balance.
3. `balance_report/validate_phase5.py` comprueba los atributos finales, las 5 armas de quest nivel100, las recompensas y que monstruos normales anteriores a lvl650 no regalan estas piezas.
4. Antes de merge: arrancar Canary de prueba y verificar carga XML/Lua, looktypes, equipo al lvl850, augments, DPS, tiempos, curaciones y loot real.
5. El PR queda **en borrador**; no desplegar ni fusionar a la rama base sin autorizacion.
