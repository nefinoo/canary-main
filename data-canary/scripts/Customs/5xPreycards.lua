local preycards5 = Action()

function preycards5.onUse(player, item, fromPosition, itemEx, toPosition)    
    player:addPreyCards(5)
    player:removeItem(52088, 1)
    player:say('Your get 5x prey cards!')
    return true
end

preycards5:id(52088)
preycards5:register()