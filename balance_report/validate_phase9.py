#!/usr/bin/env python3
"""Validate phase 9 item IDs, potion classes, prices, and unchanged storage gate."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent.parent
xml = (ROOT / "data/items/items.xml").read_bytes().decode("latin-1")
nephy = (ROOT / "data-canary/npc/Nephy.lua").read_text()
malak = (ROOT / "data-canary/npc/Malak.lua").read_text()
potions = (ROOT / "data/scripts/actions/items/potions.lua").read_text()

def xml_name(item_id):
    m = re.search(r'<item\s+id="' + str(item_id) + r'"[^>]*\bname="([^"]+)"', xml)
    assert m, f"Unknown item ID: {item_id}"
    return m.group(1).lower()

for item_id, name, gp in [
    (3399, "elven mail", 100000), (8095, "ranger legs", 100000),
    (3408, "bonelord helmet", 100000), (32622, "giant amethyst", 60000),
    (5021, "orichalcum pearl", 80), (25701, "single human eye", 1000),
    (25702, "little bowl of myrrh", 500), (43847, "rotten vermin ichor", 4500)
]:
    assert xml_name(item_id) == name, (item_id, name)
    assert re.search(r'itemName = "' + re.escape(name) +
                     r'", clientId = ' + str(item_id) + r', sell = ' + str(gp) + r'\b', nephy)
assert nephy.count('itemName = "war hammer", clientId = 3279, sell = ') == 1

for level, mana, health, spirit, basic_gp, spirit_gp in [
    (500, 51247, 51246, 51138, 738, 979),
    (1000, 50966, 50967, 50965, 938, 1179),
    (2500, 51704, 51702, 51701, 1138, 1379),
    (5000, 53143, 53144, 53142, 1338, 1579),
    (10000, 50382, 50384, 50383, 1538, 1779)
]:
    for item_id, name, price in [(mana, "mana potion", basic_gp),
                                 (health, "health potion", basic_gp),
                                 (spirit, "spirit potion", spirit_gp)]:
        assert xml_name(item_id).endswith(name), item_id
        assert re.search(r'clientId = ' + str(item_id) + r', buy = ' + str(price) + r'\b', malak), item_id
        entry = re.search(r'(?m)^\s*\[' + str(item_id) + r'\] = \{([^\n]+)', potions)
        assert entry, item_id
        value = entry.group(1)
        assert f"level = {level}" in value, item_id
        if name == "mana potion":
            assert "mana = {" in value and "health = {" not in value and "SORCERER" in value and "DRUID" in value, item_id
        elif name == "health potion":
            assert "health = {" in value and "mana = {" not in value and "KNIGHT" in value, item_id
        else:
            assert "health = {" in value and "mana = {" in value and "PALADIN" in value, item_id
assert 'itemName = "knight healing rune", clientId = 3170' in malak
assert 'local STORAGE_RUNE_UNLOCK = 60000' in malak
print("PASS: item IDs match items.xml, potion costs and vocation effects align.")
