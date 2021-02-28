// Arma 2 function

private ["_Groups","_NumGroups","_gi","_Group"];

_Groups = allGroups;
_NumGroups = count _Groups;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	_Group = _Groups select _gi;
	if ( (count (units _Group)) <= 0 ) then { _Group call F_DoDeleteGroup; };
};

nil;