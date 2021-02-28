// Arma 2 function

private ["_Unit","_NewRank","_UnitRating","_ChangedUnitRating"];

_Unit = _this select 0;
_NewRank = _this select 1;

_UnitRating = rating _Unit;
_Unit setUnitRank _NewRank;
_ChangedUnitRating = rating _Unit;
_Unit addRating (_UnitRating - _ChangedUnitRating);

nil;