# Frozen Hell - Balance fase 1 (Knight normal, nivel 100-200)

**Base:** rama pr-level-limit de nefinoo/canary-main. Modificar solo esta rama de pruebas antes de fusionar. Se requiere validar jugando o con simulador; los valores no son una medicion in-game.

## Reglas acordadas
- Solo vocaciones normales (Knight id 4, sin Elite Knight). Ganancia por nivel: +15 HP, +5 mana.
- Fist Fighting NO progresa libremente: item temporal habilita subir Fist y con ello mejora temporalmente la velocidad de ataque. No tocar esa mecanica.
- Rat, Cave Rat, Slime, Orc, demas criaturas iniciales y Hydra: conservar datos vanilla/configurados.
- La experiencia mid-high, stages, loot y poison field del Slime no se modifican.
- Primera dificultad custom posterior a Hydra: Dragon, Dragon Lord, Giant Spider y Warlock. Dragon y Dragon Lord se mantienen en esta primera iteracion para tener referencias comparables.
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

Sin cambio: HP, experiencia, loot, resistencias y armor de los monstruos; valores de dano por impacto de cada ataque; cooldowns y formulas de spells.

## Equipos: augments nativos, SIN introducir armor nuevo

El archivo data/items/items.xml es voluminoso; el cambio se entrega mediante el script idempotente balance_report/apply_knight_augments.ps1 que modifica los seis items **localmente** tras checkout de esta rama, valida IDs/nombres, respalda el XML y no altera otras propiedades. El XML aun no esta modificado en la rama GitHub hasta que se aplique el script y se haga commit.

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

## Aplicar XML localmente (Windows, PowerShell 5.1)
1. Cambiar a rama balance-frozen-hell-knight-100-200 en GitHub Desktop.
2. Desde la raiz del repositorio, ejecutar previsualizacion:
   powershell -ExecutionPolicy Bypass -File .\balance_report\apply_knight_augments.ps1
3. Aplicar:
   powershell -ExecutionPolicy Bypass -File .\balance_report\apply_knight_augments.ps1 -Apply
4. Revisar diff en GitHub Desktop y commit de items.xml cuando las pruebas esten listas.
5. El script deja una copia local llamada items.xml.frozen-hell-backup.xml; no subirla al repositorio. El script es idempotente: volver a ejecutarlo no duplica los augments.

## Validacion requerida antes del merge
- Ejecutar en entorno de pruebas, no en el servidor en produccion.
- Comprobar que la spells Exori y Exori Gran funcionan contra 1 y 3 objetivos y su cooldown de grupo se respeta.
- Confirmar damage y mana de la rotacion durante 30-60 segundos; validar curacion Exura Ico y gasto en potions.
- Verificar Knight comun vs Dragon, GS, Dragon Lord, Warlock: tiempo para matar, HP minimo, consumibles gastados, mana restante y death risk.
- Comparar equipo sin augments y con augments, y comprobar condiciones de proc (critico/leech) antes de usarlas como palancas de balance.
- NO modificar Hydra ni monstruos de las primeras zonas en esta fase.
