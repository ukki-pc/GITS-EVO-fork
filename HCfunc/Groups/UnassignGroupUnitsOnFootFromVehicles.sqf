// Arma 2 function

private ["_Group","_Units","_NumUnits","_ui","_Unit"];

_Group = _this;

_Units = units _Group;
_NumUnits = count _Units;

for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {
	
	_Unit = _Units select _ui;
	
	if (_Unit call F_UnitIsOnFoot) then {
		unassignVehicle _Unit;
	};
};

nil;