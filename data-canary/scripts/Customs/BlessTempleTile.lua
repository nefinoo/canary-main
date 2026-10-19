local Blesstiletemple = MoveEvent()

Blesstiletemple:type("stepin")

function Blesstiletemple.onStepIn(creature, item, position, fromPosition)
	local player = Player(creature)
	local updateMsg = "Welcome to Frozenhell!\n\nGetting Started.\nTo get an easy start there are rats and slimes in the sewer just outside temple.\n\nDepot can be found south south east of the temple or you may use the teleport underneath temple to bring you there.\nAny other questions you may have can be answered in help channel by players or a staff member.\nFor commands help say\n!househelp or /commands.\nUse !reward and \n\nHave Fun and enjoy the update!\nFrozenhell Staff."
	
	if creature:getStorageValue(321321) <= 0 then
		creature:setStorageValue(321321, 1)
		creature:showTextDialog(3506, updateMsg)
		-- creature:sendTextMessage(MESSAGE_LOOK, "To view the newcomers message again say !help")
	end
	player:setFeature(Features.AutoLoot, 1)
	Blessings.BuyAllBlesses(player)
    return true
end

-- Registramos ambos actionid
Blesstiletemple:uid(12345)
Blesstiletemple:register()