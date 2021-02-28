// Arma 2 function

private ["_Group","_Units","_NumUnits","_ui",
         "_GroupsVehicles","_NumGroupsVehicles","_vi","_GroupVehicle"];

_Group = _this;

_GroupsVehicles = [_Group] call F_GetGroupsVehiclesInAndAssigned;
_NumGroupsVehicles = count _GroupsVehicles;
_Units = units _Group;
_NumUnits = count _Units;

for [{ _vi = 0 }, { _vi < _NumGroupsVehicles }, { _vi = _vi + 1 }] do {

	_GroupVehicle = _GroupsVehicles select _vi;
	_Group leaveVehicle _GroupVehicle;
};

doGetOut _Units;
	
for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {

	unassignVehicle (_Units select _ui);
};

nil;


