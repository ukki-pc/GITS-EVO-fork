// Arma 2 function

private ["_TheVehicle","_Driver","_AssignedVehicleCrew"];

_TheVehicle = _this;

_Driver = assignedDriver _TheVehicle;

if ( isNull _Driver) then {
	_AssignedVehicleCrew = [];
} else {
	_AssignedVehicleCrew = [_Driver];
};

_AssignedVehicleCrew = _AssignedVehicleCrew + (_TheVehicle call F_VehicleCrewInTurrets);

_AssignedVehicleCrew;