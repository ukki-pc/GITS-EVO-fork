// Arma 2 function

private ["_units","_NumUnits","_AllNotCrews","_ui","_Unit","_UnitVehicle","_HasVehicle",
         "_RoleArray"];

_units = + _this;
_NumUnits = count _units;

_AllNotCrews = (_NumUnits >= 1);

for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {

	_Unit = _units select _ui;
	_UnitVehicle = vehicle _Unit;
	_HasVehicle = (_UnitVehicle != _Unit);

	if ( _HasVehicle && ( _Unit in _UnitVehicle ) ) then {

		_RoleArray = assignedVehicleRole _Unit;

		if ( (_RoleArray select 0) != "Cargo" ) then {

			_AllNotCrews = false; 
		};
	};
}; 

_AllNotCrews;


