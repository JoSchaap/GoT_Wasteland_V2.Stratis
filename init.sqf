																																																												asaerw3rw3r4 = 1; 
//	@file Version: 1.2
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap
//	@file Description: The main init.

#include "setup.sqf"

// base saving can only be enabled if the server is running the @inidb mod!
// base building parts that are locked, including food/water supplys that are locked will be saved during the restart
// these will re-spawn unlocked after the restart to avoid bases clutterring the entire map
// it does NOT save player loadouts, ammocrates or vehicles!

StartProgress = false;
enableSaving[false,false];

X_Server = false;
X_Client = false;
X_JIP = false;
hitStateVar = false;
versionName = "GoT Wasteland v2.3";


if(isServer) then { X_Server = true;};
if(!isDedicated) then { X_Client = true;};
if(isNull player) then {X_JIP = true;};


true spawn {
	if(!isDedicated) then {
		titleText ["Welcome to GoT Wasteland v2.3, Have patience dear Padawan!", "BLACK", 0];
		waitUntil {!isNull player};
		client_initEH = player addEventHandler ["Respawn", {removeAllWeapons (_this select 0);}];
	};
};

//init Wasteland Core
[] execVM "config.sqf";
[] execVM "briefing.sqf";

generateKey = compileFinal preprocessFileLineNumbers "server\antihack\generateKey.sqf"; 
fn_vehicleInit = compile preprocessFileLineNumbers "server\functions\fn_vehicleInit.sqf";
removeNegativeScore = compile preprocessFileLineNumbers "server\functions\removeNegativeScore.sqf";

if(!isDedicated) then {
	waitUntil {!isNull player};

	//Wipe Group.
	if(count units group player > 1) then
	{  
		diag_log "Player Group Wiped";
		[player] join grpNull;    
	};

	[] execVM "client\init.sqf";
};

if(X_Server) then {
	diag_log format ["############################# %1 #############################", missionName];
	diag_log format["WASTELAND SERVER - Initilizing Server"];
	[] execVM "server\init.sqf";
};

//init 3rd Party Scripts
[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";

//Disable r3f on map/mission sided buildings (causes desync when moved)
//props to Tonic-_- at the BIS forums for this find! :)
// Disabled : should be handled in r3f's init now :)
// if (!isDedicated) then {
// 	waitUntil {!isNil {R3F_LOG_CFG_objets_deplacables}};
// 	{
//     	if(!(_x in (allMissionObjects "Building"))) then
//     	{
// 	        _x setVariable["R3F_LOG_disabled",true];
//     	};
// 	} foreach (nearestObjects[[0,0], R3F_LOG_CFG_objets_deplacables, 20000]); 
// };

[] execVM "addons\proving_Ground\init.sqf";
