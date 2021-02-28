// Arma 2 function

private ["_Groups","_NumGroups","_gi","_Group"];

_Groups = + _this;

_NumGroups = count _Groups;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	//hintSilent "_Group = _Groups select _gi;";
	_Group = _Groups select _gi;
	
	if (! (_Group call F_HasGroupsNeverTimeoutWaypoint)) then {
	
		_Group call F_InsertNeverTimeoutWaypoint;
	};
};

nil;