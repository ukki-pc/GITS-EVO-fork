// Arma 2 function

private ["_SelGroups","_HCBarGroups","_gi","_NumBarGroups","_Group"];

_SelGroups = + _this;

_HCBarGroups = hcAllGroups player;
_NumBarGroups = count _HCBarGroups;

//hintSilent format ["no. selected = %1",count _SelGroups];

sleep 0.2;

for [{ _gi = 0 }, { _gi < _NumBarGroups }, { _gi = _gi + 1 }] do {
 
	_Group = _HCBarGroups select _gi;
	player hcSelectGroup [_Group, !(_Group in _SelGroups)];
};

nil;