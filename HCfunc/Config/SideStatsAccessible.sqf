// Arma 2 function

private ["_TestSide","_HideOtherSidesStats","_HideEnemySides","_MySide","_Accessible"];

_TestSide = _this;

_HideOtherSidesStats = missionNamespace getVariable "HCExtHideStatsOnOtherSides";
_HideEnemySidesStats = missionNamespace getVariable "HCExtHideStatsOnEnemySides";

_MySide = side player;
_Accessible = true;

if ( _HideOtherSidesStats ) then {
	
	_Accessible = (_MySide == _TestSide);
} else {

	if ( _HideEnemySidesStats ) then {
	
		_Accessible = ((_MySide getFriend _TestSide) >= 0.6);
	};
};

_Accessible;