// Arma 2 function

private ["_NumA","_NumB","_Tolerance","_Equal"];


_NumA = _this select 0;
_NumB = _this select 1;
_Tolerance = abs (_this select 2);

_Equal = (abs (_NumA - _NumB)) <= _Tolerance;

_Equal;