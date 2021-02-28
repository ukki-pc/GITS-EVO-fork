// Arma 2 function

private ["_Groups","_EngineOn","_DoSubGroups","_Vehicles","_NumVehicles","_vi","_Vehicle"];

_Groups = + (_this select 0);
_EngineOn = _this select 1;
_DoSubGroups = _this select 2;

if (_DoSubGroups) then { _Groups = _Groups call F_GroupsAndSubGroupsHC; };

_Vehicles = _Groups call F_GetGroupsVehiclesIn;
_NumVehicles = count _Vehicles;

for [{ _vi = 0 }, { _vi < _NumVehicles }, { _vi = _vi + 1 }] do {

	_Vehicle = _Vehicles select _vi;
	
	if ( ((speed _Vehicle) <= 0.5) && (((getPosATL _Vehicle) select 2) <= 0.2) ) then {
		_Vehicle engineOn _EngineOn;
	};
};

nil;