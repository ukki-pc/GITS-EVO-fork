// Arma 2 function

private ["_TestSide","_HideOtherSides","_HideEnemySides","_MySide","_Accessible"];

_TestSide = _this;

_HideOtherSides = missionNamespace getVariable "HCExtHideAccessToOtherSides";
_HideEnemySides = missionNamespace getVariable "HCExtHideAccessToEnemySides";

_MySide = side player;
_Accessible = true;

if ( _HideOtherSides ) then {
	
	_Accessible = (_MySide == _TestSide);
} else {

	if ( _HideEnemySides ) then {
	
		_Accessible = ((_MySide getFriend _TestSide) >= 0.6);
	};
};

_Accessible;