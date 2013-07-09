#include "defs.hpp"
private["_core"];
if (!__launchCondition) exitWith {};

if (isClass(configFile >> "cfgPatches" >> "ace_main")) then {
	ace_sys_wounds_enabled = true;
	publicVariable "ace_sys_wounds_enabled";
};

if (time==0) then {
	sleep .1;
};

if !(isNil{GVAR(init)}) exitWith {};

_dir = direction player;
_pos = getPos player;
_marker = createMarkerLocal ["respawn_west",_pos];
_marker = createMarkerLocal ["respawn_east",_pos];
_marker = createMarkerLocal ["respawn_guerrila",_pos];
_marker = createMarkerLocal ["respawn_civilian",_pos];

_pos = [(_pos select 0)+20*sin(_dir),(_pos select 1)+20*cos(_dir),0];
_core = "logic" createVehicleLocal _pos;
_core setPos _pos;
_core setDir _dir;
player addRating 100000000;
//init variables
PG_set(core,_core);
PG_set(veh,objNull);
PG_set(soundsource,objNull);
PG_set(mags,magazines player);
PG_set(weapons,weapons player);
_stat = [currentWeapon(vehicle player),0,0,0];//weapon,hits,kills,shots
PG_set(STAT,_stat);
_props = [100,0,(_dir+180)%360];
PG_set(target_mode,0);
PG_set(target_props,_props);
_rprops = [50,5,90];
PG_set(target_props_rand,_rprops);
_air_wp_dist = 500;
PG_set(air_wp_dist,_air_wp_dist);
PG_set(land_targets,[]);
PG_set(crew,[]);
PG_set(air_targets,[]);
PG_set(crew_air,[]);

//init target management
createCenter sideLogic;
_grpLogic = createGroup sideLogic;
_HQ = _grpLogic createUnit ["Logic", [0,0,0], [], 0, "NONE"];
PG_set(HQ,_HQ);
_opfor=switch (side player) do {case west:{east}; case east:{west}; default {west}};
createCenter _opfor;
PG_set(opfor,_opfor);
PG_set(target_grp,createGroup _opfor);
PG_set(air_target_grp,createGroup _opfor);

_wp_land = [];
_wp = PG_get(target_grp) addWaypoint [[(_pos select 0)+20*sin(_dir+90)+(_props select 0)*sin(_dir),(_pos select 1)+20*cos(_dir+90)+(_props select 0)*cos(_dir)],0,0];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 30;
_wp_land set [count _wp_land,_wp];
_wp = PG_get(target_grp) addWaypoint [[(_pos select 0)-20*sin(_dir+90)+(_props select 0)*sin(_dir),(_pos select 1)-20*cos(_dir+90)+(_props select 0)*cos(_dir)],0,1];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 30;
_wp_land set [count _wp_land,_wp];
_wp = PG_get(target_grp) addWaypoint [[_pos select 0,_pos select 1],0,2];
_wp setWaypointType "CYCLE";
_wp_land set [count _wp_land,_wp];
PG_set(wp_land,_wp_land);

_wp_air = [];
_wp = PG_get(air_target_grp) addWaypoint [[(_pos select 0)+_air_wp_dist,(_pos select 1)],0,0];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 50;
_wp_air set [count _wp_air,_wp];
_wp = PG_get(air_target_grp) addWaypoint [[(_pos select 0),(_pos select 1)+_air_wp_dist],0,1];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 50;
_wp_air set [count _wp_air,_wp];
_wp = PG_get(air_target_grp) addWaypoint [[(_pos select 0)-_air_wp_dist,(_pos select 1)],0,2];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 50;
_wp_air set [count _wp_air,_wp];
_wp = PG_get(air_target_grp) addWaypoint [[(_pos select 0),(_pos select 1)-_air_wp_dist],0,3];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 50;
_wp_air set [count _wp_air,_wp];
_wp = PG_get(air_target_grp) addWaypoint [[_pos select 0,_pos select 1],0,4];
_wp setWaypointType "CYCLE";
_wp_air set [count _wp_air,_wp];
PG_set(wp_air,_wp_air);
PG_set(wp_markers,[]);


//init flags
PG_set(bulletcam,false);
PG_set(bullettime,1);

PG_set(hitmarker,false);
PG_set(hitmarkers,[]);
PG_set(tracking,false);
PG_set(STATUS,false);
PG_set(AMMO,false);
PG_set(Autoheal,false);

//init functions
__prepFnc(ammo);
__prepFnc(booster);
__prepFnc(target);
__prepFnc(status);
__prepFnc(autoheal);
__prepFnc(sound);
__prepFnc(bulletcam);
__prepFnc(bullettrack);
__prepFnc(create_vehicle);
__prepFnc(create_weapon);
__prepFnc(exec_console);
__prepFnc(sattelite);
__prepFnc(statistics);
__prepFnc(environment);
if (isClass(configFile >> "cfgVehicles" >> "An2_1_TK_CIV_EP1")) then {
	PG_set(satcam_keyhandler,__preprocess __scriptPath(satcam_keyhandler_OA));
}else{
	PG_set(satcam_keyhandler,__preprocess __scriptPath(satcam_keyhandler));
};
#include "fnc_global.sqf"

[] call PG_get(fnc_status);

GVAR(init) = true;

//init functions for HJ_cfgExplorer
#define __addon_prefix proving_ground_HJ_
#define __scriptPath(a) __quoted(__concat4(__path,\CfgExplorer2\scripts\,a,.sqf))
#define __scriptName(a) __concat4(__autor_prefix,__addon_prefix,fnc_,a)
__prepFnc(InitDialog);
__prepFnc(EndDialog);
__prepFnc(onDoubleClickClass);
__prepFnc(onButtonClick_dump);
__prepFnc(onButtonClick_up);
__prepFnc(showConfig);
__prepFnc(FillClasses);
__prepFnc(FillValues);
__prepFnc(ArrayToString);
__prepFnc(onConfigChange);
//init functions for Reloader
#define __addon_prefix proving_ground_reloader_
#define __scriptPath(a) __quoted(__concat4(__path,\Reloader\fnc_,a,.sqf))
#define __scriptName(a) __concat4(__autor_prefix,__addon_prefix,fnc_,a)
__prepFnc(act_open_dialog);
__prepFnc(add_magazine);
__prepFnc(ammo_info);
__prepFnc(fill_compatible_magazines_list);
__prepFnc(fill_current_magazines_list);
__prepFnc(fill_turret_list);
__prepFnc(fill_weapon_list);
__prepFnc(get_capacity);
__prepFnc(get_current_magazines_turret);
__prepFnc(get_selected_data);
__prepFnc(get_selected_turret);
__prepFnc(get_selected_vehicle);
__prepFnc(remove_magazine);
__prepFnc(restore_loadout);
diag_log "Proving ground - init complete"