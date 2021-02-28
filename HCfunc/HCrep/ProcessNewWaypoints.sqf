// Arma 2 function

private ["_PosX","_PosY","_Ctrl","_str","_Groups","_NumGroups","_AddWpLimit",
         "_WorldPos","_gi","_Group","_AllowAddAndDeleteWp","_NewWaypoint"];
         
         
//_str = format ["Called ProcessNewWaypoints\n_this = %1", _this];

//['MOVE',_pos,_is3D,hcselected player,false]   Replace WP with one
//['MOVE',_pos,_is3D,hcselected player,true]	Add Waypoints


if ( hcshownbar and ( (call F_GetModeHC) == "Standard" ) ) then {

	_WorldPos = + (_this select 1);
	_Is3D = _this select 2;
	_Groups = + (_this select 3);
	_Ctrl = _this select 4;
	
	_NumGroups = count _Groups;
	_AddWpLimit = missionNamespace getVariable "HCExtMaxNumGroupsNewWaypoints";
	
	if ( _NumGroups > _AddWpLimit ) then {
		
		hintSilent format ["Too many groups selected to add wapoints for.\n%1 is the current config limit.", 
		                   _AddWpLimit];
		                   
		[_Groups, true, 0.2] spawn F_SelectHCGroups;
		
	} else {
			            
		for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {
			
			_Group = _Groups select _gi;
			_AllowAddAndDeleteWp = missionNamespace getVariable "HCExtAllowAddAndDeleteWp";
			
			if ( (! _Ctrl) and _AllowAddAndDeleteWp ) then {
				[_Group,true] call F_DeleteGroupWaypoints;
			};
			
			_NewWaypoint = _Group addWaypoint [_WorldPos, 0];
			_NewWaypoint setWaypointType "MOVE";
		};
	};
};

//hintSilent _str;

nil;
