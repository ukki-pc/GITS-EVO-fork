// Arma 2 function

private ["_MySide","_Sides","_NumSides","_EnemySides","_si","_Side"];

_MySide = _this;

_Sides = [West, East, Civilian, Resistance];

_NumSides = count _Sides;
_EnemySides = [];

for [{ _si = 0 }, { _si < _NumSides }, { _si = _si + 1 }] do {
	
	_Side = _Sides select _si;
	
	if ( (_MySide getFriend _Side) < 0.6 ) then {
		
		_EnemySides = _EnemySides + [_Side];
	};
};

_EnemySides;