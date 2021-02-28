// Arma 2 function

private ["_Units","_NumUnits","_ui","_Unit","_Group","_IsLeader","_IsPlayer"];

_Units = allunits;
_NumUnits = count _Units;

for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {

	_Unit = _Units select _ui;
	_Group = group _Unit;
	_IsLeader = ((leader _Group) == _Unit);
	_IsPlayer = (player == _Unit);

	if ( (_IsLeader or _IsPlayer) and ((side _Unit) call F_SideAccessible) ) then {
	
		addSwitchableUnit _Unit;
	} else {
		removeSwitchableUnit _Unit;
	};
};

nil;