//	@file Name: set.sqf
//	@file Author: MercyfulFate
//  @file Description: Set the values of an item in the inventory
//	@file Args: an item to set in the format [id, qty, name, use, dropobject, icon, max_qty]
_new = [];
_done = false;
{
	if (_x select 0 == (_this select 0)) then {
		_new = _new + [_this];
		_done = true;
	} else {
		_new = _new + [_x];	
	};
} forEach mf_inventory;

if not _done then { _new = _new + [_this]};

mf_inventory = _new;