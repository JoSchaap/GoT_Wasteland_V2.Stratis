//	@file Name: drop.sqf
//	@file Author: MercyfulFate
//  @file Description: Drop an Item
//	@file Args: _id - the id of the item to drop.

#include "mutex.sqf";
#include "define.sqf";

private ["_id", "_item", "_type"];
_id = _this;
_item = _id call mf_inventory_get;
_type = _item select OBJECT;

if (_item select QTY <= 0) exitWith {
	hint format["you have no %1 to drop", _item select NAME];
};

private ["_obj"];
MUTEX_LOCK_OR_FAIL;
_obj = _type createVehicle position player;
_obj setVariable ["mf_item_id", _id, true];
_obj = _obj setPos position player;
[_id, 1] call mf_inventory_remove;
MUTEX_UNLOCK;