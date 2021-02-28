// Arma 2 function

private ["_TheVehicle","_UnitsInsideVehicle","_NumUnitsInsideVehicle","_ui","_Unit",
         "_CrewUnitsInsideVehicle"];

_TheVehicle = _this;

_UnitsInsideVehicle = crew _TheVehicle;
_NumUnitsInsideVehicle = count (_UnitsInsideVehicle);
_CrewUnitsInsideVehicle = [];

for [{ _ui = 0 }, { _ui < _NumUnitsInsideVehicle }, { _ui = _ui + 1 }] do {

	_Unit = _UnitsInsideVehicle select _ui;
	
	if ( ((assignedVehicleRole _Unit) select 0) != "Cargo" ) then { 
		_CrewUnitsInsideVehicle = _CrewUnitsInsideVehicle + [_Unit];
	};
};

_CrewUnitsInsideVehicle;