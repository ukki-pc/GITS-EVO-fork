// Arma 2 function

private ["_DownPos","_Is3D","_Ctrl","_WorldPos"];

_DownPos = missionNamespace getVariable "HCExtCurrentMouseLoc";
_Is3D = ! visibleMap;
_Ctrl = missionNamespace getVariable "HCExtCtrlHeld";

if (_Is3D) then {
	
	//_WorldPos = (uinamespace getvariable "_MainDisplay") ctrlmapscreentoworld _DownPos;	
} else {
	_WorldPos = (uinamespace getvariable "_MapView") ctrlmapscreentoworld _DownPos;
};

[_WorldPos,_Is3D,_Ctrl];