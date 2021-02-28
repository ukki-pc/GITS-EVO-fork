// Arma 2 function

private ["_PosX","_PosY","_StartScreenLoc","_LastScreenLoc","_LastWorldPos",
         "_CurrentWorldPos","_MovementInWorld"];

_PosX = _this select 0;
_PosY = _this select 1;


//Workout Movement since click or last hold.

_StartScreenLoc = missionNamespace getVariable "HCExtLeftMouseButtonDownLoc";
_LastScreenLoc = missionNamespace getVariable "HCExtLeftMouseButtonHoldLoc";

if ( (count _LastScreenLoc) == 0 ) then {
	
	_LastWorldPos = (uinamespace getvariable "_MapView") ctrlmapscreentoworld _StartScreenLoc;
} else {
	_LastWorldPos = (uinamespace getvariable "_MapView") ctrlmapscreentoworld _LastScreenLoc;
};

_CurrentWorldPos = (uinamespace getvariable "_MapView") ctrlmapscreentoworld [_PosX,_PosY];
_MovementInWorld = [_CurrentWorldPos, _LastWorldPos] call F_VectorSub;

_MovementInWorld call F_MoveSelectedWaypoints;			            

nil;