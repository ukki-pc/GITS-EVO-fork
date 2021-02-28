// Arma 2 function

private ["_Unit","IsDriver"];

_Unit = _this;

IsDriver = ( ((assignedVehicleRole _Unit) select 0) == "Driver" );

IsDriver;


