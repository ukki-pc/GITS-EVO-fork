// Arma 2 function

private ["_Units","_NumUnit","_ui"];

_Units = allunits;
_NumUnit = (count _Units);

for [{ _ui = 0 }, { _ui < _NumUnit }, { _ui = _ui + 1 }] do {
	
	_Unit = _Units select _ui;
	
	if ( (side _Unit) call F_SideAccessible ) then {
	
		addSwitchableUnit _Unit;
	} else {
		removeSwitchableUnit _Unit;
	};
};

nil;
