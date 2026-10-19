# Frozen Hell — Fase 4: Salazaari 450 → Valick/Mummy/Deathwalker 650 → Hell Soldier/Undead Mage 850

Rama de pruebas: \`balance-frozen-hell-knight-100-200\`. Pendiente de pruebas reales y aprobación de merge. Solo Knight **normal**, sin promoción; se conserva la experiencia Mid–High y las quests de armas. No se modifica \`Custom/Custom/Deathwalker.lua\`: ese archivo es **The Deathwalker**, un monstruo de quest de seis millones de HP.

## Estadísticas resultantes
| Monster normal | Etapa | HP final | EXP final | Rol |
|---|---:|---:|---:|---|
| Salazaari Defender | 450 | 7400 | 11,500,000 | melee y área física |
| Salazaari Ranger | 450 | 6800 | 11,500,000 | daño a distancia más frecuente |
| Salazaari Windwalker | 450 | 7200 | 11,500,000 | energía + muerte; corrige health inicial 5200/7200 |
| Valick | 650 | 13000 | 15,500,000 | melee, proyectil y parálisis controlada |
| Mummy | 650 | 11500 | 15,000,000 | veneno y robo de vida |
| Deathwalker **normal** | 650 | 14500 | 17,500,000 | resistencia física ligera, muerte y robo de vida |
| Hell Soldier | 850 | 17500 | 24,500,000 | físico/fuego; peligro del combate próximo |
| Undead Mage | 850 | 15500 | 25,000,000 | hechizos death/energy y manadrain |

Los tres últimos monstruos no estaban definidos en archivos Lua en esta rama. Se añadieron y se registran por sus nombres tal como se esperan en el teleport. Los looktypes de momento reutilizan sprites conocidos del cliente: Deathwalker lookType 232, Hell Soldier lookType 243 y Undead Mage lookType 99. **Comprobar con el mapa y corregir apariencias si hay sprites personalizados.** No se les asignó raceId numérico inventado: validar Bestiary antes de activarlo.

## Equilibrio del Elven Set raro (IDs, no nombres)
Estos tres objetos no deben ser requisito para entrar al siguiente teleport; son recompensa de eficiencia.

| ID | Equipo | Antes | Después |
|---:|---|---|---|
| 3399 | Elven Mail | armor35, +100 HP, 3% protección física, Berserk y Fierce Berserk +30% | Mantiene stats defensivos; Berserk y Fierce Berserk +12% cada uno |
| 8095 | Ranger Legs | armor27, +50 HP, +50 mana, 2% físico, sin augment activo | Mantiene stats; Berserk y Fierce Berserk +6% cada uno |
| 3408 | Bonelord Helmet | armor25, +100 mana, 2% físico, augments Deadly Core/Tornado +10 | Conserva Deadly Core/Tornado +10, añade Berserk y Fierce Berserk +3% cada uno |

El nuevo nivel mínimo equipado será **650** en las tres piezas (antes 100). Los bonos de Exori/Exori Gran suman 21 puntos porcentuales entre las tres piezas, antes de otras bonificaciones y según la implementación de Canary. No equipar simultáneamente armaduras incompatibles. La vida adicional del conjunto completo es +150 HP, mana +150 y armor de las 3 piezas = 87; se conservan los bonus de protección física.

La automatización \`balance_report/apply_elven_stage4.py\` cambia estas estadísticas dentro de \`data/items/items.xml\` y elimina **únicamente las entradas exactas de ID 3399/8095/3408** en monstruos normales con experiencia configurada inferior a 15,000,000 dentro de \`data-canary/monster/Custom\`; excluye los directorios Bosses, Arena y Custom, y los archivos con \`boss=true\`. No toca The Deathwalker ni quests. Los drops se reubican en monstruos de 650 y 850:
- Valick: 125/100,000 para cada pieza (~0.125%).
- Mummy: 100/100,000 (~0.10%).
- Deathwalker normal: 120/100,000 (~0.12%).
- Hell Soldier: 200/180/180 por 100,000 (~0.20/0.18/0.18%).
- Undead Mage: 180/180/220 por 100,000 (~0.18/0.18/0.22%).

Se conservaron los HP/EXP de los monstruos existentes salvo la corrección de Salazaari Ranger, Windwalker y Mummy. Valick recibió reducción de ralentización larga y de la frecuencia de proyectiles. Mummy tiene ahora \`minDamage/maxDamage\` para condición poison, ya que el código C++ del servidor descarta \`startDamage\` si no se ha definido un daño mínimo.

### Recompensas normales
Salazaari ahora entrega mejoras de equipo clásico como Magic Plate Armor, Golden Legs o Royal Helmet, sin entregar directamente armas de quest. Valick/Mummy proporcionan mejoras comunes adicionales; las piezas raras no son una obligación para jugar.

### Verificación
1. Revisar resultado de GitHub Actions (workflow \`apply-frozen-hell-quest-weapons.yml\`); \`items.xml\` y la limpieza de loot quedan aplicados por esa automatización, no manualmente.
2. Encender Canary en entorno de pruebas y comprobar 0 warnings/errores en Lua o XML y carga de 3 monstruos nuevos.
3. Confirmar que los teleports invocan los nombres \`deathwalker\`, \`hell soldier\` y \`undead mage\` y que los looktypes son los esperados; ajustar si los sprites son otros.
4. Knight normal nivel 450 / 650 / 850, skill Axe 68 / 80 / 90, Fist bloqueado 10, equipo común vs equipo raro: 10 combates contra 1 monstruo, luego contra 2, registrando daño real, consumibles, mana y tiempo para matar.
5. Verificar que equipo raro nivel650 se equipe correctamente y el de nivel100 no tenga accesos indirectos.
6. Probar Bestiary de monstruos nuevos con raceId validado y que no colisione con otras criaturas.
7. **NO fusionar** a \`pr-level-limit\` ni desplegar hasta terminar esas pruebas.

