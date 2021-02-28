// Arma 2 function

private ["_Groups","_NumGroups","_gi","_Group","_NumGroupWayPoints","_CurrentWpIndex"];

_Groups = + _this;
_NumGroups = count _Groups;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	_Group = _Groups select _gi;
	_NumGroupWayPoints = count (waypoints _Group);
	_CurrentWpIndex = currentWaypoint _Group;

	//Need to set the waypoint to the current group location to make the units stop moving.
	//[_Group, (_NumGroupWayPoints - 1)] setWaypointCompletionRadius 1000000;

	if ( (_NumGroupWayPoints > _CurrentWpIndex) and (_NumGroupWayPoints >= 2)) then {
		deleteWaypoint [_Group, _CurrentWpIndex];
	};
	
	if ( _NumGroupWayPoints <= (_CurrentWpIndex + 1) ) then {
		_Group addWaypoint [position (leader _Group), 0];
	};

};

nil;