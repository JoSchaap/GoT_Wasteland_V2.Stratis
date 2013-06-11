//  @file Version: 1.0
//	@file Name: findHackedVehicles.sqf
//	@file Author: AgentRev
//	@file Created: 09/06/2012 16:56

private ["_queryChecksum", "_hackedVehicles"];
_queryChecksum = call generateKey;
			
hackedVehicles = nil;

"hackedVehicles" addPublicVariableEventHandler compile format ["_hackedVehicles = _this select 1; if ( isNil '_hackedVehicles' || {typeName _hackedVehicles != typeName []} || {count _hackedVehicles <= 1} || {typeName (_hackedVehicles select 1) != typeName _queryChecksum} || {_hackedVehicles select 1 != '%1'} ) then { _this set [1, hackedVehicles] }", _queryChecksum];

while {	isNil "hackedVehicles" || 
		{typeName hackedVehicles != typeName []} || 
		{count hackedVehicles <= 1} || 
		{typeName (hackedVehicles select 1) != typeName _queryChecksum} ||
		{hackedVehicles select 1 != _vehicleOwnerChecksum} } do
{
	_queryIdent = [player,_queryChecksum];
	hackedVehicles = nil;
	
	[[player, _queryChecksum], "checkHackedVehicles", false, false] call BIS_fnc_MP;
	
	waitUntil { !isNil "hackedVehicles" };
};

_hackedVehicles = + (hackedVehicles select 0);
hackedVehicles = nil;

{
	_hackedVehicles set [_forEachIndex, [objectFromNetId (_x select 0), _x select 1]];
} forEach _hackedVehicles;

_hackedVehicles
