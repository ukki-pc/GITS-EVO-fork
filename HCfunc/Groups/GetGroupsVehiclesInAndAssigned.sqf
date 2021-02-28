// Arma 2 function

private ["_Groups","_NumGroups","_Vehicles","_gi","_group","_units","_nunits",
         "_unit","_Vehicle"];

_Groups = + _this;

_NumGroups = count _Groups;
_Vehicles = [];

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	_group = _Groups select _gi;
	_units = units _group;
	_nunits = count _units;

	for [{ _ui = 0 }, { _ui < _nunits }, { _ui = _ui + 1 }] do {
	
		_unit = _units select _ui;
		
		if ( _unit call F_UnitsIsAssignedAVehicle ) then {
			_Vehicle = vehicle _unit;
			if (! (_Vehicle in _Vehicles)) then {
				_Vehicles = _Vehicles + [_Vehicle];
			};
		};
	};
};

_Vehicles;


