// Arma 2 function

private ["_Is3D","_Group","_WpID","_Button","_PosX","_PosY","_Shift","_Ctrl","_Alt","_SelectedGroups",
         "_str","_Groups","_Waypoint","_SelWaypoint","_SelectedWaypoints"];
         
//_str = "Called DoOnGroupIconClick";

if ( hcshownbar and ((call F_GetModeHC) == "Standard") ) then {

	_Is3D = (_this select 0) select 0;
	_Group = (_this select 0) select 1;
	_WpID = (_this select 0) select 2;
	_Button = (_this select 0) select 3;
	_PosX = (_this select 0) select 4;
	_PosY = (_this select 0) select 5;
	_Shift = (_this select 0) select 6;
	_Ctrl = (_this select 0) select 7;
	_Alt = (_this select 0) select 8;
	_SelectedGroups = + (_this select 1);

	//_logic = player getvariable "BIS_HC_scope";
	
	//_str = _str +
	//	format ["\n_Is3D = %1\n_Group = %2\n_WpID = %3\n_Button = %4\n_PosX = %5\n_PosY = %6\n_Shift = %7\n_Ctrl = %8\n_Alt = %9\n_this = %10", 
	//            _Is3D, _Group, _WpID, _Button, _PosX, _PosY, _Shift, _Ctrl, _Alt, _this];

	//_worldpos = (uinamespace getvariable "_MapView") ctrlmapscreentoworld [_posx,_posy];

	_Groups = [_Group];

	if (_Ctrl) then {
		_Groups = _Groups + _SelectedGroups;
	};
	
	[_Groups,true] spawn F_SelectHCGroups;
	
	if ((_WpID >= 0) and (_Button == 0)) then {
		//showCommandingMenu "RscHCWPRootMenu";
		
		_Waypoint = [_Group,_WpID];
		_SelWaypoint = [_Waypoint, (waypointPosition _Waypoint)];
		
		_SelectedWaypoints = [];
		if (_Ctrl) then { _SelectedWaypoints = missionNamespace getVariable "HCExtSelectedWaypoints"; };
		
		missionNamespace setVariable ["HCExtSelectedWaypoints", (_SelectedWaypoints + [_SelWaypoint])];
		
		//_str = _str +
		//	format ["\nHCExtSelectedWaypoints = %1", 
		//			missionNamespace getVariable "HCExtSelectedWaypoints"];
		
		showCommandingMenu "#USER:HCExtWaypoint_menu";
		//showCommandingMenu "#USER:Statistics_menu";

		[hcAllGroups player, false, 0.1] spawn F_SelectHCGroups;

	} else {
		missionNamespace setVariable ["HCExtSelectedWaypoints", []];
	};
	
	if ((_WpID >= 0) and (_Button == 1)) then {
		
		// Show waypoint parameters
		[_Group, _WpID] spawn F_ShowWaypointInfo;
		
		missionNamespace setVariable ["HCExtSelectedWaypoints", []];
		
		[hcAllGroups player, false, 0.1] spawn F_SelectHCGroups;
	};
	
	if ((_WpID < 0) and (_Button == 1)) then {
		
		// Show group state
		_Group spawn V_SquadUnitsStats;
		
		missionNamespace setVariable ["HCExtSelectedWaypoints", []];
	};

	
	//showCommandingMenu "RscHCWPRootMenu";
	//showCommandingMenu "RscHCGroupRootMenu";
	//showCommandingMenu "";
};

//hintSilent _str;

nil;
