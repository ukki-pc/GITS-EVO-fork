// Arma 2 function

private ["_VarName","_NewValue","_str","_InHighCommandMode","_IconsVisible"];

_VarName = _this;

if ( ! (missionNamespace getVariable "HCExtAllowRunTimeConfigChanges") ) then {

	_str = format ["Run time config changes are switched off.\nHCExtAllowRunTimeConfigChanges = %1",
	               missionNamespace getVariable "HCExtAllowRunTimeConfigChanges"];
} else {
	_NewValue = ! (missionNamespace getVariable _VarName); 
	missionNamespace setVariable [_VarName, _NewValue];

	if ( _VarName == "HCExtShowHCIconsOnlyInHCMode" ) then {
		
		call F_HCExtSetGroupIconsVisible;
	};
	
	if ( (_VarName == "HCExtHideEnemySideIcons") and (! _NewValue) ) then { 
	
		missionNamespace setVariable ["HCExtHideOtherSideIcons", _NewValue];
	};
	
	if ( (_VarName == "HCExtHideEnemySideIcons") 
	    or (_VarName == "HCExtHideOtherSideIcons") ) then {
	    
		[true, player] call F_SetVisibleGroupIcons;
	};
	
	_str = format ["HCExtAllowAddAndDeleteWp = %1\nHCExtShowHCIconsOnlyInHCMode = %2", 
				   missionNamespace getVariable "HCExtAllowAddAndDeleteWp",
				   missionNamespace getVariable "HCExtShowHCIconsOnlyInHCMode"];

	_str = _str + format ["HCExtHideOtherSideIcons = %1\nHCExtHideEnemySideIcons = %2", 
						  missionNamespace getVariable "HCExtHideOtherSideIcons",
						  missionNamespace getVariable "HCExtHideEnemySideIcons"];

	_str = _str + format ["HCExtHideAccessToOtherSides = %1\nHCExtHideAccessToEnemySides = %2", 
						  missionNamespace getVariable "HCExtHideAccessToOtherSides",
						  missionNamespace getVariable "HCExtHideAccessToEnemySides"];

	_str = _str + format ["HCExtHideStatsOnOtherSides = %1\nHCExtHideStatsOnEnemySides = %2", 
						  missionNamespace getVariable "HCExtHideStatsOnOtherSides",
						  missionNamespace getVariable "HCExtHideStatsOnEnemySides"];
};

hintSilent _str;

nil;