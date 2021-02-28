// Arma 2 function

private ["_SelectedWaypoints","_NumWaypoints","_wi","_StoredWaypoint","_Group","_WpIndex"];

_SelectedWaypoints = + (_this select 0);
_SplitAfter = _this select 1;
_NumSplits = _this select 2;

_NumWaypoints = count _SelectedWaypoints;

for [{ _wi = 0 }, { _wi < _NumWaypoints }, { _wi = _wi + 1 }] do {
	
	_StoredWaypoint = (_SelectedWaypoints select _wi);
	
	if ( _StoredWaypoint call F_StoredWaypointExists ) then {
				
		_Group = (_StoredWaypoint select 0) select 0;
		_WpIndex = (_StoredWaypoint select 0) select 1;
				
		[_Group, _WpIndex, _SplitAfter, _NumSplits] call F_WaypointSplitBeforeAfter;
		
		_SelectedWaypoints = [_SelectedWaypoints, _Group, _WpIndex, _SplitAfter, _NumSplits]
											call F_IncSelectedWpsOnSplitBeforeAfter;
	};
};

missionNamespace setVariable ["HCExtSelectedWaypoints", []];

nil;