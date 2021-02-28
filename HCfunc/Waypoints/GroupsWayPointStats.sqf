// Arma 2 function

private ["_Groups","_NumGroups","_gpi","_Group","_NumWaypoints","_wpi","_TheWaypoint","_str"];

_Groups = + _this;

_NumGroups = count _Groups;
_str = format ["Waypoints of %1 Group", _NumGroups];

for [{ _gpi = 0 }, { _gpi < _NumGroups }, { _gpi = _gpi + 1 }] do {

	_Group = _Groups select _gpi;
	_NumWaypoints = count (waypoints _Group);
	
	_str = _str + format ["\n%1: CurrentWp = %2, Num Waypoints = %3\n[",
	                      _Group, currentWaypoint _Group, _NumWaypoints];
	
	for [{ _wpi = 0 }, { _wpi < _NumWaypoints }, { _wpi = _wpi + 1 }] do {

		_TheWaypoint = [_Group, _wpi];

        if (_wpi >= 1) then { _str = _str + ",\n"; };
        		
		_str = _str + format ["[Index: %1, Type: %2, TimOut: %3, %4, Speed: %5, Description: %6, Position: %7, Statements: %8]", 
                              _wpi, (waypointType _TheWaypoint), waypointTimeout _TheWaypoint, 
                              (waypointBehaviour _TheWaypoint), (waypointSpeed _TheWaypoint),
                              (waypointDescription _TheWaypoint), waypointPosition _TheWaypoint,
                              waypointStatements _TheWaypoint];
	};
	
	_str = _str + "]";
};

hintSilent _str;
copyToClipboard _str;

nil;