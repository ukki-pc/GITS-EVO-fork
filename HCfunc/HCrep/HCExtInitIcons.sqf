// Arma 2 function

private ["_JustInitialised"];


if ([] call F_NoHCModule) then {

	_JustInitialised = missionNamespace getVariable "JustInitialised";
	
	if ( _JustInitialised ) then {
	
		missionNamespace setVariable ["JustInitialised", false];
		
		call F_HCExtSetGroupIconsVisible;
		[false] call F_SetVisibleGroupIcons;
		[true] call F_RefreshAllGroupsIcons;
		[true] call F_SetVisibleGroupIcons;
	} else {
		[] call F_HCExtRefreshIcons;
	};
};

nil;