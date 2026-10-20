# Frozen Hell — Fase 12: propuesta piso 1000–3000 (nueve criaturas)

**Estado:** PLAN, sin cambios de estadísticas ni mapa. Rama `balance-frozen-hell-knight-100-200`. No hacer merge.

## Decisión de diseño

Repartir los nueve monstruos visibles del siguiente piso en **cinco zonas 1000–1999 + cuatro zonas 2000–3000**. El **boss de lvl2000** se mantiene como encuentro de transición independiente de estas nueve zonas, salvo que se decida expresamente usar una variante de uno de ellos; la progresión no debe detenerse hasta nivel5000 con tan pocos respawns.

| Orden | Nombre visible | Acceso orientativo | Función prevista |
|---|---|---:|---|
| 1 | Undead Mage | 1000–1150 | casters, presión de mana |
| 2 | Frozenhell Guard | 1200–1350 | melee/defensa |
| 3 | Dementor | 1400–1550 | debuffs y movilidad |
| 4 | Arch Angel | 1600–1750 | burst que permite reacción |
| 5 | Undead Dragon | 1800–1999 | cierre del bloque, AoE con avisos |
| transición | **Boss pendiente de identificar** | ≈2000 | primer set exclusivamente para Knight, Paladin, Druid y Sorcerer |
| 6 | Hellraiser | 2050–2250 | movilidad/daño sostenido |
| 7 | Venom | 2300–2500 | veneno controlable |
| 8 | Little Puppy | 2550–2750 | identidad/mecánica particular por confirmar |
| 9 | Orshabaal | 2800–3000 | élite de cierre, NO convertir boss global sin comprobar mapa |

Los intervalos son hipótesis para revisar según scripts, daño/HP real, quests y distancias de teleport; no niveles verificados ni acceso de mapa confirmado. El aparente tamaño o nombre de sprite no determina dificultad.

## Equipo
- Elven (850) debe poder entrar a primeros respawns 1000+, con más consumo, riesgo y menor velocidad que Green Demon.
- Green Demon lvl1000 reduce fricción sin ser llave obligatoria.
- Boss lvl2000 da cuatro sets vocacionales; son la recompensa para las zonas más duras posteriores, no condición para cazarlas.
- No mover drops de las tres quests de armas lvl100 a las cacerías normales nuevas.

## Verificación de rama
- Undead Mage: existe archivo `data-canary/monster/Custom/Undead Humanoids/undead mage.lua`, 17k HP / 28M exp, comentario lvl850. Definir si respawn repite versión lvl850 o usa **variante** lvl1000; no romper la cacería original.
- Undead Dragon: archivo `data-canary/monster/Custom/Skeletons/undead dragon.lua`, 22k HP / 36M exp. Su fuerza actual y drop de armas nivel100 deben revisarse antes de usarlo como 1800.
- Orshabaal: `data-canary/monster/Custom/Bosses/orshabaal.lua` tiene 20.5k HP / 15.5M exp y `boss=false`, pese a su carpeta. No asumir que es boss lvl2000; una variante para el piso debe evitar efectos secundarios en spawn/raids existentes.
- No aparecieron archivos de monstruo para los nombres exactos Arch Angel, Frozenhell Guard, Dementor, Little Puppy, Hellraiser y Venom en el árbol de la rama; pueden existir sólo en servidor local o con otros nombres de registro. Identificarlos antes de editar.
- Las fotos son evidencia de nombres/locaciones visibles, NO de HP/dps o permisos de script.

## Pesca y curación
- Conservar tres sistemas: spells vanilla, pociones y Super Food. Excluir Mana Rune y Knight Heal Rune del modelo. Medir exhaust consumibles compartido 2s (pendiente test en Canary).
- Fishing desde lvl1000: Quara Constrictor 1000 (skill45), Hydromancer 1300 (50), Mantassin 1500 (55), Pincher 1750 (58), Predator 2000 (65), con thresholds reducidos en fase11. Las capturas deben ser oportunidades difíciles y dar mejor recompensa por aparición, NO necesariamente más EXP/hora que caza óptima.
- Quara y zonas deben compararse en EXP/h, pociones/food consumidos, mortalidad y coste neto.

## Próximos cambios cuando estén identificadas las criaturas
1. Leer scripts exactos y dependencias antes de tocar loot/HP/ataques/XP.
2. Hacer tabla DPS bruto/efectivo y simulaciones solo por vocación, con equipo 850/1000/2000.
3. Balancear 1000–1999, boss≈2000, luego 2000–3000 en ese orden.
4. Testear configuración in-game y Canary/cliente12.56; mantener PR borrador hasta aprobación.
