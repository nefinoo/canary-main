#!/usr/bin/env python3
"""Read-only validations for Frozen Hell phase 5. Run from the repo root."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent.parent
XML = (ROOT / "data/items/items.xml").read_bytes().decode("latin-1")
CUSTOM = ROOT / "data-canary/monster/Custom"
SET_IDS = {3399, 8095, 3408}


def item_block(item_id: int) -> str:
    pattern = r'<item\s+id="' + str(item_id) + r'"(?=\s|>).*?</item>'
    matches = re.findall(pattern, XML, re.DOTALL)
    if len(matches) != 1:
        raise AssertionError(f"Item ID {item_id}: expected 1, got {len(matches)}")
    return matches[0]


def require(source: str, fragment: str, label: str) -> None:
    if fragment not in source:
        raise AssertionError(f"{label}: missing {fragment!r}")


for item_id, field, value in [
    (3399, "maxhitpoints", 600),
    (8095, "maxhitpoints", 350),
    (8095, "maxmanapoints", 250),
    (3408, "maxmanapoints", 350),
]:
    item = item_block(item_id)
    require(item, f'<attribute key="{field}" value="{value}"/>', f"item {item_id}")
    require(item, '<attribute key="level" value="850"/>', f"item {item_id}")
    require(item, '<attribute key="augments" value="1">', f"item {item_id}")

for item_id in (3341, 3287, 3288, 3319, 3309):
    item = item_block(item_id)
    require(item, 'key="script" value="moveevent;weapon"', f"quest weapon {item_id}")
    require(item, '<attribute key="level" value="100"/>', f"quest weapon {item_id}")

expected = {
    "Demons/hell soldier.lua": (18500, 26000000, {3399: 350, 8095: 150, 3408: 120}),
    "Undead Humanoids/undead mage.lua": (17000, 28000000, {3399: 120, 8095: 220, 3408: 350}),
}
for relative, (hp, xp, drops) in expected.items():
    src = (CUSTOM / relative).read_bytes().decode("utf-8")
    require(src, f"monster.health = {hp}", relative)
    require(src, f"monster.maxHealth = {hp}", relative)
    require(src, f"monster.experience = {xp}", relative)
    for item_id, chance in drops.items():
        require(src, f"{{id = {item_id}, chance = {chance}}}", relative)

early_re = re.compile(r"(?m)^\s*\{\s*id\s*=\s*(3399|8095|3408)\s*,")
errors = []
for file in CUSTOM.rglob("*.lua"):
    if file.relative_to(CUSTOM).parts[0] in ("Bosses", "Arena", "Custom"):
        continue
    src = file.read_bytes().decode("utf-8-sig", errors="replace")
    if re.search(r"\bboss\s*=\s*true\b", src):
        continue
    xp = re.search(r"(?m)^\s*monster\.experience\s*=\s*(\d+)", src)
    if xp and int(xp.group(1)) < 15000000 and early_re.search(src):
        errors.append(str(file.relative_to(ROOT)))
if errors:
    raise AssertionError("Early rare-set loot found in: " + ", ".join(errors))

print("PASS: phase 5 rare equipment, quest weapons, late loot, and stage gating verified.")
