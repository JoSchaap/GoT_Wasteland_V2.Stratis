/** Drop an Item
 * 
 * The Inventory System takes care of all the logic around dropping an item,
 * and as such, is quite simplistic. At the moment, you only need to tell it
 * what object to create on the ground, which is done when you create/define
 * the item. see init.sqf for a simple example.
 * 
 * 
 * This operates under the wasteland mutex.
 * This only drops 1 item at a time
 * 
 * @author MercyfulFate
 * @param id {string} - the id of the item
 */

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