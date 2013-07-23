//	@file Name: init.sqf
//	@file Author: MercyfulFate
//  @file Description: Initialize the inventory system
//	@file Args: the path to the directoy holding this file
#define compile(file) [MF_INVENTORY_PATH, file] call mf_compile

mf_inventory_mutex = false;

MF_INVENTORY_PATH = _this;
MF_INVENTORY_TAKE_DISTANCE = 5;

// initialize players inventory
mf_inventory = [];
mf_inventory_all = {mf_inventory};
mf_inventory_get = compile("get.sqf");
mf_inventory_set = compile("set.sqf");
mf_inventory_is_full = compile("is_full.sqf");
mf_inventory_create = compile("create.sqf");
mf_inventory_add = compile("add.sqf");
mf_inventory_remove = compile("remove.sqf");
mf_inventory_drop = compile("drop.sqf");
mf_inventory_takeable = compile("takeable.sqf");
mf_inventory_take = compile("take.sqf");
mf_inventory_use = compile("use.sqf");
mf_inventory_count = compile("count.sqf");