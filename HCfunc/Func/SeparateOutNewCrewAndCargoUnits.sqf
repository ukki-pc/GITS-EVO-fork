// Arma 2 function
// Assumes that all the units are in the same group and the leader is in _Units.

private ["_Units","_VehicleCrewCapacity","_FreeCargoCapacity","_NumUnits",
         "_Leader","_NumCrewAdded","_CrewUnits","_CargoUnits","_ui","_Unit"];

_Units = _this select 0;
_VehicleCrewCapacity = _this select 1;
_FreeCargoCapacity = _this select 2;

_NumUnits = count _Units;
_Leader = leader (group (_Units select 0));
_NumCrewAdded = 1;
_CrewUnits = [_Leader];
_CargoUnits = [];

for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {
	
	_Unit = _Units select _ui;
	
	if ( _NumCrewAdded < _VehicleCrewCapacity ) then {
	
		if ( _Unit != _Leader ) then {
			_CrewUnits = _CrewUnits + [_Unit];
			_NumCrewAdded = _NumCrewAdded + 1;
		};
	} else {
		_CargoUnits = _CargoUnits + [_Unit];
	};
};

[_CrewUnits, _CargoUnits];


 
  