# Frozen Hell — ESTADO MAESTRO DEL BALANCEO V2

**ÚLTIMA ACTUALIZACIÓN:** 2026-11-06
**Repositorio:** https://github.com/nefinoo/canary-main
**Rama ACTIVA de balanceo:** `balance-v2-knight-foundation`
**Rama de origen:** `pr-level-limit`
**Ramas anteriores/históricas (NO utilizar para el nuevo balance):** `balance-frozen-hell-knight-100-200`, PR #2. `main` NO se ha modificado.
**Etapa actual:** V2.2 — 21 armas Knight escaladas en items.xml (niveles 1000 a 30000), pendientes equipo defensivo, augments y validación en Canary.
**Seguridad:** no hacer merge, desplegar ni modificar monstruos de quest sin aprobación explícita. Nunca atribuir resultados reales a simulaciones.

## 0. PREFERENCIA DE TRABAJO (06-nov-2026)

- El usuario **NO quiere ejecutar Python, validadores, simuladores ni comandos de terminal**. No volver a pedirle ejecutarlos ni ponerlos como condición para continuar.
- Quiere que el asistente **edite los archivos de monstruos o ítems directamente en GitHub**, y que informe los cambios confirmados. Para la V2, la prioridad inmediata son **ítems/armas del Knight**; no crear monstruos hasta que el usuario indique el nivel del primer respawn.
- El usuario podrá actualizar archivos por GitHub Desktop si decide usarlos. Evitar instrucciones de terminal.
- **RESUELTO:** El XML de ítems es muy grande para el conector de edición directa. Se creó una automatización interna en GitHub `.github/workflows/apply-knight-v2-items.yml` que ejecuta `balance_report/apply_knight_v2_items.py`, verifica el XML y guarda automáticamente el `items.xml`. El usuario NO ejecuta ningún comando ni Python. El script verifica ID, clase Knight, nivel y valor original antes de modificar; el cambio es idempotente.
- **APLICADO Y VERIFICADO:** 21 armas de Knight con ataques escalados entre nivel 1000 y 30000. Commits reales en `data/items/items.xml`: `5e19d1917496cc78a8fcbb8c9f2f47c32292c6ad` (tres Deadly) y `b0079e78f3695ce364b9b7b157c1b5ba503ef19a` (18 armas posteriores). SHA XML tras el segundo: `2068d26823444debe43fa4a61d61ae1d27231394`. XML validado estructuralmente en la automatización; NO verificado in-game.
- Ataques implementados, en orden Axe / Sword / Club:
  - Nivel 1000: 110 / 108 / 112 (IDs 3303, 7390, 7415), los tres con nivel requerido 1000.
  - Nivel 2500: 145 / 142 / 148 (IDs 53049, 53050, 53048).
  - Nivel 5000: 185 / 181 / 189 (IDs 52365, 52376, 52366).
  - Nivel 10000: 240 / 235 / 246 (IDs 51069, 51064, 51066).
  - Nivel 15000: 290 / 284 / 297 (IDs 50972, 50970, 50977).
  - Nivel 20000: 340 / 333 / 348 (IDs 51918, 51922, 51920).
  - Nivel 30000: 420 / 412 / 430 (IDs 53280, 53284, 50819).
- Se conservaron las defensas, bonos, críticos, leech, augments y restricciones de clase existentes de estas armas. Ningún monstruo se modificó. Los valores son un punto de partida y aún no establecen TTK 40/20 medido.
- Los informes y simulaciones anteriores siguen disponibles como referencia técnica **interna**, pero el usuario no debe ejecutar herramientas ni escribir comandos.

## 1. VISIÓN DEL USUARIO — LEER EN CADA NUEVO CHAT

Se reinicia el balanceo completamente, **con el mismo repositorio**. El historial previo es referencia, NO determina las estadísticas de la nueva progresión.

