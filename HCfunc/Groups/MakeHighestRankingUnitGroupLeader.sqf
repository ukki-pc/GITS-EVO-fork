// Arma 2 function

private ["_Group","_GroupUnits","_NumUnits","_TopRank","_TopUnitIndex",
         "_ui","_Unit","_UnitRank"];

_Group = _this;
_GroupUnits = units _Group;
_NumUnits = count _GroupUnits;
_TopRank = -1;
_TopUnitIndex = -1;

for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {

	_Unit = _GroupUnits select _ui;
	_UnitRank = rankId _Unit;

	if ( _UnitRank > _TopRank ) then {
	
		_TopRank = _UnitRank;
		_TopUnitIndex = _ui;
	};
};

//hintSilent format ["\n_NumUnits: %1;\nNo. _TopRank: %2;\n_TopUnitIndex: %3;", 
//                      _NumUnits, _TopRank, _TopUnitIndex];

if ( _NumUnits >= 1 ) then {

	_Group selectLeader (_GroupUnits select _TopUnitIndex);
};

nil;