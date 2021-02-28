// Arma 2 function

private ["_Group","_LandMode","_Units","_NumUnits","_ui","_Unit","_UnitVehicle"];

_Group = _this select 0;
_LandMode = _this select 1;

_Units = units _Group;
_NumUnits = count _Units;

//hintSilent format ["_Group = %1\n_LandMode = %2\n_NumUnits = %3", _Group, _LandMode, _NumUnits];

for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {

	_Unit = _Units select _ui;
	
	if ( _Unit call F_UnitIsMountedDriver ) then {

		_UnitVehicle = vehicle _Unit;

		if (_UnitVehicle isKindOf "Helicopter") then {

			_UnitVehicle land _LandMode;
		}; 
	}; 
};

nil;