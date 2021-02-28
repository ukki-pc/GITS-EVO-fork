// Arma 2 function

private ["_selunits","_unit","_hcgrps","_NumHCgrps","_gi","_SubGroup","_group"];

_selunits = + _this;

if ((count _selunits ) >= 1) then {

	_unit = _selunits select 0;
	_hcgrps = hcAllGroups player;
	_NumHCgrps = count _hcgrps;
	hcRemoveAllGroups player;

	for [{ _gi = 0 }, { _gi < _NumHCgrps }, { _gi = _gi + 1 }] do {
	
		_SubGroup = _hcgrps select _gi;
		_unit hcsetgroup [_SubGroup,""];
	};

	_group = group player;
	_group selectLeader _unit;
	[player, _unit] call F_PerformTeamSwitch;
};

nil;
