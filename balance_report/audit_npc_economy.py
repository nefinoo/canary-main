#!/usr/bin/env python3
"""Read-only economic model for Frozen Hell: monster loot, Nephy resale, Malak expenses."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent.parent
NPC = ROOT / "data-canary/npc"
MON = ROOT / "data-canary/monster/Custom"

def read(p):
    return p.read_text(encoding="utf-8-sig", errors="replace")

entry_re = re.compile(r'\{[^{}\n]*itemName\s*=\s*"([^"]+)"[^{}\n]*clientId\s*=\s*(\d+)[^{}\n]*\}')
def shop(p, direction):
    rows = []
    for match in entry_re.finditer(read(p)):
        amount = re.search(r'\b' + direction + r'\s*=\s*(\d+)', match.group(0))
        if amount:
            rows.append((match.group(1).casefold(), int(match.group(2)), int(amount.group(1))))
    return rows

nephy = shop(NPC / "Nephy.lua", "sell")
by_id, by_name = {}, {}
for name, item_id, price in nephy:
    if item_id in by_id and by_id[item_id] != price:
        print(f"CONFLICT Nephy ID={item_id}: {by_id[item_id]} vs {price}")
    by_id[item_id] = price
    by_name[name] = price

money = {"gold coin": 1, "platinum coin": 100, "crystal coin": 10000}
monster_rows = [
    (450, "Elves/elf.lua"), (450, "Elves/elf scout.lua"),
    (450, "Elves/elf arcanist.lua"),
    (650, "Undead Humanoids/valick.lua"), (650, "Undead Humanoids/mummy.lua"),
    (650, "Undead Humanoids/deathwalker.lua"),
    (850, "Demons/hell soldier.lua"), (850, "Undead Humanoids/undead mage.lua"),
]
print("STAGE | MONSTER | THEORETICAL VENDOR GP/KILL | UNPRICED DROPS")
for lvl, monster in monster_rows:
    src = read(MON / monster)
    block = re.search(r'monster\.loot\s*=\s*\{(.*?)\n\}', src, re.S)
    if not block:
        print(lvl, monster, "(loot block not parsed)")
        continue
    gross, unknown = 0.0, []
    for match in re.finditer(r'\{[^{}\n]*\}', block.group(1)):
        line = match.group(0)
        rate = re.search(r'\bchance\s*=\s*(\d+)', line)
        if not rate:
            continue
        item = re.search(r'\bid\s*=\s*(\d+)', line)
        named = re.search(r'\bname\s*=\s*"([^"]+)"', line)
        stack = re.search(r'\bmaxCount\s*=\s*(\d+)', line)
        item_id = int(item.group(1)) if item else None
        item_name = named.group(1).casefold() if named else None
        price = by_id.get(item_id) if item_id is not None else money.get(item_name, by_name.get(item_name))
        if price is None:
            unknown.append(item_name or f"ID {item_id}")
            continue
        mean_stack = (1 + int(stack.group(1))) / 2 if stack else 1
        gross += int(rate.group(1)) / 100000 * mean_stack * price
    print(f"{lvl:5} | {Path(monster).stem:26} | {gross:>12,.0f} gp | {', '.join(sorted(set(unknown))) or '-'}")

ids = {51247, 51138, 51246, 50966, 50965, 50967, 51704, 51701, 51702,
       53143, 53142, 53144, 50382, 50383, 50384}
print("\nMALAK — POTION BUY PRICES:")
for name, item_id, gp in shop(NPC / "Malak.lua", "buy"):
    if item_id in ids:
        print(f"{item_id}: {name} — {gp} gp")
print("\nMODEL ONLY: assumes chance/100000 and uniform stacks 1..maxCount.")
print("Excludes loot modifiers, the value of unpriced drops, and potions actually consumed.")
