//	@file Name: takeable.sqf
//	@file Author: MercyfulFate
//  @file Description: Check to see if an item on the ground is takeable
//	@file Args: id - The id of the item to look for.
//  @file Return: True if takeable

 #include "define.sqf"
private ["_id", "_item", "_type", "_takeable"];
_id = _this;
_item = _id call mf_inventory_get;
_type = _item select OBJECT;
_takeable = objNull;
{
	switch (true) do {
	    case (_id call mf_inventory_is_full): {};
	    case (_x getVariable ["mf_item_id", ""] != _id): {};
	    default {_takeable = _x};
	};
} forEach (nearestObjects [player, [_type], MF_INVENTORY_TAKE_DISTANCE]);
_takeable;