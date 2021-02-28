// Arma 2 function

private ["_Groups","_NumGroups","_Vehicles","_gi","_Group","_Units","_NumUnits",
         "_Unit","_Vehicle"];

_Groups = + _this;

_NumGroups = count _Groups;
_Vehicles = [];

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	_Group = _Groups select _gi;
	_Units = units _Group;
	_NumUnits = count _Units;

	for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {
	
		_Unit = _Units select _ui;
		
		if ( _Unit call F_UnitsIsInAVehicle ) then {
			_Vehicle = vehicle _Unit;
			if (! (_Vehicle in _Vehicles)) then {
				_Vehicles = _Vehicles + [_Vehicle];
			};
		};
	};
};

_Vehicles;


