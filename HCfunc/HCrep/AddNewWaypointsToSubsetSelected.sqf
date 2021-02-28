// Arma 2 function

private ["_Groups","_SubsetCategory","_WorldClickParam","_WorldPos","_Is3D","_Ctrl",
         "_SubsetGroups","_NumSubsetGroups","_gi","_Group","_NewWaypoint"];
     
_Groups = + (_this select 0);
_SubsetCategory = _this select 1;

if (hcshownbar) then {
	
	 _WorldClickParam = call F_GetWorldClickParameters;
	
	_WorldPos = + (_WorldClickParam select 0);
	_Is3D = _WorldClickParam select 1;
	_Ctrl = _WorldClickParam select 2;
	
	if ( ! _Is3D ) then {
	
		_SubsetGroups = [_Groups, _SubsetCategory] call F_SubsetOfGroups;
		_NumSubsetGroups = count _SubsetGroups;
				
		for [{ _gi = 0 }, { _gi < _NumSubsetGroups }, { _gi = _gi + 1 }] do {
			
			_Group = _SubsetGroups select _gi;
			
			if ( false ) then {
				[_Group,true] call F_DeleteGroupWaypoints;
			};
			
			_NewWaypoint = _Group addWaypoint [_WorldPos, 0];
			_NewWaypoint setWaypointType "MOVE";
		};
	};
};

nil;
