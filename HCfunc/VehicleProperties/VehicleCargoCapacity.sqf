// Arma 2 function

private ["_TheVehicle","_NumCargoSpaces","_UnitsInsideVehicle","_NumUnoccupiedCargo",
         "_NumUnitsInsideVehicle","_ui","_Unit","_CargoUnitsInsideVehicle"];

_TheVehicle = _this;

// emptyPositions returns unassigned and assigned empty positions.
// crew returns only the units currently in the vehicle (not those assigned but outside).
//_NumCargoSpaces = (count (assignedCargo _TheVehicle));

_UnitsInsideVehicle = crew _TheVehicle;

_NumUnoccupiedCargo = _TheVehicle emptyPositions "cargo";
_NumUnitsInsideVehicle = count (_UnitsInsideVehicle);
_CargoUnitsInsideVehicle = 0;

for [{ _ui = 0 }, { _ui < _NumUnitsInsideVehicle }, { _ui = _ui + 1 }] do {

	_Unit = _UnitsInsideVehicle select _ui;
	
	if ( ((assignedVehicleRole _Unit) select 0) == "Cargo" ) then { 
		_CargoUnitsInsideVehicle = _CargoUnitsInsideVehicle + 1;
	};
};

_NumCargoSpaces = _CargoUnitsInsideVehicle + _NumUnoccupiedCargo;

_NumCargoSpaces;