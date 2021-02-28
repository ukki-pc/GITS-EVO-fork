// Arma 2 function

private ["_ScaleFactor","_TheVector","_NumDimensions","_vi","_Result"];

_ScaleFactor = _this select 0;
_TheVector = + (_this select 1);

_NumDimensions = count _TheVector;
_Result = [];

for [{ _vi = 0 }, { _vi < _NumDimensions }, { _vi = _vi + 1 }] do {
	
	_Result = _Result + [(_TheVector select _vi) * _ScaleFactor];
};

_Result;