//	@file Name: use.sqf
//	@file Author: MercyfulFate
//  @file Description: Use an item in the inventory
//	@file Args: id - The id of the item to use.
//  Note: this blocks untill the items "use" function has completed.
#include "define.sqf"
#include "mutex.sqf"
private ["_id","_item", "_remove"];
_id = _this;
_item = _id call mf_inventory_get;

MUTEX_LOCK_OR_FAIL;
_remove = call (_item select USE);
if _remove then {[_id, 1] call mf_inventory_remove};
MUTEX_UNLOCK;