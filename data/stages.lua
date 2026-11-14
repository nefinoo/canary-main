-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		multiplier = 1,
	},
		-- minlevel = 1,
		-- maxlevel = 10000,
		-- multiplier = 1000,
	-- },
	-- {
		-- minlevel = 10001,
		-- maxlevel = 20000,
		-- multiplier = 600,
	-- },
	-- {
		-- minlevel = 20001,
		-- maxlevel = 30000,
		-- multiplier = 450,
	-- },
	-- {
		-- minlevel = 30001,
		-- maxlevel = 40000,
		-- multiplier = 300,
	-- },
	-- {
		-- minlevel = 40001,
		-- maxlevel = 50000,
		-- multiplier = 200,
	-- },
	-- {
		-- minlevel = 50001,
		-- multiplier = 100,
	-- },
}

skillsStages = {
	{
		minlevel = 10,
		maxlevel = 30,
		multiplier = 10,
	},
	{
		minlevel = 31,
		maxlevel = 50,
		multiplier = 7,
	},
	{
		minlevel = 51,
		maxlevel = 70,
		multiplier = 5,
	},
	{
		minlevel = 71,
		maxlevel = 95,
		multiplier = 3,
	},
	{
		minlevel = 96,
		multiplier = 2,
	},
}

magicLevelStages = {
	{
		minlevel = 0,
		maxlevel = 30,
		multiplier = 10,
	},
	{
		minlevel = 31,
		maxlevel = 50,
		multiplier = 9,
	},
	{
		minlevel = 51,
		maxlevel = 65,
		multiplier = 7,
	},
	{
		minlevel = 66,
		maxlevel = 80,
		multiplier = 5,
	},
	{
		minlevel = 81,
		maxlevel = 90,
		multiplier = 3,
	},
	{
		minlevel = 91,
		multiplier = 2,
	},
}
