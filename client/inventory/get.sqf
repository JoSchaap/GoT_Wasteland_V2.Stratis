//	@file Name: get.sqf
//	@file Author: MercyfulFate
//  @file Description: Get an Item in the inventory
//	@file Args: id - The id of the item to get.
//  @file Return: The item in format [id, qty, name, use, dropobject, icon, max_qty]

private "_result";
_result = objNull;
{
	if (_x select 0 == _this) exitWith {_result = _x;};
} forEach mf_inventory;
_result;