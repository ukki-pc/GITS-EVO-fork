// Arma 2 function

private ["_Groups","_ngrps","_gi","_myside","_group","_s","_s",
         "_s","_s","_s","_s","_s","_s","_s"];

_Groups = allGroups;
_ngrps = count _Groups;
_myside = side player;

for [{ _gi = 0 }, { _gi < _ngrps }, { _gi = _gi + 1 }] do {

	_group = _Groups select _gi;

	if ( (side (leader _group)) == _myside ) then {

		_group call F_GroupUnitsReallocateExceptLeader;
	};
};

nil;