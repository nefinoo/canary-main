local recharging = Action()

function recharging.onUse(player, item)

	local minReward = 5000 -- Minimum daily reward
    local maxReward = 20000 -- Maximum daily reward

    local lastReward = player:getStorageValue(Storage.DailyRewardLastReceived)
    local currentDay = os.time(os.date("!*t"))

    if lastReward == -1 then
        lastReward = 0
    end

    -- Convert stored time and current time to days
    local lastRewardDay = math.floor(lastReward / (24 * 60 * 60))
    local currentDay = math.floor(currentDay / (24 * 60 * 60))
	print(lastReward)
	print(lastRewardDay)
	print(currentDay)
    if currentDay > lastRewardDay then
        -- Player is eligible for a new daily reward
        local reward = math.random(minReward, maxReward)

        -- Add the reward money to the player
        player:addMoney(reward)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You have received " .. reward .. " gold coins as your daily reward!")

        -- Update the last reward time
        player:setStorageValue(Storage.DailyRewardLastReceived, os.time())
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You have already received your daily reward today.")
    end
	
	return true
end

recharging:aid(9876)
recharging:register()