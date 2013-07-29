waitUntil {!isNull player && isPlayer player};

player createDiarySubject ["Wasteland", "HOW-TO-PLAY??"];
player createDiarySubject ["changelog", "The Changelog"];
player createDiarySubject ["info", "Mission Info"];
player createDiarySubject ["GoT2DayZ", "GoT2DayZ Info"];

player createDiaryRecord["changelog",
[
"1.01(404)",
"
<br/>
		[Fixed] - Gun Stores<br/>
		[Fixed] - Missions<br/>
		[Fixed] - General UI<br/>
		[Fixed] - Lots of other fixes<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.02(404)",
"
<br/>
		[Fixed] - Respawning Vehicles<br/>
		[Fixed] - Deserted Vehicles (20Mins)<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.03(404)",
"
<br/>
		[Added] - Light Armed Vehicle Mission (All armed cars).<br/>
		[Removed] - All armed cars from initial spawn for balance.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.05(404)",
"
<br/>
		[Added] Uniforms,Hats and Vests to the gunstore.<br/>
		[Added] Players now spawn with a backpack.<br/>
		[Fixed] Not able to get weapons out of vehicle.<br/>
		[Fixed] R3F Loading into vehicles.<br/>
		[Fixed] Gunstore locations so they can't be ran down by vehicles.<br/>
		[Fixed] Health Icon.<br/>
		[Fixed] Static helicopter spawning and no more explosions.<br/>
		[Fixed] Weapon crates can now be loaded into vehicles.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.06(404)",
"
<br/>
		[Fixed] Fix to make Ammo boxes moveable.(thanks to meat147).<br/>
		[Fixed] missing disabled color for money input error.(thanks to Sanjo).<br/>
		[Fixed] NV Goggles in cars and boxes.(thanks to Sanjo).<br/>
		
"
]
];

player createDiaryRecord["changelog",
[
"1.07(GoT)",
"
<br/>
		[Fixed] Fixed the Sound Counter error on first spawn.<br/>
		[Fixed] Re-Added the LightArmed-Vehicle mission.<br/>
		[Fixed] Fixed the description issue for the LightArmed-Vehicle mission.<br/>
		[Removed] Scaffolding and other useless objectspawns to improve ability to build bases.<br/>
		[Changed] Starting money to 200.<br/>
		[Changed] Added our own strings and some other changes.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.08(GoT)",
"
<br/>
		*Revision:a*<br/>
		[Added] New main mission (Convoy) By Sanjo.<br/>
		[Added] MiniConvoy Sidemission (JoSchaap) Tnx Sanjo<br/>
		[Added] Posibility to move and airlift small bunkers<br/>
		[Added] More baseparts to be taken from all over the map<br/>
		[Added] Food,Water,Fuel sources and the refuel option<br/>
		[Fixed] Fixed misc font errors.<br/>
		[Fixed] one of the weap boxes could not be moved.<br/>
		[Fixed] Survival system now active again!<br/>
		[Fixed] Now posible to get food,water,fuel !<br/>
		[Fixed] Ifrit spawn and mission issue's<br/>
		[Fixed] Vehicle content window missing an image/icon<br/>
		[Fixed] Admin-Provinggrounds missing an image/icon<br>
		<br/>
		*Revision:b*<br/>
		[Added] More variaty of basebuilding parts (+new parts!)<br/>
		[Added] 20mm and 40mm flare rounds to Gunstore<br/>
		[Added] You can study and build improvised roofs!<br/>
		[Added] Cargo Containers with 30slots space for parts<br/>
		[Changed] Cargo Containers can only be Towed or airlifted!<br/>
		[Changed] Lamp-class for basebuilding due to placement bugs<br/>
		[Changed] Significantly increased the ammount of objects<br/>
		[Fixed] Font errors on some rare occasions<br/>
		[Fixed] Desync issues<br/>
		[Fixed] Bug that enabled players to take map-bound objects<br/>
		[Fixed] Typo's in stringtables<br/>
		[Fixed] Dropping food and water through playermenu<br/>
		[Removed] The metal bunker for basebuilding<br/>
		[Removed] Funtionality to drop your Jerrycan (not in arma3)<br/>
		<br/>
		*Revision:d (c was skipped intentionally)<br/>
		[Added] Different reward crate contents for the convoys<br/>
		[Added] New objects to the list of basebuilding parts<br/>
		[Added] Sanjo's mission select (prevents recurring missions)<br/>
		[Added] Mission intel and author info to the splash screen<br/>
		[Added] Gunstore radars are back!<br/>
		[Added] New side mission Hostile Helicopter<br/>
		[Added] New main mission Hostile Helicopter-Squad<br/>
		[Changed] Weapon and item prizes in the gunstore<br/>
		[Changed] death sequence when killed<br/>
		[Changed] baseparts that kept falling over<br/>
		[Changed] Logisitic checks on init (caused long waiting times)<br/>
		[Changed] Enabled groups in Blufor/Opfor <br/>
		[Fixed] Flare rounds in gunstore not possible to buy<br/>
		[Fixed] AI and Vehicles from convoy missions not despawning<br/>
		[Fixed] Slow respawn dialog on first spawn<br/>
		[Removed] Some more GoT2DayZ.nl references where removed<br/>
		<br/>
		*Revision:e<br/>
		[Added] The location ticker is back (BIS Fixed it!)<br/>
		[Fixed] Vehicles not spawning since update to alpha<br/>
		[Fixed] Ammoboxes not spawning since update to alpha<br/>
		[Fixed] Moving objects caused loss of weapon attachments<br/>
		[Removed] Deprecated function calls<br/>
		<br/>
		*Revision:f<br/>
		[Added] More spawns for objects and vehicles<br/>
		[Added] Random loot inside buildings all over the map<br/>
		[Added] Backpacks to gunstore<br/>
		[Changed] Starting backpack<br/>
		[Changed] Armed/Civil Heli missions no longer spawn broken<br/>
		[Fixed] Vehicles not respawning<br/>
		[Fixed] Not being able to buy 7.62mm ammo<br/>
		[Fixed] Gunstore now properly checks your inventory space<br/>
		[Fixed] Various broken admin-features<br/>
		<br/>
"
]
];

