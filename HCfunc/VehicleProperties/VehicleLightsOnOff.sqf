// Arma 2 function

private ["_Groups","_LightsOn","_DoSubGroups","_Vehicles","_NumVehicles","_vi","_Vehicle"];

_Groups = + (_this select 0);
_LightsOn = _this select 1;
_DoSubGroups = _this select 2;

if (_DoSubGroups) then { _Groups = _Groups call F_GroupsAndSubGroupsHC; };

_Vehicles = _Groups call F_GetGroupsVehiclesIn;
_NumVehicles = count _Vehicles;

for [{ _vi = 0 }, { _vi < _NumVehicles }, { _vi = _vi + 1 }] do {

	_Vehicle = _Vehicles select _vi;
	
	//combat" or "stealth" = lights off, any other mode = lights on
	// Need to set the combat mode to set the lights on or off for AI.
	if (_LightsOn) then {
		(driver _Vehicle) action ["lightOn", _Vehicle];
	} else {
		(driver _Vehicle) action ["lightOff", _Vehicle];
	};
};

nil;