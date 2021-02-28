// Arma 2 function

private ["_Units","_NumUnits","_ui","_Unit","_HCGroups"];

_Units = allunits;
_NumUnits = count _Units;

for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {

	_Unit = _Units select _ui;
	_HCGroups = hcAllGroups _Unit;
	
	if ( ((count _HCGroups) > 0) and ((side _Unit) call F_SideAccessible) ) then {
	
		addSwitchableUnit _Unit;
	} else {
		removeSwitchableUnit _Unit;
	};
};

nil;
