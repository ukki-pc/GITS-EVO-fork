// Arma 2 function

private ["_Group","_GroupUnits","_NumGroupUnits","_ui","_Side","_GroupLeader","_Unit"];

_Group = _this;
_GroupUnits = units _Group;
_NumGroupUnits = count _GroupUnits;
_ui = 0;
_Side = side (_GroupUnits select 0);
_GroupLeader = leader _Group;

_TempLeader = creategroup _Side;

for [{ _ui = 0 }, { _ui < _NumGroupUnits }, { _ui = _ui + 1 }] do {

	_Unit = _GroupUnits select _ui;

	if( _Unit != _GroupLeader ) then {

		[_Unit] joinSilent _TempLeader;
		[_Unit] joinSilent _Group;
	};
};

_TempLeader call F_DoDeleteGroup;

nil;


