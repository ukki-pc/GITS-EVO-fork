// Arma 2 function

private ["_TheVehicle","_HasDriver","_TheVehicleCrewCapacity"];

_TheVehicle = _this;

_HasDriver = _TheVehicle call F_VehicleHasDriverSeat;

_TheVehicleCrewCapacity = count ((typeOf _TheVehicle) call F_VehicleTypeTurretPostions);

if _HasDriver then { _TheVehicleCrewCapacity = _TheVehicleCrewCapacity + 1 };

_TheVehicleCrewCapacity;