player createDiaryRecord["changelog",
[
"v2 (GoT)",
"
		[Added] 8 new towns/settlements to spawn in.<br/>
		[Added] 16 new spawnareas for objects/vehicles.<br/>
		[Added] 3 new fuelpump locations<br/>
		[Added] new underwater sidemission!<br/>
		[Added] new scuba Mainmission with armed boat<br/>
		[Added] Diving goggles/gear to gunstore.<br/>
		[Added] Game info, hints and tips to briefing<br/>
		[Added] Ghilly suits, Rangefinder to gunstore<br/>
		[Added] Sniper Rifles and ammo to gunstore<br/>
		[Added] SOS Sniper optic to gunstore<br/>
		[Added] Random boat spawns near coastlines<br/>
		[Added] new gunstore to even the odds<br/>
		[Added] some scriptdetection<br/>
		[Added] gunstore option to sell uniform/vest<br/>
		[Added] New basebuilding parts<br/>
		[Added] Explosive specialist class<br/>
		[Fixed] Cleanup on corpse food/water/money<br/>
		[Changed] Marksman class to Sniper class<br/>
		[Changed] Sniper class spawns in ghillie<br/>
		[Changed] Explosive Spec. needs toolkit to defuse<br/>
		[Changed] Gunstore radar radius reduced to 70 ft<br/>
		[Changed] Gunstore locations.<br/>
		[Changed] Prices on MXM, EBR and Diving equipment.<br/>
		[Changed] Reduced ammount of objects<br/>
		[Changed] Reduced ammount of ammo caches<br/>
		[Changed] Civilian boats respawn faster<br/>
		[Changed] Rubber boats are movable by players<br/>
		[Changed] Rubber boats respawn faster<br/>
		[Changed] Armed boats are heli-liftable<br/>
		[Changed] Armed boats have storage space<br/>
		*comming soon:<br/>
		*- your idea here? let us know!<br/>
"
]
];

player createDiaryRecord["changelog",
[
"v2.1 (GoT)",
"
		[Added] Time Accelerated x10<br/>
		[Added] New gunstore dialog!<br/>
		[Fixed] Scalar value money bug (infinite money)<br/>
		[Fixed] Vehicles that kept respawning in limbo<br/>
		[Fixed] Boats that kept respawning in limbo<br/>
		[Changed] gunstore prices have been changed<br/>
		[Changed] Starting money reduced<br/>
		[Changed] Nerfed lootspawns inside buildings<br/>
		[Changed] Raised prices of the sniper rifles<br/>
		[Changed] antihack/scriptdetection methods<br/>
"
]
];

