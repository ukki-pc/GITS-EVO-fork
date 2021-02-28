// Arma 2 function

private ["_Unit","_IsMountedDriver"];

_Unit = _this;

_IsMountedDriver = ( ((assignedVehicleRole _Unit) select 0) == "Driver" ) 
                  and (_Unit != (vehicle _Unit));

_IsMountedDriver;


