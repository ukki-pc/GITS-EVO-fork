// Arma 2 function

private ["_TheVehicle","_TheVehicleIsOccupied"];

_TheVehicle = _this;

_TheVehicleIsOccupied = ((count (crew _TheVehicle)) >= 1);

_TheVehicleIsOccupied;