local itemss = { 
		{itemid = 394},
		{itemid = 35},
		{itemid = 1061},
		{itemid = 1468},
		{itemid = 844},
		{itemid = 229},
		{itemid = 12},
		{itemid = 591},
		{itemid = 910},
		{itemid = 862},
		{itemid = 495},
		{itemid = 1591},
		{itemid = 925},
		{itemid = 309},
		{itemid = 1197},
		{itemid = 1542},
		{itemid = 1277},
		{itemid = 945},
		{itemid = 1144},
		{itemid = 292},
		{itemid = 947},
		{itemid = 984},
		{itemid = 1393},
		{itemid = 862},
		{itemid = 595},
		{itemid = 988},
		{itemid = 1224},
		{itemid = 444},
		{itemid = 1308},
		{itemid = 504},
		{itemid = 1317},
		{itemid = 676},
		{itemid = 500},
}	


local spell = Spell("instant")

function spell.onCastSpell(creature, var)
repeat rand = getOutfit(creature)
until rand ~= false
	outcome = math.random(33)
	outfit = {lookType = itemss[outcome].itemid, lookHead = 0, lookAddons = 0, lookLegs = 0, lookBody = 0, lookFeet = 0}
	return doSetCreatureOutfit(creature, outfit, 2000)

end

spell:name("Outfiterr Boss")
spell:words("###8790")
spell:isAggressive(false)
spell:blockWalls(true)
spell:needLearn(true)
spell:needDirection(false)
spell:register()