// Arma 2 function

private ["_Groups","_TargetRange","_MySide","_OnlyDoLeaders","_KnownValue","_NumGroups",
         "_InvisbleSides","_gi","_Group","_KnownTargets",
         "_Units","_NumUnits","_ui","_Unit","_UnitTargets","_str","_UnitKnownValues",
         "_TargetsKnownValues"];

_Groups = + (_this select 0);
_TargetRange = _this select 1;
_MySide = _this select 2;
_OnlyDoLeaders = _this select 3;
_KnownValue = _this select 4;

_NumGroups = count _Groups;
_KnownTargets = [];
_TargetsKnownValues = [];

_InvisbleSides = [[West, East, Civilian, Resistance], _MySide, false] call F_GetSidesWithVisibleIcons;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {
	
	_Group = _Groups select _gi;
	
	if (_OnlyDoLeaders) then {
		_Units = [leader _Group];
	} else {
		_Units = units _Group;
	};
	_NumUnits = count _Units;
	
	for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {

		_Unit = _Units select _ui;
		_UnitTargets = _Unit nearTargets _TargetRange;
		
		_UnitTargets = [_InvisbleSides, _UnitTargets] call F_FilterSides;
		_UnitTargets = [_Unit, _KnownValue, _UnitTargets] call F_FilterOnKnowsAbout;
		_UnitKnownValues = [_Unit, _UnitTargets] call F_GetKnowsAboutValues;
		
		_KnownTargets = _KnownTargets + _UnitTargets;
		_TargetsKnownValues = _TargetsKnownValues + _UnitKnownValues;
	};
};

[_KnownTargets, _TargetsKnownValues];