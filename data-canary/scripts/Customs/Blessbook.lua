local blessScroll = Action()

function blessScroll.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	Blessings.BuyAllBlesses(player)
	return true
end

blessScroll:uid(13135) -- cambia 2345 por el ID del ítem
blessScroll:register()
