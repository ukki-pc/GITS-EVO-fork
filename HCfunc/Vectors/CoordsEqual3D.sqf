// Arma 2 function

private ["_CoordA","_CoordB","_Tolerance","_DiffX","_DiffY","_DiffZ","_Equal"];


_CoordA = + (_this select 0);
_CoordB = + (_this select 1);
_Tolerance = _this select 2;

_DiffX = (_CoordA select 0) - (_CoordB select 0);
_DiffY = (_CoordA select 1) - (_CoordB select 1);
_DiffZ = (_CoordA select 2) - (_CoordB select 2);

_Equal = ((_DiffX * _DiffX) + (_DiffY * _DiffY) + (_DiffZ * _DiffZ)) <= (_Tolerance * _Tolerance);

_Equal;