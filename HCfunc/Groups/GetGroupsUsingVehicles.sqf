// Arma 2 function

private ["_Vehicles","_VehicleUse","_NumVehicles","_Groups","_vi","_Vehicle",
         "_VehicleUnits","_NumVehicleUnits","_ui","_Unit","_UnitGroup"];

_Vehicles = + (_this select 0);
_VehicleUse = _this select 1;

_NumVehicles = count _Vehicles;
_Groups = [];

for [{ _vi = 0 }, { _vi < _NumVehicles }, { _vi = _vi + 1 }] do {
	
	_Vehicle = _Vehicles select _vi;
	_VehicleUnits = [];
	
	if ( _VehicleUse == "In" ) then {
		
		_VehicleUnits = crew _Vehicle;
	};
	
	if ( _VehicleUse == "Assigned" ) then {
		
		_VehicleUnits = _Vehicle call F_GetUnitsAssignedVehicle;
	};
	
	_NumVehicleUnits = count _VehicleUnits;
	
	for [{ _ui = 0 }, { _ui < _NumVehicleUnits }, { _ui = _ui + 1 }] do {
		
		_Unit = _VehicleUnits select _ui;
		_UnitGroup = group _Unit;
		
		if ( ! (_UnitGroup in _Groups) ) then {
			_Groups = _Groups + [_UnitGroup];
		}
	};
};
	
//hintSilent format ["_VehicleUnits = %1\n_NumVehicleUnits = %2\n_Groups = %3", 
//                   _VehicleUnits, _NumVehicleUnits, _Groups];

_Groups;