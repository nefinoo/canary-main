# Frozen Hell — Fase 2: Demon, Juggernaut y transición a Outlawed Dwarfs

## Alcance y reglas

Rama de pruebas `balance-frozen-hell-knight-100-200`, creada sobre `pr-level-limit`. Esta fase se limita a Demon y Juggernaut, cacerías normales posteriores a Warlock y anteriores a Outlawed Dwarfs.

- **No tocar** rat, slime, orcs, Hydra, Giant Spider, Dragon, Dragon Lord, Warlock ni quests en esta fase.
- **No tocar** experiencia Mid–High, stages, rateSkill/rateMagic, botín ni probabilidades de rarezas.
- Usar solo Knight normal (sin Elite Knight); niveles de referencia 200–250; ataques básicos con skill Axe, Exori y Exori Gran.
- Las armas nivel 100 se consiguen en quest; no se añaden al loot.
- The Deathwalker es un monstruo de quest y queda fuera de este balance.
- Los Outlawed Dwarfs **todavía no** fueron modificados. Son el siguiente bloque.
- Todos los números de esta fase requieren validación con Canary de prueba antes de fusionar.

## Cambios aplicados

| Archivo / monstruo | Valor anterior | Nuevo | Motivo |
| --- | --- | --- | --- |
| `Demons/demon.lua` HP y maxHP | 8,200 | 4,600 | Reducir tiempos de combate excesivos del Knight sin rebajar ataques |
| Demon hechizo de curación (probabilidad / 1s) | 15% | 10% | Mantener curación característica sin prolongar demasiado cada pelea |
| `Demons/juggernaut.lua` HP y maxHP | 20,000 | 6,000 | Su resistencia anterior hacía la cacería individual excesivamente lenta |
| Juggernaut resistencia física (campo `percent`) | +40% | +15% | Evitar castigar desproporcionadamente a Knights |
| Juggernaut intervalo melee | 1,500 ms | 2,000 ms | Mantener peligro pero reducir saturación de curaciones |
| Juggernaut proyectil físico (probabilidad cada 2s) | 65% | 50% | Reducir picos de daño mientras conserva el estilo de combate |

Sin modificar: experiencia 3.5M Demon / 4M Juggernaut, loot, velocidad, defensa, armor, daño por golpe, campos, summons, efectos visuales, habilidades especiales, Bestiary y demás atributos.

## Proyección ofensiva reproducible (NO prueba in-game)

**Referencia:** Knight normal nivel 200, HP base 3,065, mana 1,050, Axe 51, Stonecutter Axe `3319` attack 50 (quest), Fist 10, full attack, sin augments. Se usa una autoataque cada 0.95s por la formula de `getAttackSpeed`, y Exori/Exori Gran dos veces cada uno por 12s. Se asume que autoataques y spells no se bloquean entre sí.

- Golpe basico bruto medio: (40 + round(0.085 × 50 × 51 + 40)) / 2 = ~148.5.
- Exori: (40 + (51 + 50)) × 1.1 = 155.1 de promedio bruto.
- Exori Gran: 155.1 × 1.3 = 201.6.
- Daño medio: se descuenta **aproximadamente** armor (la fórmula del C++ es aleatoria) antes de resistencia física; la defensa/mitigación y fallos adicionales no están simulados.
- Demon cura en promedio 145 HP por activación; la frecuencia matemática es 21.75 HP/s antes y 14.5 HP/s después.
- Juggernaut daño físico recibido: multiplica ×0.60 antes, ×0.85 después.

| Monstruo | Tiempo antiguo estimado | Tiempo nuevo estimado |
| --- | ---: | ---: |
| Demon | ~57.5 s | ~30.7 s |
| Juggernaut | ~165.2 s | ~35.0 s |

El combate **real será distinto**: faltan bloqueos/escudos, mitigación, desplazamiento, invocaciones, maná disponible, curación del jugador y los ataques que se pierdan al lanzar hechizos.

## Presión ofensiva del monstruo (sin mitigación del Knight)

- Demon: melee esperado 331.5/2 = ~165.8 HP/s; además fuego ~23.2 HP/s, energía ~33.2 HP/s, manadrain ~14.4 mana/s, campos e invocaciones (no modelados).
- Juggernaut **antes**: melee 544/1.5 = ~362.7, proyectil (331.5 × 0.65)/2 = ~107.7, total ~470.4 HP/s.
- Juggernaut **después**: melee 544/2 = 272, proyectil (331.5 × 0.50)/2 = ~82.9, total ~354.9 HP/s.
- Outlawed Warrior, siguiente zona: melee (318 + 474)/2 = 396 HP/s bruto, antes de defensa del Knight.

Se pretende una **escalera de supervivencia**, no solo aumentar HP: Warlock = amenaza mágica; Demon = pelea de resistencia; Juggernaut = cuerpo a cuerpo intenso; Outlawed Dwarfs = ataque físico muy rápido. Las áreas, rango y acumulación de enemigos pueden incrementar mucho el daño.

## Validación y próximo paso

1. En un servidor de **pruebas**, comprobar que cargan sin errores ambos Lua.
2. Knight 200 Axe 51 con arma de quest, equipo común de su etapa: 10 combates individuales por enemigo; medir mínimo HP, número de pociones, mana y tiempo real.
3. Repetir en Knight 230 y 250, incluyendo una comparativa sin y con augments del equipamiento anterior.
4. Comprobar que Juggernaut sigue siendo más difícil que Demon y que ninguno resulta imposible para un Knight solitario.
5. A continuación evaluar **Outlawed Warrior / Ranger / Elite Guard / Sorcerer** antes de modificar sus archivos.

**No fusionar a `pr-level-limit` hasta realizar pruebas y recibir aprobación.**
