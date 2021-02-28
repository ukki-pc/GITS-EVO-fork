// Arma 2 function

private ["_SelGpgsTopLevel","_selgpgs","_ngps","_MagTypesAndNumOf","_gi",
         "_group","_GroupUnits","_nunits","_ui","_Unit","_UnitMags", "_BackPackMags","_str"];

_SelGpgsTopLevel = + _this;

_selgpgs = _SelGpgsTopLevel call F_GroupsAndSubGroupsHC;

_ngps = count _selgpgs;
_MagTypesAndNumOf = [[],[]];

for [{ _gi = 0 }, { _gi < _ngps }, { _gi = _gi + 1 }] do {
 
	_group = _selgpgs select _gi;
	_GroupUnits = units _group;
	_nunits = count _GroupUnits;

	for [{ _ui = 0 }, { _ui < _nunits }, { _ui = _ui + 1 }] do {

		_Unit = _GroupUnits select _ui;
		_UnitMags = (magazines _Unit);
		_MagTypesAndNumOf = [_UnitMags, _MagTypesAndNumOf] call F_AccumulateTypeTotals;

		_BackPackMags = getMagazineCargo (unitBackpack _Unit);
		_MagTypesAndNumOf = [_BackPackMags, _MagTypesAndNumOf] call F_AccumulateTypeCountTotals;
	};
};

_str = "Selected HC Units" + ([_MagTypesAndNumOf, "Magazine"] call F_ObjectTypesTotalToString);

hintSilent _str;
copyToClipboard _str;

nil;
