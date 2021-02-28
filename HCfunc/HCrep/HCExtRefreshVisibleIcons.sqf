// Arma 2 function

private ["_Unit"];

_Unit = _this;

if ([] call F_NoHCModule) then {

	// Only make friendly icons visible.				
	[true, _Unit] call F_SetVisibleGroupIcons;
};

nil;