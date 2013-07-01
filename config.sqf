//	@file Version: 2
//	@file Name: config.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap

                                                                                                
//Gunstore Weapon List - Gun Store Base List
// Text name, classname, buy cost, sell amount
weaponsArray = [
		//Handgun
	["ACP-C2","hgun_ACPC2_F",90,50],
	["P07","hgun_P07_F",70,40],
        ["Rook-40","hgun_Rook40_F",70,40], 
	//SMG's
	["SMG (9mm)","SMG_02_F",100,50],
	["SMG (46ACP)","SMG_01_F",100,50],
	["MK20 (5.56)","arifle_MK20_F",140,60],
	["MK20C (5.56)","arifle_MK20C_F",150,65],
    	//Underwater Gun
	["SDAR (underwater)","arifle_SDAR_F",110,20],
    	//Assault Rifle
	["TRG-21","arifle_TRG21_F",160,50],
    ["TRG-20","arifle_TRG20_F",150,50],
	["MX","arifle_MX_F",250,100],
    ["MXC","arifle_MXC_F",260,100],
	["MXM","arifle_MXM_F",270,100], 
    ["Katiba","arifle_Katiba_F",250,100],
    ["Katiba Carabine","arifle_Katiba_C_F",275,120],
    ["MX 3GL","arifle_MX_GL_F",270,120],
    ["Katiba GL","arifle_Katiba_GL_F",270,120],
	["TRG-21 EGLM","arifle_TRG21_GL_F",190,90],
    	//Light Machine Gun
    ["MX SW","arifle_MX_SW_F",300,120],
    ["Mk200 LMG","LMG_Mk200_F",300,120],
    ["Zafir LMG (7.62)","LMG_Zafir_F",430,220],
    	//Rocket
    ["NLAWr","launch_NLAW_F",300,120],
    ["RPG-42 Alamut","launch_RPG32_F",300,120],
    ["Titan (short)","launch_Titan_short_F",450,190],
    ["Titan","launch_Titan_F",500,320],
    	//Sniper
    ["EBR","srifle_EBR_F",375,150],
    ["Lynx 12.7c GM6","srifle_GM6_SOS_F",1500,650],
    ["M320 LRR Rifle","srifle_LRR_SOS_F",1500,650]
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = [
	["Laserdes. Battery","Laserbatteries",30],
	["9mm 16Rnd Mag","16Rnd_9x21_Mag",12],
	["9mm 30Rnd Mag","30Rnd_9x21_Mag",22],
	["9Rnd 45ACP Mag","9Rnd_45ACP_Mag",12],
	["30Rnd 45ACP Mag","30Rnd_45ACP_Mag_SMG_01",22],
	["5.56mm 20Rnd (U.W.) Mag","20Rnd_556x45_UW_mag",8],
	["5.56mm 30Rnd STANAG Mag","30Rnd_556x45_Stanag",14],
    	["6.5mm 30Rnd CL Mag","30Rnd_65x39_caseless_mag",30],
	["6.5mm 100Rnd Belt","100Rnd_65x39_caseless_mag_Tracer",120],
	["6.5mm 200Rnd Belt","200Rnd_65x39_cased_Box",190],
	["7.62mm 150Rnd Belt","150Rnd_762x51_Box",200],
	["7.62mm 20Rnd Mag","20Rnd_762x51_Mag",45],
	["12.7mm 5Rnd Mag","5Rnd_127x108_Mag",175],
	["408 7Rnds LRR","7Rnd_408_Mag",175],
	["GL Flare 40mm (white)","UGL_FlareWhite_F",45],
	["GL Flare 40mm (green)","UGL_FlareGreen_F",45],
	["GL Flare 40mm (Red)","UGL_FlareRed_F",45],
	["GL Flare 40mm (Yellow)","UGL_FlareYellow_F",45],
	["GL Flare 40mm (Cir)","UGL_FlareCIR_F",45],
	["NLAW Missile","NLAW_F",140],
    ["RPG32 Missile","RPG32_F",120],
    ["RPG32 AA Missile","RPG32_AA_F",140],
    ["Titan Missile (AA)","Titan_AA",160],
    ["Titan(s) Missile (AT)","Titan_AT",160],
    ["Titan(s) Missile (AP)","Titan_AP",160],
	["Explosive Charge","DemoCharge_Remote_Mag",250],
    ["Explosive Satchel","SatchelCharge_Remote_Mag",250],
    ["AT Mine","ATMine_Range_Mag",250],
    ["M6 SLAM Mine","SLAMDirectionalMine_Wire_Mag",250],
    ["Claymore Charge","ClaymoreDirectionalMine_Remote_Mag",250],
    ["APERS Mine","APERSMine_Range_Mag",250],
    ["APERS Bounding Mine","APERSBoundingMine_Range_Mag",250],
    ["APERS Tripwire Mine","APERSTripMine_Wire_Mag",250]
];

//Gun Store Equipment List
//Text name, classname, buy cost
accessoriesArray = [
	["GPS","ItemGPS", 30,"item"],
	["Binoculars","Binocular", 20,"binoc"],
//	["NV Goggles","NVGoggles", 100,"item"],
	["Range Finder","Rangefinder", 250,"binoc"],
	["Laser Designator","Laserdesignator", 300,"binoc"],
    ["First Aid","FirstAidKit", 20,"item"],
    ["Medkit","Medikit", 150,"item"],
    ["Toolkit","ToolKit", 150,"item"],
  	["Suppressor 9mm","muzzle_snds_L", 50,"item"],
    ["Suppressor 5.56mm","muzzle_snds_M", 90,"item"],
    ["Suppressor 6.5mm","muzzle_snds_H", 150,"item"],
    ["Suppressor 6.5mm(LMG)","muzzle_snds_H_MG", 150,"item"],
	["Suppressor 7.62mm","muzzle_snds_B", 150,"item"],
    ["Flash Light","acc_flashlight", 40,"item"],
    ["Holosight","optic_Holosight", 90,"item"],
	["ACO Sight","optic_Aco", 80,"item"],
    ["ACO Sight(Green)","optic_ACO_grn", 80,"item"], 
	["RCO Sight","optic_Hamr", 190,"item"],
    ["ARCO Sight","optic_Arco", 190,"item"],
    ["MRCO Sight","optic_MRCO", 190,"item"],
    ["SOS Sight(LR)","optic_SOS", 290,"item"],
    ["Backpack (Large)","B_Bergen_Base", 200,"backpack"],
    ["Backpack (Extra Large)","B_Carryall_Base", 350,"backpack"], 
    ["Carrier GL Rig (Green)","V_PlateCarrierGL_rgr", 70,"vest"],
    ["Carrier Lite (Coyote)","V_PlateCarrier1_cbr", 70,"vest"],
    ["Carrier Lite (Green)","V_PlateCarrier1_rgr", 70,"vest"],
    ["Carrier Rig (Green)","V_PlateCarrier2_rgr", 70,"vest"],
    ["Chest Rig (Khaki)","V_Chestrig_khk", 70,"vest"],
    ["Chest Rig (Green)","V_ChestrigB_rgr", 70,"vest"],
//  ["Slash Bandolier (Coyote)","V_BandollierB_cbr", 100,"vest"],
//  ["Slash Bandolier (Khaki)","V_BandollierB_khk", 100,"vest"],
    ["Tactical Vest (Brown)","V_TacVest_brn", 70,"vest"],
    ["Tactical Vest (Khaki)","V_TacVest_khk", 70,"vest"],
    ["Tactical Vest (Olive)","V_TacVest_oli", 70,"vest"],
//	["Combat Fatigues (MTP)","U_B_CombatUniform_mcam", 100,"uni"],
//  ["Combat Fatigues (Tee)","U_B_CombatUniform_mcam_tshirt", 100,"uni"],
	//diving gear
	["Dive Goggles","G_Diving", 20,"gogg"],
    ["Dive Rebreather(BLUEFOR)","V_RebreatherB", 50,"vest"],
	["Dive Rebreather(OPFOR)","V_RebreatherIR", 50,"vest"],
	["Dive Rebreather(INDEP.)","V_RebreatherIA", 50,"vest"],
    ["Dive Wetsuit(BLUEFOR)","U_B_Wetsuit", 50,"uni"],
	["Dive Wetsuit(OPFOR)","U_O_Wetsuit", 50, "uni"],
	["Dive Wetsuit(INDEP.)","U_I_Wetsuit", 50, "uni"],
    ["Ghillie suit(BLUEFOR)","U_B_Ghilliesuit", 90,"uni"],
	["Ghillie suit(OPFOR)","U_O_Ghilliesuit", 90, "uni"],
	["Ghillie suit(INDEP.)","U_I_Ghilliesuit", 90, "uni"],
//    ["Leisure suit","U_C_Novak", 50, "uni"],
//    ["Kabeiroi Lead. suit","U_IG_Menelaos", 50, "uni"],
//    ["Scientist suit","U_OI_Scientist", 50, "uni"],
    ["Bandana (Surfer)","H_Bandana_surfer", 10,"hat"],
    ["Bandana (camo)","H_Bandana_camo", 10,"hat"],
    ["Bandmask (demon)","H_BandMask_demon", 10,"hat"],
    ["Bandmask (reaper)","H_BandMask_reaper", 10,"hat"],
    ["ECH","H_HelmetB", 10,"hat"],
    ["ECH (Light)","H_HelmetB_light", 10,"hat"],
    ["ECH (Custom)","H_HelmetB_paint", 10,"hat"],
    ["Booniehat (Hex)","H_Booniehat_ocamo", 10,"hat"],
    ["Booniehat (Khaki)","H_Booniehat_khk", 10,"hat"],
    ["Booniehat (MTP)","H_Booniehat_mcamo", 10,"hat"],
    ["Cap (Blue)","H_Cap_blu", 10,"hat"],
    ["Cap (Red)","H_Cap_red", 10,"hat"],
    ["Cap (SERO)","H_Cap_brn_SERO", 10,"hat"],
    ["Cap (ION)","H_Cap_blk_ION", 10,"hat"],
//    ["Cap Rangemaster","H_Cap_headphones", 10,"hat"],
    ["Cap Military (Hex)","H_MilCap_ocamo", 10,"hat"],
    ["Cap Military (MTP)","H_MilCap_mcamo", 10,"hat"],
    ["Pilot Helmet(bluefor)","H_PilotHelmetHeli_B", 10,"hat"],
    ["Pilot Helmet(others)","H_PilotHelmetHeli_O", 10,"hat"]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
generalStore = [
	["Water","water",localize "STR_WL_ShopDescriptions_Water","client\icons\water.paa",30,15],
	["Canned Food","canfood",localize "STR_WL_ShopDescriptions_CanFood","client\icons\cannedfood.paa",30,15],
	["Repair Kit","repairkits",localize "STR_WL_ShopDescriptions_RepairKit","client\icons\briefcase.paa",500,500],
//	["Medical Kit","medkits",localize "STR_WL_ShopDescriptions_MedKit","client\icons\medkit.paa",400,200],
	["Jerry Can (Full)","fuelFull",localize "STR_WL_ShopDescriptions_fuelFull","client\icons\jerrycan.paa",150,75],
    ["Jerry Can (Empty)","fuelEmpty",localize "STR_WL_ShopDescriptions_fuelEmpty","client\icons\jerrycan.paa",50,25]
];

// Stratis town and city array
//Marker Name, Radius, City Name
cityList = [
		["Town_1",200,"Air Station Mike-28"],
		["Town_2",100,"Agios Loannis"],
		["Town_3",100,"Agios Cephas"],
		["Town_4",175,"Girna"],			
		["Town_5",175,"Camp Tempest"],
		["Town_6",250,"Stratis Airbase Town"],
		["Town_7",180,"Stratis Airbase Runway"],
		["Town_8",290,"Agia Marina"],
		["Town_9",150,"Kill Farm"],
		["Town_10",210,"Camp Rogain"],
		["Town_11",180,"Kamino Firing Range"],
		["Town_12",220,"Camp Maxwell"],
		["Town_13",200,"ol-Kamino"],
		["Town_14",100,"Isla Pythos"],
		["Town_15",100,"Baldy Barracks"],
		["Town_16",175,"ol-Keiros"],			
		["Town_17",175,"Tsoukalia"],
		["Town_18",250,"LZ Connor"],
		["Town_19",180,"Playa-del-Stragos"],
		["Town_20",290,"ol-Jay"]

];
cityLocations = [];
