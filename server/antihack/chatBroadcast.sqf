
//	@file Version: 1.0
//	@file Name: chatBroadcast.sqf
//	@file Author: AgentRev
//	@file Created: 02/06/2013 16:23

if (typeName _this == typeName [] && {count _this > 2} && {_this select 2 == _flagChecksum} && {_this select 1 != getPlayerUID player}) then
{
	player groupChat format ["%1", _this select 0];
};
