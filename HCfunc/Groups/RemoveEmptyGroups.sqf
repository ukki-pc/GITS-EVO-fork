// Arma 2 function

private ["_Groups","_NumGroups","_gi","_Group"];

_Groups = allGroups;
_NumGroups = count _Groups;

for [{ _gi = _NumGroups - 1 }, { 0 <= _gi }, { _gi = _gi - 1 }] do {
	
	_Group = _Groups select _gi;
	
	if ( (count (units _Group)) < 1 ) then {
	
		_Group call F_DoDeleteGroup;
	};
};

nil;