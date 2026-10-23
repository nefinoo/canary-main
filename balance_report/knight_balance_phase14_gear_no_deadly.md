# Frozen Hell — Fase 14: progresión de equipo y retirada de Deadly Spells

**Rama:** `balance-frozen-hell-knight-100-200` · PR #2 borrador, sin merge ni prueba in-game. Modificación efectiva en `data/items/items.xml` commit `7160602c`.

## Problema corregido
El Demon Set de nivel 500 sumaba **255 armadura** en casco, armor y legs frente a solo **87 armadura** del equipo raro 850, aunque el siguiente piso está pensado para avanzar de dificultad. Se corrigió por ID exacto, conservando los nombres de cada pieza:

| Slot | Demon lvl500 | Rare lvl850 | Green Demon lvl1000 |
|---|---|---|---|
| Head | 3387 Demon Helmet Arm70 | 3408 Bonelord Helmet **Arm90** | 37609 Green Demon Helmet Arm130 |
| Body | 3388 Demon Armor Arm100 | 3399 Elven Mail **Arm135** | 37608 Green Demon Armor Arm190 |
| Legs | 3389 Demon Legs Arm85 | 8095 Ranger Legs **Arm115** | 37607 Green Demon Legs Arm150 |
| Total 3 piezas | **255** | **340** | **470** |

Green Demon Slippers ID37610 añade Arm50 (solo en el set de cuatro piezas). Los números son ARMOR nominal, no porcentajes lineales efectivos de reducción.

Bonus: Demon completo (3 piezas) +750 HP, +750 MP; raro 850 (3 piezas) +950 HP y **+800 MP**; Green Demon (4 piezas) +1450 HP y +900 MP. Las protecciones físicas 3%, 2%, 2% del raro permanecen; verificar mitigación real en el engine.

## Deadly Spells descartadas
- Quitadas **166 entradas activas de augments** con claves que empiezan por `Deadly` de **83 ítems** de todos los niveles, no solo los tres sets comparados.
- Se retiraron los contenedores de `augments` que quedaron vacíos.
- Los augments de `berserk` / `fierce berserk` permanecen en los 3 ítems raros 850, ya que corresponden a spells que **sí** usaremos (Exori, Exori Gran).
- No confundir los **nombres de armas Deadly** con las antiguas Deadly Spells. Los archivos de spells antiguos no se eliminan ni se registran/desregistran con este parche: ya no contribuyen a las bonificaciones del equipo.

## Cinco armas de quests nivel 1000 (IDs confirmados por usuario)
| ID | Nombre | Antes | Ahora |
|---|---|---|---|
| 7368 | deadly star | nivel1000 | nivel1000 |
| 3303 | deadly axe | sin requisito | **1000** |
| 895 | deadly wand | sin requisito | **1000** |
| 7415 | deadly basher | nivel60, `unproperly=true` | **1000**, `unproperly=false` |
| 7390 | deadly blade | sin requisito, `unproperly=true` | **1000**, `unproperly=false` |

**Pendiente intencional:** daños de estas armas, en particular wand 895 sin `wandtype`/`fromdamage`/`todamage` y Knight axe/club/sword de ataque 52/44/47. No se debe afirmar que son armas equilibradas o funcionales hasta inspeccionar las rutas de ataque y medir DPS. Star 7368 tiene ataque250, también requiere comprobación antes de rebajar.

## Seguridad e idempotencia
- `balance_report/apply_equipment_phase14.py`: parche preciso por ID; elimina augments inactivos de Deadly con expresiones ancladas, conserva XML Latin-1, atomic replace, idempotencia y fail-fast si cambian los nombres/estructuras.
- `balance_report/validate_phase14.py`: comprueba armaduras, nivel, mana, ausencia de Deadly augments activos, Exori augments conservados, y los 5 IDs quest.
- `apply_elven_stage5.py` adaptado a los bonus finales para prevenir fallos/reversiones al volver a ejecutar las fases.
- Workflow `apply-frozen-hell-quest-weapons.yml` ahora aplica fase14 tras fases 4/5/10 y ejecuta validaciones 14/10/5.
- Se releyó `items.xml` desde la rama después de editar y se comprobó que la progresión 500 < 850 < 1000 se cumple por casco/armor/legs, todos los IDs correctos, los cinco requisitos nivel1000 y **cero** Deadly augments activos. Esta verificación estructural NO reemplaza iniciar Canary ni confirmar que el workflow de Actions haya pasado.

## Pruebas de servidor obligatorias
1. Usar jugador Knight/Paladin/Druid/Sorcerer lvl500,850,1000; comprobar el equipo, resistencias reales, bonus HP/mana y la nueva descripción del look.
2. Confirmar que ningún item de nivel500/850/1000 mantiene Deadly Core/Caldera/Tornado/Berseker en el cliente; que `berserk` y `fierce berserk` sí funcionan.
3. Confirmar requisito de equipamiento real nivel1000 y daño de cada arma quest; el campo nivel1000 por sí solo no garantiza su uso de quest exclusivo si otro monstruo la suelta.
4. Medir daño recibido y supervivencia contra Hell Soldier, Undead Mage, Deathpincer y Undead Dragon; usar spells vanilla, potions, Super Food con exhaust compartido. Excluir Mana Rune/Knight Heal Rune.
5. Registrar EXP/hora, tiempo para matar, consumibles, maná gastado, probabilidad de muerte y comparar equipo 850 frente al de nivel1000.

No hacer merge ni deploy sin aprobación explícita.
