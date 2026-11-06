#!/usr/bin/env python3
"""Frozen Hell V2 Knight-only encounter estimator. Offline model, not Canary.

Example:
 python balance_report/v2_knight_ttk.py --level 1000 --skill 95 --attack 110 --ml 8 --exit-level 1500 --exit-skill 110 --exit-attack 160

Inputs describe the CURRENT gear at respawn entrance and at respawn exit.
The normal Fist skill is locked; --fist-bonus and --fist-buff-seconds model the temporary item effect without modifying the engine.
40 s is the entrance target; 20 s is the exit target. The same creature HP must
satisfy both. Adjust target resistance, healing and incoming damage when known.
"""
import argparse
import math

# name: level unlock, cooldown(s), mana, min and max expressions as coefficients
# tuple damage expression: level_coeff, skill_times_weapon_coeff, flat_bonus
SPELLS = {
    "exori": (35, 4.0, 65, (.11, .048, 20), (.17, .074, 32), 1.00),
    "exori gran": (90, 6.0, 120, (.11, .048, 20), (.17, .074, 32), 1.35),
    "exori min": (70, 7.0, 60, (.11, .048, 20), (.17, .074, 32), .82),
    "exori mas": (33, 8.0, 90, (.11, .048, 20), (.17, .074, 32), .70),
    "exori ico": (16, 5.0, 50, (.13, .067, 28), (.20, .093, 46), 1.00),
    "exori gran ico": (110, 12.0, 150, (.22, .105, 55), (.32, .15, 95), 1.00),
}
# Unlock, approximate average HP restored, and Malak buy price where verified.
HEALTH_POTS = (
    (0, 150, None), (50, 300, None), (80, 500, None),
    (130, 750, None), (200, 1000, None), (500, 1950, 738),
    (1000, 2750, 938), (2500, 5000, 1379),
    (5000, 7000, 1579), (10000, 11000, 1779),
)
HEALS = {
    "exura ico": (8, 1.5, 25, (.14, 4, 20), (.21, 6.5, 35)),
    "exura med ico": (300, 2.0, 70, (.32, 7, 55), (.46, 10, 85)),
    "exura gran ico": (80, 45.0, 220, (1.7, 20, 200), (2.3, 30, 350)),
}


def spell_mean(name, p):
    _, _, _, lo, hi, mult = SPELLS[name]
    gear = p["skill"] * p["attack"]
    value = lambda x: x[0] * p["level"] + x[1] * gear + x[2]
    return (value(lo) + value(hi)) / 2 * mult


def heal_mean(name, p):
    _, _, _, lo, hi = HEALS[name]
    val = lambda x: x[0] * p["level"] + x[1] * p["ml"] + x[2]
    return (val(lo) + val(hi)) / 2


def potion(p):
    return next(row for row in reversed(HEALTH_POTS) if row[0] <= p["level"])


