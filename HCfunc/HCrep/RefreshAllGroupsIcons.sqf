// Arma 2 function

private ["_DoDepth"];

_DoDepth = _this select 0;

[_DoDepth, true, West] spawn V_ChangeHCbarIcons;
[_DoDepth, true, East] spawn V_ChangeHCbarIcons;
[_DoDepth, true, Civilian] spawn V_ChangeHCbarIcons;
[_DoDepth, true, Resistance] spawn V_ChangeHCbarIcons;

nil;