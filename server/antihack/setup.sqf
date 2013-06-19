//	@file Version: 1.0
//	@file Name: setup.sqf
//	@file Author: AgentRev
//	@file Created: 07/06/2013 22:24

if (isNil "ahSetupDone") then
{
	private "_assignChecksum";
	_assignChecksum = format ["private ""_flagChecksum""; _flagChecksum = ""%1""; ", call generateKey];

	flagHandler = compileFinal (_assignChecksum + (preprocessFileLineNumbers "server\antihack\flagHandler.sqf"));

	[compile (_assignChecksum + (preprocessFileLineNumbers "server\antihack\payload.sqf")), "BIS_fnc_spawn", true, true] call BIS_fnc_MP;
	[compile ("chatBroadcast = compileFinal '" + _assignChecksum + (preprocessFileLineNumbers "server\antihack\chatBroadcast.sqf") + "'"), "BIS_fnc_spawn", true, true] call BIS_fnc_MP;
	
	LystoAntiAntiHack = compileFinal "false";
};

ahSetupDone = compileFinal "true";
diag_log "ANTI-HACK 0.7.0: Started.";
