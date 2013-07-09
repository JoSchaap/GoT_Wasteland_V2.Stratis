#include "defs.hpp"
#define GET_DISPLAY (findDisplay balca_environment_IDD)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})


_mode = _this select 0;
switch (_mode) do {
case 0: {//init

		GET_CTRL(balca_env_VD_IDC) sliderSetRange [50, 10000];
		GET_CTRL(balca_env_VD_IDC) sliderSetPosition viewDistance;
		GET_CTRL(balca_env_grass_IDC) sliderSetRange [0, 50];
		GET_CTRL(balca_env_grass_IDC) sliderSetPosition (if isNil{PG_get(grass)} then {0}else{PG_get(grass)});
		GET_CTRL(balca_env_fog_IDC) sliderSetRange [0, 1];
		GET_CTRL(balca_env_fog_IDC) sliderSetPosition fog;
		GET_CTRL(balca_env_overcast_IDC) sliderSetRange [0, 1];
		GET_CTRL(balca_env_overcast_IDC) sliderSetPosition overcast;
		GET_CTRL(balca_env_rain_IDC) sliderSetRange [0, 1];
		GET_CTRL(balca_env_rain_IDC) sliderSetPosition rain;
		_wind = wind;
		GET_CTRL(balca_env_wind_IDC) sliderSetRange [0, 100];
		GET_CTRL(balca_env_wind_IDC) sliderSetPosition (_wind distance [0,0,0]);
		GET_CTRL(balca_env_wind_dir_IDC) ctrlSetText str ((((_wind select 0) atan2 (_wind select 1))+180)%180);


		GET_CTRL(balca_env_VD_val_IDC) ctrlSetText str viewDistance;
		GET_CTRL(balca_env_grass_val_IDC) ctrlSetText str(if isNil{PG_get(grass)} then {0}else{PG_get(grass)});
		GET_CTRL(balca_env_fog_val_IDC) ctrlSetText str fog;
		GET_CTRL(balca_env_overcast_val_IDC) ctrlSetText str overcast;
		GET_CTRL(balca_env_rain_val_IDC) ctrlSetText str rain;
		GET_CTRL(balca_env_wind_val_IDC) ctrlSetText str (_wind distance [0,0,0]);

	};
case 1: {//apply from editbox
		_vd = (sliderPosition GET_CTRL(balca_env_VD_IDC)) max 0 min 10000;
		_grass = (sliderPosition GET_CTRL(balca_env_grass_IDC)) max 0 min 50;
		PG_set(grass,_grass);
		_fog = (sliderPosition GET_CTRL(balca_env_fog_IDC)) max 0 min 1;
		_overcast = (sliderPosition GET_CTRL(balca_env_overcast_IDC)) max 0 min 1;
		_rain = (sliderPosition GET_CTRL(balca_env_rain_IDC)) max 0 min 1;
		_wind = (sliderPosition GET_CTRL(balca_env_wind_IDC)) max 0 min 100;
		_wind_dir = (parseNumber ctrlText GET_CTRL(balca_env_wind_dir_IDC)) + 180;

		setViewDistance _vd;
		setTerrainGrid _grass;
		0 setFog _fog;
		0 setOvercast _overcast;
		0 setRain _rain;
		setWind [_wind*sin(_wind_dir),_wind*cos(_wind_dir),true];

		GET_CTRL(balca_env_VD_val_IDC) ctrlSetText str _vd;
		GET_CTRL(balca_env_grass_val_IDC) ctrlSetText str _grass;
		GET_CTRL(balca_env_fog_val_IDC) ctrlSetText str _fog;
		GET_CTRL(balca_env_overcast_val_IDC) ctrlSetText str _overcast;
		GET_CTRL(balca_env_rain_val_IDC) ctrlSetText str _rain;
		GET_CTRL(balca_env_wind_val_IDC) ctrlSetText str _wind;

	};
};