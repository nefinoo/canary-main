# Frozen Hell — Fase 6: auditoría 850–1000 y puerta a Deathpincer

**Estado:** criterios y pruebas, NO cambios de estadísticas ni loot en esta fase. Rama de pruebas `balance-frozen-hell-knight-100-200`, PR #2 en borrador.

## Hallazgos cuantitativos
- EXP Tibia base para subir de nivel 850 a 1000: **6,417,395,000**.
- A 26 M EXP por Hell Soldier: **247 muertes** redondeando hacia arriba, sin stages/bonos.
- A 28 M EXP por Undead Mage: **230 muertes** redondeando hacia arriba, sin stages/bonos.
- Hell Soldier favorece Mail (350/100000 = 0.35% por kill); Undead Mage favorece Helmet (350/100000 = 0.35%).
- Si el jugador mata 120 unidades de cada tipo, la probabilidad de conseguir *al menos una* Mail solo por las 120 Hell Soldier es **1-(1-0.0035)^120 ≈ 34.3%**. La misma cuenta aplica para Helmet de los 120 Undead Mage. Incluso antes de considerar Ranger Legs, **no se debe exigir el set completo para acceder a Deathpincer**. Las probabilidades por el loot cruzado elevan un poco estos resultados.
- La suma de tres reducciones físicas 3%/2%/2% requiere confirmar en Canary el cálculo final: NO declarar 7% de mitigación efectiva sin prueba.

## Puerta de progresión propuesta (parámetros de aceptación; no cifras verificadas)
- Personaje Knight normal, sin promoción. Comparar equipo común de etapa 850 con conjunto raro completo. El boss debe ser *derrotable con el equipo común* con habilidad y consumibles; el raro mejora margen y rapidez.
- Ensayos a nivel 850 y nivel 1000, skills Axe 90 y 100 como puntos de prueba (ajustables si los skills reales difieren). Probar 10 enfrentamientos contra 1 monster y 10 contra 2; medir tiempo para matar, golpes recibidos, picos, coste de potions/Super Food y mana neta.
- Curación permitida para el balance: spells vanilla, pociones y Super Food obtenido mediante Fishing. Excluir Mana Rune y Knight Heal Rune. Mantener exhaust compartido.
- Probar misma ruta con Paladin, Druid y Sorcerer antes de declarar el tramo balanceado para todas las vocaciones. Las recompensas del boss ~1000 abrirán cuatro líneas de sets por vocación.
- Medir EXP/hora *real*, considerando tiempo caminando, curación, pesca y duración de combate; no equiparar EXP/kill con EXP/hora.

## Datos bloqueantes antes de tocar Deathpincer
1. Identificar archivo exacto del boss y evitar confundirlo con The Deathwalker de quest.
2. Verificar nombre registrado, HP, experiencias, resistencias, tiempos/chances de ataque, frecuencia de curación e inmunidades.
3. Identificar posición/teleport y número simultáneo de criaturas; validar sprite looktype y Bestiary.
4. Revisar loot actual (ID exacto) y transición a sets exclusivos de Knight, Paladin, Druid y Sorcerer.
5. Comprobar que el boss no exige un equipo cuyo drop solo se obtenga tras derrotarlo.
6. Validar en Canary con cliente Tibia 12.56 antes de cambiar HP, daño, EXP o loot.

## No modificar
Stages/rates, quests de armas nivel 100 (Giant Spider Knight, Dragon magos, Warlock Paladin), Fist Fighting temporal, Rat, Slime, Orc, Hydra, The Deathwalker de quest, y bosses de quests.
No fusionar PR ni desplegar sin aprobación explícita.