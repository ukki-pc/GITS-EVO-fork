// Arma 2 function

private ["_Sides","_NearKnown","_NumSides","_NumNearKnown","_FilteredNear","_ni","_TestSide"];

_Sides = + (_this select 0);
_NearKnown = + (_this select 1);

_NumSides = count _Sides;
_NumNearKnown = count _NearKnown;
_FilteredNear = [];

for [{ _ni = 0 }, { _ni < _NumNearKnown }, { _ni = _ni + 1 }] do {
	
	_TestSide = (_NearKnown select _ni) select 2;
	
	if ( _TestSide in _Sides ) then {
	
		_FilteredNear = _FilteredNear + [_NearKnown select _ni];
	};
};

_FilteredNear;