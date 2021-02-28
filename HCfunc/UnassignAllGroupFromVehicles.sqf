// Arma 2 function

private ["_Group","_GroupsVehicles","_Units",
         "_GroupsVehicles","_NumGroupsVehicles","_gi","_GroupVehicle"];
         
_Group = group player;

if ( player == (leader _Group) ) then {

	_GroupsVehicles = [_Group] call F_GetGroupsVehiclesInAndAssigned;
	_NumGroupsVehicles = count _GroupsVehicles;
	
	for [{ _gi = 0 }, { _gi < _NumGroupsVehicles }, { _gi = _gi + 1 }] do {
	
		_GroupVehicle = _GroupsVehicles select _gi;
		_Group leaveVehicle _GroupVehicle;
	};
	
	_Units = units _Group;
	doGetOut _Units;
	
	_Group call F_UnassignGroupUnitsFromVehicle;
	_Group call CopyGroupToFreshGroupHC;
};

nil;