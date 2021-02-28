// Arma 2 function

private ["_Groups","_TargetRange","_MySide","_OnlyDoLeaders","_KnownValue","_Known"];

_Groups = + (_this select 0);
_TargetRange = _this select 1;
_MySide = _this select 2;
_OnlyDoLeaders = _this select 3;
_KnownValue = _this select 4;

_Known = [_Groups, _TargetRange, _MySide, _OnlyDoLeaders, _KnownValue] call F_KnownEnemies;

_Known call F_ShowKnownMarkers;

nil;