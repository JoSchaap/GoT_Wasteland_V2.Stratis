private ["_hackedVehicles","_check","_vehicleType"];

_hackedVehicles = call findHackedVehicles;

{
	private "_hackedVehicle";
	_hackedVehicle = _x select 0;
	
	_vehicleType = typeOf _hackedVehicle;
	if(_vehicleType isKindOf "Car") then {
		if(_vehicleType isKindOf "MotorCycle" || _vehicleType isKindOf "Truck") then {
			deleteVehicle _hackedVehicle;
		}
		else
		{
			if(!(_vehicleType isKindOf "Wheeled_APC")) then {
				deleteVehicle _hackedVehicle;
			};
		};
	};
	if(_vehicleType isKindOf "Helicopter" || _vehicleType isKindOf "Plane" || _vehicleType isKindOf "Tank" || _vehicleType isKindOf "Wheeled_APC" || _vehicleType isKindOf "ReammoBox_F") then {
		deleteVehicle _hackedVehicle;
	};
} forEach _hackedVehicles;

player commandChat "All Hacked Vehicles Deleted";

closeDialog 0;
execVM "client\systems\adminPanel\vehicleManagement.sqf";
