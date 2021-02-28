// Arma 2 function

private ["_Unit","_NearKnown","_NumNearKnown","_NearKnownValues","_ni"];

_Unit = _this select 0;
_NearKnown = + (_this select 1);

_NumNearKnown = count _NearKnown;
_NearKnownValues = [];

for [{ _ni = 0 }, { _ni < _NumNearKnown }, { _ni = _ni + 1 }] do {
		
	_NearKnownValues = _NearKnownValues + [_Unit knowsAbout ((_NearKnown select _ni) select 4)];
};

_NearKnownValues;