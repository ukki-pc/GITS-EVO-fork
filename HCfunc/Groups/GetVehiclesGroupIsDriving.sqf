// Arma 2 function

private ["_Group","_Units","_NumUnits","_VehiclesDriving","_ui","_Unit"];

_Group = _this;

_Units = units _Group;
_NumUnits = count _Units; 
_VehiclesDriving = [];

for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {
	
	_Unit = _Units select _ui;
	
	if ( _Unit call F_UnitIsMountedDriver ) then {

		_VehiclesDriving = _VehiclesDriving + [vehicle _Unit];
	};
};

_VehiclesDriving;