// Arma 2 function

private ["_Group","_WpIndex","_MakeHalt","_NumGroupWayPoints","_CurrentWpIndex"];

_Group = _this select 0;
_WpIndex = _this select 1;
_MakeHalt = _this select 2;

_NumGroupWayPoints = count (waypoints _Group);
_CurrentWpIndex = currentWaypoint _Group;

if ( (_WpIndex >= _CurrentWpIndex) and (_NumGroupWayPoints >= 2)) then {
	deleteWaypoint [_Group, _WpIndex];
};

if ( _NumGroupWayPoints <= (_CurrentWpIndex + 1) ) then {
	_Group addWaypoint [position (leader _Group), 0];
};

nil;