if not(isNil "playerMenuHandle") then {terminate playerMenuHandle};
playerMenuHandle = [] spawn {
	waituntil {!isnull player};
	private ["_veh"];
	while {true} do {
		waituntil {vehicle player == player};
		if (!isnil "_veh") then {_veh removeaction playerMenuId};
		playerMenuId = player addAction [format ["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa' width='32' height='32'/> <t color='#0000FF'>%1</t>", "[<t color='#FFFFFF'>Player Menu/Items</t><t color='#0000FF'>]</t>"], "client\systems\playerMenu\init.sqf",[],-10,false,false,"","local player"];
		waituntil {vehicle player != player};
		player removeaction playerMenuId;
		_veh = vehicle player;
		playerMenuId = _veh addAction [format ["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa' width='32' height='32'/> <t color='#0000FF'>%1</t>", "[<t color='#FFFFFF'>Player Menu/Items</t><t color='#0000FF'>]</t>"], "client\systems\playerMenu\init.sqf",[],-10,false,false,"","local player"];
	};
};