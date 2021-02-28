// Arma 2 function

private ["_TheVector","_NumDimensions","_vi","_Result"];

_TheVector = + _this;

_NumDimensions = count _TheVector;
_Result = [];

for [{ _vi = 0 }, { _vi < _NumDimensions }, { _vi = _vi + 1 }] do {
	
	_Result = _Result + [abs (_TheVector select _vi)];
};

_Result;