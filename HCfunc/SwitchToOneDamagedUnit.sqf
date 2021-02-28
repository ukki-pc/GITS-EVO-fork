// Arma 2 function

private ["_damage","_units","_notfound","_nu","_ui","_myside","_unit"];

_damage = _this select 0;

_units = allUnits;
_notfound = true;
_nu = count _units;
_ui = 0;
_myside = side player;

while { (_notfound && (_ui < _nu)) } do {

	_unit = _units select _ui;

	if ((_myside == (side _unit)) && (_unit != player) && (damage _unit) >= _damage) then {
		
		_notfound = ! ( [player, _unit, true] call F_PerformTeamSwitch );
	};
	
	_ui = _ui + 1;
};

nil;