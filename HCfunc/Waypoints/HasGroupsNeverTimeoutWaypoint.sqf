// Arma 2 function

private ["_Group","_NumGroupWayPoints","_IsNeverTimeOut","_wpi","_TheWaypoint"];


_Group = _this;

_NumGroupWayPoints = count (waypoints _Group);
_IsNeverTimeOut = false;

for [{ _wpi = 0 }, { _wpi < _NumGroupWayPoints }, { _wpi = _wpi + 1 }] do {

	_TheWaypoint = [_Group, _wpi];
	_IsNeverTimeOut = _IsNeverTimeOut || (_TheWaypoint call F_IsNeverTimeoutWaypoint);
};

_IsNeverTimeOut;