    //Random weapons and items spawning script for wasteland missions.
    //Author : Ed!, [GoT] JoSchaap

    _odd1 = 40;       //The odds that a building is selected to place loot.
    _odd2 = 30;       //The odds that the selected building's spots will have loot(almost like odds per room).
    _itemtoweaponratio = 55;    //The chances of an item like food,money etc. will spawn instead of a weapon.
    randomweapontestint = 0.01;   //Sets the intervals in which weaponpositions are tested. (Lower = slower, but more accurate. Higher = faster, but less accurate.)


randomweapon_weaponlist = [
["SDAR_F","20Rnd_556x45_UW_mag"],
["arifle_TRG21_ACO_point_F","30Rnd_556x45_Stanag_Tracer_Red"],
["arifle_TRG20_ACO_F","30Rnd_556x45_Stanag_Tracer_Yellow"],
["arifle_TRG21_F","30Rnd_556x45_Stanag"],
["arifle_TRG20_F","30Rnd_556x45_Stanag"],
["hgun_P07_snds_F","16Rnd_9x21_Mag"],
["hgun_P07_F","16Rnd_9x21_Mag"],
["hgun_Rook40_snds_F","16Rnd_9x21_Mag"],
["hgun_Rook40_F","16Rnd_9x21_Mag"]
];
 
randomweapon_itemlist = [
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
     _position = _this;
     _selectedgroup = (floor(random(count randomweapon_itemlist)));
     _class = randomweapon_itemlist select _selectedgroup;
     _item = createVehicle [_class, _position, [], 0, "CAN_COLLIDE"];
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
