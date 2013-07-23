//	@file Name: add.sqf
//	@file Author: MercyfulFate
//	@file Args: [id, qty]
//      id = item id to add
//      qty = number to add
#include "define.sqf";
private ["_id", "_qty"];
_id = _this select 0;
_qty = _this select 1;

private ["_item", "_current"];
_item = _id call mf_inventory_get;
_current = _item select QTY;
_item set [QTY, _current + _qty];