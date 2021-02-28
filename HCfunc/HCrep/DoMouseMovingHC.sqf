// Arma 2 function

private ["_EventName","_PosX","_PosY","_str","_LeftMouseButtonDownLoc","_RightMouseButtonDownLoc","_HoldCount"];
         
//_str = "Called DoMouseMovingHC";

if (hcshownbar) then {

	_EventName = _this select 0;
	_PosX = (_this select 1) select 1;
	_PosY = (_this select 1) select 2;
	
	//_str = _str +
	//	format ["_EventName = %1\n_PosX = %2\n_PosY = %3\n_this = %4", 
	//            _EventName, _PosX, _PosY, _this];
	            
	_HoldCount = missionNamespace getVariable "HCExtMouseHoldCount";
	missionNamespace setVariable ["HCExtMouseHoldCount", _HoldCount + 1];

	//_str = _str + "\n" + (call F_GetHCExtState);

	missionNamespace setVariable ["HCExtCurrentMouseLoc", [_PosX, _PosY]];

	_LeftMouseButtonDownLoc = missionNamespace getVariable "HCExtLeftMouseButtonDownLoc";
	_RightMouseButtonDownLoc = missionNamespace getVariable "HCExtRightMouseButtonDownLoc";
	
	// Do band select or waypoint moving in the correct states.
	if ( (count _RightMouseButtonDownLoc) == 2 ) then {            
		            
		missionNamespace setVariable ["HCExtRightMouseButtonHoldLoc", [_PosX,_PosY]];
	};
	
	if ( (count _LeftMouseButtonDownLoc) == 2 ) then { 

		//hintSilent format ["Left button holding\n%1", missionNamespace getVariable "HCExtSelectedWaypoints"];
		
		if ( (call F_GetModeHC) == "Standard" ) then {
		
			if ( (count (missionNamespace getVariable "HCExtSelectedWaypoints")) >= 1 ) then {
			
				[_PosX,_PosY] call F_ProcessMovingWaypointsGUI;
			} else {           
				[_PosX,_PosY] call F_UpdateSelectionBand;
			};
		};
		
		missionNamespace setVariable ["HCExtLeftMouseButtonHoldLoc", [_PosX,_PosY]];
	};
};

//hintSilent _str;

nil;
