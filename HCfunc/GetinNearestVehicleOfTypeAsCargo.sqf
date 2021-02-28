// Arma 2 function

private ["_VehicleTypes","_Groups","_NumGroups","_NumSquadsLoaded","_gi","_Group","_Units",
         "_NumUnits","_Leader","_PosLeader","_NearestVehicles","_FoundVehicle","_nv","_vi",
         "_Vehicle","_NumFreeSpaces","_NewWaypoint"];

_VehicleTypes = + (_this select 0);
_Groups = + (_this select 1);

_NumGroups = count _Groups;
_NumSquadsLoaded = 0;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	_Group = _Groups select _gi;
	_Units = units _Group;
	_NumUnits = count _Units;
	_Leader = leader _Group;

	if ( _Units call F_AllUnitsAreOnFoot ) then {

		_PosLeader = position _Leader;
		_NearestVehicles = nearestObjects [_PosLeader, _VehicleTypes, 200];
		_FoundVehicle = false;
		_nv = count _NearestVehicles;
		_vi = 0;

		while { (! _FoundVehicle) && (_vi < _nv) } do {

			_Vehicle = _NearestVehicles select _vi;
			_NumFreeSpaces = _Vehicle call F_VehicleNumUnassignedCargo;

			// The nearest helicopter will hover to pick up cargo.
			if ( _NumUnits <= _NumFreeSpaces ) then {
			
				[_Units, _Vehicle] call F_AssignCargoUnits;

				// Creating a get in waypoint to the vehicle would force the getin 
				// which sometimes fails after editor waypoints.
				[_Group, false] call F_DeleteGroupWaypoints;
				_NewWaypoint = _Group addWaypoint [position _Vehicle, 0];
				_NewWaypoint setWaypointType "GETIN";
				_NumSquadsLoaded = _NumSquadsLoaded + 1; 
				_FoundVehicle = true;
			};

			_vi = _vi + 1;
		};
	};
};

hintSilent format ["No. squads loading = %1 of %2 squads.", _NumSquadsLoaded, _NumGroups];

nil;