def simulate(p, seconds=40, target_hp=float("inf"), taken_dps=0, monster_hps=0,
             damage_multiplier=1.0, augment_pct=0, health_stock=20, mana_stock=20):
    hpmax = 185 + max(0, p["level"] - 8) * 15 + p["hp_gear"]
    mpmax = 90 + max(0, p["level"] - 8) * 5 + p["mana_gear"]
    hp, mp = float(hpmax), float(mpmax)
    health_pot = potion(p)[1]
    mana_pot = 150 if p["level"] >= 50 else 100
    spell_ready, heal_ready = {}, {}
    attack_group, heal_group, supply_next = 0.0, 0.0, 0.0
    damage, min_hp, hp_used, mp_used, attacks, heals = 0.0, hp, 0, 0, 0, 0
    next_autoattack = 0.0
    dead, killed, elapsed = False, False, 0.0
    boost = damage_multiplier * (1 + augment_pct / 100.0)
    # Nominal normal melee assumes attackFactor=1, one swing/s, no crit/leech.
    min_hit = p["level"] / 5
    max_hit = round(.085 * p["attack"] * p["skill"] + p["level"] / 5) * 1.10
    auto = (min_hit + max_hit) / 2 * damage_multiplier

    for tick in range(int(seconds * 10)):
        t = tick / 10
        elapsed = t + .1
        hp -= taken_dps * .1
        mp = min(mpmax, mp + 2 / 6 * .1)
        hp = min(hpmax, hp + 1 / 6 * .1)
        if hp <= 0:
            dead = True
            break

        # Consumables: ONE supply every 2 s; food is reserved for a later model.
        if t >= supply_next:
            if health_stock and hpmax - hp >= health_pot * .65:
                hp = min(hpmax, hp + health_pot)
                health_stock -= 1
                hp_used += 1
                supply_next = t + 2
            elif mana_stock and mpmax - mp >= mana_pot and mp <= max(200, mpmax * .22):
                mp = min(mpmax, mp + mana_pot)
                mana_stock -= 1
                mp_used += 1
                supply_next = t + 2

        # Healing spells share their own 1 s healing group cooldown.
        if t >= heal_group and hp < hpmax * .85:
            priority = ["exura gran ico", "exura med ico", "exura ico"]
            for name in priority:
                lvl, cd, cost, _, _ = HEALS[name]
                if p["level"] < lvl or t < heal_ready.get(name, 0) or mp < cost:
                    continue
                if name == "exura gran ico" and hp > hpmax * .25:
                    continue
                gain = heal_mean(name, p)
                if hpmax - hp < gain * .50:
                    continue
                hp = min(hpmax, hp + gain)
                mp -= cost
                heal_ready[name] = t + cd
                heal_group = t + 1
                heals += 1
                break

        # Fist is trained only via the temporary buff item (ordinary training is blocked).
        # Its current value affects the original Canary automatic attack interval.
        current_fist = p["fist"] + (p["fist_bonus"] if t < p["fist_buff_seconds"] else 0)
        interval = max(100, 1000 - 5 * current_fist) / 1000.0
        if t + 1e-9 >= next_autoattack:
            damage += auto
            next_autoattack += interval

        # Prioritize biggest eligible single-target spell; attack group 2 s.
        if t >= attack_group:
            options = []
            for name, (lvl, cd, cost, *_rest) in SPELLS.items():
                if p["level"] >= lvl and t >= spell_ready.get(name, 0) and mp >= cost:
                    options.append((spell_mean(name, p), name))
            if options:
                amount, name = max(options)
                lvl, cd, cost, *_ = SPELLS[name]
                mp -= cost
                attack_group = t + 2
                spell_ready[name] = t + cd
                damage += amount * boost
                attacks += 1

        min_hp = min(min_hp, hp)
        if damage - monster_hps * elapsed >= target_hp:
            killed = True
            break

    return dict(damage=damage, net_damage=damage - monster_hps * elapsed,
                seconds=elapsed, killed=killed, alive=not dead, min_hp=min_hp,
                hp_used=hp_used, mp_used=mp_used, spells=attacks, heals=heals,
                mana_left=mp, max_hp=hpmax, max_mana=mpmax)


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--level", type=int, required=True)
    ap.add_argument("--skill", type=int, required=True)
    ap.add_argument("--attack", type=int, required=True, help="Weapon attack")
    ap.add_argument("--ml", type=int, default=8)
    ap.add_argument("--fist", type=int, default=10, help="Base Fist skill (not trainable normally)")
    ap.add_argument("--fist-bonus", type=int, default=0, help="Temporary Fist added by the item")
    ap.add_argument("--fist-buff-seconds", type=float, default=0, help="Duration of the Fist boost")
    ap.add_argument("--hp-gear", type=int, default=0)
    ap.add_argument("--mana-gear", type=int, default=0)
    ap.add_argument("--exit-level", type=int)
    ap.add_argument("--exit-skill", type=int)
    ap.add_argument("--exit-attack", type=int)
    ap.add_argument("--exit-ml", type=int)
    ap.add_argument("--exit-fist", type=int)
    ap.add_argument("--exit-fist-bonus", type=int)
    ap.add_argument("--exit-fist-buff-seconds", type=float)
    ap.add_argument("--incoming-dps", type=float, default=0)
    ap.add_argument("--monster-hps", type=float, default=0)
    ap.add_argument("--damage-multiplier", type=float, default=1.0,
                    help="Damage after defenses/resistances; 0.85 means 15%% less")
    ap.add_argument("--augment-pct", type=float, default=0,
                    help="Simplified damage modifier for offensive spells")
    args = ap.parse_args()
    if min(args.level, args.skill, args.attack, args.ml) < 0 or args.level < 8:
        ap.error("Provide level >= 8 and nonnegative skill/attack/ML")
    if not 0 < args.damage_multiplier <= 2:
        ap.error("--damage-multiplier must be in (0,2]")
    p = dict(level=args.level, skill=args.skill, attack=args.attack,
             ml=args.ml, hp_gear=args.hp_gear, mana_gear=args.mana_gear,
             fist=args.fist, fist_bonus=args.fist_bonus, fist_buff_seconds=args.fist_buff_seconds)
    q = dict(p)
    for attr, key in [("exit_level", "level"), ("exit_skill", "skill"),
                      ("exit_attack", "attack"), ("exit_ml", "ml"),
                      ("exit_fist", "fist"), ("exit_fist_bonus", "fist_bonus"),
                      ("exit_fist_buff_seconds", "fist_buff_seconds")]:
        value = getattr(args, attr)
        if value is not None:
            q[key] = value
    opts = dict(taken_dps=args.incoming_dps, monster_hps=args.monster_hps,
                damage_multiplier=args.damage_multiplier,
                augment_pct=args.augment_pct)
    if p["fist"] < 0 or p["fist_bonus"] < 0 or p["fist_buff_seconds"] < 0:
        ap.error("Fist values and buff duration must be nonnegative")
    if q["fist"] < 0 or q["fist_bonus"] < 0 or q["fist_buff_seconds"] < 0:
        ap.error("Exit Fist values and buff duration must be nonnegative")
    start = simulate(p, 40, **opts)
    hp = max(1, round(start["net_damage"]))
    end = simulate(q, 240, target_hp=hp, **opts)
    print("FROZEN HELL V2 | KNIGHT (OFFLINE ESTIMATE)")
    print("Entry: level={level} skill={skill} weaponAtk={attack} ML={ml}".format(**p))
    print("Exit:  level={level} skill={skill} weaponAtk={attack} ML={ml}".format(**q))
    print(f"Fist boost: entry {p['fist']}+{p['fist_bonus']} for {p['fist_buff_seconds']}s; "
          f"exit {q['fist']}+{q['fist_bonus']} for {q['fist_buff_seconds']}s")
    print(f"Entry damage in 40 s: {start['damage']:,.0f} (after selected multiplier)")
    print(f"PROPOSED monster HP: {hp:,} (monster healing subtracted)")
    print(f"Entry sustain: alive={start['alive']} minHP={start['min_hp']:,.0f} "
          f"healthPots={start['hp_used']} manaPots={start['mp_used']} "
          f"heals={start['heals']} spells={start['spells']}")
    print(f"Exit kill time: {end['seconds']:.1f}s, killed={end['killed']} alive={end['alive']}")
    if not start["alive"] or not end["alive"]:
        print("WARNING: Unsafe profile; adjust incoming DPS, supplies or gear.")
    if not 18 <= end["seconds"] <= 22:
        print("WARNING: 20s exit target NOT met with this exit level/gear.")
    print("MODEL ONLY: expected hits, no map/pathing/crit/real armor/AI/engine tick tests.")


if __name__ == "__main__":
    main()
