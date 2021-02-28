// Arma 2 function

private ["_Group","_MinFuelLevel","_MaxFuelLevel","_NeedsFuel","_Vehicles",
         "_NumVehicles","_vi","_Vehicle"];

_Group = _this select 0;
_MinFuelLevel = _this select 1;
_MaxFuelLevel = _this select 2;

_NeedsFuel = false;

_Vehicles = [_Group] call F_GetGroupsVehiclesInAndAssigned;
_NumVehicles = count _Vehicles;

for [{ _vi = 0 }, { _vi < _NumVehicles }, { _vi = _vi + 1 }] do {

	_vehicle = _vehicles select _vi;
	_NeedsFuel = _NeedsFuel or ([_Vehicle, _MinFuelLevel, _MaxFuelLevel] call F_VehicleNeedsFuel);
};

_NeedsFuel;