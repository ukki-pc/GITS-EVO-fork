// Arma 2 function

private ["_Numbers","_NumNumbers","_Sum","_ni"];

_Numbers = + _this;

_NumNumbers = count _Numbers;
_Sum = 0;

for [{ _ni = 0 }, { _ni < _NumNumbers }, { _ni = _ni + 1 }] do {
	
	_Sum = _Sum + (_Numbers select _ni);
};

_Sum;

