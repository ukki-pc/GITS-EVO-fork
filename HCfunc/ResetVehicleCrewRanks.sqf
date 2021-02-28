// Arma 2 function
// Vehicle crew units by default in the 2D editor are given to high ranks that cannot be changed.
// This makes the ranks more realistic.

private ["_Units","_NumUnits","_ui","_Unit","_UnitVehicle","_IsLeader","_IsGunner",
         "_IsCommander","_IsDriver","_NumGroup"];

_Units = allUnits;
_NumUnits = count _Units;

for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {

	_Unit = _Units select _ui;

	if ( ! (_Unit call F_UnitsIsNotCrew) ) then {

		_UnitVehicle = vehicle _Unit;
		_IsLeader = (_Unit == leader _Unit);
		_IsGunner = (_Unit == (assignedCommander _UnitVehicle)); 
		_IsCommander = (_Unit == (assignedCommander _UnitVehicle));
		_IsDriver = (_Unit == (assignedDriver _UnitVehicle));
		_NumGroup = count (units (group _Unit));

		if ( _IsLeader && (_NumGroup >= 8) ) then {
		
			[_Unit, "SERGEANT"] call F_SetUnitRankWithoutChangingRating;
		} else {
		
			if ( _IsGunner || _IsCommander ) then {
			
				[_Unit, "CORPORAL"] call F_SetUnitRankWithoutChangingRating;
			} else {
				[_Unit, "PRIVATE"] call F_SetUnitRankWithoutChangingRating;
			};
		};
	};
};

nil;