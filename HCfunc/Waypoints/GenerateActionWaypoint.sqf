// Arma 2 function

private ["_Group","_WpLocation","_ThinkTime","_WpCondition","_WpStatements","_WpCompletionRadius",
         "_InsertIndex","_InsertIndex","_WpDummyLocation","_NewWaypoint"];

_Group = _this select 0;
_WpLocation = + (_this select 1);
_ThinkTime = _this select 2;
_WpCondition = _this select 3;
_WpStatements = _this select 4;
_WpCompletionRadius = _this select 5;
_InsertWp = false;
if ( (count _this) >= 7 ) then { _InsertIndex = _this select 6; _InsertWp = true; };

_WpDummyLocation = [_WpCompletionRadius + 1000,0,0];
[_WpDummyLocation, _WpLocation, _WpDummyLocation] call F_VectorAdd;

if ( _InsertWp ) then {
	_NewWaypoint = _Group addWaypoint [_WpDummyLocation, 0, _InsertIndex];
} else {
	_NewWaypoint = _Group addWaypoint [_WpDummyLocation, 0];
};	
	
_NewWaypoint setWaypointDescription "Special Action";
_NewWaypoint setWaypointTimeout [_ThinkTime, _ThinkTime, _ThinkTime];
_NewWaypoint setWaypointStatements [_WpCondition, _WpStatements];
_NewWaypoint setWaypointCompletionRadius _WpCompletionRadius;
_NewWaypoint setWaypointPosition [_WpLocation, 0];

nil;