#include "defs_ui.hpp"
#include "defs.hpp"

class balca_loader_main
{
	idd = balca_loader_main_IDD;
	name = "balca_loader_main";
	movingEnable = false;
	
	controlsBackground[] = {balca_loader_background};
	objects[] = {};
	controls[] =
	{
		balca_loader_vehicle_shortcut,
		balca_loader_vehicle_list_desc,
		balca_loader_turret_list_desc,
		balca_loader_weapon_list_desc,
		balca_loader_vehicle_list,
		balca_loader_turret_list,
		balca_loader_weapon_list,
		balca_loader_capacity,
		balca_loader_default_loadout_desc,
		balca_loader_default_loadout,
		balca_loader_compatible_magazines_desc,
		balca_loader_current_magazines_desc,
		balca_loader_ammo_info_desc,
		balca_loader_compatible_magazines,
		balca_loader_current_magazines,
		balca_loader_ammo_info,
		balca_loader_restore_btn,
		balca_loader_load_btn,
		balca_loader_unload_btn,
		balca_loader_close_btn
	};
	
//background
	class balca_loader_background
	{
		idc = -1;
		type = CT_STATIC;
		style = 512;
		x = safezoneX; w = display_weight;
		y = safezoneY; h = display_height-offset_bottom;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0.1, 0.1,0.1, 0.7}; 
		background = 1;
		text = "";
		font = "PuristaMedium";
		sizeEx = 0.032;
	};

//abstract classes

	class balca_loader_text
	{
		idc = -1;
		type = CT_STATIC;
		style = ST_LEFT;
		x = 0.0; w = 0.3;
		y = 0.0; h = 0.03;
		sizeEx = 0.023;
		colorBackground[] = {0.5, 0.5, 0.5, 0};
		colorText[] = {0.85, 0.85, 0.85, 1};
		font = "PuristaMedium";
		text = "";
	};

	class balca_loader_image
	{
		idc = -1;
		type = CT_STATIC;
		style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
		x = 0.25; w = 0.1;
		y = 0.1; h = 0.1;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "";
		font = "PuristaMedium";
		sizeEx = 0.032;
	};

	class balca_loader_btn
	{
		idc = -1;
		type = 1;
		style = 2;
		
		text = "btn";
		action = "";
		
		x = 0;
		y = 0;
		
		w = 0.23;
		h = 0.04;
		
		shadow = 2;
		font = FontM;
		size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		colorText[] = {1, 1, 1, 1.0};
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
		colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1};
		colorBackgroundDisabled[] = {0.95, 0.95, 0.95, 1};
		colorDisabled[] = {1, 1, 1, 0.25};
		offsetX = 0.003;
		offsetY = 0.003;
		offsetPressedX = 0.002;
		offsetPressedY = 0.002;
		colorFocused[] = {1, 1, 1, 0.5};
		colorFocused2[] = {1, 1, 1, 0.1};
		colorShadow[] = {0, 0, 0, 1};
		colorBorder[] = {0, 0, 0, 1};
		borderSize = 0.0;
		soundEnter[] = {"\A3\ui_f\data\sound\onover", 0.09, 1};
		soundPush[] = {"\A3\ui_f\data\sound\new1", 0.0, 0};
		soundClick[] = {"\A3\ui_f\data\sound\onclick", 0.07, 1};
		soundEscape[] = {"\A3\ui_f\data\sound\onescape", 0.09, 1};	
		period = 1.2;
	};

	class balca_loader_list
	{
		type = CT_LISTBOX;
		style = ST_LEFT;
		idc = -1;
		text = "";
		w = 0.275;
		h = 0.04;
		colorSelect[] = {1, 1, 1, 1};
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0.8,0.8,0.8,1};
		colorSelectBackground[] = {0.40, 0.43, 0.28, 0.5};
		colorScrollbar[] = {0.2, 0.2, 0.2, 1};
		wholeHeight = 0.45;
		rowHeight = 0.04;
		color[] = {0.30, 0.32, 0.21, 1};
		colorActive[] = {0,0,0,1};
		colorDisabled[] = {0,0,0,0.3};
		font = "PuristaMedium";
		sizeEx = 0.023;
		soundSelect[] = {"",0.1,1};
		soundExpand[] = {"",0.1,1};
		soundCollapse[] = {"",0.1,1};
		maxHistoryDelay = 1;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;

		class ScrollBar
		{
			color[] = {0.30, 0.32, 0.21, 0.6};
			colorActive[] = {0.30, 0.32, 0.21, 1};
			colorDisabled[] = {0.30, 0.32, 0.21, 0.3};
			thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
			arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		};
	};

	class balca_loader_pict
	{
		idc = -1;
		type = CT_STATIC;
		style = ST_PICTURE;
		x = 0.25; w = 0.5;
		y = 0.1; h = 0.8;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "";
		font = "PuristaMedium";
		sizeEx = 0.032;
	};

