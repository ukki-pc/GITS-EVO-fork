// Arma 2 function

private ["_Waypoint","_WaypointMapCoord","_Exists","_Group","_WpIndex","_Waypoints","_NumWaypoints",
         "_wpi","_TestWaypointMapCoord","_TestWaypoint"];

// The wapoint index is not assumed to be the same, but the coordinate and group must be correct.

_Waypoint = + (_this select 0);
_WaypointMapCoord = + (_this select 1);

_Exists = false;

_Group = _Waypoint select 0;
_WpIndex = _Waypoint select 1;

if ( (!(isNull _Group)) and (_WpIndex >= 0) ) then {
	
	_Waypoints = waypoints _Group;
	_NumWaypoints = count _Waypoints;
	
	_wpi = currentWaypoint _Group;
	
	while { (_wpi < _NumWaypoints) and (! _Exists) } do {
	
		_TestWaypoint = [_Group, _wpi];
		_TestWaypointMapCoord = waypointPosition _TestWaypoint;
		
		_Exists = [_WaypointMapCoord, _TestWaypointMapCoord, 0.1] call F_CoordsEqual2D;
		
		_wpi = _wpi + 1;
	};
};

_Exists;