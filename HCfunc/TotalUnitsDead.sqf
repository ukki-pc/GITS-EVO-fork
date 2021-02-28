// Arma 2 function

// Assumes that all members of the groups are on the same side.
// They will be until the leader is killed normally.

private ["_DeadUnits","_nDeadUnits","_ObjTotals","_UnitTypes","_UnitTypeTotals","_str",
         "_uti","_NumUnitTypes"];

_DeadUnits = allDead;
_nDeadUnits = count _DeadUnits;

_str = "Dead Unit Totals:";

_ObjTotals = _DeadUnits call F_CalcObjectTypeTotals;
_UnitTypes = _ObjTotals select 0;
_UnitTypeTotals = _ObjTotals select 1;

_NumUnitTypes = count _UnitTypes;

for [{ _uti = 0 }, { _uti < _NumUnitTypes }, { _uti = _uti + 1 }] do {

	_str = _str + (format ["\n%1: %2;", _UnitTypes select _uti, _UnitTypeTotals select _uti]);  
};

_str = _str + format ["\nTotal Dead Units & Vehicles: %1", _nDeadUnits];

hintSilent _str;
copyToClipboard _str;

nil;