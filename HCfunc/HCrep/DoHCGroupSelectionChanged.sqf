// Arma 2 function

private ["_IsSelected","_Group","_Show"];
         
_Group = _this select 0;
_IsSelected = _this select 1;
         
_Show = false;

if (_IsSelected) then {

	_Show = true;
	
	if (commandingmenu == "") then {
		showCommandingMenu "RscHCGroupRootMenu";
	};
} else {
	if (hcshownbar) then {
	
		_Show = true;
	} else {
		_Show = true;
	};
};

[_Group,_Show] call F_SetGroupWaypointsVisiblity;

nil;
