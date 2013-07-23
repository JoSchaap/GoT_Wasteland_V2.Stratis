//	@file Name: take.sqf
//	@file Author: MercyfulFate
//  @file Description: Take (pickup) an Item from the ground
//	@file Args: [player, player, actionid, itemid] - itemid of the item to pickup.

 #include "mutex.sqf"
private ["_id", "_obj"];

_id = _this select 3;
_obj = _id call mf_inventory_takeable;
if not(isNull _obj) then {
	MUTEX_LOCK_OR_FAIL;
	deleteVehicle _obj;
	[_id,1] call mf_inventory_add;
	MUTEX_UNLOCK;
};