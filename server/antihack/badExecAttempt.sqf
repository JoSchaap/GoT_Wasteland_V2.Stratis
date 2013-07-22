//	@file Version: 1.0
//	@file Name: badExecAttempt.sqf
//	@file Author: AgentRev
//	@file Created: 14/07/2013 13:10

if (!isServer) exitWith {};

if (typeName _this == typeName [] && {count _this > 0} && {typeName (_this select 0) == typeName ""} && {_this select 0 == "BIS_fnc_MP_packet"}) then
{
	private ["_values", "_arguments", "_code"];
	_values = [_this select 1, 0] call BIS_fnc_removeIndex;
	
	_arguments = [_values, 0] call BIS_fnc_removeIndex;
	_code = _values select 0;
	
	_defineServerRules = (_arguments select 0 == "BIS_fnc_execVM" && {typeName _code == typeName []} && {count _code > 1} && {typeName (_code select 1) == typeName ""} && {_code select 1 == "client\functions\defineServerRules.sqf"});

	if (_defineServerRules || {(toLower (_values select 1)) in ["bis_fnc_kbtelllocal", "bis_fnc_effectkilledairdestruction", "bis_fnc_effectkilledsecondaries", "bis_fnc_effectkilledairdestructionstage2", "bis_fnc_tridenthandledamage", "bis_fnc_tridenthandledamage_server", "bis_fnc_shownotification", "bis_fnc_tasksetstate"]}) then
	{
		_this call BIS_fnc_MPexec;
	}
	else
	{
		_arguments = [_values, 0] call BIS_fnc_removeIndex;
		_code = _values select 0;
		diag_log format ["ANTI-HACK 0.8.0: An unknown player attempted to execute: arguments=%1 code=%2", _arguments, str _code];
	};
};
