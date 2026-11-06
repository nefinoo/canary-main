#!/usr/bin/env python3
"""Frozen Hell V2: apply Knight quest weapon balance to the large items.xml.

Runs automatically on GitHub Actions when this file changes. Users do not
need to run commands. Changes are limited to 3 Knight-only weapon IDs.
"""
from pathlib import Path
import re
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parent.parent
FILE = ROOT / "data/items/items.xml"

# id -> (original attack, new attack, level)
WEAPONS = {
    3303: (52, 110, 1000),   # Deadly Axe
    7415: (44, 112, 1000),   # Deadly Basher
    7390: (47, 108, 1000),   # Deadly Blade
}


def update_item(source: str, item_id: int, original_attack: int, new_attack: int, level: int) -> str:
    pattern = re.compile(
        r'<item\s+id="' + str(item_id) + r'"[^>]*>.*?</item>',
        re.DOTALL,
    )
    matches = list(pattern.finditer(source))
    if len(matches) != 1:
        raise ValueError(f"Expected exactly one item id={item_id}; found {len(matches)}")

    original_block = matches[0].group()
    block = original_block
    if 'Knight;true, Elite Knight' not in block:
        raise ValueError(f"Item {item_id} is not Knight-only")

    attack_field = re.search(r'<attribute key="attack" value="(\d+)"\s*/>', block)
    if not attack_field:
        raise ValueError(f"Missing attack value on item {item_id}")
    current_attack = int(attack_field.group(1))
    if current_attack not in (original_attack, new_attack):
        raise ValueError(f"Unexpected attack on item {item_id}: {current_attack}")
    block = block.replace(
        attack_field.group(),
        f'<attribute key="attack" value="{new_attack}"/>',
        1,
    )

    level_field = re.search(r'<attribute key="level" value="(\d+)"\s*/>', block)
    if level_field:
        current_level = int(level_field.group(1))
        allowed = (60, level) if item_id == 7415 else (level,)
        if current_level not in allowed:
            raise ValueError(f"Unexpected level on item {item_id}: {current_level}")
        block = block.replace(
            level_field.group(), f'<attribute key="level" value="{level}"/>', 1
        )
    else:
        anchor = '<attribute key="script" value="moveevent;weapon">'
        if anchor not in block:
            raise ValueError(f"Missing weapon script attribute on item {item_id}")
        block = block.replace(
            anchor, anchor + f'\n\t\t\t<attribute key="level" value="{level}"/>', 1
        )

    if block.count(f'<attribute key="attack" value="{new_attack}"/>') != 1:
        raise ValueError(f"Attack verification failed for item {item_id}")
    if block.count(f'<attribute key="level" value="{level}"/>') != 1:
        raise ValueError(f"Level verification failed for item {item_id}")

    return source[:matches[0].start()] + block + source[matches[0].end():]


def main() -> None:
    before = FILE.read_bytes()
    # Preserve items.xml's actual ISO-8859-1 encoding and its existing formatting.
    text = before.decode("iso-8859-1")
    updated = text
    for item_id, (original_attack, new_attack, level) in WEAPONS.items():
        updated = update_item(updated, item_id, original_attack, new_attack, level)

    changed = updated.encode("iso-8859-1")
    # Reject malformed XML before writing to the worktree.
    ET.fromstring(changed)
    if changed != before:
        FILE.write_bytes(changed)
    print("Checked Knight quest weapon IDs 3303 / 7415 / 7390; XML syntax valid.")
    print("Attack values now 110 / 112 / 108; required levels 1000.")


if __name__ == "__main__":
    main()