//controls

	class balca_loader_vehicle_list_desc : balca_loader_text
	{
		x = safezoneX + border_offsetX + column_weight; 
		w = column_weight - border_offsetX;
		y = safezoneY + border_offsetY; 
		h = str_height;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "Vehicles";
	};

	class balca_loader_turret_list_desc : balca_loader_text
	{
		x = safezoneX + border_offsetX + column_weight*2; 
		w = column_weight - border_offsetX;
		y = safezoneY + border_offsetY; 
		h = str_height;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "Turrets";
	};

	class balca_loader_weapon_list_desc : balca_loader_text
	{
		x = safezoneX + border_offsetX + column_weight*3; 
		w = column_weight - border_offsetX;
		y = safezoneY + border_offsetY; 
		h = str_height;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "Weapons";
	};

	class balca_loader_capacity : balca_loader_text
	{
		idc = balca_loader_capacity_IDC;
		x = safezoneX + border_offsetX + column_weight*3; 
		w = column_weight - border_offsetX;
		y = display_height/2 - str_height; 
		h = str_height;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "Capacity";
	};

	class balca_loader_default_loadout_desc : balca_loader_text
	{
		x = safezoneX + border_offsetX; 
		w = column_weight - border_offsetX;
		y = display_height/2 + border_offsetY*2; 
		h = str_height;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "Default loadout";
	};


	class balca_loader_compatible_magazines_desc : balca_loader_text
	{
		x = safezoneX + border_offsetX + column_weight*1; 
		w = column_weight - border_offsetX;
		y = display_height/2 + border_offsetY*2; 
		h = str_height;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "Compatible magazines";
	};

	class balca_loader_current_magazines_desc : balca_loader_text
	{
		x = safezoneX + border_offsetX + column_weight*2; 
		w = column_weight - border_offsetX;
		y = display_height/2 + border_offsetY*2; 
		h = str_height;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "Current magazines";
	};

	class balca_loader_ammo_info_desc : balca_loader_text
	{
		x = safezoneX + border_offsetX + column_weight*3; 
		w = column_weight - border_offsetX;
		y = display_height/2 + border_offsetY*2; 
		h = str_height;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "Ammo info";
	};

	class balca_loader_ammo_info : balca_loader_text
	{
		idc = balca_loader_ammo_info_IDC;
		type = CT_STRUCTURED_TEXT;
		size = 0.023;
		x = safezoneX + border_offsetX + column_weight*3; 
		w = column_weight - border_offsetX;
		y = display_height/2 + border_offsetY*2 + offset_top; 
		h = display_height/2 - offset_bottom - (safezoneY + border_offsetY + offset_top);
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "";
	};
////////
	class balca_loader_vehicle_shortcut : balca_loader_image
	{
		idc = balca_loader_vehicle_shortcut_IDC;
		x = safezoneX + border_offsetX; 
		w = column_weight - border_offsetX;
		y = safezoneY + border_offsetY + offset_top; 
		h = img_height;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "";
	};
