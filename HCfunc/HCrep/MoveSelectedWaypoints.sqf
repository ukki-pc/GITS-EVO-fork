// Arma 2 function

private ["_MovementInWorld","_SelectedWaypoints","_NewStoredWaypoints","_NumWaypoints","_wi",
         "_StoredWaypoint","_NewWaypointLoc","_CompletionRadius"];

_MovementInWorld = + _this;

_SelectedWaypoints = + (missionNamespace getVariable "HCExtSelectedWaypoints");
_NewStoredWaypoints = [];

_NumWaypoints = count _SelectedWaypoints;

for [{ _wi = 0 }, { _wi < _NumWaypoints }, { _wi = _wi + 1 }] do {
	
	_StoredWaypoint = _SelectedWaypoints select _wi;
	
	if ( _StoredWaypoint call F_StoredWaypointExists ) then {
	
		_NewWaypointLoc = [_StoredWaypoint select 1, _MovementInWorld] call F_VectorAdd;
		_StoredWaypoint set [1, _NewWaypointLoc];
		
		_NewStoredWaypoints = _NewStoredWaypoints + [_StoredWaypoint];
		
		_CompletionRadius = waypointCompletionRadius (_StoredWaypoint select 0);
		(_StoredWaypoint select 0) setWaypointPosition [_NewWaypointLoc, 0];
	};
};

missionNamespace setVariable ["HCExtSelectedWaypoints", _NewStoredWaypoints];

nil;