// Arma 2 function

private ["_Groups","_NumGroups","_gi","_Group","_wpi","_NumWaypoints","_TheWaypoint"];

_Groups = + _this;

_NumGroups = count _Groups;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	_Group = _Groups select _gi;
	_NumWaypoints = count (waypoints _Group);

	for [{ _wpi = currentWaypoint _Group }, { _wpi <= _NumWaypoints }, { _wpi = _wpi + 1 }] do {
	
		_TheWaypoint = [_Group, _wpi];
	
		if (_TheWaypoint call F_IsNeverTimeoutWaypoint) exitWith {
			
			_TheWaypoint setWaypointTimeout [0, 0, 0];
			_TheWaypoint setWaypointDescription "";
			
			if ( _wpi == (currentWaypoint _Group) ) then {
				deleteWaypoint _TheWaypoint;
			};
		};
	};
};

nil;