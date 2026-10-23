# Frozen Hell — Fase 16: Deathpincer, Salmon, Yalahari y supervivencia con dos enemigos

**Alcance:** balance de Knight; cambios en la rama `balance-frozen-hell-knight-100-200`. **No fusionado ni probado dentro de Canary**. No se tocaron quest weapons, Deathpincer HP/EXP/attacks, stages, fishing chance tables, los sets exclusivos lvl5000 ni scripts de curacion.

## 1. Sustento de Deathpincer (nivel 1000)

- Deathpincer conserva HP 135000, EXP 300M y Green Demon 10% nominal por pieza en `data-canary/monster/Custom/Insects/ancient scarab.lua`.
- Contribucion solo a Reward Chest aumenta la chance nominal por factor aprox. 1.587 (depende del score/boss bonus); no garantiza un drop.
- El Knight de referencia lvl1000, usando 3065 HP/1050 MP al lvl200, gain 15 HP/5 MP por nivel y Green Demon completo: **16515 HP y 5950 MP**.
- Extreme Health Potion (50967): 2750 HP promedio, cuesta 938 gp en Malak. Salmon (3579): **695 HP y 378 mana** cuando estan suficientemente vacios HP/MP. Comparten exhaust de consumibles 2s, NO sumar ambas a un ritmo de una cada 2s al mismo tiempo.
- Una prueba orientativa para combate de 4 min es **40–50 pociones + 25–35 Salmon**, ajustando el numero de `Exura Med Ico` y `Exori/Exori Gran` al mana; es un escenario hipotetico, no un resultado medido. Si se mata mas lento, recalcular recursos.
- Aumentamos la disponibilidad de Salmon solo en los monster drops pescados:

| Monster | Chance antes | Chance nueva | MaxCount nuevo |
| --- | ---: | ---: | ---: |
| Crab | 35.43% | 55% | 16 |
| Water Elemental | 39.43% | 60% | 16 |
| Blood Crab | 42.43% | 60% | 16 |
| Massive Water Elemental | 42.43% | 65% | 16 |
| Quara Constrictor | 2% | 20% | 4 |

En pesca **lvl1000, Fishing45, caña3483**, el roll de tabla usa `floor(100000 * max(0.5,2.1-0.45)) = 165000`. Umbrales sucesivos de agua: Quara Constrictor 11000, Massive Water Elemental 22500, Blood Crab 24000, Water Elemental 24500, Crab 25000. Con los monstruos registrados, spawn logrado y `maxCount` promedio uniforme, Salmon esperado de esos cinco monstruos ~**0.494 por intento** (aprox. 61 lances para 30 Salmon), **SIN incluir tiempo de matar las capturas, fallo de spawn, pesca de otras especies ni tiempo de desplazamiento**. Verificar dentro del juego.

Nephy antes compraba cada Green Demon y Nightmare Shield por 300k gp; ahora los compra por **150k gp**, manteniendo el drop y ayudando a controlar la creacion de dinero cuando aparecen duplicados. Suponiendo una chance efectiva aproximada 15.9% por cada una de las 5 piezas, la reduccion esperada de oro generado por el buyback es **~119k gp por victoria**. La rentabilidad real depende del reward score, scrolls, plata, otros drops, alimentos y tiempos.

## 2. Yalahari lvl2500

- Yalahari Boots id23477 mantiene Armor200 y Speed30, pero regen pasa de 500 HP + 500 mana / 4s a **180 HP + 160 mana / 4s** = 45 HP/s, 40 mana/s.
- Mantener food importante: Knight necesita mana para `Exura Med Ico` (90 mana/segundo al ritmo maximo), `Exori` (80 mana/4s) y `Exori Gran` (170 mana/6s).
- La descripcion XML de las botas se actualizo junto a los atributos. Otros componentes Yalahari y shield lvl2500 (id3423) no se modificaron.
- Doble fuente de loot corregida: eliminado el roll aleatorio `yalahariChance` del callback `data/scripts/eventcallbacks/monster/postdroploot_frozen_hell.lua`. Las tasas se controlan solo desde los monster Lua, p.ej. `hellspawn.lua`, `hero.lua`, `massive earth elemental.lua`. Los otros bonus de loot del callback permanecen.
- La tienda de eventos `Eventshop.lua` conserva costo 550 tokens por cada pieza Yalahari.