player createDiaryRecord["changelog",
[
"v2.2 (GoT)",
"
		! -INITIAL ARMA3 BETA RELEASE- !<br/>
		[Removed] Time Acceleration (lagged)<br/>
		[Removed] Random ammocrate spawns<br/>
		[Added] New beta weapons!<br/>
		[Added] New beta vehicles!<br/>
		[Added] New beta clothing!<br/>
		[Added] New beta ammunition!<br/>
		[Added] New beta boats/submarines!<br/>
		[Added] New outpost Main-mission<br/>
		[Added] New APC Main-mission<br/>
		[Added] New abandonned truck sidemission</br/>
		[Fixed] broken vehiclespawns/missions due to beta<br/>
		[Fixed] errors in admin menu's<br/>
		[Fixed] all respawn issues in limbo<br/>
		[Changed] existing mainmissions to new vehicles<br/>
		[Changed] existing sidemissions to new vehicles<br/>
		[Changed] More time between missions (side 8, main 15 minutes)<br/>
		[Changed] new lootspawns in buildings (SMG/Handguns)<br/>
		[Changed] mission starts at 4am for day edition<br/>
		[Changed] mission starts at 7pm for evening edition<br/>
		[Changed] minor changes to player hud<br/>
"
]
];

player createDiaryRecord["changelog",
[
"v2.21(GoT)",
"	
		[Added] Green army (Independent)<br/>
		[Added] Diving class to all factions<br/>
		[Added] Green army suits to gunstore<br/>
		[Added] spawn protection on debug island<br/>
		[Fixed] Lagspikes due to errors in vehicle respawn<br/>
		[Fixed] RPT logfile findsafepos spam<br/>
		[Fixed] new outpost mission did not despawn correctly<br/>
		[Fixed] incorrect mission descriptions<br/>
		[Fixed] Server cleanup set to 10 minutes after death<br/>
		[Fixed] Cargo on armed boat not working<br/>
		[Changed] hostile heli missions contain a mi48 now<br/>
		[Changed] hints before and after missions rewritten<br/>
		[Changed] missions last longer before timing out<br/>
		[Changed] mission starts at 8pm for evening edition<br/>
		[Removed] Names when in vehicle in StreamFriendlyUI<br/>
"
]
];

player createDiaryRecord["changelog",
[
"v2.3 (GoT)",
"
		***TESTBUILD DO NOT DISTRIBUTE***<br/>	
		[Added] 3 general stores<br/>
		[Added] working repairkits that can be dropped<br/>
		[Added] working fuelcans that can be dropped<br/>
		[Added] new interface for general stores<br/>
		[Added] more variaty in base building parts<br/>
		[Added] new handguns and surpressors<br/>
		[Added] new SMG's and optics/surpressors<br/>
		[Added] Independent SDV<br/>
		[Added] camo blackhawk<br/>
		[Added] New APC's<br/>
		[Added] New outposts for the outpost mission<br/>
		[Added] New antihack script by AWA, AgentREV and Tonic<br/>
		[Added] Improv. roof to general stores<br/>
		[Added] Name censoring in group-menu for StreamFriendly<br/>
		[Added] Main mission: Coastal patrol<br/>
		[Fixed] Name censoring when in vehicle for StreamFriendly<br/>
		[Fixed] Some missions did not announce themselves<br/>
		[Fixed] AI not despawning on APC mission<br/>
		[Fixed] balance between weapon/item spawns in buildings<br/>
		[Fixed] added fuelcans and repairkits to cleanup<br/>
		[Fixed] Height issue with scaffolding basepart<br/>
		[Fixed] Undefined variable errors in the original code<br/>
		[Fixed] Group invite not announcing to invited player<br/>
		[Fixed] Server cleanup now fully functional<br/>
		[Fixed] Various performance improvements in the scripts<br/>
		[Fixed] Various issues with unlocked mission vehicles<br/>
		[Fixed] Selling prices of rifles (no more 25 bucks)<br/>
		[Fixed] Gunstore purchase exploit (spamming buy button)<br/>
		[Changed] Gametype: changed to SANDBOX <br/>
		[Changed] Survival system from decimals to percentages<br/>
		[Changed] hunger/thirst death by HPdrain (not instant)<br/>
		[Changed] Food/Water drainage and gain from items<br/>
		[Changed] Stores can also be openned from actionmenu<br/>
		[Changed] Loot in buildings spawned when a player enters town<br/>
		[Changed] Loot in buildings now respawns after 30mins<br/>
		[Changed] Loot in buildings 25% chance of fuel inside fuelcans<br/>
		[Changed] Fuel cans (full or empty) can be dropped<br/>
		[Changed] Repairkits added to loot-table<br/>
		[Changed] fuel cans empty and full added to loot-table<br/>
		[Changed] players spawn without a fuelcan<br/>
		[Changed] Hostile helicopter missions use random helicopters<br/>
		[Changed] amount of objects and vehicles reduced<br/>
		[Changed] Locked baseparts will be saved on server restart<br/>
		*- After restart the baseparts will be spawned UNLOCKED!<br/>
		*- please bare with me if there are still issues<br/>
		   This is a TESTBUILD and should not be used by others<br/>
"
]
];

