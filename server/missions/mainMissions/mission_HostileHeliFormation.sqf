private ["_missionMarkerName","_missionType","_picture","_vehicleName","_hint","_waypoint","_waypoints","_grouphsq","_vehicles","_marker","_failed","_startTime","_numWaypoints","_ammobox","_createVehicle","_leader"];

#include "mainMissionDefines.sqf"

_missionMarkerName = "HostileHelis_Marker";
_missionType = "Hostile Helicopters";

diag_log format["WASTELAND SERVER - Main Mission Started: %1", _missionType];

diag_log format["WASTELAND SERVER - Main Mission Waiting to run: %1", _missionType];
[mainMissionDelayTime] call createWaitCondition;
diag_log format["WASTELAND SERVER - Main Mission Resumed: %1", _missionType];

_grouphsq = createGroup civilian;

_createVehicle = {
    private ["_type","_position","_direction","_grouphsq","_vehicle","_soldier"];
    
    _type = _this select 0;
    _position = _this select 1;
    _direction = _this select 2;
    _grouphsq = _this select 3;
    
    _vehicle = _type createVehicle _position;
    _vehicle setDir _direction;
    _grouphsq addVehicle _vehicle;
    
    _soldier = [_grouphsq, _position] call createRandomSoldier; 
    _soldier moveInDriver _vehicle;
    if (_vehicle isKindOf "O_Heli_Attack_02_F") then {
  	   _soldier = [_grouphsq, _position] call createRandomSoldier; 
       _soldier moveInTurret [_vehicle, [0]];
    };
    
    _vehicle
};

_vehicles = [];
_vehicles set [0, ["O_Heli_Light_02_F", [2436.24,847.9,0.00133419], 91, _grouphsq] call _createVehicle];
_vehicles set [1, ["O_Heli_Attack_02_F", [2418.8,828.152,0.00138879], 285, _grouphsq] call _createVehicle];
_vehicles set [2, ["O_Heli_Light_02_F", [2401.98,872.439,0.00141001], 285, _grouphsq] call _createVehicle];

_leader = driver (_vehicles select 0);
_grouphsq selectLeader _leader;
_leader setRank "LIEUTENANT";

_grouphsq setCombatMode "WHITE";
_grouphsq setBehaviour "AWARE";
_grouphsq setFormation "STAG COLUMN";
_grouphsq setSpeedMode "LIMITED";

_waypoints = [
[3208.18,5892.56,0.00139952],
[4514.16,6803.21,8.18937],
[6601.05,5192.41,19.6563],
[2778.99,1745.92,0.00140381],
[1611.09,4970.55,0.00143862],
[1875.8,5944.03,0.00143862],
[2480.15,5602.22,0.00115967],
[5027.56,5903.91,0.00144958],
[4600.89,5293.84,0.00161743],
[4360.94,3788.16,0.0012207],
[3353.02,2908.18,0.00141907],
[3069.41,2144.08,0.00146484],
[1932.52,2701.13,4.23677],
[1987.06,3525.87,0.00142264],
[3535.24,4935.48,2.97694],
[6436.94,5431.56,0.00140905],
[4284.53,2628.48,3.2423],
[4514.16,6803.21,8.18937],
[6601.05,5192.41,19.6563],
[2778.99,1745.92,0.00140381],
[1611.09,4970.55,0.00143862],
[1875.8,5944.03,0.00143862],
[2480.15,5602.22,0.00115967],
[5027.56,5903.91,0.00144958],
[4600.89,5293.84,0.00161743],
[4360.94,3788.16,0.0012207],
[3353.02,2908.18,0.00141907],
[3069.41,2144.08,0.00146484],
[1932.52,2701.13,4.23677],
[1987.06,3525.87,0.00142264],
[3535.24,4935.48,2.97694],
[6436.94,5431.56,0.00140905],
[4284.53,2628.48,3.2423],
[644.232,6694.51,113.885]
];
{
    _waypoint = _grouphsq addWaypoint [_x, 0];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointCompletionRadius 45;
    _waypoint setWaypointCombatMode "WHITE"; // Defensiv behaviour
    _waypoint setWaypointBehaviour "AWARE"; 
    _waypoint setWaypointFormation "STAG COLUMN";
    _waypoint setWaypointSpeed "LIMITED";
} forEach _waypoints;

_marker = createMarker [_missionMarkerName, position leader _grouphsq];
_marker setMarkerType "mil_destroy";
_marker setMarkerSize [1.25, 1.25];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "HostileHelis";

_picture = getText (configFile >> "CfgVehicles" >> "O_Heli_Light_02_F" >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> "O_Heli_Light_02_F" >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>! AIR ALARM !</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>Hostile AirSquad</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A formation of 3 <t color='%4'>%3</t> Are patroling the island, armed and dangerous! Take them out now!</t>", _missionType, _picture, _vehicleName, mainMissionColor, subTextColor];
messageSystem = _hint;
if (!isDedicated) then { call serverMessage };
publicVariable "messageSystem";

diag_log format["WASTELAND SERVER - Main Mission Waiting to be Finished: %1", _missionType];

_failed = false;
_startTime = floor(time);
_numWaypoints = count waypoints _grouphsq;
waitUntil
{
    private ["_unitsAlive"];
    
    sleep 10; 
    
    _marker setMarkerPos (position leader _grouphsq);
    
    if ((floor time) - _startTime >= mainMissionTimeout) then { _failed = true };
    if (currentWaypoint _grouphsq >= _numWaypoints) then { _failed = true }; // HostileHelis got successfully to the target location
    _unitsAlive = { alive _x } count units _grouphsq;
    
    _unitsAlive == 0 || _failed
};

if(_failed) then
{
    // Mission failed
    deleteVehicle _vehicle;
	{if (vehicle _x != _x) then { deleteVehicle vehicle _x; }; deleteVehicle _x;}forEach units _grouphsq;
	{deleteVehicle _x;}forEach units _grouphsq;
	deleteGroup _grouphsq; 
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>Hostile AirSquad</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The enemy got away, better luck next time!</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Main Mission Failed: %1",_missionType];
} else {
    // Mission complete
    _ammobox = "Box_NATO_Wps_F" createVehicle getMarkerPos _marker;
    clearMagazineCargoGlobal _ammobox;
    clearWeaponCargoGlobal _ammobox; 
    [_ammobox,"mission_USSpecial2"] call fn_refillbox;
    _ammobox2 = "Box_NATO_Wps_F" createVehicle getMarkerPos _marker;
    clearMagazineCargoGlobal _ammobox2;
    clearWeaponCargoGlobal _ammobox2; 
    [_ammobox2,"mission_USLaunchers2"] call fn_refillbox;
    _ammobox3 = "Box_NATO_Wps_F" createVehicle getMarkerPos _marker;
    clearMagazineCargoGlobal _ammobox3;
    clearWeaponCargoGlobal _ammobox3; 
    [_ammobox3,"mission_Side_USSpecial"] call fn_refillbox;
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>Hostile AirSquad</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The Hostile AirSquad has been taken down!</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Main Mission Success: %1",_missionType];
};

deleteMarker _marker;
