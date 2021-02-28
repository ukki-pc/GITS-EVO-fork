// Arma 2 function

private ["_SelGpgsTopLevel","_selgpgs","_ngps","_WeaponTypesAndNumOf","_gi",
         "_group","_GroupUnits","_nunits","_ui","_Unit","_UnitWeapons","_BackPackWeapons","_str"];

_SelGpgsTopLevel = + _this;

_selgpgs = _SelGpgsTopLevel call F_GroupsAndSubGroupsHC;

_ngps = count _selgpgs;
_WeaponTypesAndNumOf = [[],[]];

for [{ _gi = 0 }, { _gi < _ngps }, { _gi = _gi + 1 }] do {
 
	_group = _selgpgs select _gi;
	_GroupUnits = units _group;
	_nunits = count _GroupUnits;

	for [{ _ui = 0 }, { _ui < _nunits }, { _ui = _ui + 1 }] do {

		_Unit = _GroupUnits select _ui;
		
		_UnitWeapons = weapons _Unit;
		_WeaponTypesAndNumOf = [_UnitWeapons, _WeaponTypesAndNumOf] call F_AccumulateTypeTotals;

		_BackPackWeapons = getWeaponCargo (unitBackpack _Unit);
		_WeaponTypesAndNumOf = [_BackPackWeapons, _WeaponTypesAndNumOf] call F_AccumulateTypeCountTotals;
	};
};

_str = "Selected HC Units" + ([_WeaponTypesAndNumOf, "Weapon"] call F_ObjectTypesTotalToString);

hintSilent _str;
copyToClipboard _str;

nil;