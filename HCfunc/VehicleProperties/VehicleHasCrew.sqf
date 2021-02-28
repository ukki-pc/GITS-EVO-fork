// Arma 2 function

private ["_TheVehicle","_TheVehicleHasCrew"];

_TheVehicle = _this;

_TheVehicleHasCrew = ((count (_TheVehicle call F_VehicleAssignedCrew)) >= 1);

_TheVehicleHasCrew;