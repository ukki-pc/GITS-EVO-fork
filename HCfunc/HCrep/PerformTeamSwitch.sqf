// Arma 2 function

private ["_FromUnit","_ToUnit","_Quiet","_Success"];


_FromUnit = _this select 0;
_ToUnit = _this select 1;
_Quiet = false;
if ( (count _this) >= 3 ) then { _Quiet = _this select 3; };

_Success = false;

if ( (side _ToUnit) call F_SideAccessible ) then {

	addSwitchableUnit _ToUnit;

	if (alive _ToUnit) then {

		selectPlayer _ToUnit;
		[] call F_ReInitHCExtState;
		_ToUnit call F_HCExtRefreshVisibleIcons;
		_Success = true;
	}
} else {
	if ( ! _Quiet ) then { hintSilent "Switching sides is disabled."; };
};
_Success;