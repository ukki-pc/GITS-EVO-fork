// Arma 2 function

private ["_Group","_MakeHalt","_NumGroupWayPoints","_wpi","_LeaderPos"];

_Group = _this select 0;
_MakeHalt = _this select 1;

_NumGroupWayPoints = count (waypoints _Group);
_LeaderPos = position (leader _Group);

if ( _MakeHalt ) then {

	[_Group, 0] setWaypointPosition [_LeaderPos, 0];
};

for [{ _wpi = _NumGroupWayPoints - 1 }, { _wpi >= 1 }, { _wpi = _wpi - 1 }] do {

	deleteWaypoint [_Group, _wpi];
};

if ( _MakeHalt ) then {
	
	_Group setCurrentWaypoint [_Group, 0];
	_Group addWaypoint [_LeaderPos, 0];
};

nil;