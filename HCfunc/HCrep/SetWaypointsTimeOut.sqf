// Arma 2 function

private ["_StoredWaypoints","_TimeInSeconds","_NumWaypoints","_wi","_StoredWaypoint"];

_StoredWaypoints = + (_this select 0);
_TimeInSeconds = _this select 1;

_NumWaypoints = count _StoredWaypoints;

for [{ _wi = 0 }, { _wi < _NumWaypoints }, { _wi = _wi + 1 }] do {
	
	_StoredWaypoint = + (_StoredWaypoints select _wi);
	
	if ( _StoredWaypoint call F_StoredWaypointExists ) then {
	
		(_StoredWaypoint select 0) setWaypointTimeout [_TimeInSeconds,_TimeInSeconds,_TimeInSeconds];
		
		if ( _TimeInSeconds < 1e6 ) then {
			(_StoredWaypoint select 0) setWaypointDescription (format ["Wait %1s", _TimeInSeconds]);
		} else {
			(_StoredWaypoint select 0) setWaypointDescription "Wait Indefinitely";
		};
	};
};

nil;