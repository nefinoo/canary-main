# Frozen Hell — Fase 10: Deathpincer, primer boss y set universal nivel 1000

Rama: `balance-frozen-hell-knight-100-200`, PR#2 en borrador. **No fusionado ni probado en Canary.**

## Identidad real verificada
- El boss de transición **Deathpincer** está definido en `data-canary/monster/Custom/Insects/ancient scarab.lua`, con `Game.createMonsterType("deathpincer")`, a pesar del nombre de archivo.
- Su acceso se configura en `data-canary/scripts/Customs/BossesLevers/Deathpincer/Movemente Deathpincer.lua` con storage46001 y action IDs 9001/9002.
- Tiene `rewardBoss=true`. Se recompensa mediante `data/scripts/systems/reward_chest.lua`; el loot normal de cadáver se omite en la ruta C++ de reward boss. La chance final puede variar según puntuación, participantes y bonus; los valores Lua son chances base, no probabilidades garantizadas.
- El set universal de transición es **Green Demon** (helm 37609, armor 37608, legs 37607, slippers 37610) y escudo **Nightmare Shield** 6390, todos con requisito lvl1000. Las cuatro piezas de ropa no tenían bonus de HP/mana, por lo que sustituir el Elven Set lvl850 podía disminuir vida y mana. El shield se mantiene intacto.

## Combate: más viable en solo y difícil

| Factor | Antes | Fase 10 |
|---|---|---|
| HP | 215,000 | **135,000** |
| EXP | 300,000,000 | **sin cambios** |
| Melee cada 2s | 1153–1500 | **1100–1450**, veneno con daño mínimo/máximo configurados |
| Rango físico | 100%, cada 1s, 1153–1500 | **70%, cada 2s, 950–1300** |
| Ralentización | −700, 25s, 13%/1s | **−450, 6s, 20%/4s** |
| Sangrado área | radius5, 50%/3s, 1153–1500 | **radius3, 35%/4.5s, 400–650** |
| Buff velocidad propio | +350, 9s, 8%/1s | **+350, 5s, 20%/3s** |

El DPS bruto directo aritmético melee+rango pasa de `(1153+1500)/2×(1/2+1/1)≈1989.8` a `(1100+1450)/2×(1/2)+(950+1300)/2×(0.70/2)≈1031.3`. Esto **no** incluye veneno, sangrado, defensa, mitigación, tipo de ataque, distancia o simultaneidad; el DPS real se debe medir. En rango, solo el proyectil principal aporta ≈394 bruto DPS calculado. Con 135k HP, y DPS del jugador **hipotéticos** de 400/600/900, el combate duraría 338/225/150 segundos antes de curaciones del boss (no tiene curas). No son tiempos probados.

## Equipo de transición (cuatro piezas)

Los cuatro elementos ya tienen grandes valores de armadura; **no cambiarlos**. Se añaden mejoras moderadas de máximos, validadas por ID exacto y nivel1000.

| ID | Slot | HP nuevo | Mana nuevo | Armor original |
|---|---|---:|---:|---:|
| 37609 Green Demon Helmet | Head | +250 | +250 | 130 |
| 37608 Green Demon Armor | Body | +650 | +100 | 190 |
| 37607 Green Demon Legs | Legs | +400 | +350 | 150 |
| 37610 Green Demon Slippers | Feet | +150 | +200 | 50 |
| **Total** | 4 slots | **+1450** | **+900** | **520** |

El Elven Set lvl850 otorga +950 HP/+600 mana entre tres piezas (87 armor y absorb parcial física); Green Demon queda como upgrade en armor y máximos para las cuatro vocaciones. La comparación de armadura es por suma nominal, NO daño reducido, que depende del engine. El usuario puede necesitar otro escudo o sostener wand/rod de dos manos; no imponer Nightmare Shield a todas las vocaciones.

## Recompensas

- Los cinco drops de lvl1000 (IDs 37609,37608,37607,37610,6390) pasan de **5000/100000** a **10000/100000** cada uno: 10% *base*, con `unique=true` conservado.
- Se eliminan entradas inválidas `51671, 51672, 51673` que no existen en `items.xml`. Permanece el Experience Scroll válido `51670` con chance25000 y maxCount5.
- Las recompensas monetarias, materiales, montura y tokens quedan intactas. Nephy compra cada Green Demon y Nightmare Shield actualmente por 300k gp; considerar el costo económico real del farming y la distribución individual del reward chest antes de mayores aumentos de rareza.
- Los sets separados por vocación comentados en Deathpincer **permanecen desactivados** y tienen en `items.xml` requisitos de nivel5000 en varios casos; pertenecen a un jefe **posterior**, no a éste.

## Validación y despliegue

`balance_report/apply_green_demon_stage10.py` modifica **solo** las 4 entradas de lvl1000 de `items.xml`, preservando Latin1 y saltos de línea, y es idempotente. El workflow ya existente en la rama ejecutará el parche y luego `balance_report/validate_phase10.py` cuando termine la tarea. El runner de GitHub Actions puede tardar o requerir autorización: confirmar commit de aplicación, no asumir que `items.xml` se actualizó solo porque está el script en GitHub.

Validar con un servidor local de prueba:
1. Cargar el archivo de monstruo `ancient scarab.lua` y que `deathpincer` se registre sin errores y lo invoque el mapa.
2. Probar el Reward Chest en solo y en party; chance real/100k, `unique=true`, fallback/cadáver y montura, 20+ kills.
3. Usar Knight, Paladin, Druid y Sorcerer lvl1000 con equipo pre-boss, curaciones vanilla, pociones Malak (si el storage60000 las desbloquea) y Super Food; registrar tiempo, DPS recibido, coste por combate y tasa de muerte.
4. Equipar cuatro piezas Green Demon y verificar +1450 HP/+900 mana; comprobar que el Nightmare Shield es 6390 y tiene +5 shielding y defense50.
5. Medir GP bruto y neto de venta a Nephy para evitar inflación por duplicados; no dar por supuesta la chance real del reward boss.

**Orden de contenido:** Deathpincer lvl1000 → equipo universal Green Demon → monstruos 1000+ → siguiente boss (solo allí sets vocacionales).
