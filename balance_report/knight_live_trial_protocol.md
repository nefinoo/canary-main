# Frozen Hell — Pruebas reales Knight (Canary)

Esta herramienta **no simula combates, no aparece monstruos, no modifica loot ni da invulnerabilidad**. Se ejecuta dentro del Canary vivo y registra lo que sucede durante los cinco enfrentamientos de la Fase 1 y Fase 2.

## Instalación

1. Copiar `frozen_hell_live_trials.lua` a `data-canary/scripts/Customs/` de tu servidor **de pruebas**.
2. Editar al principio del script `allowedNames` para incluir exactamente los nombres de los personajes Knight que probarán (por defecto contiene `Maloka`). Utilizar un Knight normal, **no un personaje con inmunidad de Game Master**.
3. Confirmar que exista la carpeta `data/logs/` en la carpeta desde la que se ejecuta Canary y que el servidor pueda escribir dentro.
4. Reiniciar Canary para registrar los nuevos CreatureEvents/TalkAction.
5. Preparar una arena privada y colocar los enemigos con un personaje GM separado. Ningún otro jugador debe estar dentro de ocho casillas del Knight de prueba. El registrador no crea monstruos ni inicia el ataque por sí solo.

## Cinco enfrentamientos

| Prueba | Personaje/Equipo | Enemigos | Comando antes de entrar en combate |
|---|---|---|---|
| A1 | Knight 1000; set 850 + arma quest 1000; repetir con Green Demon | Deathpincer x1 | `!fhtrial start, deathpincer, 1` |
| A2 | Knight 4000; Yalahari + Shield (anotar composición) | Frozenhell Guard x1 | `!fhtrial start, frozenhell guard, 1` |
| A3 | Knight 4000; mismo equipo | Frozenhell Guard x2 | `!fhtrial start, frozenhell guard, 2` |
| A4 | Knight 4800; mismo criterio de equipo | Venom x1 | `!fhtrial start, venom, 1` |
| A5 | Knight 4800; mismo equipo | Venom x2 | `!fhtrial start, venom, 2` |

Usar Exura Ico, Exura Med Ico, pociones de Malak y Super Food. **No contar las Mana Runes ni la Knight Healing Rune** para este balance.

Comandos adicionales: `!fhtrial status` para estado actual y `!fhtrial stop` para terminar voluntariamente. El script termina solo cuando mueren los objetivos, cuando detecta un objetivo desaparecido, cuando el Knight muere/se desconecta o al cumplir 900 segundos.

Después del combate, **sin restockear ni recoger loot durante la medición**, recoger los drops/reward chest y evaluar su valor vendible en Nephy (sin necesariamente venderlos). Registrar el valor real: `!fhtrial loot, 150000`. Anotar por separado la comida pescada usada (su coste de oportunidad no está incluido).

Repetir Deathpincer **10–20 veces** con cada configuración y los combates Guard/Venom suficientes para observar variabilidad, no una sola pelea. Para dos enemigos comenzar con la prueba defensiva de ~10–20 segundos y detenerse/huir si no es sostenible. No provocar muertes permanentes del personaje; usar entorno de pruebas.

## Registros

Enviar el archivo `data/logs/frozen_hell_live_trials.csv`, junto con observaciones de las cargas, vida y mana del jugador. El log contiene muestras de HP/MP cada segundo, HP conjunto restante de enemigos, EXP ganada, consumo registrado de alimentos y pociones (diferencia de inventario), DPS aproximado y el valor de loot ingresado manualmente.

**Limitaciones:** la duración usa `os.time()` con resolución de 1 s; los campos `damage_to_player_events` y `damage_to_monsters_events` son valores de callback y pueden diferir del daño final aplicado tras la mitigación del motor. Las muestras de HP/MP son valores observados, pero pueden omitir picos entre muestras. `combat_xp_hour` no incluye desplazamiento, pesca ni espera por respawns, por lo que **no debe presentarse como EXP/h de cacería completa**. Los conteos de consumibles se calculan por cambios de inventario: no agregar ni retirar manualmente esos ítems mientras se registra la pelea.

**Esta herramienta aún no se ha ejecutado en una instancia Canary**. Su sintaxis se comprobó con el intérprete Lua de la máquina de preparación. Se requiere reiniciar/probar el script dentro del servidor para verificar que los eventos se activen y que se genere el CSV.