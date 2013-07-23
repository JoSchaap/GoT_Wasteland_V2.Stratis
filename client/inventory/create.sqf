//	@file Name: create.sqf
//	@file Author: MercyfulFate
//  @file Description: Create an Item "definition" in the players inventory
//	@file Args: [id, name, use, object, icon, max]
//      id = item id to add
//      name = the Text that the player sees
//      use = the function that is called when the player presses "use"
//           Note: must return true/false (true to remove 1x item from the inventory)
//      object = the item's "ground object type" that is created when dropped.
//      icon = the icon to use for the item

#include "define.sqf"
private ["_item", "_label", "_condition", "_action"];
_item = [];
_item set [ID, _this select 0];
_item set [QTY, 0];
_item set [NAME, _this select 1];
_item set [USE, _this select 2];
_item set [OBJECT, _this select 3];
_item set [ICON, _this select 4];
_item set [MAX, _this select 5];
_item call mf_inventory_set;

_label = format ['<img image="%1" width="32" height="32" /> Take %2', _item select 5, _item select 2];
_condition = format['not isNull ("%1" call mf_inventory_takeable);', _item select 0];
_action = [_label, mf_inventory_take, _item select 0, 1, false, false, "", _condition];
[format["take-%1", _this select 0], _action] call mf_player_actions_set;