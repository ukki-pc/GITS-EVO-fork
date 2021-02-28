// Arma 2 function

// Assumes that all members of the groups are on the same side.
// They will be until the leader is killed normally.

private ["_SelGpgsTopLevel","_selgpgs","_ngps","_UnitTypesAndNumOf","_NumUnitTypes","_gi",
         "_group","_GroupUnits","_str","_TotalUnits","_ti"];

_SelGpgsTopLevel = + _this;

_selgpgs = _SelGpgsTopLevel call F_GroupsAndSubGroupsHC;

_ngps = count _selgpgs;

_UnitTypesAndNumOf = [[],[]];

for [{ _gi = 0 }, { _gi < _ngps }, { _gi = _gi + 1 }] do {
 
	_group = _selgpgs select _gi;
	_GroupUnits = units _group;
	_UnitTypesAndNumOf = [_GroupUnits, _UnitTypesAndNumOf] call F_AccumulateObjectTypeTotals;
};

_str = "Selected HC Unit Type Totals: ";
_TotalUnits = 0;
_NumUnitTypes = count (_UnitTypesAndNumOf select 0);

for [{ _ti = 0 }, { _ti < _NumUnitTypes }, { _ti = _ti + 1 }] do {

	_TotalUnits = _TotalUnits + ((_UnitTypesAndNumOf select 1) select _ti); 
	_str = _str + format ["\n%1 = %2;", 
	                      ((_UnitTypesAndNumOf select 0) select _ti), 
	                      ((_UnitTypesAndNumOf select 1) select _ti)];
};

_str = _str + format ["\nTotal Units = %1; ", _TotalUnits];

hintSilent _str;
copyToClipboard _str;

nil;
