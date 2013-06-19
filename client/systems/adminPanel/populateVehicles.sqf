//	@file Version: 1.0
//	@file Name: populateVehicles.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args: [int _switch]

#define vehicleManagementDialog 12000
#define vehicleManagementListBox 12001
#define vehicleWeaponsText 12003
#define vehicleUsersText 12004
#define vehicleDamageText 12005
#define vehicleSpeedText 12006

disableSerialization;

private ["_switch","_vehicleType","_vehicleSummary","_dialog","_vehicleListBox","_weaponText","_userText","_damageText","_speedText","_check"];
_uid = getPlayerUID player;
if ((_uid in moderators) OR (_uid in administrators) OR (_uid in serverAdministrators)) then {
	_switch = _this select 0;
	_allVehicles = vehicles;
	
	_dialog = findDisplay vehicleManagementDialog;
	_vehicleListBox = _dialog displayCtrl vehicleManagementListBox;
	_weaponText = _dialog displayCtrl vehicleWeaponsText;
	_userText = _dialog displayCtrl vehicleUsersText;
	_damageText = _dialog displayCtrl vehicleDamageText;
	_speedText = _dialog displayCtrl vehicleSpeedText;
	
	lbClear _vehicleListBox;
	_weaponText ctrlSetText format["Weapons:"];
	_speedText ctrlSetText format["Speed:"];
	_userText ctrlSetText format["Users:"];
	_damageText ctrlSetText format["Damage:"];
	
	switch (_switch) do
	{
	    case 0:
		{
	    	{
			   	_vehicleType = Format["%1",typeOf _x];
			    if(_vehicleType isKindOf "Car") then {
	            	if(_vehicleType isKindOf "MotorCycle") then {
	                	_vehicleSummary = format["[Class: MotorCycle] [Type: %1]",_vehicleType];
			        	_index = _vehicleListBox lbAdd format["%1",_vehicleSummary];
			        	_vehicleListBox lbSetData [_index, str(_x)];    
	                };
	                
	                if(_vehicleType isKindOf "Truck") then {
	                	_vehicleSummary = format["[Class: Truck] [Type: %1]",_vehicleType];
			        	_index = _vehicleListBox lbAdd format["%1",_vehicleSummary];
			        	_vehicleListBox lbSetData [_index, str(_x)];    
	                };
	                
	                if(!(_vehicleType isKindOf "Truck") AND !(_vehicleType isKindOf "MotorCycle") AND !(_vehicleType isKindOf "Wheeled_APC")) then {
	                	_vehicleSummary = format["[Class: Car] [Type: %1]",_vehicleType];
				        _index = _vehicleListBox lbAdd format["%1",_vehicleSummary];
				        _vehicleListBox lbSetData [_index, str(_x)];    
	                }
			    };
			} forEach _allVehicles;           	    	
		};
		case 1:
		{
	    	{
			   	_vehicleType = Format["%1",typeOf _x];
			    if(_vehicleType isKindOf "Helicopter") then {
				    _vehicleSummary = format["[Class: Helicopter] [Type: %1]",_vehicleType];
				    _index = _vehicleListBox lbAdd format["%1",_vehicleSummary];
					_vehicleListBox lbSetData [_index, str(_x)];
			    };
			} forEach _allVehicles;		    
		};
	    case 2:
	    {
			{
			   	_vehicleType = Format["%1",typeOf _x];
			    if(_vehicleType isKindOf "Plane") then {
			        _vehicleSummary = format["[Class: Plane] [Type: %1]",_vehicleType];
			        _index = _vehicleListBox lbAdd format["%1",_vehicleSummary];
			        _vehicleListBox lbSetData [_index, str(_x)];
			    };
			} forEach _allVehicles;	
	    };
	    case 3:
	    {
			{
			   	_vehicleType = Format["%1",typeOf _x];
			    if(_vehicleType isKindOf "Tank") then {
			        _vehicleSummary = format["[Class: Tank] [Type: %1]",_vehicleType];
			        _index = _vehicleListBox lbAdd format["%1",_vehicleSummary];
			        _vehicleListBox lbSetData [_index, str(_x)];
			    };
	            
	            if(_vehicleType isKindOf "Wheeled_APC") then {
			        _vehicleSummary = format["[Class: APC] [Type: %1]",_vehicleType];
			        _index = _vehicleListBox lbAdd format["%1",_vehicleSummary];
			        _vehicleListBox lbSetData [_index, str(_x)];
			    };
			} forEach _allVehicles;   	
	    };
	    case 4:
	    {
			private "_hackedVehicles";
			_hackedVehicles = call findHackedVehicles;
			
	    	{
				private ["_hackedVehicle", "_vehicleOwner", "_ownerInfo"];
				_hackedVehicle = _x select 0;
				_vehicleOwner = _x select 1;
				
				if (_vehicleOwner == "") then
				{
					_ownerInfo = "[Unknown owner]";
				}
				else
				{
					if (_hackedVehicle isKindOf "ReammoBox_F") then
					{
						_ownerInfo = format ["[Owner: %1]", _vehicleOwner];
					}
					else
					{
						_ownerInfo = format ["[Last driver: %1]", _vehicleOwner];
					};
				};
				
				_vehicleType = typeOf _hackedVehicle;
				if(_vehicleType isKindOf "Car") then {					
					if(_vehicleType isKindOf "MotorCycle") then {
						_vehicleSummary = format["[Class: Motorcycle] [Type: %1] %2", _vehicleType, _ownerInfo];
						_index = _vehicleListBox lbAdd format["%1",_vehicleSummary];
						_vehicleListBox lbSetData [_index, str(_hackedVehicle)];    
					};
					if(_vehicleType isKindOf "Truck") then {
						_vehicleSummary = format["[Class: Truck] [Type: %1] %2", _vehicleType, _ownerInfo];
						_index = _vehicleListBox lbAdd format["%1",_vehicleSummary];
						_vehicleListBox lbSetData [_index, str(_hackedVehicle)];    
					};
					if(!(_vehicleType isKindOf "Truck") AND !(_vehicleType isKindOf "MotorCycle") AND !(_vehicleType isKindOf "Wheeled_APC")) then {
						_vehicleSummary = format["[Class: Car] [Type: %1] %2", _vehicleType, _ownerInfo];
						_index = _vehicleListBox lbAdd format["%1",_vehicleSummary];
						_vehicleListBox lbSetData [_index, str(_hackedVehicle)];    
					};
				};
				
				{
					if(_vehicleType isKindOf _x) then {
						_vehicleSummary = format["[Class: %1] [Type: %2] %3", _x, _vehicleType, _ownerInfo];
						_index = _vehicleListBox lbAdd format["%1",_vehicleSummary];
						_vehicleListBox lbSetData [_index, str(_hackedVehicle)];
					};
				} forEach ["Helicopter", "Plane", "Tank", "Wheeled_APC"];
				
				if(_vehicleType isKindOf "ReammoBox_F") then {
					_vehicleSummary = format["[Class: Ammo Box] [Type: %1] %2", _vehicleType, _ownerInfo];
					_index = _vehicleListBox lbAdd format["%1",_vehicleSummary];
					_vehicleListBox lbSetData [_index, str(_hackedVehicle)];    
				};
					
			} forEach _hackedVehicles;    
	    };
	};
} else {
  exit;  
};
