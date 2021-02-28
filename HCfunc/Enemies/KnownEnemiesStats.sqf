// Arma 2 function

private ["_Groups","_TargetRange","_MySide","_OnlyDoLeaders","_KnownValue","_NumGroups",
         "_Targets","_EnemySides","_gi","_Group","_UnitKnownTargets","_KnownTargets",
         "_Units","_NumUnits","_ui","_Unit","_UnitTargets","_str","_UnitKnownValues",
         "_TargetsKnownValues"];

_Groups = + (_this select 0);
_TargetRange = _this select 1;
_MySide = _this select 2;
_OnlyDoLeaders = _this select 3;
_KnownValue = _this select 4;

_NumGroups = count _Groups;
_Targets = [];
_KnownTargets = [];
_TargetsKnownValues = [];

_EnemySides = _MySide call F_EnemySides;
_EnemySides = _EnemySides + [Enemy, Unknown];

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
		
		_UnitTargets = [_EnemySides, _UnitTargets] call F_FilterSides;
		_UnitKnownTargets = [_Unit, _KnownValue, _UnitTargets] call F_FilterOnKnowsAbout;
		_UnitKnownValues = [_Unit, _UnitTargets] call F_GetKnowsAboutValues;
		
		_Targets = _Targets + [_UnitTargets];
		_KnownTargets = _KnownTargets + [_UnitKnownTargets];
		_TargetsKnownValues = _TargetsKnownValues + [_UnitKnownValues];
	};
};

_str = format ["Targets in %1m are:\n%2\nKnown\n%3\nKnown Values\n%4\n%5", 
               _TargetRange, _Targets, _KnownTargets, _TargetsKnownValues, _EnemySides];
hintSilent _str;
copyToClipboard _str;

nil;