// Arma 2 function

private ["_Groups","_Formation","_NumGroups","_gi","_Group"];

_Groups = + (_this select 0);
_Formation = _this select 1;

_NumGroups = count _Groups;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	_Group = _Groups select _gi;
	_Group setFormation _Formation;
};

nil;