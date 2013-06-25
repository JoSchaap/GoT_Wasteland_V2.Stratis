//	@file Version: 1.1
//	@file Name: Script Name
//	@file Author: [404] Deadbeat, [GoT] JoSchaap
//	@file Created: DD/MM/YYYY HH:MM
//	@file Args:

if(!X_Server) exitWith {};

_objPos = _this select 0;
_Objtype = objectList select (random (count objectList - 1));
_obj = createVehicle [_Objtype,_objPos,[], 50,"None"]; 

_obj addeventhandler ["hit", {(_this select 0) setdamage 0;}];
_obj addeventhandler ["dammaged", {(_this select 0) setdamage 0;}];

switch (_Objtype) do
{
	case "Land_WaterBarrel_F": {
		_obj setVariable["water",50,true];
	};
	case "Land_Sacks_goods_F": {
		_obj setVariable["food",40,true];
	};
};

_obj setVariable["R3F_LOG_disabled",false];
_obj setpos [getpos _obj select 0,getpos _obj select 1,0];
