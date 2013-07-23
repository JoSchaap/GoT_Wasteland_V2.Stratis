//	@file Name: is_full.sqf
//	@file Author: MercyfulFate
//  @file Description: Check if you can hold more on an item
//	@file Args: The Id of the item to check
//  @file Return: true if you can not hold any more items (of that type)

#include "define.sqf"
private "_item";
_item = _this call mf_inventory_get;
(_item select QTY) >= (_item select MAX);