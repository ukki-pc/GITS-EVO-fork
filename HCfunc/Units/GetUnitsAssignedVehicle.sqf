// Arma 2 function

private ["_Vehicle","_Units","_NumUnits","_UnitsFound","_ui","_Unit"];

_Vehicle = _this;

_Units = allUnits;
_NumUnits = count _Units;
_UnitsFound = [];

for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {
	
	_Unit = _Units select _ui;
	
	if ( _Vehicle == (assignedVehicle _Unit) ) then {
	
		_UnitsFound = _UnitsFound + [_Unit];
	};
};

_UnitsFound;