1. **SOLO KNIGHT POR AHORA.** No balancear Paladin, Druid o Sorcerer ni alterar sus pociones, spells, regeneración y estadísticas. Los cambios en archivos compartidos deben delimitarse por vocación Knight/Elite Knight.
2. Primero cerrar ataques normales, spells ofensivos, spells de curación, cooldowns, mana, pociones, sustain, defensa del Knight y modelado de equipo.
3. **Monstruos de cacería serán TOTALMENTE NUEVOS**, creados después de que el Knight esté calibrado. No reutilizar/editar monstruos existentes como sustitutos, salvo instrucción específica.
4. Cada nuevo monstruo se diseña para que un Knight con nivel, skill y equipo de **entrada al respawn tarde ~40 segundos por kill**. Cuando ese mismo monstruo tarde **~20 segundos por kill** debido a niveles, skills y equipo mejores, se habrá alcanzado el momento natural de cambiar al siguiente respawn. No confundir mayor HP con más EXP/h por defecto.
5. Revisar equipo **existente** por ID real y diseñar libremente el nivel requerido, armadura, daño, absorciones, augments y loot que permiten la transición 40s → 20s. El equipo solo se editará tras inventario y pruebas de su impacto.
6. El loot del monstruo, su EXP, su defensa, su daño y su rentabilidad se ajustarán después de fijar el perfil Knight de entrada y salida; evitar recompensas que invaliden los futuros respawns.
7. Combate principalmente solitario y progresivo. Sustento legítimo: curaciones Knight, pociones y Super Food. NO contar Mana Runes, Knight Mana Runes ni Knight Heal Rune en simulaciones.
8. **FIST FIGHTING ESTÁ BLOQUEADO PARA ENTRENAMIENTO/PROGRESIÓN EN TODAS LAS VOCACIONES.** Existe un ítem especial que incrementa **temporalmente** Fist Skill y por ello aumenta **solo durante X segundos** la velocidad de los autoataques, generando una ráfaga. Este mecanismo es **intencional y se debe PRESERVAR**. No crear entrenamiento de Fist normal, NO eliminar el multiplicador por Fist y NO aislar Knight de esa velocidad. El ítem de Fist se analizará separadamente cuando se identifique su ID/archivo y duración real.

## 2. CAMBIOS IMPLEMENTADOS EN ESTA RAMA — NO TODOS PROBADOS IN-GAME

### 2.1. Daño del Knight (Spell 6 + autoataque)

Archivos modificados:
- `data/scripts/spells/attack/berserk.lua` — `exori`: CD 4s, mana 65.
- `data/scripts/spells/attack/fierce_berserk.lua` — `exori gran`: CD 6s, mana 120.
- `data/scripts/spells/attack/front_sweep.lua` — `exori min`: CD 7s, mana 60.
- `data/scripts/spells/attack/groundshaker.lua` — `exori mas`: CD 8s, mana 90.
- `data/scripts/spells/attack/brutal_strike.lua` — `exori ico`: CD 5s, mana 50.
- `data/scripts/spells/attack/annihilation.lua` — `exori gran ico`: CD 12s, mana 150.
- Todos conservan cooldown de grupo ofensivo 2s y están registrados solo para Knight y Elite Knight.

Fórmulas de daño nominal (antes de defensas/mitigación):
- Sea `L = nivel`, `G = skill de arma * ataque de arma equipada`.
- Exori mínimo `0.11L + 0.048G + 20`; máximo `0.17L + 0.074G + 32`; multiplicador ×1.00.
- Exori Gran: **misma fórmula ×1.35**.
- Exori Min: misma fórmula ×0.82.
- Exori Mas: misma fórmula ×0.70.
- Exori Ico: min `0.13L + 0.067G + 28`, max `0.20L + 0.093G + 46`.
- Exori Gran Ico: min `0.22L + 0.105G + 55`, max `0.32L + 0.15G + 95`.
- Objetivo: que nivel + habilidad + **equipo/arma** impacten realmente el TTK. Estos números son la primera propuesta, no balance final certificado.
- `data/XML/vocations.xml`: `meleeDamage=1.10` para IDs 4/8 (Knight/Elite Knight), otras vocaciones sin cambios.
- Autoataque: `src/creatures/players/player.cpp` **ha quedado en su lógica ORIGINAL** desde `pr-level-limit`. `toggleAttackSpeedOnFist = true` en `config.lua`. Con Fist temporal activo, velocidad `max(100 ms, 1000 ms - 5 ms * Fist actual)` bajo valores actuales (según `Player::getAttackSpeed`). El Fist normal no debe poder entrenarse. Si el config cambia, revisar ambos valores. No modificar esta regla para calibrar el daño del Knight.

### 2.2. Curación del Knight

- `data/scripts/spells/healing/wound_cleansing.lua`: Exura Ico mana25, CD1.5s, min `0.14L + 4ML + 20`, max `0.21L + 6.5ML + 35`.
- `data/scripts/spells/healing/fair_wound_cleansing.lua`: Exura Med Ico lvl300, mana70, CD2s, min `0.32L + 7ML + 55`, max `0.46L + 10ML + 85`.
- `data/scripts/spells/healing/intense_wound_cleansing.lua`: Exura Gran Ico lvl80, mana220, CD45s, min `1.7L + 20ML + 200`, max `2.3L + 30ML + 350`; se debe comprobar el carácter de curación de emergencia en el juego.
- Grupo curación 1s. No sumar sustain de dos spells simultáneos sin respetar cooldowns, mana y prioridades.

