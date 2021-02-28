// Arma 2 function

private ["_Groups","_NumGroups","_ToSelected","_gi","_Group"];

_Groups = + (_this select 0);
_ToSelected = _this select 1;

if ( (count _this) >= 3 ) then {
	sleep (_this select 2);
};

_NumGroups = count _Groups;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {
 
	_Group = _Groups select _gi;
	player hcSelectGroup [_Group, _ToSelected];
};

nil;