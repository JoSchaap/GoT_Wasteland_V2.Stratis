    //Random weapons and items spawning script for wasteland missions.
    //Author : Ed!, [GoT] JoSchaap

    _odd1 = 35;       //The odds that a building is selected to place loot.
    _odd2 = 30;       //The odds that the selected building's spots will have loot(almost like odds per room).
    _itemtoweaponratio = 45;    //The chances of an item like food,money etc. will spawn instead of a weapon.
//		randomweaponspawnminmoney = 30;  //The minimum amount of money that can spawn.
//		randomweaponspawnmaxmoney = 190; //The maximum amount of money that can spawn.
	money = 50; //random kept generating scalar errors , back to a steady ammount of 50
    randomweapontestint = 0.01;   //Sets the intervals in which weaponpositions are tested. (Lower = slower, but more accurate. Higher = faster, but less accurate.)


randomweapon_weaponlist = [["arifle_MX_F","30Rnd_65x39_caseless_mag"],
["arifle_TRG21_F","30Rnd_556x45_Stanag_Tracer_Red"],
["arifle_TRG20_F","30Rnd_556x45_Stanag_Tracer_Yellow"],
["arifle_MXC_F","30Rnd_65x39_caseless_mag_Tracer"],
["arifle_Khaybar_F","30Rnd_65x39_caseless_green"],
["arifle_Khaybar_C_F","30Rnd_65x39_caseless_green_mag_Tracer"],
["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],
["arifle_Khaybar_GL_F","30Rnd_65x39_caseless_green_mag_Tracer"],
["srifle_EBR_F","20Rnd_762x51_Mag"]];
 
randomweapon_itemlist = [
//"Land_Sack_F",				//Money
"Land_Basket_F",			//Water
"Land_Bucket_F"				//Food
];


    randomweaponspawnweapon = {
     _position = _this;
     _selectedgroup = (floor(random(count randomweapon_weaponlist)));
     _weapon = randomweapon_weaponlist select _selectedgroup select 0;
     _weaponholder = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
     _weaponholder addWeaponCargoGlobal [_weapon, 1];
     if((count((randomweapon_weaponlist) select _selectedgroup)) > 1) then {
     for[{_rm = 0}, {_rm < (2 + floor(random(3)))}, {_rm = _rm + 1}] do {
     _mag = randomweapon_weaponlist select _selectedgroup select ((floor(random((count(randomweapon_weaponlist select _selectedgroup) - 1)))) + 1);
     _weaponholder addMagazineCargoGlobal [_mag, 1]; 
     };
     };
     _weaponholder setPos _position;
    };

    randomweaponspawnitem = {
	 _amountmoney = 50;
     _position = _this;
     _selectedgroup = (floor(random(count randomweapon_itemlist)));
     _class = randomweapon_itemlist select _selectedgroup;
     _item = createVehicle [_class, _position, [], 0, "CAN_COLLIDE"];
     if(_class == "Land_Sack_F") then {
	  _amountmoney = _money;
      _item setVariable ["money", _amountmoney, true];
      _item setVariable ["owner", "world", true];
     };
     _item setPos _position;
    };


    _pos = [0,0];
    randomweapon_buildings = nearestObjects [_pos, ["house"], 60000];
    sleep 30;
    {
     _building = _x;
     _buildingpos = [];
     _endloop = false;
     _poscount = 0;
     while {!_endloop} do {
      if(((_building buildingPos _poscount) select 0) != 0 && ((_building buildingPos _poscount) select 1) != 0) then {
       _buildingpos = _buildingpos + [_building buildingPos _poscount];
       _poscount = _poscount + 1;
      } else {
       _endloop = true;
      };
     };
     _num = (random 100);
     if (_num < _odd1) then {
      if (count _buildingpos > 0) then
      {  
       for[{_r = 0}, {_r < count _buildingpos}, {_r = _r + 1}] do
       {
        _num2 = (random 100);
        if (_num2 < _odd2) then
        {
         _pos = _buildingpos select _r;
         _posnew = _pos;
         if(_pos select 2 < 0) then
         {
          _pos = [_pos select 0, _pos select 1, 1];
         };
         _z = 0;
         _testpos = true;
         while {_testpos} do {
          if((!lineIntersects[ATLtoASL(_pos), ATLtoASL([_pos select 0, _pos select 1, (_pos select 2) - (randomweapontestint * _z)])]) && (!terrainIntersect[(_pos), ([_pos select 0, _pos select 1, (_pos select 2) - (randomweapontestint * _z)])]) && (_pos select 2 > 0)) then {
           _posnew = [_pos select 0, _pos select 1, (_pos select 2) - (randomweapontestint * _z)];
           _z = _z + 1;
          } else {
           _testpos = false;
          };
         };
         _posnew = [_posnew select 0,_posnew select 1,(_posnew select 2) + 0.05];
         _woi = floor(random(100));
         if(_woi < _itemtoweaponratio) then {
          _posnew call randomweaponspawnitem;
         } else {
          _posnew call randomweaponspawnweapon;
         };
        };
       };
      };    
     };
    }foreach randomweapon_buildings;
