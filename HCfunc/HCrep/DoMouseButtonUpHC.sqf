// Arma 2 function

private ["_EventName","_Button","_PosX","_PosY","_Shift","_Ctrl","_Alt","_SelectedGroups",
         "_str","_SelectionBand","_BandSelectEndLoc","_StartScreenLoc","_StartWorldLoc","_CtrlDown"];
         
//_str = "Called DoMouseButtonUpHC";

if (hcshownbar) then {

	_EventName = _this select 0;
	_Button = (_this select 1) select 1;
	_PosX = (_this select 1) select 2;
	_PosY = (_this select 1) select 3;
	_Shift = (_this select 1) select 4;
	_Ctrl = (_this select 1) select 5;
	_Alt = (_this select 1) select 6;
	_SelectedGroups = + (_this select 2);

	//_str = _str +
	//	format ["_EventName = %1\n_Button = %2\n_PosX = %3\n_PosY = %4\n_Shift = %5\n_Ctrl = %6\n_Alt = %7\n_this = %8", 
	//            _EventName, _Button, _PosX, _PosY, _Shift, _Ctrl, _Alt, _this];

	missionNamespace setVariable ["HCExtCurrentMouseLoc", [_PosX, _PosY]];

	if (_Button == 0) then {

		_SelectionBand = "HCExtSelectionBand";
		_SelectionBand setMarkerAlphaLocal 0;
		
		_BandSelectEndLoc = missionNamespace getVariable "HCExtBandSelectEndLoc";
		
		if ( (count _BandSelectEndLoc) >= 2 ) then {
			
			_StartScreenLoc = missionNamespace getVariable "HCExtLeftMouseButtonDownLoc";
			_StartWorldLoc = (uinamespace getvariable "_MapView") ctrlmapscreentoworld _StartScreenLoc;
	
			//hintSilent format ["_StartWorldLoc = %1\n_BandSelectEndLoc = %2", _StartWorldLoc, _BandSelectEndLoc];
						
			[_StartWorldLoc, _BandSelectEndLoc, _Ctrl, _SelectedGroups] call F_SelectHCGroupsInRectangle;
		};

		missionNamespace setVariable ["HCExtLeftMouseButtonDownLoc", []];
		missionNamespace setVariable ["HCExtBandSelectEndLoc", []];
	};

	if (_Button == 1) then {

		missionNamespace setVariable ["HCExtRightMouseButtonDownLoc", []];
	};
};

//hintSilent _str;

nil;
