// Arma 2 function

private ["_Groups","_NumGroups","_gi","_Group"];

_Groups = hcAllGroups player;
_NumGroups = count _Groups;

if ( _NumGroups >= 1 ) then {

	hcRemoveAllGroups player;

	for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

		_Group = _Groups select _gi;

		if ( (count (units _Group)) < 1 ) then {
		
			_Group call F_DoDeleteGroup;
		}else{
			player hcsetgroup [_Group,""];
		};
	};
};

nil;