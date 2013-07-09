#include "defs.hpp"
#define GET_DISPLAY (findDisplay balca_debug_WC_IDD)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})
#define __cfgWeap configFile >> "cfgWeapons"


_mode = _this select 0;
_item_type = _this select 1;
switch (_mode) do {
case 0: {//fill weapon list
		_cfgweapons = configFile >> "cfgWeapons";
		_generalCondition = {
			((getNumber(_this >> "scope")==2)&&(getNumber(_this >> "access")!=0)&&(getText(_this >> "model")!="")&&(getText(_this >> "displayName")!=""))
		};
		_haveOptics = {
			(getText(_this >> "ModelOptics")!="-")||(getNumber(configFile >> "cfgWeapons" >> getText(_this >> "LinkedItems" >> "LinkedItemsOptic" >> "item") >> "ItemInfo" >> "OpticType")>0)
		};
		_condition = switch (_item_type) do {
			case 0: {{ (_this call _generalCondition)&&(getNumber(_this >> "type")==1)&&(getNumber(_this >> "WeaponSlotsInfo" >> "mass")<70)&&!(_this call _haveOptics)}};//rifles
			case 1: {{ (_this call _generalCondition)&&(getNumber(_this >> "type")==1)&&(getNumber(_this >> "WeaponSlotsInfo" >> "mass")<70)&&(_this call _haveOptics)}};//scoped rifles
			case 2: {{ (_this call _generalCondition)&&(getNumber(_this >> "type") in [1,5])&&(getNumber(_this >> "WeaponSlotsInfo" >> "mass")>=70)}};//heavy
			case 3: {{ (_this call _generalCondition)&&(getNumber(_this >> "type")==4)}};//secondary weapon
			case 4: {{ (_this call _generalCondition)&&(getNumber(_this >> "type")==2)}};//pistol
			case 5: {{ (getNumber(_this >> "type")==0)&&(getText(_this >> "ModelOptics")=="")}};//put/throw
			case 6: {{ (_this call _generalCondition)&&(getNumber(_this >> "type")==4096)}};//BinocularSlot
			case 7: {{ (_this call _generalCondition)&&(getNumber(_this >> "type")==131072)&&(getNumber(_this >> "ItemInfo" >> "type")==0)}};//SmallItems
			case 8: {{ (_this call _generalCondition)&&(getNumber(_this >> "type")==131072)&&(getNumber(_this >> "ItemInfo" >> "type") in [701,801,605,619, 607, 401])}};//wear
			case 9: {{ (_this call _generalCondition)&&(getNumber(_this >> "type")==131072)&&(getNumber(_this >> "ItemInfo" >> "type") in [201, 301, 101])}};//attachments
			default {{ true}};
		};
		lbClear GET_CTRL(balca_WC_weaplist_IDC);
		for "_i" from 0 to (count _cfgweapons)-1 do {
			_weapon = _cfgweapons select _i;
			if (isClass _weapon) then {
				if (_weapon call _condition) then {
					GET_CTRL(balca_WC_weaplist_IDC) lbAdd getText(_weapon >> "displayName");
					GET_CTRL(balca_WC_weaplist_IDC) lbSetData [(lbSize GET_CTRL(balca_WC_weaplist_IDC))-1,configName _weapon];
					GET_CTRL(balca_WC_weaplist_IDC) lbSetPicture [(lbSize GET_CTRL(balca_WC_weaplist_IDC))-1,getText(_weapon >> "picture")];
				};
			};
		};
		lbSort GET_CTRL(balca_WC_weaplist_IDC);		


	};
case 1: {//weap info, fill magazines
		_weap_type = GET_SELECTED_DATA(balca_WC_weaplist_IDC);
		_weapon = (configFile >> "cfgWeapons" >> _weap_type);
		_displayName = getText(_weapon >> "displayName");
		_picture = getText(_weapon >> "picture");
		_library = getText(_weapon >> "Library" >> "libTextDesc");
		_dispersion = getNumber(_weapon >> "dispersion");
		_magazines = [];
		{
			_magazines = _magazines + getArray( (if ( _x == "this" ) then { _weapon } else { _weapon >> _x }) >> "magazines")
		} forEach getArray(_weapon >> "muzzles");
		_dispersion = getNumber(_weapon >> "dispersion");
		{
			_dispersion =  getNumber(_weapon >> _x >> "dispersion")
		} forEach getArray (_weapon >> "modes");
		GET_CTRL(balca_WC_weapon_shortcut_IDC) ctrlSetText (_picture);
		_lb = parseText "<br/>";
		_text = composeText ["Class: ",str configName(_weapon),_lb,
			"DisplayName: ",str _displayName,_lb,
			"Dispersion: ",str _dispersion,_lb,_lb,
			 parseText _library];
		GET_CTRL(balca_WC_weap_info_IDC) ctrlSetStructuredText _text;
		lbClear GET_CTRL(balca_WC_magazinelist_IDC);
		{
			GET_CTRL(balca_WC_magazinelist_IDC) lbAdd (getText(configFile >> "cfgMagazines" >> _x >> "displayName"));
			GET_CTRL(balca_WC_magazinelist_IDC) lbSetData [(lbSize GET_CTRL(balca_WC_magazinelist_IDC))-1,configName(configFile >> "cfgMagazines" >> _x)];
			GET_CTRL(balca_WC_magazinelist_IDC) lbSetPicture [(lbSize GET_CTRL(balca_WC_magazinelist_IDC))-1,getText(configFile >> "cfgMagazines" >> _x >> "picture")];
		} forEach _magazines;

	};

case 2: {//addweapon
		_weapon = GET_SELECTED_DATA(balca_WC_weaplist_IDC);
		switch true do {
			case (getNumber(configFile >> "cfgWeapons" >> _weapon >> "ItemInfo" >> "type")==801): { player addUniform _weapon};
			case (getNumber(configFile >> "cfgWeapons" >> _weapon >> "ItemInfo" >> "type")==701): { player addVest _weapon};
			case (getNumber(configFile >> "cfgWeapons" >> _weapon >> "ItemInfo" >> "type")==605): { player addHeadgear _weapon};
			case (getNumber(configFile >> "cfgWeapons" >> _weapon >> "ItemInfo" >> "type")==603): { player addGoggles _weapon};
			case (getNumber(configFile >> "cfgWeapons" >> _weapon >> "ItemInfo" >> "type")>0): { player addItem _weapon};
			default {
				PG_set(MAGS,[]);
				[_weapon] call PG_get(FNC_ADD_WEAPON);
				PG_set(WEAPONS,weapons player);
			};
		};
	};

case 3: {//ammo info
		_mag = GET_SELECTED_DATA(balca_WC_magazinelist_IDC);
		_count = getNumber(configFile>>"CfgMagazines">>_mag>>"count");
		_displayName = getText (configFile >> "CfgMagazines" >> _mag >> "displayName");
		_initSpeed = getNumber(configFile >> "cfgMagazines" >> _mag >> "initSpeed");
		_shell = getText(configFile >> "cfgMagazines" >> _mag >> "ammo");
		_displayName = getText (configFile >> "CfgAmmo" >> _shell >> "displayName");
		_hit = getNumber(configFile >> "cfgAmmo" >> _shell >> "hit");
		_indirectHit = getNumber(configFile >> "cfgAmmo" >> _shell >> "indirectHit");
		_indirectHitRange = getNumber(configFile >> "cfgAmmo" >> _shell >> "indirectHitRange");
		_ACE_damage = getNumber(configFile >> "cfgAmmo" >> _shell >> "ACE_hit");
		_timeToLive = getNumber(configFile >> "cfgAmmo" >> _shell >> "timeToLive");
		_airFriction = getNumber(configFile >> "cfgAmmo" >> _shell >> "airFriction");

		_lb = parseText "<br/>";
		_text = composeText ["Class: ",str _mag,_lb,
			"Ammo class: ",str _shell,_lb,
			"DisplayName: ",str _displayName,_lb,
			"Count: ",str _count,_lb,
			"Damage: ", str _hit,_lb];
		if (_ACE_damage >0) then {
		_text = composeText [_text,"ACE damage: ",str _ACE_damage,_lb];
		};
		if (_indirectHit >0) then {
		_text = composeText [_text,"Indirect damage: ",str _indirectHit,_lb,"Explosion radius: ", str _indirectHitRange,_lb];
		};
		_text = composeText [_text,"InitSpeed: ",str _initSpeed,_text,"AirFriction: ",str _airFriction,_lb,"LifeTime: ", str _timeToLive];
		GET_CTRL(balca_WC_magazine_info_IDC) ctrlSetStructuredText _text;
	};

case 4: {//addMagazine
		_mag = GET_SELECTED_DATA(balca_WC_magazinelist_IDC);
		player addMagazine _mag;
		PG_set(MAGS,magazines player);
	};

case 5: {//weap to clipboard
	copyToClipboard (""""+GET_SELECTED_DATA(balca_WC_weaplist_IDC)+"""");
	};

case 6: {//ammo to clipboard
	copyToClipboard (""""+GET_SELECTED_DATA(balca_WC_magazinelist_IDC)+"""");
	};
};