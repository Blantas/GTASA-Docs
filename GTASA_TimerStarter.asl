/**
 * GTA San Andreas Timer Starter +MiscSplitter
 *							(GTASA TimerStarter)

 * @game	   Grand Theft Auto: San Andreas
 * @category   Timer Starter
 * @author     Karolis Vaikutis <speedrun.com/user/Blantas>
 * @version    alpha
 * @link       -

 * @supported  1.00 EU/US
			   
 * @todo	   
 
 */

/**
 * San Andreas 1.0
 * Both EU and US versions are almost the same.
 */
	
state("gta_sa", "1.00_EU")
{
	int 	globalGameTimer : 0x77CB84;
	int 	gameState		: 0x88D4C0;
	int		gameLoadingState: 0x7A67A5;
	int		playerState		: 0x77CD98, 0x530;
	int		playerDamagedBy	: 0x77CD98, 0x760;
	
	int		burglarCurrItems: 0x648A20;
	int		burglarDone		: 0x64b0a8;
	
	int		taxiFaresTotal	: 0x649C30;
	int		taxiDone		: 0x64B0AC;
	
	byte	cutsceneActive	: 0x75F851;
	string10 lastCutscene	: 0x7C3F0C;
	
	byte	widescreen		: 0x76F065;
	byte	enableShowZone	: 0x7AA3F8;
}

state("gta_sa", "1.00_US")
{
	int 	globalGameTimer : 0x77CB84;
	int 	gameState		: 0x88D4C0;
	int		gameLoadingState: 0x7A67A5;
	int		playerState		: 0x77CD98, 0x530;
	int		playerDamagedBy	: 0x77CD98, 0x760;
	
	int		burglarCurrItems: 0x648A20;
	int		burglarDone		: 0x64b0a8;
	
	int		taxiFaresTotal	: 0x649C30;
	int		taxiDone		: 0x64B0AC;
	
	byte	widescreen		: 0x76F065;
	byte	enableShowZone	: 0x7AA3F8;
}

/**
 * San Andreas 1.01
 * Both EU and US versions are almost the same.
 */
 
state("gta_sa", "1.01_EU")
{
	int 	globalGameTimer : 0x77f204;
	int 	gameState		: 0x88FC80;
}

state("gta_sa", "1.01_US") 
{
	int 	globalGameTimer : 0x77f204;
	int 	gameState		: 0x88FC80;
}

/**
 * Probably 1.01 Polish version
 * If anyone can confirm this, please contact me.
 * Detecting version by looking for 38079 doesn't seem to work at all.
*/

state("gta_sa", "1.01_PL") 
{
	int 	globalGameTimer : 0x7f7b38;
	int 	gameState		: 0x900F30;
}

/**
 * San Andreas 3.00
 * Detecting version by checking 0x45EC4A value doesn't seem to work always.
 * Currently available only using a downgrader.
*/

state("gta-sa", "3.00_STEAM")
{
	int 	globalGameTimer : 0x80f538;
	int 	gameState		: 0x9187F0;
}

state("testapp", "3.00_STEAM")
{
	int 	globalGameTimer : 0x80f538;
	int 	gameState		: 0x9187F0;
}

/**
 * San Andreas newsteam_r2
 * Current version available in steam.
 * Steam version available since December 9th 2014
*/

state("gta-sa", "newsteam_r2")
{
	int 	globalGameTimer : 0x80FD74;
	int 	gameState		: 0x919020;
}

startup
{
	// How often script checks game values
	refreshRate = 50;
	
	// Version name, (module size, address to check while identifying version)
	vars.gameVersions = new Dictionary<string,List<int>> 
	{
		{"1.00_US",		new List<int> {18313216, 	0x42457C}},
		{"1.00_EU",		new List<int> {18313216, 	0x4245BC}},
		{"1.01_US", 	new List<int> {34471936, 	0x4252FC}},
		{"1.01_EU",		new List<int> {34471936, 	0x42533C}},
		{"1.01_PL",		new List<int> {9621504, 	0x0		}},
		{"3.00_STEAM",	new List<int> {9691136, 	0x45EC4A}},
		{"newsteam_r2",	new List<int> {9981952, 	0x0		}}
	};
	
	vars.missionCutscenes = new Dictionary<string,string>
	{
		{"PROLOG1", "New Game"},
		{"INTRO1A", "Big Smoke"},
		{"INTRO2A", "Ryder"},
		{"STEAL_5", "Puncture Wounds"},
		{"DESERT6", "N.O.E."},
		{"HEIST4A", "Dam and Blast"}
	};
	
	settings.Add("timer_strict", 				false, "Timer needs a fresh game to start?");
	// settings.Add("timer_afterload", 			false, "Timer also starts after loading a savefile?");
	
	settings.Add("split_on_any_death", 			false, 	"Split on any death");
	
	settings.Add("split_on_specific_death", 	false, 	"Split on specific death:");
	settings.Add("split_on_specific_death_00", 	false, 	"Fist", 				"split_on_specific_death");
	settings.Add("split_on_specific_death_01", 	false, 	"Brass Knuckles", 		"split_on_specific_death");
	settings.Add("split_on_specific_death_02", 	false, 	"Golf Club", 			"split_on_specific_death");
	settings.Add("split_on_specific_death_03", 	false, 	"Nightstick", 			"split_on_specific_death");
	settings.Add("split_on_specific_death_04", 	false, 	"Knife", 				"split_on_specific_death");
	settings.Add("split_on_specific_death_49", 	false, 	"Hit by a Vehicle", 	"split_on_specific_death");
	settings.Add("split_on_specific_death_50", 	false, 	"Helicopter Blades", 	"split_on_specific_death");
	settings.Add("split_on_specific_death_51", 	false, 	"Explosion", 			"split_on_specific_death");
	settings.Add("split_on_specific_death_53", 	false, 	"Drowned", 				"split_on_specific_death");
	settings.Add("split_on_specific_death_54", 	false, 	"Splat", 				"split_on_specific_death");
	
	settings.Add("split_bust", 					true, 	"Split on player bust");
	
	settings.Add("split_burglar", 				true, 	"Burglar");
	settings.Add("split_burglar_single_item", 	true, 	"Items in Van (Each)", 	"split_burglar");
	settings.Add("split_burglar_done", 			true, 	"Mission Complete", 	"split_burglar");
	
	settings.Add("split_taxi", 					true, 	"Taxi");
	settings.Add("split_taxi_single_fare", 		true, 	"Fares Completed (Each)",	"split_taxi");
	settings.Add("split_taxi_done", 			true, 	"Mission Complete", 	"split_taxi");
}

