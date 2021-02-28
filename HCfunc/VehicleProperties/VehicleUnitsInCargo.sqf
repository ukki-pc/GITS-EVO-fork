// Arma 2 function

private ["_TheVehicle","_UnitsInsideVehicle","_NumUnitsInsideVehicle","_ui","_Unit",
         "_CrewUnitsInCargo"];

_TheVehicle = _this;

_UnitsInsideVehicle = crew _TheVehicle;
_NumUnitsInsideVehicle = count (_UnitsInsideVehicle);
_CrewUnitsInCargo = [];

for [{ _ui = 0 }, { _ui < _NumUnitsInsideVehicle }, { _ui = _ui + 1 }] do {

	_Unit = _UnitsInsideVehicle select _ui;
	
	if ( ((assignedVehicleRole _Unit) select 0) == "Cargo" ) then { 
		_CrewUnitsInCargo = _CrewUnitsInCargo + [_Unit];
	};
};

_CrewUnitsInCargo;