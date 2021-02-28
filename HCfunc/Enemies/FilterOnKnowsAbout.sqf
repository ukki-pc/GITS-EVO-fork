// Arma 2 function

private ["_Unit","_KnowsAboutValue","_NearKnown","_NumNearKnown","_FilteredNear","_ni"];

_Unit = _this select 0;
_KnowsAboutValue = _this select 1;
_NearKnown = + (_this select 2);

_NumNearKnown = count _NearKnown;
_FilteredNear = [];

for [{ _ni = 0 }, { _ni < _NumNearKnown }, { _ni = _ni + 1 }] do {
		
	if ( (_Unit knowsAbout ((_NearKnown select _ni) select 4)) >= _KnowsAboutValue ) then {
	
		_FilteredNear = _FilteredNear + [_NearKnown select _ni];
	};
};

_FilteredNear;