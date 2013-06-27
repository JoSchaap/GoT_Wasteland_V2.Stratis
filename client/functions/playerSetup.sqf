//	@file Name: playerSetup.sqf
//	@file Author: [GoT] JoSchaap

_player = _this;
_player setskill 0;
{_player disableAI _x} foreach ["move","anim","target","autotarget"];
_player setVariable ["BIS_noCoreConversations", true];
_player addEventHandler ["HandleDamage", {false}];

enableSentences false;
_player removeWeapon "ItemRadio";
_player removeWeapon "ItemGPS";
_player unassignItem "NVGoggles";
_player removeItem "NVGoggles";
removeAllWeapons _player;
removeUniform _player;
removeVest _player;
removeBackpack _player;
removeHeadgear _player;
removeGoggles _player;


switch (str(playerSide)) do
{
	case "WEST":
		if (typeof _player == "B_sniper_F") then { 
			_player addUniform "U_B_Ghilliesuit"; 
			_player addVest "V_PlateCarrier1_rgr"; 
		};
		if (typeof _player == "B_diver_F") then { 
			_player addUniform "U_B_Wetsuit"; 
			_player addVest "V_RebreatherB";
			_player addGoggles "G_Diving";
		};
		if (typeof _player != "B_diver_F" && typeof _player != "B_sniper_F") then { 
			_player addUniform "U_B_CombatUniform_mcam";
			_player addVest "V_PlateCarrier1_rgr";
			_player addHeadgear "H_HelmetB";
		};
	case "EAST":
		if (typeof _player == "O_sniper_F") then { 
			_player addUniform "U_O_Ghilliesuit"; 
			_player addVest "V_PlateCarrier1_rgr"; 
		};
		if (typeof _player == "O_diver_F") then { 
			_player addUniform "U_O_Wetsuit"; 
			_player addVest "V_RebreatherIR";
			_player addGoggles "G_Diving";
		};
		if (typeof _player != "O_diver_F" && typeof _player != "O_sniper_F") then { 
			_player addUniform "U_O_CombatUniform_ocamo";
			_player addVest "V_PlateCarrier1_rgr";
			_player addHeadgear "H_HelmetO_ocamo";
		};
	case "GUER":
		if (typeof _player == "I_sniper_F") then { 
			_player addUniform "U_I_Ghilliesuit"; 
			_player addVest "V_PlateCarrier1_rgr"; 
		};
		if (typeof _player == "I_diver_F") then { 
			_player addUniform "U_I_Wetsuit"; 
			_player addVest "V_RebreatherIA";
			_player addGoggles "G_Diving";
		};
		if (typeof _player != "I_diver_F" && typeof _player != "I_sniper_F") then { 
			_player addUniform "U_I_CombatUniform";
			_player addVest "V_PlateCarrier1_rgr";
			_player addHeadgear "H_MilCap_ocamo";
		};
};

_player addItem "NVGoggles";
_player assignItem "NVGoggles";
_player addBackpack "B_Kitbag_Base";
_player addMagazine "16Rnd_9x21_Mag";
_player addMagazine "16Rnd_9x21_Mag";
_player addWeapon "hgun_P07_F";
_player selectWeapon "hgun_P07_F";

_player addrating 1000000;
_player switchMove "AmovPknlMstpSrasWpstDnon_gear";

thirstLevel = 100;
hungerLevel = 100;

_player setVariable["medkits",0,false];
_player setVariable["fuel",0,false];
_player setVariable["repairkits",0,false];
_player setVariable["fuelFull", 0, false];
_player setVariable["fuelEmpty", 1, false];
_player setVariable["spawnBeacon",0,false];
_player setVariable["camonet",0,false];

[] execVM "client\functions\playerActions.sqf";

_player groupChat format["GoT Wasteland v2.21 - Initialization Complete"];
playerSetupComplete = true;
