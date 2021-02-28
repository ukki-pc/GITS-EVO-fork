// Arma 2 function

private ["_Group","_GroupUnits","_NumUnits","_GroupLeader","_ExtraGroupHCGroups","_ui",
         "_Unit","_UnitHCGroups","_NumExtraGroups","_gi"];

_Group = _this;
_GroupUnits = units _Group;
_NumUnits = count _GroupUnits;
_GroupLeader = leader _Group;
_ExtraGroupHCGroups = [];

for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {
 
	_Unit = _GroupUnits select _ui;

	if ( _Unit != _GroupLeader ) then {

		_UnitHCGroups = hcAllGroups _Unit;

		if ( (count _UnitHCGroups) >= 1 ) then {

			_ExtraGroupHCGroups = _ExtraGroupHCGroups + _UnitHCGroups;
			hcRemoveAllGroups _Unit;
		};
	};
};

_NumExtraGroups = count _ExtraGroupHCGroups;

for [{ _gi = 0 }, { _gi < _NumExtraGroups }, { _gi = _gi + 1 }] do {

	_GroupLeader hcsetgroup [(_ExtraGroupHCGroups select _gi),""];
};

nil;