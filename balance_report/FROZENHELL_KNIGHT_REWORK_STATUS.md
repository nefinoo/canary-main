# Frozen Hell | Reinicio del balance - Knight (v1)

Fecha: 2026-11-07. Rama de trabajo: feat/frozenhell-knight-spells-v1 (base pr-level-limit).

## Alcance
- Solo Knight / Elite Knight. Los monstruos, pociones, equipo, runas, NPCs y otras vocaciones NO se han balanceado aun.
- Se conservan las formulas de combate nativas del motor (armadura, mitigacion, habilidades de arma) y se reemplazan las spells de ataque/curacion del Knight.
- Los scripts antiguos permanecen en el repositorio, inhabilitados de forma reversible con \`if true then return end\`. Las curaciones \`utura\` / \`utura gran\` quedan habilitadas para Paladin.
- Se preservan utilidades como \`exeta res\`, \`exana pox\` y \`utani tempo hur\`. No son spells de dano/curacion directa; su impacto podra evaluarse en una fase posterior.
- NO utilizar Mana Rune ni Knight Mana Rune para el balance (restriccion del proyecto).

## Archivo principal
\`data-canary/scripts/spells/knight_rework/frozenhell_knight_spells.lua\`

La tabla global \`FrozenHellKnightBalance\` es la FUENTE UNICA DE VERDAD de las nuevas spells. El futuro \`!simdps demon\` debe leerla directamente, usando nivel, skills, arma, ML, equipo e inventario actuales del jugador.

### Daño (fisico, ANTES de reducciones del monstruo)
Potencia \`P = nivel / 5 + 0.085 * skill * attack\`.
Rango de cada hechizo: \`P * multiplicador * [0.85, 1.15]\`.

| Spell | Palabras | Nivel | Multiplicador | CD | Mana: base + fraccion de mana maximo |
|---|---|---:|---:|---:|---|
| Steel Fang | exori fang | 8 | 0.95 | 3 s | 25 + 0.5% |
| Frost Cleave | exori frost | 100 | 0.60 por enemigo, 3x3 | 5 s | 65 + 1.2% |
| Frost Breaker | exori breaker | 250 | 1.65 | 8 s | 100 + 1.6% |
| Glacial Storm | exori storm | 500 | 0.78 por enemigo, 3x3 | 9 s | 150 + 2.4% |
| Frozen Execution | exori execute | 1000 | 2.40 | 15 s | 220 + 3.5% |

Todas las spells ofensivas tienen un cooldown grupal de 2 segundos. Sus ataques usan daño FISICO (los efectos de hielo son visuales).

### Curaciones
Rango de la curacion directa: \`(HPmax * factorHP + min(ML * factorML, HPmax * limiteML)) * [0.95, 1.05]\`.

| Spell | Palabras | Nivel | Curacion | CD | Mana: base + fraccion de mana maximo |
|---|---|---:|---|---:|---|
| Second Wind | exura wind | 8 | 6% HPmax + min(4.5 ML, 2% HPmax) | 1.5 s | 30 + 0.8% |
| Frozen Recovery | utura frost | 100 | 1% HPmax cada segundo por 8 s | 25 s | 80 + 2.0% |
| Frost Mend | exura frost | 300 | 12% HPmax + min(7 ML, 3% HPmax) | 3 s | 85 + 1.8% |
| Last Bastion | exura bastion | 1000 | 22% HPmax + min(12 ML, 4% HPmax) | 14 s | 140 + 4.5% |

Cooldown grupal de curacion: 1 segundo. Para Frozen Recovery, el tick depende del HPmax al lanzar la spell y no se acumula indefinidamente (cooldown mayor que duracion).

## Como validar dentro del servidor
1. Revisar y fusionar la rama solo tras aprobar los cambios; reiniciar Canary para cargar los RevScripts.
2. Verificar que un Knight pueda lanzar \`exori fang\` y \`exura wind\` desde nivel 8 y que no pueda lanzar las spells antiguas \`exori\` / \`exura ico\`.
3. Comprobar niveles requeridos, daño y cura, coste de mana real, cooldowns de grupo y ataques 3x3.
4. Verificar que \`utura\` y \`utura gran\` sigan funcionando para Paladin y que las utilidades de Knight sigan disponibles.
5. Probar contra ratas, slimes, orcs, minotaurs, cyclops y luego criaturas superiores. No asumir que el balance anterior sigue siendo valido.

## Pendientes y decisiones
- FASE ACTUAL: spells Knight v1 listas para pruebas. No se ha ejecutado Canary real; prueba Lua aislada valida carga y 9 registros.
- SIGUIENTE: medir daño/heal en juego; ajustar formulas segun TTK, supervivencia y consumo.
- DESPUES: crear pociones nuevas, economía de suministros y cooldown compartido con Super Food.
- DESPUES: reconstruir \`!simdps demon\` para leer el personaje/armas/equipo/contenedores y utilizar exactamente \`FrozenHellKnightBalance\`.
- DESPUES: balance progresivo completo de monsters de Frozen Hell como servidor nuevo, respetando las etapas establecidas.

## Reversion
Deshacer los commits de esta rama, o restaurar los scripts originales quitando su guarda \`if true then return end\` y restableciendo las vocaciones compartidas. No eliminar permanentemente archivos vanilla.
