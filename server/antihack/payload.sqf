
//	@file Version: 1.0
//	@file Name: setup.sqf
//	@file Author: AgentRev
//	@file Created: 01/06/2013 21:31

if (isServer) exitWith {};

private ["_continueCheck", "_cheatFlag"];
_continueCheck = true;

// diag_log "ANTI-HACK 0.7.0 starting...";

{
	if (loadFile _x != "") exitWith
	{
		// diag_log "ANTI-HACK 0.7.0: Found a hack menu!";

		_cheatFlag = [player, "hack menu", _x];
		_continueCheck = false;
	};
} forEach ["used for hacking", "@DevCon\DevCon.pbo", "@ExtData\addons\loki_lost_key.pbo", "@ExtData\addons\loki_lost_key_models.pbo", "@ExtData\loki_lost_key.pbo", "@ExtData\loki_lost_key_models.pbo", "addons\@DevCon\DevCon.pbo", "addons\@ExtData\addons\loki_lost_key.pbo", "addons\@ExtData\addons\loki_lost_key_models.pbo", "addons\@ExtData\loki_lost_key.pbo", "addons\@ExtData\loki_lost_key_models.pbo", "crinkly\keymenu.sqf", "DevCon.pbo", "fazeddays.sqf", "jestersMENU\exec.sqf", "LystoArma3\start.sqf", "menu\exec.sqf", "menu\initmenu.sqf", "scripts\ajmenu.sqf", "scripts\defaultmenu.sqf", "scripts\exec.sqf", "scr\start.sqf", "ShadowyFaze\exec.sqf", "startup.sqf", "vet@folder\vet@start.sqf", "WookieMenu.sqf", "Wookie_Beta\start.sqf", "wookie_wuat\startup.sqf", "wuat\exec.sqf", "wuat\screen.sqf"];

// diag_log "ANTI-HACK 0.7.0: Starting loop!";

// diag_log "ANTI-HACK 0.7.0: Detection of hack variables started!";

private["_keyDownHandlerCount", "_keyUpHandlerCount", "_ctrlDrawHandlerCount", "_defaultRecoil"];
_defaultRecoil = unitRecoilCoefficient player;

