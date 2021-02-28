// Arma 2 function
// Won't reallocate squad leader currently!

private ["_Group","_GroupUnits","_NumGroupUnits","_ui","_Side","_GroupLeader",
         "_TempLeader","_TempGroup","_Unit"];

_Group = _this;
_GroupUnits = units _Group;
_NumGroupUnits = count _GroupUnits;

if ( _NumGroupUnits >= 2 ) then {

	_ui = 0;
	_Side = side (_GroupUnits select 0);
	_GroupLeader = leader _Group;

	_TempLeader = _GroupUnits select 0;
	if ( _GroupLeader == _TempLeader ) then {
		_TempLeader = _GroupUnits select 1;
	};

	_TempGroup = creategroup _Side;

	while {_ui < _NumGroupUnits} do {

		_Unit = _GroupUnits select _ui;

		if( _Unit != _GroupLeader ) then {

			[_Unit] joinSilent _TempGroup;
			[_Unit] joinSilent _Group;

		} else {

			_Group selectLeader _TempLeader;
			[_Unit] joinSilent _TempGroup;
			[_Unit] joinSilent _Group;
			_Group selectLeader _Unit;  
		};
		_ui = _ui + 1;
	};

	_Group selectLeader _GroupLeader;
	
} else {

	_Unit = _GroupUnits select 0;
	[_Unit] joinSilent _TempGroup;
	[_Unit] joinSilent _Group;
};

_TempGroup call F_DoDeleteGroup;

nil;



