// Arma 2 function

private ["_StoredWaypoints","_NumWaypoints","_wi","_StoredWaypoint"];

_StoredWaypoints = + _this;

_NumWaypoints = count _StoredWaypoints;

for [{ _wi = 0 }, { _wi < _NumWaypoints }, { _wi = _wi + 1 }] do {
	
	_StoredWaypoint = + (_StoredWaypoints select _wi);
	
	if ( _StoredWaypoint call F_StoredWaypointExists ) then {
			
		(_StoredWaypoint select 0) setWaypointDescription "";
		(_StoredWaypoint select 0) setWaypointStatements ["true", ""];
	};
};

nil;