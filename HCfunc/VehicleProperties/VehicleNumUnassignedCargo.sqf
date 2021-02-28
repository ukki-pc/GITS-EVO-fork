// Arma 2 function

private ["_TheVehicle","_NumUnassignedCargo"];

_TheVehicle = _this;

_NumUnassignedCargo = (_Vehicle call F_VehicleCargoCapacity) - (count (assignedCargo _TheVehicle));

_NumUnassignedCargo;