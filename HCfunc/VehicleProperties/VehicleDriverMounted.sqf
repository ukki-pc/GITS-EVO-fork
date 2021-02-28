// Arma 2 function

private ["_TheVehicle","_UnitsInsideVehicle","_NumUnitsInsideVehicle","_ui","_Unit",
         "_DriverInMounted"];

_TheVehicle = _this;

_UnitsInsideVehicle = crew _TheVehicle;
_NumUnitsInsideVehicle = count (_UnitsInsideVehicle);
_DriverInMounted = false;

for [{ _ui = 0 }, { _ui < _NumUnitsInsideVehicle }, { _ui = _ui + 1 }] do {

	_Unit = _UnitsInsideVehicle select _ui;
	
	_DriverInMounted = _DriverInMounted or ( ((assignedVehicleRole _Unit) select 0) == "Driver" );
};

_DriverInMounted;