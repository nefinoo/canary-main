local items = { 
		{itemid = 43886},
		{itemid = 43884},
		{itemid = 43878},
		{itemid = 43865},
		{itemid = 43869},
		{itemid = 43875},
		{itemid = 43876},
		{itemid = 43883},
		{itemid = 43880},
		{itemid = 43887},
		{itemid = 22118},
		{itemid = 35571},
		{itemid = 5674},
		{itemid = 28945},
		{itemid = 5675},
		{itemid = 37317},
		{itemid = 39546},
		{itemid = 34109},
		{itemid = 39148},
		{itemid = 39147},
		{itemid = 39151},
		{itemid = 39150},
		{itemid = 39149},
		{itemid = 39155},
		{itemid = 39154},
		{itemid = 39153},
		{itemid = 39156},
		{itemid = 39152},
		{itemid = 39183},
		{itemid = 39181},
		{itemid = 40535},
		{itemid = 39186},
		{itemid = 39178},
		{itemid = 39233},
		{itemid = 39754},
		{itemid = 39693},
		{itemid = 39163},
		{itemid = 39162},
		{itemid = 39157},
		{itemid = 37608},
		{itemid = 37609},
		{itemid = 37607},
		{itemid = 37610},
		{itemid = 37611},
		{itemid = 39161},
		{itemid = 39160},
		{itemid = 39159},
		{itemid = 39158},
		{itemid = 39165},
		{itemid = 39167},
		{itemid = 39166},
		{itemid = 39164},
		{itemid = 39761},
		{itemid = 39759},
		{itemid = 40590},
		{itemid = 40593},
		{itemid = 40531},
		{itemid = 40530},
		{itemid = 40532},
		{itemid = 40533},
		{itemid = 40592},
		{itemid = 40589},
		{itemid = 40588},
		{itemid = 40591},
		{itemid = 40595},
		{itemid = 40534},
}

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
repeat rand = getOutfit(creature)
until rand ~= false
	outcome = math.random(66)
	return doSetCreatureOutfit(creature, items[outcome].itemid, 2000)

end

spell:name("Outfiterr Quests")
spell:words("###8789")
spell:isAggressive(false)
spell:blockWalls(true)
spell:needLearn(true)
spell:needDirection(false)
spell:register()