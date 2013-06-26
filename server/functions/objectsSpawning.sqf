//	@file Version: 1.0
//	@file Name: vehicleTestSpawn.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!X_Server) exitWith {};

private ["_counter","_pos","_markerName","_marker","_amountOfVehicles","_hint"];
_counter = 0;

for "_i" from 1 to 134 do
{
    _pos = getMarkerPos format ["Spawn_%1", _i];

	//debug line added by JoSchaap to find an issue (you should NOT use my debug builds on your server!)
	diag_log format["--DEBUG-- [ObjectSpawning] call findsafepos for (Spawn_%2) with args: [%1, 21, 40, 1, 0, 60 * (pi / 180), 0] --DEBUG--", _pos, _i]; 
    //emd of debug line added by JoSchaap (you should NOT use my debug builds on your server!)
    
    _newpos = [_pos, 21, 40, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    [_newpos] call objectCreation; 
    
    _counter = _counter + 1;
};

diag_log format["WASTELAND SERVER - %1 Objects Spawned",_counter];
