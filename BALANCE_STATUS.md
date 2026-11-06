# Frozen Hell — ESTADO MAESTRO DEL BALANCEO V2

**ÚLTIMA ACTUALIZACIÓN:** 2026-11-06
**Repositorio:** https://github.com/nefinoo/canary-main
**Rama ACTIVA de balanceo:** `balance-v2-knight-foundation`
**Rama de origen:** `pr-level-limit`
**Ramas anteriores/históricas (NO utilizar para el nuevo balance):** `balance-frozen-hell-knight-100-200`, PR #2. `main` NO se ha modificado.
**Etapa actual:** V2.1 — fundamento de combate del Knight implementado en la rama, pendiente de validación completa en Canary.
**Seguridad:** no hacer merge, desplegar ni modificar monstruos de quest sin aprobación explícita. Nunca atribuir resultados reales a simulaciones.

## 0. PREFERENCIA DE TRABAJO (06-nov-2026)

- El usuario **NO quiere ejecutar Python, validadores, simuladores ni comandos de terminal**. No volver a pedirle ejecutarlos ni ponerlos como condición para continuar.
- Quiere que el asistente **edite los archivos de monstruos o ítems directamente en GitHub**, y que informe los cambios confirmados. Para la V2, la prioridad inmediata son **ítems/armas del Knight**; no crear monstruos hasta que el usuario indique el nivel del primer respawn.
- El usuario podrá actualizar archivos por GitHub Desktop si decide usarlos. Evitar instrucciones de terminal.
- El archivo `data/items/items.xml` ocupa ~3.65 millones de caracteres; al intentar actualizarlo con el conector GitHub se recibió un error de transporte `h2 protocol error`. **NO se aplicó el cambio**: SHA original verificado `4ba5e46fa29096aba643c5f98dfb67c915b5aa2f`. No afirmar que las armas fueron alteradas.
- Auditoría realizada en el XML original: las armas Knight de nivel 2500/5000/10000/15000/20000/30000 mantienen ataque base de ~44/47/52. Las armas Deadly de quest de nivel 1000 (IDs 3303/7415/7390) siguen con ATK 52/44/47; además no todas tienen nivel 1000 correcto. Es un problema de progresión que debemos solucionar en una edición de items.xml efectivamente confirmada.
- Borrador de ataque escalonado (todavía NO aplicado): nivel 1000 [axe 3303=110, club 7415=112, sword 7390=108]; 2500 [53049=145, 53048=148, 53050=142]; 5000 [52365=185, 52366=189, 52376=181]; 10000 [51069=240, 51066=246, 51064=235]; 15000 [50972=290, 50977=297, 50970=284]; 20000 [51918=340, 51920=348, 51922=333]; 30000 [53280=420, 50819=430, 53284=412]. Mantener IDs/vocaciones/drops/quest; revisar impactos antes de dar el balance por cerrado.
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

## 3. PRUEBAS Y ESTADO

- [x] Se creó nueva rama **sin mezclar con el balanceo anterior**.
- [x] Se localizaron spells, pociones, vocaciones, C++ de velocidad y NPC Malak en GitHub.
- [x] Se escribieron primeras fórmulas de daño, curaciones y potions Knight en nueva rama.
- [x] Se revirtió el bloqueo involuntario del bonus temporal Fist.
- [x] Se restituyó el ID de poción Knight `50965`; Paladin `50967` no se modifica.
- [x] Se restituyeron precios de Malak; pendiente costeo final de la nueva progresión.
- [x] Se creó estimador y validador en GitHub.
- [ ] Ejecutar `python balance_report/validate_knight_v2.py` y resolver cualquier regresión.
- [ ] Confirmar ejecución de GitHub Actions / sintaxis Lua.
- [ ] Probar en una instancia Canary de pruebas (Knight normal, no GM): 10+ golpes básicos con/sin ítem Fist; Exori, Exori Gran, Exori Min, Exori Mas, Exori Ico y Exori Gran Ico; cooldown real, distancia/área y mana consumido.
- [ ] Probar Exura Ico, Exura Med Ico y Exura Gran Ico a varios niveles, así como la espera de 2s compartida entre potions y Super Food.
- [ ] Construir perfiles de Knight para futuros respawns: entrada/salida, nivel, skills, ML, tipo de arma, set completo (ARM, HP/MP, absorción, augments), y consumibles por minuto. No hay perfiles aprobados todavía.
- [ ] Calibrar el estimador contra daño observado; definir presupuesto defensivo y gasto en GP por 40s.
- [ ] Solo entonces crear primer monstruo **nuevo** con meta 40s de entrada y 20s de salida. No tocar los nueve monstruos históricos sin solicitud.

## 4. SIGUIENTE ACCIÓN EXACTA

**V2.2 — Edición directa de ítems Knight y luego monstruos nuevos.** No pedir al usuario ejecutar Python ni comandos.
1. Resolver método de escritura fiable del archivo grande `data/items/items.xml` (la llamada directa al conector falló; no hay cambios confirmados en este XML).
2. Aplicar primero armas de nivel 1000 y siguientes tiers con nivel y ATK coherentes; conservar IDs de quest, vocaciones y rarezas; verificar SHA/commit y leer de vuelta los valores.
3. Revisar armaduras, piernas, cascos, botas, escudos y augments existentes para Knight; priorizar piezas utilizables por Knight sin modificar el balance de las demás vocaciones.
4. Cuando el usuario indique un nivel concreto, crear un monstruo **totalmente nuevo** y ajustar su HP/defensas/loot para el objetivo 40 s al entrar y 20 s cuando el Knight mejore equipo y nivel. La medición real no se ha confirmado.
5. Registrar **solo cambios realmente guardados** en GitHub en este archivo.

## 5. CÓMO RETOMAR ESTE PROYECTO EN UN CHAT NUEVO

En el nuevo chat pedir: **"Continúa el balanceo de Frozen Hell V2. Lee el archivo `BALANCE_STATUS.md` de la rama `balance-v2-knight-foundation` del repositorio `nefinoo/canary-main`. Sigue desde 'SIGUIENTE ACCIÓN EXACTA'; NO reinicies ni uses las fases antiguas; SOLO Knight. Actualiza ese archivo con cada cambio."**

El asistente DEBE consultar primero este archivo en GitHub, cotejarlo con los Lua y con los commits recientes, ejecutar/priorizar validaciones y **actualizar la fecha, checks, decisiones, pruebas, hallazgos y siguiente paso** aquí con cada intervención relevante. La memoria/chat es secundaria: ESTE archivo es fuente de continuidad, pero nunca reemplaza verificar código real.
