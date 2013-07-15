//	@file Version: 1.0
//	@file Name: payload.sqf
//	@file Author: AgentRev (also many thanks to the unknown author of the original ANTI-HACK v0.6.3)
//	@file Created: 01/06/2013 21:31

if (isServer) exitWith {};
waitUntil {!isNull player};
private ["_cheatFlag", "_defaultRecoil"];
_defaultRecoil = unitRecoilCoefficient player;

// diag_log "ANTI-HACK 0.7.2 starting...";

{
	if (loadFile _x != "") exitWith
	{
		// diag_log "ANTI-HACK 0.7.2: Found a hack menu!";

		_cheatFlag = ["hack menu", _x];
	};
} forEach ["used for hacking", "@DevCon\DevCon.pbo", "@ExtData\addons\loki_lost_key.pbo", "@ExtData\addons\loki_lost_key_models.pbo", "@ExtData\loki_lost_key.pbo", "@ExtData\loki_lost_key_models.pbo", "addons\@DevCon\DevCon.pbo", "addons\@ExtData\addons\loki_lost_key.pbo", "addons\@ExtData\addons\loki_lost_key_models.pbo", "addons\@ExtData\loki_lost_key.pbo", "addons\@ExtData\loki_lost_key_models.pbo", "crinkly\keymenu.sqf", "DevCon.pbo", "fazeddays.sqf", "jestersMENU\exec.sqf", "LystoArma3\start.sqf", "menu\exec.sqf", "menu\initmenu.sqf", "scripts\ajmenu.sqf", "scripts\defaultmenu.sqf", "scripts\exec.sqf", "scr\start.sqf", "ShadowyFaze\exec.sqf", "startup.sqf", "vet@folder\vet@start.sqf", "WookieMenu.sqf", "Wookie_Beta\start.sqf", "wookie_wuat\startup.sqf", "wuat\exec.sqf", "wuat\screen.sqf", "ShitMyNigga\Normal\player\makers.sqf", "ShitMyNigga\Normal\targetplayer\explode_target.sqf", "ShitMyNigga\Normal\all\buildSwastika.sqf", "WookieMenuV5.sqf"];

// diag_log "ANTI-HACK 0.7.2: Starting loop!";

// diag_log "ANTI-HACK 0.7.2: Detection of hack variables started!";

while { true } do
{			
	waitUntil {time > 0.1};
	
	if (isNil "_cheatFlag") then 
	{
		// diag_log "ANTI-HACK 0.7.2: Recoil hack check started!";
		
		private ["_currentRecoil", "_recoilDifference"];
		_currentRecoil = unitRecoilCoefficient player;
		
		if (_currentRecoil != _defaultRecoil) then
		{
			// diag_log "ANTI-HACK 0.7.2: Detected recoil hack!";
			
			_recoilDifference = ((_currentRecoil / _defaultRecoil) - 1) * 100;
			
			_cheatFlag = ["no recoil", (if (_recoilDifference > 0) then { "+" } else { "" }) + (format ["%1", _recoilDifference]) + "% difference"];
		};
	};
	
	if (!isNil "_cheatFlag") exitWith
	{
		waitUntil {time > 0.1};
		
		[[name player, getPlayerUID player, _cheatFlag select 0, _cheatFlag select 1, _flagChecksum], "flagHandler", false, false] call BIS_fnc_MP;
		
		// Where is your god now?
		
		endMission "LOSER";
				
		for "_i" from 0 to 99 do
		{
			(findDisplay _i) closeDisplay 0;
		};
	};
	
	sleep 30;
};
