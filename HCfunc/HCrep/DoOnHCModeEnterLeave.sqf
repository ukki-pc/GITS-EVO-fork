// Arma 2 function

private ["_InHighCommandMode"];

_InHighCommandMode = _this;

[] call F_ReInitHCExtState;

if ( missionNamespace getVariable "HCExtShowHCIconsOnlyInHCMode" ) then {
	
	setGroupIconsVisible [_InHighCommandMode, _InHighCommandMode];
};

nil;