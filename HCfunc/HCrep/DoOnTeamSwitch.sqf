// Arma 2 function

private ["_FromUnit","_ToUnit","_FromUnitLeader","_FromUnits","_NumFromUnits",
         "_ui","_Unit","_FromGroup"];


_FromUnit = _this select 0;
_ToUnit = _this select 1;

_FromUnitLeader = leader _FromUnit;
selectPlayer _FromUnitLeader;
_FromUnits = units _FromUnit;
_NumFromUnits = count _FromUnits;

for [{ _ui = 0 }, { _ui < _NumFromUnits }, { _ui = _ui + 1 }] do {

	_Unit = _FromUnits select _ui;
	_Unit doFollow _FromUnitLeader;
};

selectPlayer _ToUnit;

[] call F_ReInitHCExtState;
_ToUnit call F_HCExtRefreshVisibleIcons;

//addSwitchableUnit _FromUnit;
removeSwitchableUnit _FromUnit;

_FromGroup = group _FromUnit;
_FromGroup = _FromGroup call F_CopyGroupToFreshGroupHC;
_FromGroup call F_UnassignGroupUnitsOnFootFromVehicles;

if ((units _FromGroup) call F_AllUnitsAreOnFoot) then {
	[_FromGroup, "All"] spawn V_GetOutGroup;
};

nil;