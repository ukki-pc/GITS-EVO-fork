// Arma 2 function

private ["_Group","_CurrentWp","_BigTime","_LeaderPosition","_OffsetPosition","_NewWaypoint"];


_Group = _this;

_CurrentWp = currentWaypoint _Group;

_BigTime = 1e9;   //Time in seconds
_LeaderPosition = position (leader _Group);
_LeaderPosition = [(_LeaderPosition select 0), _LeaderPosition select 1, 0];
_OffsetPosition = [(_LeaderPosition select 0) + 1000, _LeaderPosition select 1, 0];

if (_CurrentWp == 0) then {

	_NewWaypoint = _Group addWaypoint [_OffsetPosition, 0, 1];
} else {
	_NewWaypoint = _Group addWaypoint [_OffsetPosition, 0, _CurrentWp];
};

_NewWaypoint setWaypointTimeout [_BigTime, _BigTime, _BigTime];
_NewWaypoint setWaypointDescription "Wait Indefinitely";
_NewWaypoint setWaypointPosition [_LeaderPosition, 0];

nil;