// Arma 2 function

private ["_Groups","_NumGroups","_gi"];

_Groups = + _this select 0;
_MakeHalt = _this select 1;

_NumGroups = count _Groups;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	[(_Groups select _gi), _MakeHalt] call F_DeleteGroupWaypoints;
};

nil;