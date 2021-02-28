// Arma 2 function
// The group must have all drivers in all the vehicles that it assigned to
// and have all its other units in these vehicles.

private ["_Group","_Result","_GroupVehicles","_VehiclesDriving"];

_Group = _this;

_Result = false;

if ( (units _Group) call F_AllUnitsAreInVehicles ) then {

	_GroupVehicles = [_Group] call F_GetGroupsVehiclesInAndAssigned;
	_VehiclesDriving = _Group call F_GetVehiclesGroupIsDriving;

	_Result = [_GroupVehicles, _VehiclesDriving] call F_ArraysElementsEqual;
};

_Result;