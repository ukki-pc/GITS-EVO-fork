// Arma 2 function

private ["_TestSide","_HideOtherSides","_HideEnemySides","_MySide","_Visible"];

_MySide = _this select 0;
_TestSide = _this select 1;

_HideOtherSides = missionNamespace getVariable "HCExtHideOtherSideIcons";
_HideEnemySides = missionNamespace getVariable "HCExtHideEnemySideIcons";

_Visible = true;

if ( _HideOtherSides ) then {
	
	_Visible = (_MySide == _TestSide);
} else {

	if ( _HideEnemySides ) then {
	
		_Visible = ((_MySide getFriend _TestSide) >= 0.6);
	};
};

_Visible;