//	@file Name: is_full.sqf
//	@file Author: MercyfulFate
//  @file Description: Check if you can hold more on an item
//	@file Args: The Id of the item to check
//  @file Return: true if you can not hold any more items (of that type)

#include "define.sqf"
private ["_item", "_full"];
_full = true;
_item = _this call mf_inventory_get;
_max = _item select MAX;
switch (typeName _max) do {
    case "SCALAR": {
		_full = _max <= (_item select QTY);
    };
    case "CODE": {
        _full = [] call _max;
    };
};
_full;