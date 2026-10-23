# Frozen Hell — Fase 9: Nephy y Malak, economía integrada

**Rama de pruebas:** `balance-frozen-hell-knight-100-200`. Fecha: 19 octubre 2026. No fusionada ni desplegada.

## Comprobaciones en los archivos actuales

- El NPC al que el jugador se refiere como Nepy es `data-canary/npc/Nephy.lua`: compra objetos del jugador (`sell`).
- `data-canary/npc/Malak.lua`: vende consumibles (`buy`), incluidos quince ítems especiales de mana, salud y espíritu, con acceso mediante storage **60000=1**. No quitar la quest de desbloqueo.
- Las configuraciones de uso están en `data/scripts/actions/items/potions.lua`. El nombre de cada ítem fue contrastado con `data/items/items.xml` mediante su ID real.

## Corrección aplicada: Nephy

| Artículo | ID incorrecto | ID correcto | Precio de venta a Nephy |
|---|---:|---:|---:|
| Elven Mail | 3408 | **3399** | 100,000 |
| Ranger Legs | 3408 | **8095** | 100,000 |
| Bonelord Helmet | 3408 | 3408 | 100,000 |
| Giant Amethyst | 30061 | **32622** | 60,000 |
| Orichalcum Pearl | 3026 | **5021** | 80 |
| Single Human Eye | 25696 | **25701** | 1,000 |
| Little Bowl of Myrrh | 25697 | **25702** | 500 |
| Rotten Vermin Ichor | 43849 | **43847** | 4,500 |

War Hammer ID3279 tenía dos precios (1,200 y 470 gp); se conserva 1,200 y se retira el duplicado de 470. No se cambiaron los otros precios de los miles de ítems de Nephy. Las armas de quest pueden venderse a Nephy por 100,000 gp; no se pusieron en venta en Malak.

## Corrección aplicada: Malak y potions.lua

**Solo en nivel 1000** estaban intercambiados los efectos/eligibilidad de Health y Spirit: se intercambiaron las configuraciones de `potions.lua` de ID 50967 (Knight Health) e ID 50965 (Paladin Spirit), **sin cambiar su potencia**.

Desde nivel 2500, las vocaciones/efectos ya estaban correctamente asociados a cada ID; ahí solo se intercambiaron los **precios** en Malak. Los IDs/nombres del items.xml permanecen iguales.

| Nivel | Sorcerer/Druid Mana | Knight Health | Paladin Spirit | Precio Mana/Health (GP) | Precio Spirit (GP) |
|---|---|---|---|---:|---:|
| 500 | 51247 | 51246 | 51138 | 738 | 979 |
| 1000 | 50966 | 50967 | 50965 | **938** | **1179** |
| 2500 | 51704 | 51702 | 51701 | **1138** | **1379** |
| 5000 | 53143 | 53144 | 53142 | **1338** | **1579** |
| 10000 | 50382 | 50384 | 50383 | **1538** | **1779** |

En Malak, la runa ID3170 se corrigió de nombre a *knight healing rune*, que es como aparece en items.xml. Su uso y costo no entran en el balance actual.

## Modelo de ingresos según el loot real de los monstruos

Con `chance/100000`, precios actuales de Nephy y cantidad media supuesta `(1+maxCount)/2` (NO validada en C++), sin buffs ni valor de loot que no acepta Nephy:

| Monster | EXP escrita en Lua | GP bruto medio modelado por kill |
|---|---:|---:|
| Salazaari Defender | 11,500,000 | ~1,668 |
| Valick | 15,500,000 | ~2,353 |
| Hell Soldier | 26,000,000 | **~5,841** |
| Undead Mage | 28,000,000 | **~6,665** |

**No es ganancia neta:** faltan número de pociones gastadas, munición, tiempo de caza, objetos no comerciables y otros loot. Hell Soldier y Undead Mage sueltan ID12413 (*belongings of a deceased*), cuyo contenido puede tener valor pero no tiene precio directo en Nephy.

Con el precio de Malak nivel500 (Knight 738 gp/poción; Paladin 979 gp/poción), las 5,841 gp modeladas de Hell Soldier equivaldrían al costo bruto de aproximadamente 7.9 pociones Knight o 6 pociones Paladin, *antes* de otros costos. No significa que sean esas las pociones realmente utilizadas. Para balance económico real hay que medir sesiones de caza.

## Auditoría reutilizable

Desde la raíz del repo:
```bash
python3 balance_report/audit_npc_economy.py
python3 balance_report/validate_phase9.py
```

La primera calcula proyecciones de GP/kill por venta NPC para los monstruos 450, 650 y 850 y lista el catálogo actual de pociones de Malak. La segunda valida precios/IDs contra `items.xml` y efectos/eligibilidad contra `potions.lua`. Son análisis estáticos, no sustituyen probar Canary.

## Orden de progreso después del umbral 1000

1. Llegar a nivel 1000, matar al primer boss y conseguir su **equipo de nivel 1000** de transición.
2. Diseñar y probar las cacerías posteriores a 1000 considerando HP, daño, XP, loot y el dinero real que paga Nephy.
3. Luego pasar al **siguiente boss**, que será el primer jefe que entrega **equipo exclusivo para cada vocación**: Knight, Paladin, Druid y Sorcerer.

No inventar el nombre ni los stats de esos bosses. En el código actual hay un portal/acceso Deathpincer, pero su definición real como monstruo no está identificada aún. Quests, bosses y sets de nivel 1000+ quedan sin cambios en esta fase.

## Pruebas requeridas en Canary

- Comprar y usar las pociones con y sin storage60000; verificar especialmente 50967/50965, sus vocaciones, efectos y precios.
- Vender a Nephy cada ítem cuyo ID se corrigió y comparar precios reales; comprobar que quest equipment no aparezca comprable en Malak.
- Ejecutar ambos scripts del informe y verificar las 4 vocaciones contra Hell Soldier y Undead Mage durante 10+ muertes cada una, registrando consumibles/costos y GP/kill.
- No fusionar a `pr-level-limit` ni desplegar sin pruebas.
