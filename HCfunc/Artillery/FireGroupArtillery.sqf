// Arma 2 function

private ["_GroupArtilleryModule","_Dispersion","_AimPositionASL","_RoundType","_NumRounds","_ArtTemplate"];

_GroupArtilleryModule = _this select 0;
_Dispersion = _this select 1;
_AimPositionASL = + (_this select 2);
_RoundType = _this select 3;
_EachGunFireDelaySec = _this select 4;
_NumRounds = _this select 5;

[_GroupArtilleryModule, _Dispersion] call BIS_ARTY_F_SetDispersion;

_ArtTemplate = ["IMMEDIATE", _RoundType, _EachGunFireDelaySec, _NumRounds];

[_GroupArtilleryModule, _AimPositionASL, _ArtTemplate] call BIS_ARTY_F_ExecuteTemplateMission;

[_GroupArtilleryModule, _RoundType] call BIS_ARTY_F_LoadMapRanges;

/*
hintSilent format ["Doing Fire _GroupArtilleryModule = %1\n_AimPositionASL = %2\nBIS_ARTY_F_PosInRange %3\n_ArtTemplate = %4\nMaxR = %5 MinR = %6",
                   _GroupArtilleryModule, _AimPositionASL,
                   [_GroupArtilleryModule, _AimPositionASL, _ArtTemplate select 1] call BIS_ARTY_F_PosInRange,
                   _ArtTemplate,
                   _GroupArtilleryModule getVariable "ARTY_MAX_RANGE",
				   _GroupArtilleryModule getVariable "ARTY_MIN_RANGE"];
*/

nil;
