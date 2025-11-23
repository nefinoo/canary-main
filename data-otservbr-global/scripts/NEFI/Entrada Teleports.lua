local config = {
	[36800] = {Storage = {3500, 3600}},
	[36801] = {Storage = {3501, 3601}},
	[36802] = {Storage = {3502, 3602}},
	[36803] = {Storage = {3503, 3603}},
	[36804] = {Storage = {3504, 3604}},
	[36805] = {Storage = {3505, 3605}},
	[36806] = {Storage = {3506, 3606}},
	[36807] = {Storage = {3507, 3607}},
	[36808] = {Storage = {3508, 3608}},
	[36809] = {Storage = {3509, 3609}},
	[36810] = {Storage = {3510, 3610}},
	[36811] = {Storage = {3511, 3611}},
	[36812] = {Storage = {3512, 3611}},
	[36813] = {Storage = {3513, 3611}},
	[36814] = {Storage = {3514, 3611}},
	[36815] = {Storage = {3515, 3611}},
	[36816] = {Storage = {3516, 3611}},
	[36817] = {Storage = {3517, 3611}},
	[36818] = {Storage = {3518, 3611}},
	[36819] = {Storage = {3519, 3611}},
	[36820] = {Storage = {3520, 3620}},
	[36821] = {Storage = {3521, 3621}},
	[36822] = {Storage = {3522, 3622}},
	[36823] = {Storage = {3523, 3623}},
	[36824] = {Storage = {3524, 3624}},
	[36825] = {Storage = {3525, 3625}},
	[36826] = {Storage = {3526, 3626}},
	[36827] = {Storage = {3527, 3627}},
	[36828] = {Storage = {3528, 3628}},
	[36829] = {Storage = {3529, 3629}},
	[36830] = {Storage = {3530, 3630}},
	[36831] = {Storage = {3531, 3631}},
	[36832] = {Storage = {3532, 3632}},
	[36833] = {Storage = {3533, 3633}},
	[36834] = {Storage = {3534, 3634}},
	[36835] = {Storage = {3535, 3635}},
	[36836] = {Storage = {3536, 3636}},
	[36837] = {Storage = {3537, 3637}},
	[36838] = {Storage = {3538, 3638}},
	[36839] = {Storage = {3539, 3639}},
	[36840] = {Storage = {3540, 3640}},
	[36841] = {Storage = {3541, 3641}},
	[36842] = {Storage = {3542, 3642}},
	[36843] = {Storage = {3543, 3643}},
	[36844] = {Storage = {3544, 3644}},
	[36845] = {Storage = {3545, 3645}},
	[36846] = {Storage = {3546, 3646}},
	[36847] = {Storage = {3547, 3647}},
	[36848] = {Storage = {3548, 3648}},
}

local teleportportal = MoveEvent()

function teleportportal.onStepIn(creature, item, position, fromPosition)
	valueentrance = creature:getStorageValue(config[item:getActionId()].Storage[1])
	if config[item:getActionId()].Storage[1] >= 3501 then
		if valueentrance <= 0 then		
			creature:sendTextMessage(MESSAGE_ADMINISTRATOR, "Entry has not been discovered!")
			creature:teleportTo(fromPosition)
			fromPosition:sendMagicEffect(CONST_ME_HITAREA)
		end
	end
			
end

teleportportal:type("stepin")
for id in pairs(config) do
	teleportportal:aid(id)
end
teleportportal:register()