## 3. Frozenhell Guard y Venom con dos enemigos

**DPS nominal directo** calculado como suma `(min + max)/2 * chance/100 * 1000/intervalMs`; NO representa dano recibido. No incluye factores de rango, armor, mitigation, resistencias, condiciones ni cooldowns internos del engine.

| Enemigo | DPS bruto anterior | DPS bruto nuevo | 2 enemigos, bruto |
| --- | ---: | ---: | ---: |
| Frozenhell Guard (`Outlaws/hero.lua`) | 3520 | 3520 | 7040 |
| Venom (`Geo-Elementals/massive earth elemental.lua`) | 3995 | **3582** | **7163** |

- Frozenhell Guard: HP245000, EXP687M; **sin cambios** de ataques: ya es peligroso para pulls multiples.
- Venom: HP330000, EXP902M conservados. Life Drain se ajusto de intervalo2500/chance95%/3300–4850 a **intervalo2800/chance80%/3300–4650**. Resto ataques intactos. De este modo Venom sigue siendo la criatura superior, pero el salto frente a Guard es controlable.
- Para el Knight lvl4000 con Yalahari Shield: HP base estimado + shield = 65065; ML hipotetico10; `Exura Med Ico` ~1796 HP/uso, pocion Obscure5000 promedio cada2s y regen Yalahari45HP/s. El techo de curacion es ~4341 HP/s. Dos Guard nominales ~7040 DPS antes de reducir armor => **unos 24 s de margen bruto** al partir de HP maximo si ambos impactaran continuamente, ignorando mana.
- Para el Knight lvl4800 con mismo equipamiento: HP77065 y techo ~4661 HP/s; dos Venom nominales ~7163 DPS => **unos 31 s de margen bruto**, en las mismas suposiciones. Mitigacion fisica aumentara ese tiempo si aplica; picos y agotamiento de mana podrian reducirlo. **Esto NO prueba que pueda derrotar dos enemigos simultaneamente**. Meta: poder separarlos/escapar, no tanquear dos hasta matarlos.
- Al nivel5000, Eternal Health Potion promedio7000/2s cambia la capacidad de curacion; el acceso de Malak depende ahora del nivel, sin desbloquear custom runes.

## Pruebas presenciales pendientes (obligatorias)

1. Verificar que el servidor en ejecución realmente usa la rama actual, que el XML se importa y que los cambios en Nephy/Malak aplican despues de reinicio.
2. 10–20 peleas solo de Deathpincer con Knight lvl1000: cronometro, DPS realizado y recibido, potions, Salmon, mana y reward chest (loot/no-drop). Repetir con set850 vs Green Demon.
3. Pescar 200 lances (lvl1000 Fishing45 cana3483) y registrar monstruos capturados, kills, Salmon total, worms, tiempo real y EXP/h.
4. Verificar equipar Yalahari Boots, regeneracion 180 HP/160 MP tras cuatro segundos y funcionamiento fuera de combate; comprobar el impacto del shield +5000 HP/MP.
5. Ejecutar combate 1vs1 con Guard lvl4000 y Venom lvl4800; despues probar pull de 2 en zona segura con personal de pruebas y registrar 10s/20s de HP, mana y curaciones. **No usar el valor bruto como promesa de supervivencia**.
6. Confirmar que los drops Yalahari raros salen una sola vez y que no queda callback adicional haciendo un segundo sorteo.

Los resultados numericos son **modelos para guiar el test**, no mediciones de juego. Ninguna quest o boss lvl5000 fue alterado.