player createDiaryRecord["info",
[
"Credits",
"
<br/>
	First things first: <br/>
	The idea of wasteland and the first original in arma2:<br/> 
	* TAW_Tonic<br/>
	* Sa-Matra<br/>
	* Marker<br/>
	<br/>
	This wasteland mission was originally re-developped by:<br/>
	(404games DEV-Team) consisting:<br/><br/>
	* Deadbeat<br/>
	* Costlyy<br/>
	* Pulse<br/>
	* Domuk<br/>
	<br/>
	Development after v1.06 was taken on by:<br/>
	* JoSchaap (GoT/Tweakers.Net)<br/>
	<img size='4' image='client\icons\logo.paa'/><br/>
	<br/>
	Others that contributed:<br/>
	* afroVoodo (ArmaHolic)<br/>
	* Sanjo (GitHub)<br/>
	* Ed! (404forums)<br/>
	* AgentREV (GitHub/TPG - antihax coder!)<br/>
	* SPJESTER (404forums)<br/>
	* Hub (404forums)<br/>
	* Tonic-_- (BIS-forums)<br/>
	* spunFIN (BIS-forums)<br/><br/>
	* AWA (OpenDayZ.Net)<br/>
	* Sa-Matra (BIS-forums)</br>
	* SicSemperTyrannis (iniDB)<br/>
	* {ZAG}Ed!<br/>
	* Na-Palm (BIS-Forums)<br/>
	* MercyfulFate (GitHub)<br/>
	* * Thanks ALOT for the help/inspiration!<br/>
	<br/>
"
]
];

player createDiaryRecord["info",
[
"Original version",
"
<br/>
	Visit the original thread by Tonic in the BISforums:<br/><br/>
	http://forums.bistudio.com/showthread.php?140070-TVT-CO-55-Wasteland<br/>
	<br/>
"
]
];

player createDiaryRecord["info",
[
"Sa-Matra edition",
"
<br/>
	Find Sa-Matra's version on the BISforums:<br/><br/>
	http://forums.bistudio.com/showthread.php?154610-MP-Team-Sa-Matra-s-Wasteland<br/>
	<br/>
"
]
];

player createDiaryRecord["info",
[
"404Games info",
"
<br/>
	Visit the 404games Team at their website/forums:<br/><br/>
	http://404games.co.uk<br/>
	<br/>
"
]
];

player createDiaryRecord["info",
[
"GoT/GoT2DayZ",
"
<br/>
	Visit our website at:<br/><br/>
	http://www.got2dayz.nl<br/>
	<img size='5' image='client\icons\logo.paa'/><br/>
	<br/>
"
]
];

player createDiaryRecord["GoT2DayZ",
[
"Who what where?",
"
<br/>
	What is GoT/GoT2DayZ?<br/><br/>
	<img size='5' image='client\icons\logo.paa'/><br/>
	GoT2DayZ started as a DayZ community for Tweakers.Net<br/>
	As time passed on we also started playing wasteland.<br/>
	Now we run some public servers.<br/>
	And also modify Wasteland missions for them.<br/>
	<br/>Our website: www.got2dayz.nl<br/><br>
	our servers:<br/>
	* ArmA2 Wasteland on Utes (Customized by us)<br/>
	* ArmA3 Alpha Wasteland on Stratis (day)<br/>
	* ArmA3 Alpha Wasteland on Stratis (night)<br/>
	<br/>
"
]
];

