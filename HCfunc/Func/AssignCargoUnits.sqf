// Arma 2 function

private ["_Units","_Vehicle","_NumUnits","_ui","_Unit"];

_Units = _this select 0;
_Vehicle = _this select 1;

_NumUnits = count _Units;

for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {

	_Unit = _Units select _ui;
	_Unit assignAsCargo _Vehicle;
};

nil;


 
  