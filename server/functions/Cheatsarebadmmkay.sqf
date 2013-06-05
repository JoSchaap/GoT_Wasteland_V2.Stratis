THISIS43SPARTA =
{
	// diag_log "ANTI-HACK 0.6.7 starting...";
	if (isServer) exitWith {};
	
	{
		if (loadFile _x != "") then 
		{
			// diag_log "ANTI-HACK 0.6.7: hacker?!";
			
			waitUntil {time > 0.1};

			cheatFlag = [player, "hack menu", _x];
			publicVariableServer "cheatFlag";
			
			endMission "LOSER";
					
			for "_i" from 0 to 99 do
			{
				(findDisplay _i) closeDisplay 0;
			};
		};
	} forEach ["used for hacking", "wuat\screen.sqf", "scripts\defaultmenu.sqf", "menu\initmenu.sqf", "scripts\exec.sqf", "menu\exec.sqf", "wuat\exec.sqf", "crinkly\keymenu.sqf", "scripts\ajmenu.sqf", "startup.sqf", "wookie_wuat\startup.sqf", "@DevCon\DevCon.pbo", "addons\@DevCon\DevCon.pbo", "DevCon.pbo", "ShadowyFaze\exec.sqf", "jestersMENU\exec.sqf", "vet@folder\vet@start.sqf", "LystoArma3\start.sqf", "scr\start.sqf", "Wookie_Beta\start.sqf"];
	
	// diag_log "ANTI-HACK 0.6.7: Starting loops!";
	
	[] spawn
	{
		// diag_log "ANTI-HACK 0.6.7: Detection of hack variables started!";
		
		while { true } do
		{
			private "_continueLoop";
			_continueLoop = true;
			
			{
				if !(isNil _x) exitWith 
				{
					// diag_log "ANTI-HACK 0.6.7: Found a hack variable!";
					
					waitUntil {time > 0.1};
					
					cheatFlag = [player, "hacked variable", _x];
					publicVariableServer "cheatFlag";
					
					endMission "LOSER";
					
					for "_i" from 0 to 99 do
					{
						(findDisplay _i) closeDisplay 0;
					};
					
					_continueLoop = false;
				};
			} forEach ["abcd", "abcdefGEH", "abox1", "activeITEMlist", "activeITEMlistanzahl", "addgun", "aesp", "antiantiantiantih4x", "antiloop", "ARGT_JUMP", "atext", "battleHIGH_vehpub", "boost", "bowen", "bowonky", "byebyezombies", "cargod", "changebackpack", "changestats", "ChangingBullets_xx", "ctrl_onKeyDown", "dayzRespawn2", "dayzRespawn3", "dayzSetDate", "dayzSetFix", "DAYZ_CA1_Lollipops", "dayz_godmode", "debugConsoleIndex", "debug_simple", "debug_star_colorful", "delaymenu", "DEV_ConsoleOpen", "dontAddToTheArray", "drawic", "dwarden", "enamearr", "ESP", "fffffffffff", "firstrun", "footSpeedIndex", "footSpeedKeys", "fuckmegrandma", "g0d", "g0dmode", "gluemenu", "god", "godall", "godlol", "hacks", "hangender", "HaxSmokeOn", "HDIR", "helpmenu", "HMDIR", "hotkeymenu", "iBeFlying", "igodokxtt", "img", "InfiniteAmmo", "infi_STAR_exec", "inf_ammo_loop_infiSTAR", "initarr", "initarr2", "initarr3", "inv", "invall", "j", "keymenu", "keymenu2", "letmeknow", "Listw", "list_wrecked", "lmzsjgnas", "LOKI_GUI_Key_Color", "mahcaq", "maphalf", "mapm", "marker", "markPos", "mehatingjews", "mk2", "monky", "monkytp", "Monky_funcs_inited", "Monky_hax_toggled", "moptions", "morphtoanimals", "musekeys", "MV", "MY_KEYDOWN_FNC", "namePlayer", "nb", "nd", "omgwtfbbq", "p", "pathtoscrdir", "pbx", "pic", "playerDistanceScreen", "playericons", "playershield", "plrshldblckls", "plrshldblcklst", "ptags", "pu", "qofjqpofq", "qopfkqpofqk", "reinit", "rem", "rSPAWN", "rspwn", "sbp", "sbpc", "scode", "selecteditem", "shnmenu", "skinmenu", "slag", "smag", "spawnitems1", "spawnweapons1", "surrmenu", "swpn", "TAG_onKeyDown", "take1", "tempslag", "TentS", "testIndex", "theKeyControl", "thingtoattachto", "toggle_keyEH", "TTT5OptionNR", "Ug8YtyGyvguGF", "unitList", "unitsmenu", "v", "vehicleg0dv3_BushWookie", "vehiclegooov3ood_BushWookie", "ViLayer", "VL", "vm", "vspeed", "weapFun", "wierdo", "wl", "wuat_fpsMonitor", "xdistance", "xtags", "xtags_star_xx", "xyzaa", "xZombieBait", "zeus", "zeusmode", "zombieDistanceScreen", "zombieshield"];
			
			if (!_continueLoop) exitWith {};
 
			sleep 30;
		};
	};
	
	[] spawn
	{
		private["_keyDownHandlerCount", "_keyUpHandlerCount", "_ctrlDrawHandlerCount"];
		// diag_log "ANTI-HACK 0.6.7: Hack menu check started!";
		
		while {	true } do
		{
			(findDisplay 46) displayRemoveAllEventHandlers "KeyUp";
			((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers "Draw";
			
			if (!isNull findDisplay 3030 || {!isNull findDisplay 155}) exitWith 
			{
				// diag_log "ANTI-HACK 0.6.7: Found a hack menu!";
				
				// player globalChat "[ANTI-HACK] This user has cheating scripts.";
				
				waitUntil {time > 0.1};
				
				cheatFlag = [player, "hack menu", _x];
				publicVariableServer "cheatFlag";
				
				endMission "LOSER";
					
				for "_i" from 0 to 99 do
				{
					(findDisplay _i) closeDisplay 0;
				};
			};
			
			sleep 5;
		};
	};
	[] spawn
	{
		private["_recoilSettings"];
		_recoilSettings = unitRecoilCoefficient player;
		
		// diag_log "ANTI-HACK 0.6.7: Godmode check started!";
		
		while { true } do
		{
			if (unitRecoilCoefficient player != _recoilSettings) exitWith 
			{
				// diag_log "ANTI-HACK 0.6.7: Detected recoil hack!";
				
				// player globalChat "[ANTI-HACK] This user has cheating scripts.";
				
				waitUntil {time > 0.1};
				
				cheatFlag = [player, "no recoil", "null"];
				publicVariableServer "cheatFlag";
				
				endMission "LOSER";
					
				for "_i" from 0 to 99 do
				{
					(findDisplay _i) closeDisplay 0;
				};
			};
			
			setTerrainGrid 25;
			sleep 5;
		};
	};
};

diag_log "ANTI-HACK 0.6.7: Starting...";
diag_log "ANTI-HACK 0.6.7: Adding public variable handler";

"cheatFlag" addPublicVariableEventHandler
{
	private["_array", "_player", "_playerName", "_playerID", "_playerNum", "_hackType", "_hackValue"];
	
	_array = _this select 1;
	_player = _array select 0;
	_playerName = name _player;
	_playerID = getPlayerUID _player;
	_playerNum = owner _player;
	_hackType = _array select 1;
	_hackValue = _array select 2;
	diag_log format ["ANTI-HACK 0.6.7: %1 (%2) has a scripts-detection for '%3' with the value '%4'", _playerName, _playerID, _hackType, _hackValue];

	// Bug #8396 - serverCommand doesn't work for ARMA 3 as of 2013-05-27
	serverCommand format ["#exec ban %1", _playerID];
	serverCommand format ["#kick %1", _playerID];
	
	sleep 0.5;
	
	[call compile format ["[{ player commandChat '[ANTI-HACK NOTICE] %1 was kicked for using cheating scripts.'; }]", _playerName], "BIS_fnc_spawn", true, false] call BIS_fnc_MP;
	diag_log format ["ANTI-HACK 0.6.7: %1 (%2) was kicked for '%3' with the value '%4'", _playerName, _playerID, _hackType, _hackValue];
};

"dat4ClientStarted" addPublicVariableEventHandler
{
	private["_client"];
	
	_client = _this select 1;
	(owner _client) publicVariableClient "THISIS43SPARTA";
	diag_log format ["ANTI-HACK 0.6.7: Initializing anti-hack on client #%1 (%2)", owner _client, name _client];
};
 
diag_log "ANTI-HACK 0.6.7: Ready.";
