-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 1000,
		multiplier = 450,
	},
	{
		minlevel = 1000,
		maxlevel = 5000,
		multiplier = 400,
	},
	{
		minlevel = 5001,
		maxlevel = 10000,
		multiplier = 300,
	},
	{
		minlevel = 10001,
		maxlevel = 15000,
		multiplier = 200,
	},
	{
		minlevel = 15001,
		multiplier = 100,
	},
}

skillsStages = {
	{
		minlevel = 10,
		maxlevel = 60,
		multiplier = 100,
	},
	{
		minlevel = 61,
		maxlevel = 80,
		multiplier = 70,
	},
	{
		minlevel = 81,
		maxlevel = 110,
		multiplier = 40,
	},
	{
		minlevel = 111,
		maxlevel = 125,
		multiplier = 10,
	},
	{
		minlevel = 126,
		multiplier = 2,
	},
}

magicLevelStages = {
	{
		minlevel = 0,
		maxlevel = 60,
		multiplier = 50,
	},
	{
		minlevel = 61,
		maxlevel = 80,
		multiplier = 40,
	},
	{
		minlevel = 81,
		maxlevel = 100,
		multiplier = 30,
	},
	{
		minlevel = 101,
		maxlevel = 110,
		multiplier = 20,
	},
	{
		minlevel = 111,
		maxlevel = 125,
		multiplier = 10,
	},
	{
		minlevel = 126,
		multiplier = 2,
	},
}
