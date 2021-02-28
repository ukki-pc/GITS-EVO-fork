// Arma 2 function

private ["_Vehicles","_MinFuelLevel","_MaxFuelLevel","_NumVehicles","_VehiclesNeeding","_vi","_Vehicle"];

_Vehicles = _this select 0;
_MinFuelLevel = _this select 1;
_MaxFuelLevel = _this select 2;

_NumVehicles = count _Vehicles;
_VehiclesNeeding = [];

for [{ _vi = 0 }, { _vi < _NumVehicles }, { _vi = _vi + 1 }] do {

	_Vehicle = _vehicles select _vi;
	
	if ( [_Vehicle, _MinFuelLevel, _MaxFuelLevel] call F_VehicleNeedsFuel ) then {
	
		_VehiclesNeeding = _VehiclesNeeding + [_Vehicle];
	};
};

_VehiclesNeeding;