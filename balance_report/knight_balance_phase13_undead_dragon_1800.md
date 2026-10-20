# Frozen Hell — Fase 13: primer balance aplicado del piso 1000–2000

**Rama:** `balance-frozen-hell-knight-100-200` · **PR #2 borrador** · **sin merge / sin test de servidor**.

## Cambio de gameplay aplicado

Archivo existente: `data-canary/monster/Custom/Skeletons/undead dragon.lua`.

| Parámetro | Antes | Fase 13 |
|---|---:|---:|
| Nivel recomendado | No registrado | **1800** (comentario de diseño, no restricción de entrada) |
| HP | 22 000 | **72 000** |
| EXP | 36 000 000 | **118 000 000** |
| Defense | 35 | **42** |
| Armor | 5 | **38** |
| Speed | 300 | **320** |
| Earth/Fire/Death resist | 100% / 100% / 100% | **25% / 35% / 50%** |
| Melee principal | 865–1100 cada 1.5s | **1350–1750 cada 2s** |
| Ataques | 9 (incluyendo condition) | **7**, limitando ráfagas |

La reducción de inmunidades completas evita bloquear en exceso vocaciones y elementos. No se cambiaron otros monster Lua; la identidad registrada sigue siendo `undead dragon`, por lo que **todos los respawns con ese nombre usarán esta versión**. Verificar spawns fuera del piso antes de activar.

## DPS bruto teórico, NO DPS real

Estimar para cada ataque directo `media de |min|max| × chance/100 × 1000/interval_ms`. Para los siete ataques nuevos la suma es aproximadamente **1 279.5 DPS bruto** cuando todos impactan el objetivo. El daño real puede ser menor (defensa, resistencias, dirección y zonas), y los ataques pueden no sumarse de forma independiente según las reglas internas del engine. No utilizar esta cifra para afirmar supervivencia garantizada.

### Knight lvl1800, ML10 (referencia para test, no ML verificado)
- `exura med ico`, script vanilla `fair_wound_cleansing.lua`: min = (1800×0.2 + 10×4 + 25)×2 = **850**; max = (1800×0.2 + 10×7.95 + 51)×2 = **981**; promedio aproximado **915.5**, cooldown 1s.
- Health potion lvl1000 (ID50967): **2575–2925 HP**, promedio **2750** por consumo, con exhaust compartido de consumibles por 2s. Potencia teórica máxima si alternan sin interferencias: **1375 HP/s** por pociones.
- Spells y consumibles dan un margen teórico para un combate único, pero ignora mana, pérdida de tiempo, spikes, cooldowns adicionales, distancia y mitigación. Dos criaturas a la vez superan este cálculo simplificado sin considerar armor; probar por separado.
- **Super Food** es alternativa adicional de consumible y comparte esos 2 segundos con pociones; no sumar Super Food y potions como si pudieran usarse simultáneamente.
- No considerar Mana Rune ni Knight Heal Rune en ningún escenario.

## Loot controlado
Eliminadas las entradas que entregaban directamente cinco armas de quest lvl100 (por IDs/nombres: 3287 throwing star, 3288 magic sword, 3309 thunder hammer, 3319 stonecutter axe, 3341 arcane staff). Estas armas se reservan para sus quests.
Añadidas crystal coins hasta 2 con chance 35 000/100 000; demonic essence queda con una sola entrada de chance 11 000/100 000. Se preservan otros drops originales y equipo normal.

## Ritmo y advertencia sobre stages
En esta rama, `config.lua` declara `rateUseStages = true` y `data/stages.lua` tiene un stage abierto `minlevel=1, multiplier=1`. Por lo tanto, para estimaciones **no asumir que `rateExp=1000` aplica**: es el fallback que el config reserva cuando los stages están deshabilitados. Se preservan stages sin cambios por acuerdo previo. Confirmar experiencia efectiva in-game.

## Lo que falta antes de la siguiente iteración
- Los nombres mostrados en el piso (Frozenhell Guard, Dementor, Arch Angel, Hellraiser, Venom y Little Puppy) **no tienen archivos Lua identificados por ese nombre** en el árbol actual de `data-canary/monster`. Evitar inventar looks y loot antes de recibir o identificar scripts reales.
- Undead Mage del nivel 850 sigue con 17 000 HP y 28 M EXP. En piso 1000 es un escalón de entrada, no duplicar/rebalancear cacería previa.
- El **boss ~2000** todavía debe identificarse: no convertir el Orshabaal ya existente (en `Custom/Bosses`) en boss de esta etapa sin conocer otros spawns.
- Comparar DPS in-game en Knight, Paladin, Druid y Sorcerer, con set850 y Green Demon, contra uno y dos Undead Dragons. Evaluar spells, potions, Super Food, mana, muerte/tiempo/EXP y drop.
- Confirmar que `data-canary` del usuario realmente coincide con GitHub, mapas y looktypes. Puede haber scripts locales aún no subidos.
- Ejecutar `python3 balance_report/validate_phase13.py` desde la raíz. Valida variables, DPS bruto acotado, loot sin armas quest y la no regresión de Undead Mage y Deathpincer; es estático y no verifica el gameplay.

## Principio de diseño preservado
Boss nivel1000 → Green Demon universal facilita 1000–1999 pero equipo850 sigue viable; boss nivel2000 → cuatro sets por vocación facilitan 2000–3000, sin obligarlos como llave. La EXP de Fishing supera a criaturas equivalentes *por encuentro conseguido* sin que sea necesariamente mayor por hora, debido al tiempo y rareza de captura.
