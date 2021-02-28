// Arma 2 function

private ["_StoredWaypoints","_LandMode","_NumWaypoints","_wi","_StoredWaypoint"];

_StoredWaypoints = + (_this select 0);
_LandMode = _this select 1;

_NumWaypoints = count _StoredWaypoints;

for [{ _wi = 0 }, { _wi < _NumWaypoints }, { _wi = _wi + 1 }] do {
	
	_StoredWaypoint = + (_StoredWaypoints select _wi);
	
	if ( _StoredWaypoint call F_StoredWaypointExists ) then {
		
		(_StoredWaypoint select 0) setWaypointDescription (format ["Land Helicopter: %1", _LandMode]);
			
		(_StoredWaypoint select 0) setWaypointStatements 
			["true", 
			 "[(group this),'" + (format ["%1",_LandMode]) + "'] call F_LandHelicopterGroup;"];
	};
};

nil;