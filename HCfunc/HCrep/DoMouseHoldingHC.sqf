// Arma 2 function

private ["_EventName","_PosX","_PosY","_str","_HoldCount"];
         
// Mouse Holing events are only called when the mouse is not moving.
         
//_str = "Called DoMouseHoldingHC";

if (hcshownbar) then {

	_EventName = _this select 0;
	_PosX = (_this select 1) select 1;
	_PosY = (_this select 1) select 2;
	
	//_str = _str +
	//	format ["_EventName = %1\n_PosX = %2\n_PosY = %3\n_this = %4\n_HoldCount = %5", 
	//            _EventName, _PosX, _PosY, _this, _HoldCount];
	            
	missionNamespace setVariable ["HCExtCurrentMouseLoc", [_PosX, _PosY]];
};

_HoldCount = missionNamespace getVariable "HCExtMouseHoldCount";
missionNamespace setVariable ["HCExtMouseHoldCount", _HoldCount + 1];

//_str = _str + "\n" + (call F_GetHCExtState);

//hintSilent _str;

nil;
