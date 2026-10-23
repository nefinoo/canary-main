#!/usr/bin/env python3
"""Check phase 14 equipment progression, removal of retired Deadly augments, and lvl1000 quest weapons."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent.parent
xml = (ROOT / "data/items/items.xml").read_bytes().decode("latin-1")
item_rx = re.compile(r'<item\s+id="(\d+)"(?=\s|>)[\s\S]*?</item>')
items: dict[int, str] = {}
for hit in item_rx.finditer(xml):
    id_ = int(hit.group(1))
    if id_ in items:
        raise AssertionError(f"Duplicate XML item ID: {id_}")
    items[id_] = hit.group()
def val(id_: int, key: str) -> int:
    block = items[id_]
    found = re.findall(r'<attribute key="' + re.escape(key) + r'" value="(\d+)"/>', block)
    assert len(found) == 1, (id_, key, found)
    return int(found[0])
gears = {
    "helmet": (3387, 3408, 37609, (70, 90, 130)),
    "armor": (3388, 3399, 37608, (100, 135, 190)),
    "legs": (3389, 8095, 37607, (85, 115, 150)),
}
for slot, (demon, rare, green, expected) in gears.items():
    actual = tuple(val(id_, "armor") for id_ in (demon, rare, green))
    assert actual == expected and actual[0] < actual[1] < actual[2], (slot, actual)
    for id_, level in ((demon, 500), (rare, 850), (green, 1000)):
        assert val(id_, "level") == level, (id_, level)

for id_, mana in ((8095, 350), (3408, 450)):
    assert val(id_, "maxmanapoints") == mana, (id_, mana)

for id_, name in ((7368, "deadly star"), (3303, "deadly axe"),
                  (895, "deadly wand"), (7415, "deadly basher"), (7390, "deadly blade")):
    assert f'name="{name}"' in items[id_][:250], (id_, name)
    assert val(id_, "level") == 1000, id_
    assert '<attribute key="unproperly" value="true"/>' not in items[id_], id_

# Comments are never active augments: remove them before scanning the XML.
active_xml = re.sub(r'<!--[\s\S]*?-->', "", xml)
assert re.search(r'<attribute key="Deadly[^"]+"', active_xml, re.I) is None
# Normal combat augment skills stay enabled on the rare set.
for id_ in (3399, 8095, 3408):
    for spell in ("berserk", "fierce berserk"):
        assert f'<attribute key="{spell}" value="increased damage">' in items[id_], (id_, spell)
# Prior NPC, boss rewards and weapon quests are unmodified.
boss = (ROOT / "data-canary/monster/Custom/Insects/ancient scarab.lua").read_text(encoding="utf-8-sig")
assert 'Game.createMonsterType("deathpincer")' in boss
print("PASS phase 14: Demon500 < rare850 < Green1000; no active Deadly augments; five quests lvl1000.")
