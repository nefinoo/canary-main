# Frozen Hell - Balance fase 1 (Knight normal, nivel 100-200)

**Base:** rama pr-level-limit de nefinoo/canary-main. Modificar solo esta rama de pruebas antes de fusionar. Se requiere validar jugando o con simulador; los valores no son una medicion in-game.

## Reglas acordadas
- Solo vocaciones normales (Knight id 4, sin Elite Knight). Ganancia por nivel: +15 HP, +5 mana.
- Fist Fighting NO progresa libremente: item temporal habilita subir Fist y con ello mejora temporalmente la velocidad de ataque. No tocar esa mecanica.
- Rat, Cave Rat, Slime, Orc, demas criaturas iniciales y Hydra: conservar datos vanilla/configurados.
- La experiencia mid-high, stages, loot y poison field del Slime no se modifican.
- Primera dificultad custom posterior a Hydra: Giant Spider, Dragon, Dragon Lord y Warlock. Dragon y Dragon Lord se ajustaron tras los modelos ofensivos.
- Combatir principalmente en solitario. Equipo normal debe funcionar; equipo mejorado otorga margen de seguridad y eficiencia.
- No usar Exori Min en la rotacion inicial. Solo Exori y Exori Gran; Exori Gran mantiene 30% mas dano bruto por objetivo antes de augments y mitigacion.

## Primeros cambios realizados
| Recurso | Antes | Fase 1 | Motivo |
| --- | --- | --- | --- |
| Exori | mana 115 | mana 80 | Util a nivel 35 con reserva base limitada |
| Exori Gran | mana 340 | mana 170 | 30% mas dano que Exori no justificaba casi 3 veces mas mana |
| Giant Spider melee | 1000 ms | 1500 ms | Reducir DPS sostenido, mantener veneno e invocaciones |
| Warlock ataque fisico a distancia | 35% cada 1000 ms | 20% | Menos rafagas combinadas |
| Warlock mana drain | 17% cada 1000 ms | 10% | Controlar agotamiento de mana |
| Warlock fuego | 45% cada 2000 ms | 30% | Peligroso pero menos simultaneidad |
| Warlock energia | 25% cada 2000 ms | 17% | Peligroso pero menos simultaneidad |
| Warlock ralentizacion 1 | 40000 ms | 12000 ms | Menos castigo prolongado |
| Warlock ralentizacion 2 | 20000 ms | 10000 ms | Menos castigo prolongado |

Sin cambio: experiencia y armor de los monstruos; valores de dano por impacto de cada ataque; cooldowns y formulas de spells. En la segunda iteracion SI se cambiaron HP, resistencias fisicas y dos probabilidades de loot.

## Equipos: augments nativos, SIN introducir armor nuevo

Los seis augments YA ESTAN APLICADOS en data/items/items.xml en la rama de balance. Se incorporaron automaticamente mediante el script seguro balance_report/apply_knight_augments.py y el workflow .github/workflows/apply-frozen-hell-quest-weapons.yml. El script local PowerShell balance_report/apply_knight_augments.ps1 queda disponible solo como alternativa: NO hace falta ejecutarlo ni hacer otro commit del XML.

| ID | Item | Augment(s) propuestos |
| --- | --- | --- |
| 3370 | Knight Armor | Berserk: increased damage +5% |
| 3371 | Knight Legs | Fierce Berserk: increased damage +4% |
| 3392 | Royal Helmet | Berserk: cooldown -500 ms |
| 3416 | Dragon Shield | Fierce Berserk: increased damage +5% |
| 3386 | Dragon Scale Mail | Berserk +5%, Fierce Berserk +5% |
| 3360 | Golden Armor | Fierce Berserk +8%, critical extra damage +5%, mana leech amount +3% |

Nota: hechizos en items.xml se identifican por su **nombre** ("berserk" y "fierce berserk"), no por las palabras ("exori"). El objeto de drop puede ser usado por varias vocaciones, pero estas mejoras especificas afectan las spells del Knight.

Los augments no son equivalentes a imbuements. En este C++:
- increased damage cambia la magnitud del dano de la spell; cambios de equipo pueden modificar la relacion efectiva de 30% entre Gran/Exori.
- cooldown resta milisegundos del cooldown **individual**, limitado a la mitad del tiempo original; no modifica el cooldown del grupo.
- critical extra damage modifica el extra del critico, pero sin probabilidad de critico no activa nada.
- mana leech y life leech de augment elevan su **cantidad**, pero NO la probabilidad. Necesitan chances conseguidas por otros mecanismos (ej. imbuement o stats). No prometer mana gratis con el augment solo.
- Para el personaje inicial sin equipo avanzado, no suponer bonus de leech ni augment.

## Correccion de estadisticas de los objetos raros (items.xml de esta rama)
- Elven Mail ID 3399: armor **35**, no 67; maxhitpoints +100; augments existentes +30% Berserk y +30% Fierce Berserk.
- Ranger Legs ID 8095: armor **27**, no 50; +50 HP, +50 mana.
- Bonelord Helmet ID 3408: armor **25**, no 40; +100 mana y augments existentes de otras spells.
- Estos tres objetos siguen disponibles como drops raros en varios monstruos, incluso antes de Hydra. NO se modifican ni se incluyen como equipo comun de referencia en esta iteracion.

