#!/usr/bin/env python3
"""Summarize authentic Frozen Hell !fhtrial CSV runs; Python stdlib only."""
import csv
import sys
import re
from collections import defaultdict
from pathlib import Path
from statistics import median


def info(s):
    return dict(re.findall(r'([A-Za-z_]+):([^|]*)', s or ''))


def num(x):
    try:
        return float(x)
    except (TypeError, ValueError):
        return 0.0


def main(path):
    with open(path, 'r', encoding='utf-8', newline='') as handle:
        rows = list(csv.DictReader(handle, delimiter=';'))
    trials = defaultdict(dict)
    for row in rows:
        trial_id = row.get('trial_id') or ''
        if not trial_id:
            continue
        event = (row.get('event') or '').upper()
        if event in {'START', 'END', 'COST', 'LOOT'}:
            trials[trial_id][event] = row
        if event == 'SAMPLE':
            trials[trial_id].setdefault('samples', []).append(row)

    report = []
    for trial_id, events in sorted(trials.items()):
        start, end = events.get('START', {}), events.get('END', {})
        if not end:
            continue
        cost, loot = events.get('COST', {}), events.get('LOOT', {})
        end_notes, cost_notes, loot_notes = (info(x.get('notes', '')) for x in (end, cost, loot))
        seconds = max(1, int(num(end.get('elapsed_s'))))
        killed = int(num(end.get('killed')))
        expected = int(num(end.get('expected')))
        hp_start = num(start.get('monster_hp_sum'))
        monster_hp_end = num(end.get('monster_hp_sum'))
        xp = num(end.get('xp_gained'))
        value = loot_notes.get('manual_nephy_gp')
        potion_cost = num(cost_notes.get('potion_gp'))
        report.append({
            'trial_id': trial_id,
            'character': end.get('player'),
            'level': int(num(end.get('level'))),
            'encounter': end.get('monster'),
            'enemies': expected,
            'killed': killed,
            'outcome': cost_notes.get('outcome', end_notes.get('outcome', '')),
            'elapsed_s': seconds,
            'min_hp_sampled': int(num(end.get('min_hp_sampled'))),
            'min_mana_sampled': int(num(end.get('min_mana_sampled'))),
            'monster_net_hp_lost': int(hp_start - monster_hp_end),
            'monster_net_dps': round((hp_start - monster_hp_end) / seconds, 2),
            'damage_hook_received': int(num(end.get('damage_to_player_events'))),
            'damage_hook_dealt': int(num(end.get('damage_to_monsters_events'))),
            'exp_gained': int(xp),
            'combat_exp_per_hour_not_hunt': int(xp * 3600 / seconds),
            'potions_gp': int(potion_cost),
            'manual_nephy_gp': value if value is not None else '',
            'gp_net_after_potions': int(num(value) - potion_cost) if value is not None else '',
        })
    if not report:
        print('No complete END records; run !fhtrial start, ... and finish a fight first.')
        return
    dest = Path(path).with_name('frozen_hell_live_trials_resumen.csv')
    with open(dest, 'w', encoding='utf-8-sig', newline='') as fh:
        writer = csv.DictWriter(fh, fieldnames=list(report[0]), delimiter=';')
        writer.writeheader()
        writer.writerows(report)
    print('Summary written:', dest, '\n')
    by_encounter = defaultdict(list)
    for row in report:
        by_encounter[(row['encounter'], row['enemies'])].append(row)
    for (name, n), group in sorted(by_encounter.items()):
        secs = median(row['elapsed_s'] for row in group)
        hp = median(row['min_hp_sampled'] for row in group)
        pot = median(row['potions_gp'] for row in group)
        victories = sum(r['killed'] == r['enemies'] for r in group)
        print(f'{name} x{n}: {len(group)} trials, {victories} complete, median {secs:.0f}s, '
              f'median minHP {hp:.0f}, median potion cost {pot:.0f}gp')
    print('\nEXP/h shown in CSV is combat-only. Hunt EXP/h requires travel/respawn downtime.')


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print('Usage: python resumir_pruebas.py data/logs/frozen_hell_live_trials.csv')
        raise SystemExit(2)
    main(sys.argv[1])