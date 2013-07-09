	class balca_debug_slider
	{
		idc = -1; 

		type = CT_XSLIDER; 
		style = 0x400	+ 0x10;
		shadow = 2;
		x = 0;
		y = 0;
		h = 0.029412;
		w = 0.4;
		color[] = {1, 1, 1, 0.4};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.2};
		arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
		thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
	};
	
	class balca_debug_control_group
	{
		idc = -1;
		type = 15;
		style = 0;
		colorBackground[] = {0, 0, 0, 0};
		class VScrollbar 
		{
			color[] = {1, 1, 1, 1};
			width = 0.021;
			autoScrollSpeed = -1;
			autoScrollDelay = 5;
			autoScrollRewind = 0;
		};
		
		class HScrollbar 
		{
			color[] = {1, 1, 1, 1};
			height = 0.028;
		};
		
		class ScrollBar
		{
			color[] = {1,1,1,0.6};
			colorActive[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,0.3};
			thumb = "#(argb,8,8,3)color(1,1,1,1)";
			arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
			arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
			border = "#(argb,8,8,3)color(1,1,1,1)";
		};
		x = 0; 
		w = 1;
		y = 0; 
		h = 1;
	};

	class balca_debug_combo
	{
		idc = -1;
		type = 4;
		style = 0;

		x = 0;
		y = 0;
		w = 0.12;
		h = str_height;

		font = FontM;
		sizeEx = 0.03;

		rowHeight = 0.1;
		wholeHeight = 0.4;

		class ScrollBar
		{
			color[] = {1,1,1,0.6};
			colorActive[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,0.3};
			thumb = "#(argb,8,8,3)color(1,1,1,1)";
			arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
			arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
			border = "#(argb,8,8,3)color(1,1,1,1)";
		};

		colorSelect[] = {1, 1, 1, 1};
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0.543, 0.5742, 0.4102, 0.9};
		colorSelectBackground[] = {0.40, 0.43, 0.28, 0.9};
		colorScrollbar[] = {0.2, 0.2, 0.2, 1};

		soundSelect[] = {"", 0.1, 1};
		soundExpand[] = {"", 0.1, 1};
		soundCollapse[] = {"", 0.1, 1};
		maxHistoryDelay = 1;

		arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
		arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
		color[] = {0.1, 0.1, 0.1, 1};
		colorActive[] = {0,0,0,1};
		colorDisabled[] = {0,0,0,0.3};
	};

	class balca_debug_text
	{
		idc = -1;
		type = CT_STATIC;
		style = ST_LEFT;
		x = 0.0; w = 0.3;
		y = 0.0; h = 0.03;
		sizeEx = 0.023;
		colorBackground[] = {0, 0, 0, 0};
		colorText[] = {0.85, 0.85, 0.85, 1};
		colorDisabled[] = {1,1,1,0.3};
		font = FontM;
		text = "";
	};

	class balca_debug_edit
	{
		type = CT_EDIT;
		style = ST_LEFT+ST_MULTI;
		idc = -1;
		font = FontM;
		sizeEx = 0.026;
		htmlControl = true;
		lineSpacing = 0.004;
		x = 0.0; w = 0.3;
		y = 0.0; h = 0.06;
		colorBackground[] = color_background_item;
		colorText[] = {0.85, 0.85, 0.85, 1};
		colorSelection[] = {1, 1, 1, 1};
		colorDisabled[] = {1,1,1,0.3};
		autocomplete = "scripting";
		text = "";
	};

	class balca_debug_image
	{
		idc = -1;
		type = CT_STATIC;
		style = ST_PICTURE+ST_KEEP_ASPECT_RATIO;
		x = 0.25; w = 0.1;
		y = 0.1; h = 0.1;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "";
		font = FontM;
		sizeEx = 0.032;
	};

	class balca_debug_btn
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

	class balca_debug_list
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
		font = FontM;
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

	class balca_debug_pict
	{
		idc = -1;
		type = CT_STATIC;
		style = ST_PICTURE;
		x = 0.25; w = 0.5;
		y = 0.1; h = 0.8;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0};
		text = "";
		font = FontM;
		sizeEx = 0.032;
	};

	class balca_debug_map {
		idc = -1;
		type=101;
		style=48;

		sizeEx = 0.026;

		moveOnEdges = 1;
		x = "SafeZoneXAbs";
		y = "SafeZoneY + 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		w = "SafeZoneWAbs";
		h = "SafeZoneH - 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		font = FontM;
		shadow = false;
		ptsPerSquareSea = 5;
		ptsPerSquareTxt = 3;
		ptsPerSquareCLn = 10;
		ptsPerSquareExp = 10;
		ptsPerSquareCost = 10;
		ptsPerSquareFor = 9;
		ptsPerSquareForEdge = 9;
		ptsPerSquareRoad = 6;
		ptsPerSquareObj = 9;
		showCountourInterval = 0;
		scaleMin = 0.001;
		scaleMax = 1.0;
		scaleDefault = 0.16;
		maxSatelliteAlpha = 0.85;
		alphaFadeStartScale = 0.35;
		alphaFadeEndScale = 0.4;
		colorBackground[] = {0.969, 0.957, 0.949, 1.0};
		colorText[] = {0.00, 0.00, 0.00, 1.00};		
		colorSea[] = {0.467, 0.631, 0.851, 0.5};
		colorForest[] = {0.624, 0.78, 0.388, 0.5};
		colorForestBorder[] = {0.0, 0.0, 0.0, 0.0};
		colorRocks[] = {0.0, 0.0, 0.0, 0.3};
		colorRocksBorder[] = {0.0, 0.0, 0.0, 0.0};
		colorLevels[] = {0.286, 0.177, 0.094, 0.5};
		colorMainCountlines[] = {0.572, 0.354, 0.188, 0.5};
		colorCountlines[] = {0.572, 0.354, 0.188, 0.25};
		colorMainCountlinesWater[] = {0.491, 0.577, 0.702, 0.6};
		colorCountlinesWater[] = {0.491, 0.577, 0.702, 0.3};
		colorPowerLines[] = {0.1, 0.1, 0.1, 1.0};
		colorRailWay[] = {0.8, 0.2, 0.0, 1.0};
		colorNames[] = {0.1, 0.1, 0.1, 0.9};
		colorInactive[] = {1.0, 1.0, 1.0, 0.5};
		colorOutside[] = {0.0, 0.0, 0.0, 1.0};
		colorTracks[] = {0.84, 0.76, 0.65, 0.15};
		colorTracksFill[] = {0.84, 0.76, 0.65, 1.0};
		colorRoads[] = {0.7, 0.7, 0.7, 1.0};
		colorRoadsFill[] = {1.0, 1.0, 1.0, 1.0};
		colorMainRoads[] = {0.9, 0.5, 0.3, 1.0};
		colorMainRoadsFill[] = {1.0, 0.6, 0.4, 1.0};
		colorGrid[] = {0.1, 0.1, 0.1, 0.6};
		colorGridMap[] = {0.1, 0.1, 0.1, 0.6};
		fontLabel = FontM;
		sizeExLabel = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		fontGrid = "TahomaB";
		sizeExGrid = 0.02;
		fontUnits = "TahomaB";
		sizeExUnits = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		fontNames = FontM;
		sizeExNames = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
		fontInfo = FontM;
		sizeExInfo = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		fontLevel = "TahomaB";
		sizeExLevel = 0.02;
		text = "#(argb,8,8,3)color(1,1,1,1)";
		
		class Legend {
			x = "SafeZoneX + 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			y = "SafeZoneY + safezoneH - 4.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			font = FontM;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			colorBackground[] = {1, 1, 1, 0.5};
			color[] = {0, 0, 0, 1};
		};
		
		class Task {
			icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
			iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
			iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
			iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
			iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
			color[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
			colorCreated[] = {1, 1, 1, 1};
			colorCanceled[] = {0.7, 0.7, 0.7, 1};
			colorDone[] = {0.7, 1, 0.3, 1};
			colorFailed[] = {1, 0.3, 0.2, 1};
			size = 27;
			importance = 1;
			coefMin = 1;
			coefMax = 1;
		};

		class Waypoint {
			icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
			size = 20;
			color[] = {0, 0.900000, 0, 1};
			importance = "1.2 * 16 * 0.05";
			coefMin = 0.900000;
			coefMax = 4;
		};	
		
		class WaypointCompleted {
			icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
			size = 20;
			color[] = {0, 0.900000, 0, 1};
			importance = "1.2 * 16 * 0.05";
			coefMin = 0.900000;
			coefMax = 4;
		};

		class ActiveMarker {
			icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
			size = 20;
			color[] = {0, 0.900000, 0, 1};
			importance = "1.2 * 16 * 0.05";
			coefMin = 0.900000;
			coefMax = 4;
		};		

		class CustomMark {
			icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
			size = 24;
			importance = 1;
			coefMin = 1;
			coefMax = 1;
			color[] = {0, 0, 0, 1};
		};
		
		class Command {
			icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
			size = 18;
			importance = 1;
			coefMin = 1;
			coefMax = 1;
			color[] = {1, 1, 1, 1};
		};
		
		class Bush {
			icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
			color[] = {0.45, 0.64, 0.33, 0.4};
			size = 14/2;
			importance = 0.2 * 14 * 0.05 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Rock {
			icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
			color[] = {0.1, 0.1, 0.1, 0.8};
			size = 12;
			importance = 0.5 * 12 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class SmallTree {
			icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
			color[] = {0.45, 0.64, 0.33, 0.4};
			size = 12;
			importance = 0.6 * 12 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Tree {
			icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
			color[] = {0.45, 0.64, 0.33, 0.4};
			size = 12;
			importance = 0.9 * 16 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class busstop {
			icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1.0;
			color[] = {1, 1, 1, 1};
		};
		
		class fuelstation {
			icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1.0;
			color[] = {1, 1, 1, 1};
		};
		
		class hospital {
			icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1.0;
			color[] = {1, 1, 1, 1};
		};
		
		class church {
			icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1.0;
			color[] = {1, 1, 1, 1};
		};
		
		class lighthouse {
			icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1.0;
			color[] = {1, 1, 1, 1};
		};
		
		class power {
			icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1.0;
			color[] = {1, 1, 1, 1};
		};
		
		class powersolar {
			icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1.0;
			color[] = {1, 1, 1, 1};
		};
		
		class powerwave {
			icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1.0;
			color[] = {1, 1, 1, 1};
		};
		
		class powerwind {
			icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1.0;
			color[] = {1, 1, 1, 1};
		};
		
		class quay {
			icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1.0;
			color[] = {1, 1, 1, 1};
		};
		
		class shipwreck {
			icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1.0;
			color[] = {1, 1, 1, 1};
		};
		
		class transmitter {
			icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1.0;
			color[] = {1, 1, 1, 1};
		};
		
		class watertower {
			icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1.0;
			color[] = {1, 1, 1, 1};
		};
		
		class Cross {
			icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1.0;
			color[] = {0, 0, 0, 1};
		};
		
		class Chapel {
			icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1.0;
			color[] = {0, 0, 0, 1};
		};
		
		class Bunker {
			icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
			size = 14;
			importance = 1.5 * 14 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
			color[] = {0, 0, 0, 1};
		};
		
		class Fortress {
			icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
			size = 16;
			importance = 2 * 16 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
			color[] = {0, 0, 0, 1};
		};
		
		class Fountain {
			icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
			size = 11;
			importance = 1 * 12 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
			color[] = {0, 0, 0, 1};
		};
		
		class Ruin {
			icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
			size = 16;
			importance = 1.2 * 16 * 0.05;
			coefMin = 1;
			coefMax = 4;
			color[] = {0, 0, 0, 1};
		};
		
		class Stack {
			icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
			size = 20;
			importance = 2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
			color[] = {0, 0, 0, 1};
		};
		
		class Tourism {
			icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
			size = 16;
			importance = 1 * 16 * 0.05;
			coefMin = 0.7;
			coefMax = 4;
			color[] = {0, 0, 0, 1};
		};
		
		class ViewTower {
			icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
			size = 16;
			importance = 2.5 * 16 * 0.05;
			coefMin = 0.5;
			coefMax = 4;
			color[] = {0, 0, 0, 1};
		};
	};