### 2.3. Pociones y Super Food — Knight solamente

Archivo principal `data/scripts/actions/items/potions.lua`; objetivo de vida promedio por dosis, KNIGHT:
| Level | ID | HP min–max |
|---:|---:|---:|
| 80 | 239 | 440–560 |
| 130 | 7643 | 670–830 |
| 200 | 23375 | 900–1100 |
| 500 | 51246 | 1800–2100 |
| 1000 | **50965** | **2500–3000** |
| 2500 | 51702 | 4600–5400 |
| 5000 | 53144 | 6500–7500 |
| 10000 | 50384 | 10500–11500 |

- **CRÍTICO:** 50965 es la poción Knight lvl1000 en el script, mientras que **50967 es Paladin** (cura HP+mana). Un cambio inicial equivocado había intercambiado las vocaciones; ya fue CORREGIDO. 50967 conserva HP1020–1320 + MP550–650. No volver a intercambiarlos.
- Consumible mixto lvl50 ID236 queda en su estado original (250–350 HP).
- `data-canary/npc/Malak.lua` conserva precios **originales**: ID50965 = 938 gp, ID50967 = 1179 gp. Los nombres comerciales del NPC deben cotejarse con `items.xml` después, sin inferir vocación solo por `itemName`.
- `data-canary/scripts/Customs/Superfood.lua`: el Knight comparte storage `935110` y exhaust de **2 s** con pociones (potions.lua y Superfood.lua). Otras vocaciones conservan reglas previas. Esta compartición requiere prueba in-game de Action y de tiempos en `os.time()`; no asegurar que sea exacta a milisegundos. Verificar que el slot storage no colisione con otras funciones.
- No se cambiaron las cantidades de curación de los distintos Super Food. Se analizarán con el equipamiento y la pesca, más adelante.
- Potions de mana del Knight, disponibilidad real en tiendas y economía de consumibles: revisar en la siguiente iteración, no asumir recuperación ilimitada de mana.

### 2.4. Estimador 40s → 20s (aproximación)

`balance_report/v2_knight_ttk.py` (es solo un modelo offline, NO replica combate Canary):
- Entradas: nivel, skill de arma, ataque arma, ML, bonos HP/MP del equipo, Fist base, Fist extra temporal y segundos del buff, protección/daño multiplicador, daño recibido del monstruo y curación del monstruo.
- Calcula daño nominal disponible en 40s y propone HP de monstruo; prueba el mismo HP con perfil de salida y advierte si no logra matar en ~20s.
- Fist ordinario de ejemplo 10; `--fist-bonus`, `--fist-buff-seconds` y sus opciones exit modelan el efecto del ítem especial. **No se modificó el ítem**. Verificar duración y bonus reales cuando se localice.
- Ritmo del autoataque simulado en pasos de 0.1s, no el timer exacto del motor. Omite defensas reales, patrón de ataque, movimiento, bloqueo, parry, leech, daño crítico, prioridad real de actions, distribución de daño aleatorio, regeneración de equipo, fishing y penalizaciones de muerte.
- `balance_report/validate_knight_v2.py` verifica el estado de 6 ofensivas/3 curaciones, vocaciones, ID de pociones, Fist original, cooldown compartido y un escenario teórico.
- `.github/workflows/validate-knight-v2.yml` instala Python/Lua para ejecutar validador y comprobar sintaxis. Estado de CI y validación en Canary deben confirmarse, no asumir éxito.

### 2.5. Inventario de sets Knight (06-nov-2026) — aún sin editar

Se localizaron piezas exclusivas Knight/Elite Knight en `items.xml`:
- Black Knight nivel 5000: helmet 51226, armor 51229, legs 51212, boots 51228, shield 51697. Valor original frecuente ARM300 / DEF300 / +10000 HP por pieza; botas +1000 HP cada 2 s.
- Frozen nivel 10000: helmet 51062, armor 51059, legs 51060, boots 51061, shield 51063. Valor original ARM600 / DEF600 / +20000 HP por pieza; botas +2000 HP cada 2 s.
- Gladiator nivel 15000: helmet 51204, armor 51206, legs 51211, boots 51215, shield 53421. Valor original ARM800 / DEF700 (shield) / +40000 HP por pieza; botas +800 HP cada 2 s.
- Undyeing nivel 30000: helmet 51242, armor 51243, legs 51244, boots 51245, shield 51506. Valor original ARM1000 / DEF800 (shield); solo las cuatro piezas de ropa tienen +10000 HP cada una, botas +1500 HP cada 2 s.
- 2500: Yalahari está compartido entre vocaciones; no editarlo sin análisis de consecuencias. Nivel 1000 Green Demon también es compartido, no imponer restricción Knight arbitrariamente.
- Problemas de progresión defensiva identificados: Undyeing +10k HP por pieza es inferior a Gladiator +40k pese a ser el doble de nivel; Gladiator boots regenera menos por segundo que Frozen boots. Todavía **NO se cambiaron** ARM/HP/boots/augments, no balancearlos ciegamente sin tener claro sustain y evitar afectar otras vocaciones.
- Nivel 20000: se encontraron armas Golden, pero no un set Knight de equipamiento equivalente con el mismo nivel; revisar progresión de piezas reales.

