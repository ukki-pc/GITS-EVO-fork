// Arma 2 function

private ["_Vehicles","_NumVehicles","_EmptyVehicles","_vi","_TheVehicle"];

_Vehicles = + _this;
_NumVehicles = count _Vehicles;

_EmptyVehicles = [];

for [{ _vi = 0 }, { _vi < _NumVehicles }, { _vi = _vi + 1 }] do {

	_TheVehicle = _Vehicles select _vi;

	if ( ! (_TheVehicle call F_VehicleIsUsed) ) then {

		_EmptyVehicles = _EmptyVehicles + [_TheVehicle];
	};
}; 

_EmptyVehicles;


