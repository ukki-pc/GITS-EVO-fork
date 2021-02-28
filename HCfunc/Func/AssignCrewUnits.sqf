// Arma 2 function
// Assumes that all the units are in the same group and the leader is in _Units.

private ["_Units","_Vehicle","_NumUnits","_Leader","_Turrets","_ti","_ui","_Unit"];

_Units = _this select 0;
_Vehicle = _this select 1;

_NumUnits = count _Units;
_Leader = leader (group (_Units select 0));

_Leader assignAsDriver _Vehicle;
_Turrets = (typeOf _Vehicle) call F_VehicleTypeTurretPostions;
_ti = 0;

for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {
	
	_Unit = _Units select _ui;
	
	if ( _Unit != _Leader ) then {
	
		_Unit action ["getInTurret", _Vehicle, (_Turrets select _ti)];
		_ti = _ti + 1;
	};
};


nil;


 
  