## 3. PRUEBAS Y ESTADO

- [x] Se creó nueva rama **sin mezclar con el balanceo anterior**.
- [x] Se localizaron spells, pociones, vocaciones, C++ de velocidad y NPC Malak en GitHub.
- [x] Se escribieron primeras fórmulas de daño, curaciones y potions Knight en nueva rama.
- [x] Se revirtió el bloqueo involuntario del bonus temporal Fist.
- [x] Se restituyó el ID de poción Knight `50965`; Paladin `50967` no se modifica.
- [x] Se restituyeron precios de Malak; pendiente costeo final de la nueva progresión.
- [x] Se creó estimador y validador en GitHub.
- [ ] Verificar internamente los resultados del validador del Knight; nunca pedir al usuario ejecutar Python.
- [x] Automatización de edición de ítems ejecutada y XML válido; [ ] validar compilación/sintaxis Lua y ejecución de Canary en ambiente controlado.
- [ ] Probar en una instancia Canary de pruebas (Knight normal, no GM): 10+ golpes básicos con/sin ítem Fist; Exori, Exori Gran, Exori Min, Exori Mas, Exori Ico y Exori Gran Ico; cooldown real, distancia/área y mana consumido.
- [ ] Probar Exura Ico, Exura Med Ico y Exura Gran Ico a varios niveles, así como la espera de 2s compartida entre potions y Super Food.
- [x] Se aplicaron 21 armas Knight y se identificaron las piezas de sets Knight por ID; [ ] Construir perfiles de Knight para futuros respawns: entrada/salida, nivel, skills, ML, tipo de arma, set completo (ARM, HP/MP, absorción, augments), y consumibles por minuto. No hay perfiles aprobados todavía.
- [ ] Calibrar el estimador contra daño observado; definir presupuesto defensivo y gasto en GP por 40s.
- [ ] Solo entonces crear primer monstruo **nuevo** con meta 40s de entrada y 20s de salida. No tocar los nueve monstruos históricos sin solicitud.

## 4. SIGUIENTE ACCIÓN EXACTA

**V2.3 — Ajustar equipo DEFENSIVO exclusivo del Knight (siguiente turno).** No pedir al usuario comandos.
1. Evaluar primero sets Black Knight 5000, Frozen 10000, Gladiator 15000, Undyeing 30000. Hay discontinuidades confirmadas de HP y regeneración, especialmente Gladiator vs Frozen y Undyeing vs Gladiator; elegir escalado coherente que no desplace a las pociones ni hechizos.
2. No tocar por ahora sets Green Demon lvl1000 ni Yalahari lvl2500 compartidos entre vocaciones. Revisarlos únicamente cuando haya forma de preservar otras vocaciones.
3. Escribir los cambios en `data/items/items.xml` mediante el flujo automático de GitHub ya comprobado (sin intervención del usuario), verificar commit real y leer el patch.
4. Mantener intactos Fist temporal, los IDs, los requisitos de nivel y las misiones; no modificar monstruos históricos. El primer monstruo será TOTALMENTE NUEVO cuando el usuario indique nivel.
5. Después medir TTK 40s al llegar al respawn / 20s al subir y mejorar equipo, siempre distinguiendo modelo nominal de prueba real.

## 5. CÓMO RETOMAR ESTE PROYECTO EN UN CHAT NUEVO

En el nuevo chat pedir: **"Continúa el balanceo de Frozen Hell V2. Lee el archivo `BALANCE_STATUS.md` de la rama `balance-v2-knight-foundation` del repositorio `nefinoo/canary-main`. Sigue desde 'SIGUIENTE ACCIÓN EXACTA'; NO reinicies ni uses las fases antiguas; SOLO Knight. Actualiza ese archivo con cada cambio."**

El asistente DEBE consultar primero este archivo en GitHub, cotejarlo con los Lua y con los commits recientes, revisar las validaciones automáticamente sin pedir comandos al usuario y **actualizar la fecha, checks, decisiones, pruebas, hallazgos y siguiente paso** aquí con cada intervención relevante. La memoria/chat es secundaria: ESTE archivo es fuente de continuidad, pero nunca reemplaza verificar código real.
