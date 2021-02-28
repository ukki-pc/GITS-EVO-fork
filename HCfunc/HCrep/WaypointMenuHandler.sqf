// Arma 2 function

private ["_MenuCommandName","_SelectedWaypoints","_NumArgs","_Parameter1","_Parameter2"];


if ( typename _this == "ARRAY" ) then {
	
	_NumArgs = count _this;
	_MenuCommandName = _this select 0;
	if ( _NumArgs >= 1 ) then { _Parameter1 = _this select 1; };
	if ( _NumArgs >= 2 ) then { _Parameter2 = _this select 2; };
	
} else {  
	_MenuCommandName = _this;
};

_SelectedWaypoints = + (missionNamespace getVariable "HCExtSelectedWaypoints");

//hintSilent format ["_SelectedWaypoints = %1\n_MenuCommandName = %2\n_Parameter1 = %3", 
//                   _SelectedWaypoints, _MenuCommandName, _Parameter1];

switch (_MenuCommandName) do {

	case "WPType":				{ [_SelectedWaypoints, _Parameter1] call F_SetWaypointsType; };
	case "WPCombatMode":		{ [_SelectedWaypoints, _Parameter1] call F_SetWaypointsCombatMode; };
	case "WPFormation":			{ [_SelectedWaypoints, _Parameter1] call F_SetWaypointsFormation; };
	case "WPLimitedSpeed":		{ [_SelectedWaypoints, _Parameter1] call F_SetWaypointsSpeed; };
	case "WpWait":				{ [_SelectedWaypoints, _Parameter1] call F_SetWaypointsTimeOut; };
	case "WpCompletionRadius":	{ [_SelectedWaypoints, _Parameter1] call F_SetWaypointsCompletionRadius; };
	case "WPDelete":			{ _SelectedWaypoints call F_SelectedWaypointsDelete; };
	case "WpSplitBeforeAfter":	{ [_SelectedWaypoints, _Parameter1, _Parameter2] call F_SelectedWaypointsSplitBeforeAfter; };
	case "WpHelicopterLand":	{ [_SelectedWaypoints, _Parameter1] call F_SetWaypointsHelicopterLand; };
	case "WpAdvancedClear":		{ _SelectedWaypoints call F_SetWaypointsAdvancedClear; };
	case "WpAdvGetOutGroups":	{ [_SelectedWaypoints, _Parameter1] call F_SetWaypointsGetOutGroups; };
};

nil;
