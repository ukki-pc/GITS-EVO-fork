// Arma 2 function

private ["_Groups","_NumGroups","_gi","_ngi","_group","_str"];

_Groups = hcAllGroups player;
_NumGroups = count _Groups;
_ngi = 1;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	_group = _Groups select _gi;
	player hcRemoveGroup _group;

	if ( (count (units _group)) > 0 ) then {

		_str = format ["%1", _ngi];
		player hcsetgroup [_group,_str];
		_ngi = _ngi + 1;
	};
};

nil;
