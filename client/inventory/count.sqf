//	@file Name: count.sqf
//	@file Author: MercyfulFate
//	@file Args: _id - The item id to return the count of

#include "define.sqf"
_item = _this call mf_inventory_get;
_item select QTY;