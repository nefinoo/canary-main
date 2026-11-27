-- Frozen Hell: intermediate weapons (level 35). Overrides existing XML weapon registrations.
-- Only the six selected IDs are affected; quest weapons and starter weapons are not changed.
local weapons = {
	{ id = 3295, kind = WEAPON_SWORD, name = "bright sword", vocations = {"knight", "elite knight"}, attack = 38, defense = 28 },
	{ id = 7456, kind = WEAPON_AXE, name = "noble axe", vocations = {"knight", "elite knight"}, attack = 40, defense = 24 },
	{ id = 3333, kind = WEAPON_CLUB, name = "crystal mace", vocations = {"knight", "elite knight"}, attack = 42, defense = 20 },
	{ id = 7378, kind = WEAPON_MISSILE, name = "royal spear", vocations = {"paladin", "royal paladin"}, attack = 43, range = 5 },
	{ id = 3067, kind = WEAPON_WAND, name = "hailstorm rod", vocations = {"druid", "elder druid"}, minDamage = 80, maxDamage = 110, mana = 14, element = "ice" },
	{ id = 3071, kind = WEAPON_WAND, name = "wand of inferno", vocations = {"sorcerer", "master sorcerer"}, minDamage = 80, maxDamage = 110, mana = 14, element = "fire" },
}

for _, cfg in ipairs(weapons) do
	local weapon = Weapon(cfg.kind)
	weapon:id(cfg.id)
	weapon:level(35)
	weapon:wieldUnproperly(false)
	for i, vocation in ipairs(cfg.vocations) do
		weapon:vocation(vocation, true, i == #cfg.vocations)
	end
	if cfg.kind == WEAPON_WAND then
		weapon:damage(cfg.minDamage, cfg.maxDamage)
		weapon:mana(cfg.mana)
		weapon:element(cfg.element)
		weapon:range(4)
	elseif cfg.kind == WEAPON_MISSILE then
		weapon:attack(cfg.attack)
		weapon:defense(0, 0)
		weapon:range(cfg.range)
		weapon:breakChance(0)
		weapon:maxHitChance(85)
		-- New Weapon defaults to WEAPONACTION_NONE: no loss or movement of spear on use.
	else
		weapon:attack(cfg.attack)
		weapon:defense(cfg.defense, 0)
		weapon:range(1)
	end
	assert(weapon:register(), "Frozen Hell intermediate weapon registration failed: " .. cfg.id)
end
