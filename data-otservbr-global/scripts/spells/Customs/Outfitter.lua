local spell = Spell("instant")

function getOutfit(creature)
	outcome = math.random(2,351)
	if outcome > 127 and outcome < 159 or outcome > 160 and outcome < 192 or outcome > 149 and outcome < 153 or outcome > 267 and outcome < 274 
	or outcome > 277 and outcome < 280 or outcome > 287 and outcome < 290 or outcome > 323 and outcome < 326 or outcome > 326 and outcome < 330 
	or outcome > 250 and outcome < 253 or outcome == 75 or outcome == 266 or outcome == 302 then
	return false
	else
	return outcome
	end
end

function spell.onCastSpell(creature, var)
repeat rand = getOutfit(creature)
until rand ~= false
	outfit = {lookType = rand, lookHead = 0, lookAddons = 0, lookLegs = 0, lookBody = 0, lookFeet = 0}
	return doSetCreatureOutfit(creature, outfit, 2000)

end

spell:name("Outfiterr")
spell:words("###8788")
spell:isAggressive(false)
spell:blockWalls(true)
spell:needLearn(true)
spell:needDirection(false)
spell:register()