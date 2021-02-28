// Arma 2 function

private ["_EventName","_Button","_PosX","_PosY","_Shift","_Ctrl","_Alt","_Groups","_str","_WorldPos"];
         
//_str = "Called DoMouseButtonDownHC";

if (hcshownbar) then {

	_EventName = _this select 0;
	_Button = (_this select 1) select 1;
	_PosX = (_this select 1) select 2;
	_PosY = (_this select 1) select 3;
	_Shift = (_this select 1) select 4;
	_Ctrl = (_this select 1) select 5;
	_Alt = (_this select 1) select 6;
	_Groups = + (_this select 2);
	
	//_str = _str +
	//	format ["_EventName = %1\n_Button = %2\n_PosX = %3\n_PosY = %4\n_Shift = %5\n_Ctrl = %6\n_Alt = %7\n_this = %8", 
	//            _EventName, _Button, _PosX, _PosY, _Shift, _Ctrl, _Alt, _this];
	
	missionNamespace setVariable ["HCExtCurrentMouseLoc", [_PosX, _PosY]];

	if (_Button == 0) then {

		missionNamespace setVariable ["HCExtLeftMouseButtonDownLoc", [_PosX, _PosY]];
		missionNamespace setVariable ["HCExtLeftMouseButtonHoldLoc", []];
		
		if ( (call F_GetModeHC) == "Artillery" ) then {
			
			_WorldPos = (uinamespace getvariable "_MapView") ctrlmapscreentoworld [_PosX, _PosY];			
			[_Groups, _WorldPos] spawn F_FireArtilleryBatteries;
		};
	};
	
	if (_Button == 1) then {
		
		missionNamespace setVariable ["HCExtRightMouseButtonDownLoc", [_PosX, _PosY]];
		missionNamespace setVariable ["HCExtRightMouseButtonHoldLoc", []];
		missionNamespace setVariable ["HCExtSelectedWaypoints", []];
				
		//hintSilent format ["HCExtSelectedWaypoints = %1", missionNamespace getVariable "HCExtSelectedWaypoints"];
	};
};

//hintSilent _str;

nil;
