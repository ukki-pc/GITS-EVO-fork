// Arma 2 function
// "UNLOCKED", "DEFAULT" or "LOCKED".

private ["_LockSetting","_Vehicles","_NumVehicles","_vi","_Vehicle"];

_LockSetting = _this;

_Vehicles = vehicles;
_NumVehicles = count _Vehicles;

for [{ _vi = 0 }, { _vi < _NumVehicles }, { _vi = _vi + 1 }] do {
	
	_Vehicle = _Vehicles select _vi;
    _Vehicle setVehicleLock _LockSetting;
};

nil;