## Referencia matematica Knight lvl 200 (ejemplo, no resultado in-game)
- HP base 3065, mana base 1050, Axe Skill 51, Fist bloqueado en skill 10.
- Stonecutter Axe attack 50, modo full attack, meleeDamage=1.0, sin bonos.
- Golpe basico nativo: minimo 40, maximo 257, promedio bruto aproximado 148.5, ANTES del bloqueo de escudo/armor.
- Exori promedio bruto aprox. 155; Exori Gran promedio bruto aprox. 202, ANTES de augments/mitigacion.
- Intervalo teorico de autoataque con fist 10: 950 ms. Puede cambiar por interrupciones, condiciones y accion de jugador.
- Mana por 2 Exori y 2 Gran en 12 segundos: de 910 a 500 tras ajuste. No se cuenta curacion ni potions.
- Giant Spider HP1720: dano melee bruto esperado **si cada golpe alcanza** aprox. 231 por 1s antes, 154 por 1.5s despues; veneno e invocaciones adicionales.
- Warlock HP1935: conserva ataque fuerte, mana drain, fuego, energia, paralyze, invisibilidad y summons. Sigue siendo una pelea exigente.

## XML en GitHub
- Los cambios de armas de quest nivel 100 y los seis augments estan incluidos en la rama. Solo hay que hacer fetch/checkout de la rama en GitHub Desktop para recibirlos.
- Las modificaciones son por ID y usan la codificacion ISO-8859-1. El workflow automatizado ya dejo el XML actualizado; nunca ejecutarlo por duplicado manualmente.
- El usuario no ha autorizado fusionar el PR a pr-level-limit. El PR #2 sigue en borrador.


## Iteracion 2: orden de los teleports y diferencias aprobadas
El orden confirmado para estas etapas es Giant Spider (quest armas Knight 100), Dragon/Dragon Lord (quest arma magos 100), Warlock (quest arma Paladin 100), Demon/Juggernaut, Outlawed Dwarfs, Salazaari Elfs y posteriores.

| Monstruo | Antes | Ahora | Resist. fisica antes / ahora | Loot | 
| --- | --- | --- | --- | --- |
| Giant Spider | HP 1720 | HP 1720 | -30% / -30% | Sin cambios: Knight Armor, Knight Legs, rarezas |
| Dragon | HP 1720 | HP 1950 | 50% / 20% | Dragon Shield 600/100000 => 1500/100000 |
| Dragon Lord | HP 2150 | HP 2450 | 50% / 25% | Dragon Scale Mail 100/100000 => 900/100000 |
| Warlock | HP 1935 | HP 3000 | -20% / 15% | Sin cambios; Golden Armor existente |

- Se preservan las probabilidades y configuracion de las armas de quest: NINGUNA arma nivel 100 fue agregada al loot regular.
- Demon, Juggernaut, Dwarfs, Elfs, Slime, Rat, Orc, Hydra, exp, stages y la quest de The Deathwalker NO cambiaron.
- Los tiempos matematicos calculados son orientativos antes de tener la simulacion real de ataque/defensa/healing/invisibilidad.

## Armas de quest nivel 100: cinco IDs revisados en items.xml
| ID | Arma | Vocacion normal | Atk / dano | Cambio |
| --- | --- | --- | --- | --- |
| 3341 | Arcane Staff | Sorcerer y Druid | wand, energy 40-60 | Registrada como weapon, nivel 100, sin ataque melee erroneo |
| 3287 | Throwing Star | Paladin | ataque 30, distancia 5 | Registrada como weapon, nivel 100 |
| 3288 | Magic Sword | Knight (sword) | ataque 48 | Registro weaponType, nivel 100, no uso con penalizacion bajo nivel |
| 3319 | Stonecutter Axe | Knight (axe) | ataque 50 | Slot hand, nivel 100, no uso con penalizacion bajo nivel |
| 3309 | Thunder Hammer | Knight (club) | ataque 52 | Registro weaponType, nivel 100, no uso con penalizacion bajo nivel |

Los cinco IDs fueron actualizados previamente por el workflow y se confirmaron en el XML real de la rama de balance.

## Validacion requerida antes del merge
- Ejecutar en entorno de pruebas, no en el servidor en produccion.
- Comprobar que la spells Exori y Exori Gran funcionan contra 1 y 3 objetivos y su cooldown de grupo se respeta.
- Confirmar damage y mana de la rotacion durante 30-60 segundos; validar curacion Exura Ico y gasto en potions.
- Verificar Knight comun vs Dragon, GS, Dragon Lord, Warlock: tiempo para matar, HP minimo, consumibles gastados, mana restante y death risk.
- Comparar equipo sin augments y con augments, y comprobar condiciones de proc (critico/leech) antes de usarlas como palancas de balance.
- NO modificar Hydra ni monstruos de las primeras zonas en esta fase.
