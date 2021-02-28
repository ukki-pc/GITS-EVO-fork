// Arma 2 function

private ["_Group","_Units","_NumUnits","_str","_ui","_Unit","_UnitDamage",
         "_UnitRank","_UnitType","_UnitMorale"];

_Group = _this;
_Units = units _Group;
_NumUnits = count _Units;

_str = format ["Squad Units Stats:\nNo. Units: %1", _NumUnits];

for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {

	_Unit = _Units select _ui;
	_UnitDamage = damage _Unit;
	_UnitRank = rank _Unit;
	_UnitType = typeOf _Unit;
	_UnitMorale = morale _Unit;

	_str = _str + format ["\n(%1, %2, Damage: %3, Morale: %4", 
                          _UnitType, _UnitRank, _UnitDamage, _UnitMorale];

	if ( _Unit == player ) then { _str = _str + ", player"; };

	_str = _str + ")";
};

_str = _str + "\n" + ([[_Group], false] call F_GetGroupsStances);

hintSilent _str;
copyToClipboard _str;

nil;