while { true } do
{			
	waitUntil {time > 0.1};
	
	if (_continueCheck) then 
	{
		{
			if (!isNil _x) exitWith
			{
				// diag_log "ANTI-HACK 0.7.0: Found a hack variable!";
				
				_cheatFlag = [player, "hacked variable", _x];
				_continueCheck = false;
			};
		} forEach ["abcd", "abcdefGEH", "abox1", "activeITEMlist", "activeITEMlistanzahl", "addgun", "aesp", "aheaven", "antiantiantiantih4x", "AntiAntiAntiAntiHax", "anticrash", "antiloop", "ARGT_JUMP", "atext", "battleHIGH_vehpub", "BG_Pos_Orig", "BG_Scale_Orig", "bodyguardz", "boost", "bowen", "bowonky", "bulletz", "byebyezombies", "c0l0r", "c0lorthem", "cargod", "changebackpack", "changestats", "ChangingBullets_xx", "cr3d", "ctrl_onKeyDown", "dayzRespawn2", "dayzRespawn3", "dayzSetDate", "dayzSetFix", "DAYZ_CA1_Lollipops", "dayz_godmode", "debugConsoleIndex", "debugz", "debug_simple", "debug_star_colorful", "delaymenu", "desyncserver", "DEV_ConsoleOpen", "dontAddToTheArray", "drawic", "dwarden", "enamearr", "ESP", "esp2", "ezp", "fazelist", "faze_fillHax", "faze_fillPlrs", "faze_fill_color", "faze_fill_morph", "faze_fill_Objects", "faze_fill_spawn_misc_menu", "faze_fill_Specific", "faze_fill_VehiclesZ", "faze_fill_Weapons", "faze_funcs_inited", "faze_getControl", "faze_hax_dbclick", "faze_initMenu", "fffffffffff", "firstrun", "footSpeedIndex", "footSpeedKeys", "fuckmegrandma", "g0d", "g0dmode", "gluemenu", "god", "godall", "godlol", "hacks", "Hack_Pos_Orig", "hangender", "HaxSmokeOn", "HDIR", "helibus", "helitakoff", "HMDIR", "hotkeymenu", "iBeFlying", "igodokxtt", "InfiniteAmmo", "infi_STAR_exec", "inf_ammo_loop_infiSTAR", "initarr", "initarr2", "initarr3", "insult1", "invall", "isInSub", "keymenu", "keymenu2", "keyz", "lefont", "letmeknow", "Listw", "list_wrecked", "lmzsjgnas", "LOKI_GUI_Key_Color", "LowTerrain", "Lystic_FillMenu", "Lystic_FillObj", "Lystic_FillPlrs", "Lystic_FillThings", "Lystic_FillVeh", "Lystic_FillVehAir", "Lystic_FillVehWater", "Lystic_FillWep", "Lystic_Init", "Lystic_LMAOOOOOOOOOOOOOOOOOOO", "Lystic_Main", "Lystic_menutop", "lystic_menu_inited", "Lystic_Re", "Lystic_scrollable", "Lystic_Spawn", "Lysto_Lyst", "mahcaq", "maphalf", "mapm", "markPos", "mehatingjews", "Menulocations", "mk2", "monky", "monkytp", "Monky_funcs_inited", "Monky_hax_toggled", "moptions", "morphm3", "morphtoanimals", "musekeys", "MY_KEYDOWN_FNC", "n0clip", "namePlayer", "No_Recoil", "omgwtfbbq", "pathtoscrdir", "pbx", "playerDistanceScreen", "playericons", "playershield", "plrshldblckls", "plrshldblcklst", "Plr_Pos_Orig", "ptags", "qofjqpofq", "qopfkqpofqk", "r33d", "rainb0w", "rainbowbitch", "rainbow_var", "reinit", "removebuildings", "rspwn", "sbp", "sbpc", "scode", "selecteditem", "ShadowyFaz3VehZ", "shnmenu", "skinmenu", "slag", "smag", "spawnitems1", "spawnweapons1", "spawnz", "surrmenu", "swpn", "t0ggl3", "TAG_onKeyDown", "take1", "tempslag", "TentS", "testIndex", "tgod", "theKeyControl", "thingtoattachto", "timez", "toggle_keyEH", "TTT5OptionNR", "Ug8YtyGyvguGF", "unitList", "unitsmenu", "unlim", "unlimammo", "vehicleg0dv3_BushWookie", "vehiclegooov3ood_BushWookie", "Veh_Spawn_Shitt", "vgod", "ViLayer", "vspeed", "weapFun", "Wep_Spawn_Shitt", "wierdo", "Wookie_3Dtext", "Wookie_Add_To_Green", "Wookie_AdminMenu_404", "Wookie_AutoTakeOffV2", "Wookie_Base", "Wookie_BigFcknBullets", "Wookie_BlackNWhite_VF", "Wookie_BlackNWhite_VF_a", "Wookie_BlackNWhite_VF_t", "Wookie_CarGod_MODE", "Wookie_Car_RE", "Wookie_Cash", "Wookie_Cash_1k_t", "Wookie_Cash_3k_t", "Wookie_Cash_a", "Wookie_Cash_max_t", "Wookie_Cotton_1_VF", "Wookie_Cotton_2_VF", "Wookie_CyanGreen_VF", "Wookie_DarkBlue_VF", "Wookie_DarkGolden_VF", "Wookie_DarkGreen_VF", "Wookie_Dark_VF", "Wookie_Debug_Mon", "Wookie_DelCrate", "Wookie_DeleteCursor", "Wookie_ESP", "Wookie_Explode_t", "Wookie_ForceAdminMenu_404", "Wookie_FuckUp_GunStore", "Wookie_FuckUp_t", "Wookie_Gloomy_VF", "Wookie_Gloomy_VF_a", "Wookie_Gloomy_VF_t", "Wookie_GodeModeOff_a", "Wookie_GodeMode_a", "Wookie_GodMode_t", "Wookie_God_MODE", "Wookie_HealSelf", "Wookie_heal_t", "Wookie_HeliSquad", "Wookie_HeliSquad2", "Wookie_HighOnXmas_VF", "Wookie_Init_Menu", "Wookie_JoinVeh_t", "Wookie_Kick_t", "Wookie_KillCursor", "Wookie_Kill_t", "Wookie_List", "Wookie_MissileStrike", "Wookie_NewsBanner", "Wookie_NiggaBeFaded_VF", "Wookie_OldTimey_VF", "Wookie_PinkLemonade_VF", "Wookie_PlayerM", "Wookie_Pro_RE", "Wookie_QuickFire", "Wookie_Radiation_VF", "Wookie_RandParaLol_a", "Wookie_RandTPLol_a", "Wookie_RedBlue_VF", "Wookie_RemoveVF", "Wookie_Remove_VF_a", "Wookie_Remove_VF_t", "Wookie_SexyHeliLol", "Wookie_Shield", "Wookie_Shrooms_VF", "Wookie_SpawnCrate", "Wookie_Spectate_t", "Wookie_SpeedyGonzales", "Wookie_Spiderman_VF", "Wookie_Spiderman_VF_a", "Wookie_Spiderman_VF_t", "Wookie_SpinAround_t", "Wookie_Tele", "Wookie_TPAll_a", "Wookie_TPCursor", "Wookie_TpToMe_t", "Wookie_TpToThem_t", "Wookie_VehM", "Wookie_Wasteland_VF", "Wookie_Wasteland_VF_a", "Wookie_Wasteland_VF_t", "wuat_fpsMonitor", "xdistance", "xtags", "xtags_star_xx", "xyzaa", "xZombieBait", "zeus", "zeusmode", "zombieDistanceScreen", "zombieshield", "zshield", "_Shad0wt3xt"];
	};
	
	if (_continueCheck) then 
	{
		// diag_log "ANTI-HACK 0.7.0: Hack menu check started!";
		
		(findDisplay 46) displayRemoveAllEventHandlers "KeyUp";
		((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers "Draw";
		
		if (!isNull findDisplay 3030 || {!isNull findDisplay 155}) then
		{
			// diag_log "ANTI-HACK 0.7.0: Found a hack menu!";
			
			_cheatFlag = [player, "hack menu", _x];
			_continueCheck = false;
		};
	};
	
	if (_continueCheck) then 
	{
		// diag_log "ANTI-HACK 0.7.0: Recoil hack check started!";
		
		private ["_currentRecoil", "_recoilDifference"];
		_currentRecoil = unitRecoilCoefficient player;
		
		if (_currentRecoil != _defaultRecoil) then
		{
			// diag_log "ANTI-HACK 0.7.0: Detected recoil hack!";
			
			_recoilDifference = ((_currentRecoil / _defaultRecoil) - 1) * 100;
			
			_cheatFlag = [player, "no recoil", (if (_recoilDifference > 0) then { "+" } else { "" }) + (format ["%1", _recoilDifference]) + "% difference"];
			_continueCheck = false;
		};
		
		setTerrainGrid 25;
	};
	
	if (_continueCheck) then 
	{
		sleep 30;
	}
	else
	{
		waitUntil {time > 0.1};
		
		_cheatFlag set [count _cheatFlag, _flagChecksum];
		[_cheatFlag, "flagHandler", false, false] call BIS_fnc_MP;
		
		// Where is your god now?
		
		endMission "LOSER";
				
		for "_i" from 0 to 99 do
		{
			(findDisplay _i) closeDisplay 0;
		};
	};
	
	if (!_continueCheck) exitWith {};
};
