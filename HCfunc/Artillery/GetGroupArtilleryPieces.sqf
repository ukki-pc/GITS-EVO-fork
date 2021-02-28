// Arma 2 function
// This is only a simple check at the moment.

private ["_Group","_Vehicles","_VehicleTypes"];

_Group = _this;

//F_GetGroupsVehiclesInAndAssigned
//F_GetGroupsVehiclesIn
_Vehicles = [_Group] call F_GetGroupsVehiclesIn;

_VehicleTypes = [objNull, "SPArt", true] call F_VehicleOfUseType;
_VehicleTypes = _VehicleTypes + ([objNull, "RocketArt", true] call F_VehicleOfUseType);
_VehicleTypes = _VehicleTypes + ([objNull, "StaticArtGun", true] call F_VehicleOfUseType);
_VehicleTypes = _VehicleTypes + ([objNull, "StaticMortar", true] call F_VehicleOfUseType);

_Vehicles = [_Vehicles, _VehicleTypes] call F_FilterObjectsOfTypes;

[_Vehicles, _VehicleTypes];


