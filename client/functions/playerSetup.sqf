//	@file Version: 1.0
//	@file Name: playerSetup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

private["_startunif"];

_player = _this;
//Player initialization
_player setskill 0;
{_player disableAI _x} foreach ["move","anim","target","autotarget"];
_player setVariable ["BIS_noCoreConversations", true];
_startunif = uniform _player;

enableSentences false;
_player removeWeapon "ItemRadio";
_player removeWeapon "ItemGPS";
//_player unassignItem "NVGoggles";
//_player removeItem "NVGoggles";
removeAllWeapons _player;
removeUniform _player;
removeVest _player;
removeBackpack _player;
removeHeadgear _player;
removeGoggles _player;

switch (str(playerSide)) do
{
    case "WEST":
    {
	if (_startunif =="U_B_Ghilliesuit") then {
		_player addUniform "U_B_Ghilliesuit";
	} else {
		_player addUniform "U_B_CombatUniform_mcam";
	};
_player addVest "V_PlateCarrier1_rgr";
_player addHeadgear "H_HelmetB";
//_player addBackpack "B_Kitbag_Base";
    };

    case "EAST":
    {
       if (_startunif =="U_O_Ghilliesuit") then {
		_player addUniform "U_O_Ghilliesuit";
	} else {
		_player addUniform "U_O_CombatUniform_ocamo";
	};

_player addVest "V_HarnessO_brn";
_player addHeadgear "H_HelmetO_ocamo";
//_player addBackpack "B_Kitbag_mcamo";
    };

default
    {
if (_startunif =="U_O_Ghilliesuit") then {
		_player addUniform "U_O_Ghilliesuit";
	} else {
		_player addUniform (["U_B_CombatUniform_mcam","U_O_CombatUniform_ocamo"] call BIS_fnc_selectRandom);
	};
_player addVest (["V_PlateCarrier1_rgr","V_HarnessO_brn"] call BIS_fnc_selectRandom);
_player addHeadgear (["H_HelmetB","H_HelmetO_ocamo"] call BIS_fnc_selectRandom);
//_player addBackpack (["B_Kitbag_Base","B_Kitbag_mcamo"] call BIS_fnc_selectRandom);
    };
};

_player addBackpack "B_Kitbag_Base";
_player addMagazine "16Rnd_9x21_Mag";
_player addMagazine "16Rnd_9x21_Mag";
_player addWeapon "hgun_P07_F";
_player selectWeapon "hgun_P07_F";

_player addrating 1000000;
_player switchMove "amovpknlmstpsraswpstdnon_gear";

thirstLevel = 100;
hungerLevel = 100;

_player setVariable["cmoney",95,true];
_player setVariable["canfood",1,false];
_player setVariable["medkits",0,false];
_player setVariable["water",1,false];
_player setVariable["fuel",0,false];
_player setVariable["repairkits",0,false];
_player setVariable["fuelFull", 0, false];
_player setVariable["fuelEmpty", 1, false];
_player setVariable["spawnBeacon",0,false];
_player setVariable["camonet",0,false];

[] execVM "client\functions\playerActions.sqf";

_player groupChat format["GoT Wasteland v2.2 - Initialization Complete"];
playerSetupComplete = true;
