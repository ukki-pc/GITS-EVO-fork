// Arma 2 function

private ["_VectorA","_VectorB","_DimensionsA","_vi","_Result"];

_VectorA = + (_this select 0);
_VectorB = + (_this select 1);

_DimensionsA = count _VectorA;
_Result = [];

for [{ _vi = 0 }, { _vi < _DimensionsA }, { _vi = _vi + 1 }] do {
	
	_Result = _Result + [(_VectorA select _vi) + (_VectorB select _vi)];
};

_Result;