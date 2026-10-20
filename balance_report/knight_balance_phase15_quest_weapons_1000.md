# Frozen Hell — Fase 15: cinco armas de quest de nivel 1000

**Rama de pruebas:** `balance-frozen-hell-knight-100-200` (PR #2 en borrador). **Sin merge ni prueba ingame.** Los cambios finales están aplicados a `data/items/items.xml`, mediante script idempotente en GitHub Actions.

## Diagnóstico de Canary

Archivos consultados:
- `src/items/weapons/weapons.cpp` — `Weapons::getMaxWeaponDamage`, `WeaponMelee::getWeaponDamage`, `WeaponDistance::getWeaponDamage`, `WeaponWand::getWeaponDamage`.
- `src/items/functions/item/item_parse.cpp` — el campo `script="moveevent;weapon"` registra el ataque y `wandtype` + `fromdamage` / `todamage` define una wand funcional.
- `data/XML/vocations.xml` — las cuatro vocaciones normales tienen multiplicadores de melee/distDamage=1.0 y `attackspeed=1000`.
- `data/scripts/spells/attack/berserk.lua` y `fierce_berserk.lua` — el damage base de Exori/Exori Gran toma skill + attack; se conservan.

La Deadly Star tenía `attack=250`, `hitchance=100`, pero solo `script=moveevent`, que no registra un `WeaponDistance` propio. La Deadly Wand tenía `moveevent;weapon` pero carecía de `wandtype`, `fromdamage`, `todamage`, que quedaban en 0; los golpes base podían no funcionar.

## Modificaciones exactas (solo 5 IDs)

| ID | Arma | Anterior | Después | Vocación |
|---:|---|---|---|---|
| 3303 | Deadly Axe | attack52 | **attack110** | Knight |
| 7415 | Deadly Basher | attack44 | **attack110** | Knight |
| 7390 | Deadly Blade | attack47 | **attack110** | Knight |
| 7368 | Deadly Star | attack250, script moveevent | **attack100, script moveevent;weapon** | Paladin |
| 895 | Deadly Wand | sin daño fijo definido | **energy 250–350**, script moveevent;weapon | Sorcerer / Druid |

Las cinco siguen requiriendo nivel1000; no se cambiaron valores de defensa, vocación, slot, rango, objetos de quest lvl100 o sus métodos de adquisición. No añadimos spells Deadly ni runas de curación.

## Referencia teórica de daño

Para nivel1000, skill95, ataque ofensivo `factor=1.0`, multiplicador de vocación 1.0, enemigo sin defensa/mitigación y un swing cada segundo:
- Knight (Ataque110): `max = round(0.085 * 110 * 95 + 1000/5) = 1088`; min = 200; media ≈ **644 daño/hit**.
- Paladin (Ataque100): `max = round(0.09 * 100 * 95 + 200) = 1055`; min=200; media ≈ **627.5 daño/hit**. HitChance100 configurada (verificar in-game).
- Sorcerer/Druid wand: `normal_random(250,350)`; media ≈ **300 daño/hit** de energía, antes de defensas/resistencias (sin escala skill).
- La Star anterior, si se registrara como arma distancia, tendría máximo ≈ 2338 y media ≈ 1269 por golpe; se evitan esos valores excesivos.
- Los resultados no representan daño real medido ni igualan DPS global: spells, protecciones, posicionamiento, ataques en área y mana varían por vocación.
- El arma Knight afecta Exori y Exori Gran indirectamente al aumentar `attack`. No se tocan sus fórmulas/cooldowns.

## Pruebas pendientes

1. Equipo y autoattack: lvl999 no logra ejecutar ataque completo; lvl1000 sí. Comparar 7368/3303/895/7415/7390 vs arma lvl100.
2. Test de 10+ golpes contra muñeco/monstruo sin resistencia; medir intervalos, fallos, efectos wand, ammo, skill gains; repetir con criaturas reales.
3. Medir 10 combates en solitario por vocación contra Hell Soldier / Undead Mage / Deathpincer / Undead Dragon. Comparar DPS total (autoattack + spells), daño recibido, mana neta y curación con spells vanilla, pociones y Super Food; Mana Runes y Knight Heal Runes quedan fuera.
4. Comparar EXP/h, duración de kill, consumo, gasto neto y tasa de muerte para equipo lvl850 y Green Demon lvl1000.
5. El siguiente trabajo después de la Fase15 será identificar Frozenhell Guard, Dementor, Arch Angel, Hellraiser, Venom y Little Puppy; sus archivos Lua no están presentes con esos nombres en la rama inspeccionada.
6. Con el boss lvl2000, usar cuatro equipos exclusivos por vocación; no exigirlos para acceder al primer respawn posterior.

## Scripts y validación

- `balance_report/apply_quest_weapons_stage15.py`: ID estricto, preservación Latin-1, atomic write e idempotencia, aplicado **después** de fases4/5/10/14.
- `balance_report/validate_phase15.py`: los cinco IDs y requisitos, arma distancia registrada, wand con daño configurado, quest lvl100 intactas, sin augments Deadly activos, armor raro/Green intacta.
- Workflow `.github/workflows/apply-frozen-hell-quest-weapons.yml` completado **success**, incluidos pasos de aplicación y validación.
- Relectura GitHub del XML actualizado corroboró los cinco valores. El cambio de código está implementado; su impacto en gameplay sigue pendiente de comprobación en el servidor local.

**No hacer merge ni desplegar sin autorización explícita del usuario.**