////////
	class balca_loader_vehicle_list : balca_loader_list
	{
		idc = balca_loader_vehicle_list_IDC;
		x = safezoneX + border_offsetX + column_weight*1; 
		w = column_weight - column_div;
		y = safezoneY + border_offsetY + offset_top; 
		h = display_height/2 - offset_bottom - (safezoneY + border_offsetY + offset_top);
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		onLBSelChanged= "[_this] call c_proving_ground_reloader_fnc_fill_turret_list;";
		onLBDblClick = "[_this] call c_proving_ground_reloader_fnc_fill_turret_list;";
	};

	class balca_loader_turret_list : balca_loader_list
	{
		idc = balca_loader_turret_list_IDC;
		x = safezoneX + border_offsetX + column_weight*2; 
		w = column_weight - column_div;
		y = safezoneY + border_offsetY + offset_top; 
		h = display_height/2 - offset_bottom - (safezoneY + border_offsetY + offset_top);
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		onLBSelChanged= "[_this] call c_proving_ground_reloader_fnc_fill_weapon_list;";
		onLBDblClick = "[_this] call c_proving_ground_reloader_fnc_fill_weapon_list;";
	};

	class balca_loader_weapon_list : balca_loader_list
	{
		idc = balca_loader_weapon_list_IDC;
		x = safezoneX + border_offsetX + column_weight*3; 
		w = column_weight - column_div;
		y = safezoneY + border_offsetY + offset_top; 
		h = display_height/2 - offset_bottom - (safezoneY + border_offsetY + offset_top);
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		onLBSelChanged= "[_this] call c_proving_ground_reloader_fnc_fill_compatible_magazines_list;[_this] call c_proving_ground_reloader_fnc_fill_current_magazines_list;";
		onLBDblClick = "[_this] call c_proving_ground_reloader_fnc_fill_compatible_magazines_list;[_this] call c_proving_ground_reloader_fnc_fill_current_magazines_list;";
	};

	class balca_loader_default_loadout : balca_loader_list
	{
		idc = balca_loader_default_loadout_IDC;
		x = safezoneX + border_offsetX; 
		w = column_weight - column_div;
		y = display_height/2 + border_offsetY*2 + offset_top; 
		h = display_height/2 - offset_bottom - (safezoneY + border_offsetY + offset_top);
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		onLBSelChanged= "[_this] call c_proving_ground_reloader_fnc_ammo_info;";
	};

	class balca_loader_compatible_magazines : balca_loader_list
	{
		idc = balca_loader_compatible_magazines_IDC;
		x = safezoneX + border_offsetX + column_weight*1; 
		w = column_weight - column_div;
		y = display_height/2 + border_offsetY*2 + offset_top; 
		h = display_height/2 - offset_bottom - (safezoneY + border_offsetY + offset_top);
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		onLBSelChanged= "[_this] call c_proving_ground_reloader_fnc_ammo_info;";
		onLBDblClick = "[_this] call c_proving_ground_reloader_fnc_add_magazine;";
	};

	class balca_loader_current_magazines : balca_loader_list
	{
		idc = balca_loader_current_magazines_IDC;
		x = safezoneX + border_offsetX + column_weight*2; 
		w = column_weight - column_div;
		y = display_height/2 + border_offsetY*2 + offset_top; 
		h = display_height/2 - offset_bottom - (safezoneY + border_offsetY + offset_top);
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		onLBSelChanged= "[_this] call c_proving_ground_reloader_fnc_ammo_info;";
		onLBDblClick = "[_this] call c_proving_ground_reloader_fnc_remove_magazine;";
	};
////////
	class balca_loader_restore_btn : balca_loader_btn
	{
		idc = balca_loader_restore_btn_IDC;
		x = safezoneX + border_offsetX; w = 0.16;
		y = display_height - 0.16;
		text = "Restore";
		action = "call c_proving_ground_reloader_fnc_restore_loadout;"; 
	};

	class balca_loader_load_btn : balca_loader_btn
	{
		idc = balca_loader_load_btn_IDC;
		x = safezoneX + border_offsetX + column_weight*1; w = 0.16;
		y = display_height - 0.16;
		text = "Load";
		action = "call c_proving_ground_reloader_fnc_add_magazine;"; 
	};

	class balca_loader_unload_btn : balca_loader_btn
	{
		idc = balca_loader_unload_btn_IDC;
		x = safezoneX + border_offsetX + column_weight*2; w = 0.16;
		y = display_height - 0.16;
		text = "Unload";
		action = "call c_proving_ground_reloader_fnc_remove_magazine"; 
	};

	class balca_loader_close_btn : balca_loader_btn
	{
		x = safezoneX + border_offsetX + column_weight*3; w = 0.16;
		y = display_height - 0.16;
		text = "Close";
		action = "closeDialog 0;"; 
	};
};


