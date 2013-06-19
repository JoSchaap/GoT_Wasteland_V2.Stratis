//  @file Version: 1.0
//	@file Name: setup.sqf
//	@file Author: AgentRev
//	@file Created: 08/06/2013 01:07

private "_key";
_key = [];

for "_x" from 1 to 64 do
{
	_char = floor (random 36);
	
	if (_char < 10) then {
		_char = _char + 48;
	}
	else {
		_char = _char - 10 + 65;
	};
	
	_key set [(_x - 1), _char];		
};

toString _key
