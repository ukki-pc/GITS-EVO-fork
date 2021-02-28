// Arma 2 function

private ["_TestSide","_HideOtherSidesIcons","_HideEnemySideIcons","_MySide","_Visible"];

_TestSide = _this select 0;
_MySide = _this select 1;

_HideOtherSidesIcons = missionNamespace getVariable "HCExtHideOtherSideIcons";
_HideEnemySideIcons = missionNamespace getVariable "HCExtHideEnemySideIcons";

_Visible = true;

if ( _HideOtherSidesIcons ) then {
	
	_Visible = (_MySide == _TestSide);
} else {

	if ( _HideEnemySideIcons ) then {
	
		_Visible = ((_MySide getFriend _TestSide) >= 0.6);
	};
};

_Visible;