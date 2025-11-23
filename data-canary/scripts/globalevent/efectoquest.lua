local positions = {
	{x = 567, y = 758, z = 7},
}
local dawnportMagicEffect = GlobalEvent("DawnportMagicEffect")

function dawnportMagicEffect.onThink(interval)
	Position(positions[1]):sendMagicEffect(382)
	return true
end

dawnportMagicEffect:interval(5000)
dawnportMagicEffect:register()
