// Arma 2 function

private ["_ShowHCIconsOnlyInHCMode","_InHighCommandMode","_IconsVisible"];

_ShowHCIconsOnlyInHCMode = missionNamespace getVariable "HCExtShowHCIconsOnlyInHCMode";

_InHighCommandMode = hcShownBar;
_IconsVisible = hcShownBar or (! _ShowHCIconsOnlyInHCMode);
setGroupIconsVisible [_IconsVisible, _IconsVisible];

nil;

	

