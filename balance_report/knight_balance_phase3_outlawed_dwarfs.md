# Frozen Hell — Fase 3: Outlawed Dwarfs y equipo hacia los Salazaari Elfs

Rama: `balance-frozen-hell-knight-100-200`. Objetivo: Knight normal nivel 300, 4,565 HP base, ~1,550 mana, Axe 60, ML 8, Stonecutter Axe ID 3319 obtenido por quest. Los resultados requieren pruebas en Canary antes de fusionar.

## Alcance

- Solo Outlawed Warrior, Outlawed Ranger, Outlawed Elite Guard y Outlawed Sorcerer.
- **Excluir** Outlawed Assassin (`dwarf assassin.lua`, 5,000,000 HP): objetivo especial, sin cambios.
- Mantener todas las EXP = 7,500,000 y los HP existentes: Warrior 4,200; Ranger 4,700; Elite Guard 5,300; Sorcerer 4,500.
- No modificar stages, Fist (su subida normal está bloqueada), golpes básicos del Knight, quests, spells ni pociones.
- No modificar las piezas raras 3399 / 8095 / 3408, ni The Deathwalker.

## Modificaciones de ataques

| Monster | Antes | Después | Objetivo |
| --- | --- | --- | --- |
| Warrior | melee 318–474 cada 1 s | Sin cambios | Referencia de daño melee rápido; exige curación |
| Ranger | Bolt 100% cada 4s; Spear 100% cada 6s | 85% / 75% | Menos ráfagas dobles; daño intacto |
| Elite Guard | Energía 100% cada 4s, sin range/target especificados | 65% cada 4s, range=7 radius=1 target=true | Proyectil definido y controlado; daño intacto |
| Sorcerer | Manadrain 50% cada 4s | 30% cada 4s | Menos agotamiento de mana |
| Sorcerer | Cura 200–300, 25% cada 1s | 15% cada 1s | Reduce estancamiento sin eliminar curación |

DPS bruto esperado (NO equivale a daño final): Warrior ~396 HP/s; Ranger ~363 -> ~332 HP/s contando melee+rango; Guard ~297 -> ~262 HP/s si ambos ataques conectan; Sorcerer vida ~308 HP/s sin cambiar, mana drain medio ~52.4 -> ~31.4 mana/s y curación esperada ~62.5 -> ~37.5 HP/s. La modificación de range de Guard afecta a qué distancia puede impactar, por lo que su presión real puede cambiar según la posición.

## Loot (chance / 100,000)

- Warrior: Magic Plate Armor 250 -> 500; Mastermind Shield 250 -> 400.
- Ranger: Golden Armor 250 -> 450; Magic Plate Armor 250 -> 400; **eliminar Throwing Star 3287** del loot normal, ya que se obtiene por quest de Paladin nivel 100.
- Elite Guard: Golden Legs 250 -> 500; Magic Plate Armor 250 -> 450.
- Sorcerer: Royal Helmet 250 -> 500; Steel Boots 250 -> 500.

Los demás objetos y rarezas quedan intactos. Se conserva el loot especial de Outlawed Assassin (quest/boss).

## Nuevos augments de equipo (ID en items.xml)

La automatización `balance_report/apply_outlawed_dwarf_augments.py` edita ISO-8859-1 conservando line endings y es idempotente. Estos son los valores finales que debe contener el XML cuando termine GitHub Actions:

| ID | Equipo | Augment de spell |
| --- | --- | --- |
| 3366 | Magic Plate Armor | Exori +7% y Exori Gran +7% increased damage |
| 3420 | Demon Shield | Exori Gran +6% increased damage |
| 3414 | Mastermind Shield | Exori +6% increased damage |
| 3364 | Golden Legs | Exori Gran +5% increased damage |

Son augments exclusivos para el nombre interno del spell: `berserk` o `fierce berserk`. No elevan daño de hacha básico, no alteran armor/defense ni generan probabilidad de life/mana leech.

Los augments anteriores de Knight Armor, Knight Legs, Royal Helmet, Dragon Shield, Dragon Scale Mail y Golden Armor permanecen sin cambios.

## Advertencia: curación de Knight real

En `data-canary/scripts/Customs/KnightManarune2.0.lua`, la runa de **vida** ID 3170 tiene actualmente `reqlvl = 10000` y `reqml = 10`. **NO** está disponible a nivel 250/300 en esta rama. Esta fase NO cambia ese requisito para no desbalancear cacerías con curaciones de ~1,700 HP sin analizar exhaustiones, costos y economía. Las pruebas de lvl 300 deben utilizar Exura Med Ico y Supreme Health Potions.

## Pruebas requeridas antes de merge

1. Verificar carga Lua y XML; cero errores de esquema/augments.
2. Knight normal nivel 300, HP 4565, mana 1550, ML8, Axe60, Fist10, arma 3319; matar cada monstruo por separado al menos 10 veces.
3. Comparar equipo común (sin augments) y el nuevo equipo de Dwarf con augments, registrando tiempo, HP mínimo, mana y pociones.
4. Verificar si el proyectil de Elite Guard funciona a rango 7 pero respeta paredes, y el Ranger no genera ráfagas excesivas.
5. Comprobar que ningún Outlawed Ranger suelta Throwing Star y que la quest nivel 100 permanece funcional.
6. Confirmar que `dwarf assassin.lua` y las quests no están tocadas.
7. Mantener el PR en borrador; no fusionar a `pr-level-limit` sin aprobación explícita.

Próximo bloque: Salazaari Elfs.
