// Arma 2 function

private ["_Group","_NumGroupWayPoints","_CurrentWpIndex","_WaypointsToDo"];

_Group = _this;

_NumGroupWayPoints = count (waypoints _Group);
_CurrentWpIndex = currentWaypoint _Group;

_WaypointsToDo = (_NumGroupWayPoints == (_CurrentWpIndex + 1));

_WaypointsToDo;