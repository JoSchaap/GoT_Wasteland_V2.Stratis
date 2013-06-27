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
_player addEventHandler ["HandleDamage", {false}];  //nice idea @AgentREV!
_startunif = uniform _player;

enableSentences false;
_player removeWeapon "ItemRadio";
_player removeWeapon "ItemGPS";
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
		switch (_startunif) do
		{
			case "U_B_Ghilliesuit":
			{
				_player addUniform "U_B_Ghilliesuit";
				_player addVest "V_PlateCarrier1_rgr";
			};
			case "U_B_Wetsuit":
			{
				_player addUniform "U_B_Wetsuit";
				_player addVest "V_RebreatherB";
				_player addGoggles "G_Diving";
			};
			default
			{
				_player addUniform "U_B_CombatUniform_mcam";
				_player addVest "V_PlateCarrier1_rgr";
				_player addHeadgear "H_HelmetB";
			};
		};
	};

	case "EAST":
   	{
		switch (_startunif) do
		{
			case "U_O_Ghilliesuit":
			{
				_player addUniform "U_O_Ghilliesuit";
				_player addVest "V_PlateCarrier1_rgr";
			};
			case "U_O_Wetsuit":
			{
				_player addUniform "U_O_Wetsuit";
				_player addVest "V_RebreatherIR";
				_player addGoggles "G_Diving";
			};
			default
			{
				_player addUniform "U_O_CombatUniform_mcam";
				_player addVest "V_PlateCarrier1_rgr";
				_player addHeadgear "H_HelmetB";
			};
		};
	};

	case "GUER":
   	{
		switch (_startunif) do
		{
			case "U_I_Ghilliesuit":
			{
				_player addUniform "U_I_Ghilliesuit";
				_player addVest "V_PlateCarrier1_rgr";
			};
			case "U_I_Wetsuit":
			{
				_player addUniform "U_I_Wetsuit";
				_player addVest "V_RebreatherIA";
				_player addGoggles "G_Diving";
			};
			default
			{
				_player addUniform "U_I_CombatUniform_mcam";
				_player addVest "V_PlateCarrier1_rgr";
				_player addHeadgear "H_HelmetB";
			};
		};
	};
};

_player addBackpack "B_Kitbag_Base";
_player addMagazine "16Rnd_9x21_Mag";
_player addMagazine "16Rnd_9x21_Mag";
_player addWeapon "hgun_P07_F";
_player selectWeapon "hgun_P07_F";

_player addrating 1000000;
_player switchMove "AmovPknlMstpSrasWpstDnon_gear";

thirstLevel = 100;
hungerLevel = 100;

// set money/food/water after spawn, then disable godmode (thanks for the idea @AgentREV)
// _player setVariable["cmoney",95,true];   
//_player setVariable["canfood",1,false];
_player setVariable["medkits",0,false];
//_player setVariable["water",1,false];
_player setVariable["fuel",0,false];
_player setVariable["repairkits",0,false];
_player setVariable["fuelFull", 0, false];
_player setVariable["fuelEmpty", 1, false];
_player setVariable["spawnBeacon",0,false];
_player setVariable["camonet",0,false];

[] execVM "client\functions\playerActions.sqf";

_player groupChat format["GoT Wasteland v2.21 - Initialization Complete"];
playerSetupComplete = true;
