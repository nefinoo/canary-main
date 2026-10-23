# Frozen Hell — Fase 17: cierre de auditoría Deathpincer y corrección de Fishing

**Fecha:** 23-oct-2026. **Rama:** `balance-frozen-hell-knight-100-200`, PR #2 en borrador.
**Alcance:** cambios de Fishing y de validador; Deathpincer/Nephy/Yalahari son verificaciones de ajustes de fases previas.
**Sin merge, sin arranque del servidor, sin combates ni pescas reales.**

## 1. Deathpincer — economía ya corregida (no nueva edición)
- Boss: `data-canary/monster/Custom/Insects/ancient scarab.lua`. `rewardBoss=true`, 135000 HP, 300M EXP.
- Drop nominal de `37609/37608/37607/37610/6390`: 10000/100000 cada uno; `unique=true`.
- En Nephy todos tienen reventa de **150000 gp**, no 300000.
- Escenario orientativo del informe anterior: chance efectiva ~15.9% por pieza con modificador Reward Chest de la pelea en solitario. Valor esperado por reventa de las cinco piezas ~119000 gp por victoria, frente a ~238000 gp antes de la reducción de reventa. **No incluye otras recompensas, mercado, bonus de Bosses ni costo de tiempo y supplies.** La probabilidad real debe medirse en Canary; no extrapolar el factor a parties.
- No editar recompensas ni bosses de quest sin aprobación.

## 2. Fishing — parche aplicado en esta fase
Archivo: `data-canary/scripts/Customs/Fishing/Fishing.lua`.

Problema: el primer monstruo elegible con `roll <= chance` ganaba automáticamente. Todos los 24 monstruos de pantano tenían `chance=100000`, todos los de lava tenían `chance=20000`: en ambas tablas los monstruos elegibles posteriores al primero podían ser inaccesibles en condiciones normales.

Cambios:
1. `selectCaughtMonster` conserva la selección por el primer umbral **distinto** que cumple las condiciones y elige uniformemente entre entradas elegibles con exactamente el mismo umbral. No cambia los umbrales individuales del agua ni el único del tar.
2. Pantano: las 24 entradas de `chance=100000` pasan a `chance=20000`. No se cambian sus nombres, `level=1000`, `fishing=120`, `scroll`, `key` ni broadcasts.
3. Lava: sus umbrales `chance=20000` quedan **sin cambios**; con la elección entre empates ya se pueden obtener varias especies elegibles.
4. Cooldown de 2 s e intento que consume un worm se mantienen.

Probabilidades matemáticas bajo un intento válido, **antes de fallos de spawn**, monstruos ya presentes o movimiento:
| Superficie y condiciones | Denominador de roll | Probabilidad total de llegar al umbral | Distribución |
|---|---:|---:|---|
| Pantano lvl1000, Fishing120, caña3483 | 90000 | 20000/90000 = **22.22%** | 24 elegibles; ~0.926% por especie/intento |
| Pantano lvl1000, Fishing120, caña9306 | 65000 | 20000/65000 = **30.77%** | 24 elegibles; ~1.282% por especie/intento |
| Lava lvl1000, Fishing120, caña3483 | 90000 | 20000/90000 = **22.22%** | 10 elegibles; ~2.222% por especie/intento |
| Agua lvl1000, Fishing45, caña3483 | 165000 | Quara Constrictor `11000/165000` = **6.67%** | Agua sin cambios |

Las cifras son probabilidades del selector, **no capturas completadas ni EXP por hora**. Si `Game.createMonster` falla, el intento consumió worm pero no entrega monstruo. La experiencia de las capturas sigue dependiendo del loot/EXP de sus respectivos monstruos.

## 3. Orden de amenaza post-1000 confirmado en Lua
- Undead Dragon: 105000 HP / 188M EXP; validador de fase13 corregido a esos valores y cuatro ataques (DPS bruto ~2017).
- Orshabaal: 150000 HP / 288M EXP.
- Hellraiser: 195000 HP / 448M EXP.
- Frozenhell Guard: 245000 HP / 687M EXP; DPS bruto ~3520.
- Venom: 330000 HP / 902M EXP; DPS bruto ~3582, ligeramente mayor que Guard. Se conserva Guard antes de Venom.

**No declarar completa la lista de nueve hasta verificar en repositorio/servidor los nombres de Arch Angel, Dementor, Little Puppy y la variante inicial del piso**. Ninguna cifra inventada para ellos. Los datos anteriores no incluyen resistencias, IA, mitigación ni rango.

## 4. Auditoría y límites
- `balance_report/validate_phase13.py` ya no compara Undead Dragon contra 72000 HP, 118M EXP y siete ataques. Ahora comprueba 105000/188M/cuatro ataques/DPS bruto 1950–2100.
- La ruta del Undead Mage histórico **no existe en la rama inspeccionada**. Por eso el validador informa NOTICE y omite solo la validación cruzada de ese archivo ausente; no convierte la ausencia en una aprobación.
- No se encontró una condición de ejecución que aplique `monster.scroll` en Fishing; los flags `scroll=true` todavía **no están imponiendo un requisito efectivo**. Identificar el storage/uso verdadero del scroll antes de habilitar ese bloqueo.
- Pesca de agua usa prioridades distintas; no se tocó ni se reestimó el valor de Super Food en esta fase.
- Confirmar si el usuario ha subido todas las variantes locales de los nueve monstruos. No sustituir scripts locales sin revisar.

## 5. Próximas pruebas reales
1. En servidor de pruebas, 200 intentos de pantano (lvl1000/Fishing120/caña3483). Esperado estadístico ~44 intentos que pasan el umbral; contar spawns efectivos y diversidad de criaturas, no exigir exactamente 44.
2. 200 intentos lava con mismo personaje y caña; verificar que aparezcan más de una especie elegible y no se rompan sus `MonsterType`.
3. 100+ intentos de agua lvl1000/Fishing45 para confirmar la tabla anterior de Quara/Water Elemental/Crab y obtener la cantidad real de Salmon por hora incluyendo kills.
4. Deathpincer: 10–20 victorias solo Knight1000 con set850, registrar tiempo, supplies, GP vendible y rareza Reward Chest. No alterar sus drops por el resultado de una muestra pequeña.
5. Guard y Venom: 1v1 y dos enemigos en arena de pruebas con DPS/HP/MP minuto a minuto. Verificar que la dificultad al enfrentar dos monstruos no impida escapar.

**Estado:** parches en la rama de balance, no desplegados. Pendientes pruebas de sintaxis Lua en Canary, spawn/loot, pesca y economía observada.
