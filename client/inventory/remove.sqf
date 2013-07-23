//	@file Name: remove.sqf
//	@file Author: MercyfulFate
//  @file Description: Remove an item from the inventory
//	@file Args: [id, qty]
//      id - the id of the item to remove
//      qty - the amount to remove
//  @file Return: The item in format [id, qty, name, use, dropobject, icon, max_qty]
#include "define.sqf"

private ["_id", "_qty"];
_id = _this select 0;
_qty = _this select 1;

private ["_item", "_current"];
_item = _id call mf_inventory_get;
_current = _item select QTY;
_item set [QTY, _current - _qty];