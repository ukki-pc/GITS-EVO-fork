// Arma 2 function

private ["_selunits","_nunints","_ui","_unit","_Group"];

_selunits = + (_this select 0);
_nunints = count _selunits;

for [{ _ui = 0 }, { _ui < _nunints }, { _ui = _ui + 1 }] do {

	_unit = _selunits select _ui;
	unassignVehicle _unit;
	doGetOut _unit;
};

if ( _nunints >= 1 ) then {
	(group (_selunits select 0)) call CopyGroupToFreshGroupHC;
};

nil;