// Arma 2 function

private ["_Groups","_NumGroups","_gi","_Group","_Units"];

_Groups = + _this;
_NumGroups = count _Groups;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {
 
	_Group = _Groups select _gi;
	_Units = units _Group;
	
	if (_Units call F_AllUnitsAreOnFoot) then {
	
		_Group call F_UnassignVehiclesGroup;
	};
};

nil;