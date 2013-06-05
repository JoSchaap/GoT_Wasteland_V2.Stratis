//  @file Version: 1.0
//	@file Name: fn_fitsInInventory.sqf
//	@file Author: AgentRev
//	@file Created: 05/05/2013 00:22
//	@file Args: _player, _item

private ["_player", "_item", "_totalCapacity","_containerClass","_uniform","_vest","_backpack","_uniformCapacity","_vestCapacity","_backpackCapacity","_uniformFree","_vestFree","_backpackFree","_size","_itemSize"];

_player = _this select 0;
_item = _this select 1;

_uniformFree = 0;
_vestFree = 0;
_backpackFree = 0;

_uniform = uniform _player;

if (_uniform != "") then
{
	_containerClass = getText (configFile >> "CfgWeapons" >> _uniform >> "ItemInfo" >> "containerClass");
	_uniformCapacity = getNumber (configFile >> "CfgVehicles" >> _containerClass >> "maximumLoad");
	_uniformFree = _uniformCapacity;
	
	if (_uniformCapacity != 0) then
	{
		{
			_size = getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
			if (_size == 0) then { _size = getNumber (configFile >> "CfgMagazines" >> _x >> "mass") };
			if (_size == 0) then { _size = getNumber (configFile >> "CfgWeapons" >> _x >> "WeaponSlotsInfo" >> "mass") };
				
			if (_size != 0) then
			{
				_uniformFree = _uniformFree - _size;
			};
			
		} forEach uniformItems _player;
	};
};


_vest = vest _player;

if (_vest != "") then
{
	_containerClass = getText (configFile >> "CfgWeapons" >> _vest >> "ItemInfo" >> "containerClass");
	_vestCapacity = getNumber (configFile >> "CfgVehicles" >> _containerClass >> "maximumLoad");
	_vestFree = _vestCapacity;
	
	if (_vestCapacity != 0) then
	{
		{
			_size = getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
			if (_size == 0) then { _size = getNumber (configFile >> "CfgMagazines" >> _x >> "mass") };
			if (_size == 0) then { _size = getNumber (configFile >> "CfgWeapons" >> _x >> "WeaponSlotsInfo" >> "mass") };
				
			if (_size != 0) then
			{
				_vestFree = _vestFree - _size;
			};
			
		} forEach vestItems _player;
	};
};


_backpack = backpack _player;

if (_backpack != "") then
{
	_backpackCapacity = getNumber (configFile >> "CfgVehicles" >> _backpack >> "maximumLoad");
	_backpackFree = _backpackCapacity;
	
	if (_backpackCapacity != 0) then
	{
		{
			_size = getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
			if (_size == 0) then { _size = getNumber (configFile >> "CfgMagazines" >> _x >> "mass") };
			if (_size == 0) then { _size = getNumber (configFile >> "CfgWeapons" >> _x >> "WeaponSlotsInfo" >> "mass") };
				
			if (_size != 0) then
			{
				_backpackFree = _backpackFree - _size;
			};
			
		} forEach (backpackItems _player)
	};
};


_itemSize = getNumber (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "mass");
if (_itemSize == 0) then { _itemSize = getNumber (configFile >> "CfgMagazines" >> _item >> "mass") };
if (_itemSize == 0) then { _itemSize = getNumber (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "mass") };

// Return boolean

(_itemSize != 0 && {_itemSize <= _uniformFree || _itemSize <= _vestFree || _itemSize <= _backpackFree})
