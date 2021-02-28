// Arma 2 function

private ["_units","_nunits","_AllCrews","_ui","_unit","_unitvehicle","_hasvehicle",
         "_RoleArray"];

_units = + _this;
_nunits = count _units;

_AllCrews = (_nunits >= 1);

for [{ _ui = 0 }, { _ui < _nunits }, { _ui = _ui + 1 }] do {

	_unit = _units select _ui;
	_unitvehicle = vehicle _unit;
	_hasvehicle = (_unitvehicle != _unit);
	
	if ( _hasvehicle && ( _unit in _unitvehicle ) ) then {
	
		_RoleArray = assignedVehicleRole _unit;
		
		if ( (_RoleArray select 0) == "Cargo" ) then {
		
			_AllCrews = false; 
		};
	} else {
		_AllCrews = false;
	};
}; 

_AllCrews;


