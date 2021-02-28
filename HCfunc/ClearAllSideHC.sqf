// Arma 2 function

private ["_myside","_units","_nunits","_ui","_unit"];

_myside = side player;
_units = allunits;
_nunits = count _units;

for [{ _ui = 0 }, { _ui < _nunits }, { _ui = _ui + 1 }] do {

	_unit = _units select _ui;

	if ((side _unit) == _myside) then {

		hcRemoveAllGroups _unit; 
	};
};

[] call F_HCExtRefreshIcons;

nil;