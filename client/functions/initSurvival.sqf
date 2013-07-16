//	@file Version: 1.0
//	@file Name: initSurvival.sqf
//	@file Author: MercyfulFate, [404] Deadbeat, [404] Costlyy, TAW_Tonic (original)
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define TIME_DELTA 1 //seconds between each "check"
#define HEALTH_TIME 120 //seconds till death
#define HUNGER_TIME 900 //seconds till starving
#define THIRST_TIME 900 //seconds till dehydrated
#define HEALTH_DELTA TIME_DELTA*(100/HEALTH_TIME)/100
#define HUNGER_DELTA TIME_DELTA*(100/HUNGER_TIME)
#define THIRST_DELTA TIME_DELTA*(100/THIRST_TIME)
#define STARVATION "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have died due to starvation."
#define DEHYDRATION "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have died due to dehydration."

if not(isNil "mf_survival_handle1") then {terminate mf_survival_handle1};
mf_survival_handle1 = [] spawn {
	_decrementHunger = {
		if (hungerLevel > 0) then {hungerLevel = hungerLevel - HUNGER_DELTA };
	};

	_decrementThirst = {
		if (thirstLevel > 0) then {thirstLevel = thirstLevel - THIRST_DELTA};
	};

	while {true} do {
		sleep TIME_DELTA;
		waitUntil {!respawnDialogActive && alive player};
		if (round random 1 == 0) then _decrementHunger;
		if (round random 1 == 0) then  _decrementThirst;
		switch (true) do {
			case (hungerLevel <= 0): {
				_health = (damage player) + HEALTH_DELTA;
				if (_health > 1) then {hint parseText STARVATION};
				player setDamage _health;
			};
			case (thirstLevel <= 0): {
				_health = (damage player) + HEALTH_DELTA;
				if (_health > 1) then {hint parseText DEHYDRATION};
				player setDamage _health;
			};
		};
	};
};

[] spawn  {
	_warn1 = true; _warn2 = true; _warn3 = true; _warn4 = true;
	while{true} do {
		sleep TIME_DELTA;
		waitUntil {!respawnDialogActive};
		switch(true) do {
			case (hungerLevel <= 0 && _warn1): {_warn1 = false; hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You are now starving to death, you will slowly lose health, find something to eat quickly!", round hungerLevel];};
			case (hungerLevel <= 10 && hungerLevel > 0 && _warn2): {_warn2 = false; _warn1 = true; hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You are starting to starve, you need to find something to eat otherwise you will start to lose health!", round hungerLevel];};
			case (hungerLevel <= 25 && hungerLevel > 10 && _warn3): {_warn3 = false; _warn2 = true; hint format["You haven't eaten anything in awhile, your hunger level is currently: %1\n\n You should find something to eat soon!", round hungerLevel];};
			case (hungerLevel <= 50 && hungerLevel > 25 && _warn4): {_warn4 = false; _warn3 = true; hint format["You haven't eaten anything in awhile, your hunger level is currently: %1\n\n You should find something to eat soon!", round hungerLevel];};
			case (hungerLevel > 50 && !warn4): {warn4 = true};
		};
	};
};

[] spawn  {
	_warn1 = true; _warn2 = true; _warn3 = true; _warn4 = true;
	while{true} do {
		sleep TIME_DELTA;
		waitUntil {!respawnDialogActive};
		switch(true) do {
			case (thirstLevel <= 0 && _warn1): {_warn1 = false; hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You are now suffering from severe dehydration find something to drink quickly!", round thirstLevel];};
			case (thirstLevel <= 10 && thirstLevel > 0 && _warn2): {_warn2 = false; _warn1 = true; hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You haven't drank anything in along time, you should find someting to drink soon or you'll start to die from dehydration!", round thirstLevel];};
			case (thirstLevel <= 25 && thirstLevel > 10 && _warn3): {_warn3 = false; _warn2 = true; hint format["You haven't drank anything in awhile, your thirst level is %1\n\nYou should find something to drink soon.", round thirstLevel];};
			case (thirstLevel <= 50 && thirstLevel > 25 && _warn4): {_warn4 = false; _warn3 = true; hint format["You haven't drank anything in awhile, your thirst level is %1", round thirstLevel];};
			case (thirstLevel > 50 && !_warn4): {_warn4 = true};
		};
	};
};