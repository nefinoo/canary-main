# Frozen Hell — Fase 18: auditoría de nueve monstruos

Fecha: 23 de octubre de 2026. Solo revisión estática de archivos Lua en rama de pruebas. No se modifica gameplay, no hay pruebas in-game ni merge.

| Orden propuesto | Monstruo | Archivo Lua | HP | EXP | DPS bruto | Curación/s | GP a Nephy/kill (modelo) |
|---:|---|---|---:|---:|---:|---:|---:|
| 1 | Undead Mage | Necromancers/necromancer.lua | 11750 | 32000000 | 1249 | 13.8 | 6950 |
| 2 | Arch Angel | Monks/monk.lua | 32000 | 57000000 | 1142 | 119 | 17956 |
| 3 | Dementor | Undead Humanoids/banshee.lua | 50000 | 91000000 | 1237 | 75 | 22857 |
| 4 | Little Puppy | Canines/dog.lua | 70000 | 146000000 | 1665 | 0 | 28703 |
| 5 | Undead Dragon | Skeletons/undead dragon.lua | 105000 | 188000000 | 2017 | 0 | 39430 |
| 6 | Orshabaal | Bosses/orshabaal.lua | 150000 | 288000000 | 2131 | 55 | 45202 |
| 7 | Hellraiser | Demons/hellspawn.lua | 195000 | 448000000 | 2749 | 21.8 | 61262 |
| 8 | Frozenhell Guard | Outlaws/hero.lua | 245000 | 687000000 | 3520 | 68.8 | 73108 |
| 9 | Venom | Geo-Elementals/massive earth elemental.lua | 330000 | 902000000 | 3582 | 0 | 97620 |

El modelo de DPS suma promedio de daño nominal * probabilidad * 1000/intervalo y excluye summons, condiciones, posiciones y mitigación. GP esperado excluye equipo sin precio Nephy (Yalahari), rarezas sin precio, consumibles y tiempos; conteos 1..maxCount uniformes supuestos.

La auditoría del mapa encontró 296 nombres de spawns y los 296 cuentan con un registro estático; no equivale a verificar el arranque Canary. Registro Undead Mage en necromancer.lua ya confirmado. Problemas prioritarios: Undead Mage ofrece 2723 EXP por HP, frente a Arch Angel 1781; su DPS bruto también es mayor. Little Puppy tiene 2086 EXP/HP frente a Undead Dragon 1790, caída de 14.2%. Guard 2804 frente a Venom 2733, caída menor de 2.5%. Estas cifras son indicadores, no EXP/h medida.

**Propuesta siguiente:** medir EXP/h real, tiempo de kill, costo neto de pociones/comida y riesgo con Knight y otras vocaciones; después corregir esos tres saltos sin alterar involuntariamente el tramo de nivel 850, Deathpincer o bosses de quest. No añadir runas a los modelos de sustento. No cambiar estadísticas en esta fase sin calibración in-game.
