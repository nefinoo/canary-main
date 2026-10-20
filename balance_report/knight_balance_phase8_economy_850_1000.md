# Frozen Hell — Fase 8: sostenibilidad de cacerías 850–1000
Fecha de preparación: 2026-10-19.
Rama `balance-frozen-hell-knight-100-200` · PR #2 en borrador · sin merge ni despliegue.

## Comparación revisada en la rama de balanceo (no en main)

Una versión anterior de main contenía crystal coins en Elves/Valick; **la rama actual usa platinum coins**. Es incorrecto afirmar que los monstruos 850 monetizan menos que los del 450–650 solo por moneda. Sin embargo, el monto en monedas de 850 sigue siendo pequeño ante las pociones de lvl 500.

Previsión monetaria antes de otros drops, assuming chance/100000 y conteo uniforme 1..maxCount; este último supuesto debe verificarse con el generador real de loot (y loot rates/config); estimación, no estadísticas observadas:

| Monster | XP Lua | HP | Monedas previstas antes | Crystal Coin nueva | Monedas previstas después |
|---|---:|---:|---:|---|---:|
| Hell Soldier | 26,000,000 | 18,500 | 890 gp | 30%, 1 unidad | 3,890 gp |
| Undead Mage | 28,000,000 | 17,000 | 905 gp | 35%, 1 unidad | 4,405 gp |

- Crystal Coin = 10,000 gp; Platinum Coin = 100 gp (economía nominal Tibia). 
- Mantener los ítems `3399/8095/3408`, scrolls, gemas, demás loot, EXP/HP, ataque/defensa y rarezas exactamente iguales.
- Es un refuerzo **probabilístico**: 70% de Hell Soldier y 65% de Undead Mage siguen sin soltar Crystal Coin; no garantiza ganancias netas.
- No añadir Super Food como drop de cacerías normales: continúa vinculado a Fishing.
- No alterar precios ni fórmulas de pociones. Para break-even real: registrar número promedio de potions por kill, su precio de compra efectivo y el valor NPC del loot; ignorar market prices especulativos.

## Riesgo y progresión entre vocaciones

A lvl 850, según `data/XML/vocations.xml` (ganancias no promocionadas; asumida vida base lvl8=185):
- Knight ~12,815 HP; Paladin ~8,605; Sorcerer/Druid ~4,395. Estas cifras no incluyen equipos.
- Elven Set raro lvl850 aporta +950 HP y +600 mana **si las tres piezas pueden equiparse**.
- Comparación de daño bruto teórico de Hell Soldier: melee ~663 HP/s + fire ~150 + area ~39 = ~851 HP/s si todos los ataques conectan. Undead Mage: melee ~375 + death ~225 + energy ~112 = ~712 HP/s, además de manadrain teórico ~23 mana/s.
- Esos cálculos NO son daño real: no contemplan armor, mitigación, resistencias, posiciones, stun, esquiva, curación ni que golpes a distancia/melee no siempre alcanzan.
- Debe validarse solitario en Knight, Paladin, Sorcerer y Druid con sets disponibles, mana y consumibles.

## Boss Deathpincer y siguiente equipo

En esta rama está `data-canary/scripts/Customs/BossesLevers/Deathpincer/Movemente Deathpincer.lua` con storage 46001 y AIDs 9001/9002, pero no se detectó una definición de monstruo *deathpincer* bajo ese nombre en la ruta de monsters del árbol del repositorio. **No se inventaron HP, ataques ni loot de ese boss.** Su identidad podría diferir en el mapa y hay que cotejar el nombre de spawn antes de modificarlo.

## Pruebas requeridas

1. Ejecutar `python3 balance_report/validate_phase8.py` (verificación estática).
2. Arrancar Canary, confirmar carga de los dos Lua y que `crystal coin` se resuelve.
3. Simular o matar >=200 de cada criatura: frecuencia de Crystal Coin, monedas efectivas por muerte y potencia de los loot bonuses.
4. Medir 10 peleas en solitario por vocación (nivel 850, 925 y 1000) con equipo normal y raro; registrar DPS, tiempo, HP mínimo, costo en consumibles y gp/kill.
5. Confirmar los NPC de venta y el precio de las pociones 51247, 51138, 51246; estimar ganancia neta por kill/hora sin inventar precios.
6. Cuando se identifique el boss de lvl1000, balancear su combate y los cuatro sets exclusivos pos-1000 en archivos separados.
