#!/usr/bin/env python3
"""Frozen Hell phase 15: validate quest weapons without modifying any file."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent.parent
raw = (ROOT / "data/items/items.xml").read_bytes()
assert raw.startswith(b'<?xml version="1.0" encoding="ISO-8859-1"?>')
xml = raw.decode("latin-1")
EXPECTED = {
    7368: ("deadly star", "distance", 100),
    3303: ("deadly axe", "axe", 110),
    895: ("deadly wand", "wand", None),
    7415: ("deadly basher", "club", 110),
    7390: ("deadly blade", "sword", 110),
}

for item_id, (name, kind, attack) in EXPECTED.items():
    rx = r'<item\s+id="' + str(item_id) + r'"(?=\s|>)[\s\S]*?</item>'
    found = re.findall(rx, xml)
    assert len(found) == 1, item_id
    block = found[0]
    assert f'name="{name}"' in block[:250], item_id
    assert '<attribute key="script" value="moveevent;weapon">' in block, item_id
    assert block.count('<attribute key="level" value="1000"/>') == 1, item_id
    assert block.count(f'<attribute key="weaponType" value="{kind}"/>') >= 1, item_id
    assert 'key="unproperly" value="true"' not in block, item_id
    if attack is not None:
        assert block.count(f'<attribute key="attack" value="{attack}"/>') == 1, item_id
    else:
        for key, value in (("wandtype", "energy"), ("fromdamage", "250"), ("todamage", "350")):
            assert block.count(f'<attribute key="{key}" value="{value}"/>') == 1, (item_id, key)
        assert '<attribute key="attack"' not in block, item_id

# Original lvl100 quest weapon IDs remain independent.
for item_id in (3341, 3287, 3288, 3319, 3309):
    rx = r'<item\s+id="' + str(item_id) + r'"(?=\s|>)[\s\S]*?</item>'
    matches = re.findall(rx, xml)
    assert len(matches) == 1
    assert '<attribute key="level" value="100"/>' in matches[0], item_id

# Prior boss and rare equipment must not be changed by this stage.
for item_id, armor in ((3408,90), (3399,135), (8095,115),
                       (37609,130), (37608,190), (37607,150)):
    found = re.findall(r'<item\s+id="' + str(item_id) + r'"(?=\s|>)[\s\S]*?</item>', xml)
    assert len(found) == 1 and f'<attribute key="armor" value="{armor}"/>' in found[0]
assert not re.search(r'(?m)^\s*<attribute key="Deadly[^"]+" value=', xml)

# Do not promote any five weapons to drop from a standard enemy.
for path in (ROOT / "data-canary/monster/Custom").rglob("*.lua"):
    if path.name.lower() == "undead dragon.lua":
        data = path.read_text(encoding="utf-8-sig")
        for item_id in EXPECTED:
            assert not re.search(r'\bid\s*=\s*' + str(item_id) + r'\b', data), item_id

print("PASS phase 15: five quest weapons work as registered types on paper, lvl100 quests and gear remain safe.")
