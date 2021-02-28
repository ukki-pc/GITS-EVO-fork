// Arma 2 function

private ["_SelectedWaypoints","_Group","_WpIndex","_SplitAfter","_NumSplits","_NumWaypoints",
         "_wi","_StoredWaypoint","_StoredWaypointWp","_IncWpIndex"];

_SelectedWaypoints = + (_this select 0);
_Group = _this select 1;
_WpIndex = _this select 2;
_SplitAfter = _this select 3;
_NumSplits = _this select 4;

_NumWaypoints = count _SelectedWaypoints;

for [{ _wi = 0 }, { _wi < _NumWaypoints }, { _wi = _wi + 1 }] do {
	
	_StoredWaypoint = (_SelectedWaypoints select _wi);
	_StoredWaypointWp = _StoredWaypoint select 0;
	
	if ( _Group == (_StoredWaypointWp select 0) ) then {
	
		_IncWpIndex = _StoredWaypointWp select 1;
		
		if ( (_SplitAfter and (_IncWpIndex > _WpIndex))
		    or ((! _SplitAfter) and (_IncWpIndex >= _WpIndex)) ) then {
			
			_IncWpIndex = _IncWpIndex + (_NumSplits - 1);
			_StoredWaypointWp set [1, _IncWpIndex];
			_StoredWaypoint set [0, _StoredWaypointWp];
			_SelectedWaypoints set [_wi, _StoredWaypoint];
		};
	};
};

_SelectedWaypoints;


