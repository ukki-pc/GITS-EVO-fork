// Arma 2 function

private ["_Group","_GetOutOption","_GroupLoc","_GroupVehicles","_GroupsWith",
         "_NumGroupsWith","_gi","_GroupWith","_Leaving","_NewWaypoint"];

_Group = _this select 0;
_GetOutOption = _this select 1;

_GroupLoc = position (leader _Group);

_GroupVehicles = [_Group] call F_GetGroupsVehiclesInAndAssigned;
_GroupsWith = [_GroupVehicles, "Assigned"] call F_GetGroupsUsingVehicles;

_NumGroupsWith = count _GroupsWith;

for [{ _gi = 0 }, { _gi < _NumGroupsWith }, { _gi = _gi + 1 }] do {

	_GroupWith = _GroupsWith select _gi;
	_Leaving = [_GroupWith, _GetOutOption] call V_GetOutGroup;

	if ( _Leaving ) then {		
		if ( ! (_GroupWith call F_GroupHasWaypointsToDo) ) then {
		
			_NewWaypoint = _GroupWith addWaypoint [_GroupLoc, 0];
			_NewWaypoint setWaypointCompletionRadius 100;
		};
	};
};

nil;