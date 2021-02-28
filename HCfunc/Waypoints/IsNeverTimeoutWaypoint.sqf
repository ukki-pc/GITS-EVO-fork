// Arma 2 function

private ["_TheWaypoint","_Result"];

_TheWaypoint = + _this;

_Result = (((waypointTimeout _TheWaypoint) select 0) > 0.0);

_Result;