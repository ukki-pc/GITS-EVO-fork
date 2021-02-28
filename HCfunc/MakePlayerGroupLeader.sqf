// Arma 2 function

private ["_group","_oldleader","_hcgrps","_NumHCgrps","_gi","_SubGroup"];
         
_group = group player;
_oldleader = leader _group;

if (_oldleader != player) then {

	_hcgrps = hcAllGroups _oldleader;
	_NumHCgrps = count _hcgrps;
	hcRemoveAllGroups _oldleader;
	
	for [{ _gi = 0 }, { _gi < _NumHCgrps }, { _gi = _gi + 1 }] do {
	
		_SubGroup = _hcgrps select _gi;
		player hcsetgroup [_SubGroup,""];
	};

	_group selectLeader player;
};

nil;

