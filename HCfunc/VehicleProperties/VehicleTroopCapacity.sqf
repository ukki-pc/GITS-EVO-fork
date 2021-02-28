// Arma 2 function

private ["_VehicleStatsType","_str","_GroupsTopLevel","_Groups","_Vehicles","_NumVehicles","_vi",
         "_Vehicle","_NumVehicleIsUsed","_NumVehicleIsOccupied","_TotalCargoCapacity",
         "_TotalCrewCapacity","_TotalUnassignedCargo","_TotalCrewInside","_TotalAssignedCrew","_TotalUnitsInCargo"];
         
_GroupsTopLevel = + _this;

_Groups = _GroupsTopLevel call F_GroupsAndSubGroupsHC;

_Vehicles = _Groups call F_GetGroupsVehiclesIn;
_NumVehicles = count _Vehicles;

_str = format ["Vehicle Troop Capacity (%1):", _NumVehicles];

_NumVehicleIsUsed = 0;
_NumVehicleIsOccupied = 0;
_TotalCargoCapacity = 0;
_TotalCrewCapacity = 0;
_TotalUnassignedCargo = 0;
_TotalCrewInside = 0;
_TotalAssignedCrew = 0;
_TotalUnitsInCargo = 0;

for [{ _vi = 0 }, { _vi < _NumVehicles }, { _vi = _vi + 1 }] do {

	_Vehicle = _Vehicles select _vi;

	if ( _Vehicle call F_VehicleIsUsed ) then { _NumVehicleIsUsed = _NumVehicleIsUsed + 1; };
	if ( _Vehicle call F_VehicleIsOccupied ) then { _NumVehicleIsOccupied = _NumVehicleIsOccupied + 1; };
	_TotalCargoCapacity = _TotalCargoCapacity + (_Vehicle call F_VehicleCargoCapacity);
	_TotalCrewCapacity = _TotalCrewCapacity + (_Vehicle call F_VehicleCrewCapacity);
	_TotalUnassignedCargo = _TotalUnassignedCargo + (_Vehicle call F_VehicleNumUnassignedCargo);
	_TotalCrewInside = _TotalCrewInside + count (_Vehicle call F_VehicleCrewInside);
	_TotalAssignedCrew = _TotalAssignedCrew + count (_Vehicle call F_VehicleAssignedCrew);
	_TotalUnitsInCargo = _TotalUnitsInCargo + count (_Vehicle call F_VehicleUnitsInCargo);
};

_str = _str + (format ["\nNum Vehicles Used: %1\nNum Vehicles Occupied %2\nTotal Cargo Capacity %3\nTotal Crew Capacity %4", 
                       _NumVehicleIsUsed, _NumVehicleIsOccupied, _TotalCargoCapacity, _TotalCrewCapacity]);
 
_str = _str + (format ["\nTotal Capacity %1\nTotal Unassigned Cargo %2\nTotal Crew Inside %3\nTotal Assigned Crew %4", 
                       _TotalCargoCapacity + _TotalCrewCapacity, _TotalUnassignedCargo, _TotalCrewInside, _TotalAssignedCrew]);

_str = _str + (format ["\nTotal Units in Cargo %1\nTotal Units inside %2", 
                       _TotalUnitsInCargo, _TotalCrewInside + _TotalUnitsInCargo]);
 
hintSilent _str;
copyToClipboard _str;

nil;
