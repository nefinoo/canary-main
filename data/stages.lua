-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 10000,
		multiplier = 1000,
	},
	{
		minlevel = 10000,
		maxlevel = 10001,
		multiplier = 600,
	},
	{
		minlevel = 20000,
		maxlevel = 20001,
		multiplier = 450,
	},
	{
		minlevel = 30000,
		maxlevel = 30001,
		multiplier = 300,
	},
	{
		minlevel = 40000,
		maxlevel = 40001,
		multiplier = 200,
	},
	{
		minlevel = 50001,
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
