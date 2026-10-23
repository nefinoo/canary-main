# Frozen Hell — Fase 6: Fishing / Super Food (primera pasada)

**Rama de trabajo:** `balance-frozen-hell-knight-100-200`. Sin merge a main ni despliegue automático.

## Diagnóstico

- Fishing tiene un monstruo por captura; el sistema de pesca es una fuente alternativa de XP, Super Food y botín valioso.
- Los peces hasta lvl 650 ya escalaban de 36M EXP (Water Elemental lvl 500) a 46.5M (Blood Crab lvl 650).
- El salto siguiente era 91.95M (Massive Water Elemental lvl 750), 650M (Quara Constrictor lvl 1000) y 1100M (Quara Hydromancer lvl 1300): demasiado abrupto respecto a los 26M–28M EXP de Hell Soldier / Undead Mage.
- El `!fishing` mostraba requisitos diferentes de los usados realmente para capturar.
- La caña con ID 52053 estaba registrada, pero no figuraba en `castEffects` (error al usarla).
- `math.random` recibía un límite calculado en coma flotante; se convierte a entero y se fija un límite mínimo.
- Fishing no tenía cooldown interno: se añade espera de 2 segundos por jugador. No se modifica la selección ni probabilidad relativa de monstruos elegibles.
- Super Food calculaba curación no entera (posible error al dar HP/mana o formatear valores) y Rainbow Trout usaba 1.5 segundos con `os.time()`, que trabaja en segundos enteros.

## Experiencia corregida (valores en archivo Lua)

| Captura | Nivel mínimo | XP antes | XP después | HP (sin cambios) |
|---|---:|---:|---:|---:|
| Water Elemental | 500 | 36M | 36M | 12,000 |
| Blood Crab | 650 | 46.5M | 46.5M | 18,000 |
| Massive Water Elemental | 750 | 91.95M | **55M** | 25,000 |
| Quara Constrictor | 1000 | 650M | **85M** | 35,000 |
| Quara Hydromancer | 1300 | 1100M | **125M** | 40,000 |

Los ajustes tienen en cuenta caza individual y dificultad de captura. Son valores de primera pasada; revisar experiencia por hora, tiempos de pesca, muertes y botín con el equipo real. **No** se modifica por ahora el daño de los Quara 1500+, porque sus sets todavía están por definir.

## Super Food

Se conservan los bonus HP/mana y los ítems existentes. La recuperación queda redondeada hacia abajo para respetar enteros de Canary, sin superar vida/mana faltantes; Rainbow Trout pasa a cooldown **2 s** enteros. **Pendiente:** el cooldown de Super Food es privado y aún NO está sincronizado con el de potions.lua. No afirmar lo contrario ni alterar las pociones hasta probar el mecanismo de exhaust compartido para todas las vocaciones.

## Verificaciones pendientes en servidor

1. Arrancar Canary y comprobar que las cañas 3483, 9306 y 52053 lanzan sin error.
2. Pescar repetidamente con niveles 750/1000/1300 y comparar EXP/captura/hora frente a cacerías normales.
3. Probar Super Food sobre HP/mana fraccionarios y exhaust, incluido reconectar.
4. Verificar si `scroll=true` realmente se exige en Fishing; actualmente la tabla lo declara pero el código no comprueba ningún scroll.
5. Corregir loot y supervivencia de monstruos de pesca posteriores al nivel 1300 cuando estén establecidos los sets específicos por vocación.
