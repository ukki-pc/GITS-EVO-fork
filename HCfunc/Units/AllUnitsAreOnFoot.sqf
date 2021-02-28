// Arma 2 function

private ["_units","_nunits","_AllOnFoot","_ui","_unit","_unitvehicle","_hasvehicle"];

_units = + _this;
_nunits = count _units;

_AllOnFoot = (_nunits >= 1);

for [{ _ui = 0 }, { _ui < _nunits }, { _ui = _ui + 1 }] do {
      
	 _unit = _units select _ui;
	_unitvehicle = vehicle _unit;
	_hasvehicle = (_unitvehicle != _unit);
	
	if ( _hasvehicle 
		|| ( _hasvehicle && (!(_unit in _unitvehicle)) ) ) then { _AllOnFoot = false; };
}; 

_AllOnFoot;