player createDiaryRecord["GoT2DayZ",
[
"Contact Admin",
"
<br/>
	First of all make sure you are on the official server</br>
	Servername: [NL] GoT Wasteland v2.3<br/><br/>
	<img size='5' image='client\icons\logo.paa'/><br/>
	You can try to get an admins attention in global chat.<br/>
	If unsuccessfull you can contact us on:<br/>
	facebook: fb.me/GoT2DayZ<br/>
	reddit: redd.it/r/GoT2DayZ<br/>
	website: www.got2dayz.nl<br/>
	<br/>
"
]
];

player createDiaryRecord["GoT2DayZ",
[
"Server info",
"
<br/>
	<img size='5' image='client\icons\logo.paa'/><br/>
	Server is hosted on a dual XEON 3.2Ghz machine<br/><br/>
	- 8GB DDR3<br/>
	- 2x Samsung 120GB SSD<br/>
	- Colocated 1GB unmeterred connection<br/>
	<br/>
"
]
];

player createDiaryRecord["wasteland",
[
"Hints/Tips",
"
<img size='5' image='client\icons\logo.paa'/> GoT Wasteland v2.3<br/>
<br/>
* At the start of the game, spread out and find supplies before worrying about where to establish a meeting place or a base, supplies are important and very valuable.<br/><br/>
* When picking a base location, it is best advised to pick a place that is out of the way and not so obvious such as airports, cities, map-bound bases, etc. remember, players randomly spawn in and around towns and could even spawn inside your base should you set it up in a town.<br/><br/>
* If you spawn in an area with no vehicles or supplies in the immediate area, DO NOT just click respawn from the pause menu, chances are if you search an area of a few hundred meters, you will find something.<br/><br/>
* Always be on the lookout for nightvision. they are located in the ammo crates, and there are pairs scattered throughout vehicles. You can also purchase them from the gunstores. Nighttime without them SUCKS, and if you have them, you can conduct stealth raids on enemy bases under the cover of complete darkness.<br/><br/>
* When you set up a base, never leave your supplies unguarded, one guard will suffice, but it is recommended you have at least 2, maybe 3 guards at base at all times.<br/><br/>
* The helicopter from the side mission spawns with low fuel, so do not make a mad dash for the chopper unless you are armed and plan to protect it, or have some fuel which can be found in the fuel stations, or in the palated barrels arround towns.<br/>
* There are very aggressive AI characters that spawn with most missions and will protect the mission objectives with deadly force, be aware of them.<br/>
"
]
];

player CreateDiaryRecord["wasteland",
[
"About Wasteland",
"
Wasteland is a team versus team versus team sandbox survival experience. The objective of this mission is to rally your faction, scavenge supplies, weapons, and vehicles, and destroy the other factions. It is survival at its best! Keep in mind this is a work in progress, please direct your reports to JoSchaap (GoT2DayZ.nl).
<br/><br/>

FAQ<br/>
Q. What am I supposed to do here?<br/>
A. See the above description<br/>
<br/>
Q. Where can I get a gun?<br/>
A. Weapons are found in one of three places, first in ammo crates that come as rewards from missions, inside and outside buildings, and second, in the gear section of the vehicles, which also randomly spawn around the map. The last place to find a gun would be at the gunshops located throughout the map. You can also find them on dead players whose bodies have not yet been looted.
<br/><br/>
Q. What are the grey circles on the map?<br/>
A. The circles represent town limits. If friendly soldiers are in a town, you can spawn there from the re-spawn menu; however if there is an enemy presence, you will not be able to spawn there.
<br/><br/>
Q. Why is it so dark, I cant see.<br/>
A. The server has a day/night cycle just like in the real world, and as such, night time is a factor in your survival. It is recommended that you find sources of light or use your Night Vision Goggles as the darkness sets in.
<br/><br/>
Q. Is it ok for me to shoot my team mates?<br/>
A. If you are member of BLUFOR or OPFOR teams, then you are NOT allowed to shoot or steam items and vehicles from other players. If you play as Independent, you are free to engage anyone as well as team up with anyone you want.
<br/><br/>
Q. Whats with the buckets, baskets and big bags?<br/>
A. This game has a food and water system that you must stay on top of if you hope to survive. You can collect food and water from water Plastic cannisters, food sacks, wells, or the buckets/baskets near dead players bodies. Food and water will randomly spawn around the map.
<br/><br/>
Q. I saw someone breaking a rule, what do I do?<br/>
A. Simply go into global chat and get the attention of one of the admins or visit our facebook, reddit, or website chat, and make a report if the offence is serious.
<br/>
"]
];