init
{
	vars.enabled = true;
	vars.CheckForWideScreenChange = false;
	vars.CheckForShowZoneChange	= false;
	version = "";

	int compareWithValue = 38079;
	
	// Getting process module size
	int gameSize = modules.First().ModuleMemorySize;
	
	print("[GTASA TimerStarter] Game proccess has been found. Module: " + game.ProcessName + ". Size: " + gameSize + ".");
	
	// Identifying game module version
	foreach (var item in vars.gameVersions) 
	{
		if(gameSize == item.Value[0] || memory.ReadValue<int>(modules.First().BaseAddress + (int)item.Value[1]) == compareWithValue) 
		{
			version = item.Key;
			print("[GTASA TimerStarter] Game version identified: " + item.Key + ".");
		}
	}
	
	// If version wasn't identified
	if(version == "")
	{
		version = "unknown (" + gameSize + ")";
		print("[GTASA TimerStarter] Game version was not identified.");
		vars.enabled = false;
	}
} 

update
{
	// To prevent isLoading from being run if game version wasn't detected.
	if(!vars.enabled) return false;
}

start
{
	if(vars.CheckForWideScreenChange)
	{
		if(old.widescreen == 1 && current.widescreen == 0) 
		{
			vars.CheckForWideScreenChange = false;
			return true;
		}
	}
	
	if(vars.CheckForShowZoneChange)
	{
		if(old.enableShowZone == 1 && current.enableShowZone == 0) 
		{
			vars.CheckForShowZoneChange = false;
			return true;
		}
	}
	
	/*
	if(current.gameState == 9)
	{
		if(current.globalGameTimer > 0 && old.globalGameTimer == 0)
		{
			if(!settings["timer_afterload"] && current.globalGameTimer > 60000) return false;
			else return true;
		}
		
		if(current.globalGameTimer > 60000 && current.gameLoadingState != old.gameLoadingState)
		{
			if(!settings["timer_afterload"] && current.globalGameTimer > 60000) return false;
			else return true;
		}
	}*/
	// If cutscene ended
	if(old.cutsceneActive == 1 && current.cutsceneActive == 0)
	{
		//print("FOUND");
		foreach (var item in vars.missionCutscenes) 
		{
			if(current.lastCutscene == item.Key) 
			{
				if(item.Key == "PROLOG1")
				{
					vars.CheckForWideScreenChange = true;
					//vars.CheckForShowZoneChange = true;
				}
				else
				{
					print("FOUND");
					return true;
				}
			}
			//print("[GTASA TimerStarter] Cutscene checking: " + item.Key + " " + current.lastCutscene);
		}
	}
}

split
{
	if(settings["split_bust"] && current.playerState == 63 && old.playerState != 63) return true;
	
	//if(settings["split_on_any_death"] && current.playerState == 55) return true;
	
	if(current.playerState == 55 && old.playerState != 55)
	{
		if(settings["split_on_any_death"]) return true;
		else
		{
			if(settings["split_on_specific_death"])
			{
				if(settings["split_on_specific_death_00"] && current.playerDamagedBy == 0) return true;
				
				if(settings["split_on_specific_death_49"] && current.playerDamagedBy == 49) return true;
				if(settings["split_on_specific_death_50"] && current.playerDamagedBy == 50) return true;
				if(settings["split_on_specific_death_51"] && current.playerDamagedBy == 51) return true;
				if(settings["split_on_specific_death_52"] && current.playerDamagedBy == 52) return true;
				if(settings["split_on_specific_death_53"] && current.playerDamagedBy == 53) return true;
				if(settings["split_on_specific_death_54"] && current.playerDamagedBy == 54) return true;
			}
		}
	}
	
	/*
	if(settings["split_burglar_done"])
	{
		print("Current: " + current.burglarDone + " Old: " + old.burglarDone + " Real: " + memory.ReadValue<byte>(modules.First().BaseAddress + 0x64b0a8));
	}*/
	
	// Burglary progress
	if(settings["split_burglar_done"] && current.burglarDone == 1 && old.burglarDone == 0) return true;
	if(settings["split_burglar_single_item"] && current.burglarCurrItems > old.burglarCurrItems) return true;
	
	// Taxi progress
	if(settings["split_taxi_done"] && current.taxiDone == 1 && old.taxiDone == 0) return true;
	if(settings["split_taxi_single_fare"] && current.taxiFaresTotal > old.taxiFaresTotal) return true;
	
	return false;
}