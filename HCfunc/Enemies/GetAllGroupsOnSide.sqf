// Arma 2 function

private ["_Side","_Groups","_NumGroups","_FilteredGroups","_gi","_Group"];

_Side = _this;

_Groups = allGroups;
_NumGroups = count _Groups;
_FilteredGroups = [];

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {
	
	_Group = _Groups select _gi;
	
	if ( (side _Group) == _Side ) then {
		
		_FilteredGroups = _FilteredGroups + [_Group];
	};
};

_FilteredGroups;