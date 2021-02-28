// Arma 2 function

private ["_Group","_WpIndex","_SplitAfter","_NumSplits","_NumGroupWayPoints","_CurrentWpIndex",
         "_LastWpIndex","_Add","_NewIndex","_BeforePos","_AfterPos","_LeaderPosition",
         "_NewPos","_NewWaypoint","_SplitRatioSize","_SplitRatio","_si"];

_Group = _this select 0;
_WpIndex = _this select 1;
_SplitAfter = _this select 2;
_NumSplits = _this select 3;

//hintSilent format ["_Group = %1; _WpIndex = %2", _Group, _WpIndex];

_NumGroupWayPoints = count (waypoints _Group);
_CurrentWpIndex = currentWaypoint _Group;
_LastWpIndex = _NumGroupWayPoints - 1;

_Add = false;

if ( _NumGroupWayPoints >= 2 ) then {
	
	if ( _SplitAfter ) then {
		
		if ( (_CurrentWpIndex <= _WpIndex) and (_WpIndex < _LastWpIndex) ) then {
		
			_Add = true;
			_NewIndex = _WpIndex + 1;
			_BeforePos = waypointPosition [_Group, _WpIndex];
			_AfterPos = waypointPosition [_Group, _WpIndex + 1];
		};
	} else {
		if ( (_CurrentWpIndex <= _WpIndex) and (_WpIndex <= _LastWpIndex) ) then {
			
			if (_CurrentWpIndex == _WpIndex) then {
				
				_LeaderPosition = position (leader _Group);
				_AfterPos = waypointPosition [_Group, _WpIndex];
				
				if ( ! ([_LeaderPosition, _AfterPos, 20] call F_CoordsEqual2D) ) then {
					
					_Add = true;
					_NewIndex = _WpIndex;
					_BeforePos = _LeaderPosition;
				};
				
			} else {
				_Add = true;
				_NewIndex = _WpIndex;
				_BeforePos = waypointPosition [_Group, _WpIndex - 1];
				_AfterPos = waypointPosition [_Group, _WpIndex];
			};
		};	
	};
};

if ( _Add ) then {

	_SplitRatioSize = 1.0 / _NumSplits;
	_SplitRatio = 1.0;
	
	for [{ _si = 2 }, { _si <= _NumSplits }, { _si = _si + 1 }] do {
		
		_SplitRatio = _SplitRatio - _SplitRatioSize;
		
		_NewPos = [_AfterPos, _BeforePos] call F_VectorSub;
		_NewPos = [_SplitRatio, _NewPos] call F_VectorScale;
		_NewPos = [_NewPos, _BeforePos] call F_VectorAdd;

		_NewWaypoint = _Group addWaypoint [_NewPos, 0, _NewIndex];
	};
};

nil;