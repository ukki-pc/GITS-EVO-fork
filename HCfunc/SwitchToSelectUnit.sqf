// Arma 2 function

private ["_selunits","_nsel","_unit"];

_selunits = + _this;
_nsel = count _selunits;

if (_nsel > 0) then {

	_unit = _selunits select 0;
	[player, _unit] call F_PerformTeamSwitch;
}; 

nil;
