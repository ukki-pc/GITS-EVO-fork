// Arma 2 function

private ["_SelectedGroups","_MenuCommandName","_NumArgs"];

_SelectedGroups = hcSelected player;

//hintSilent format ["_this = %1", _this];

if (typename _this == "ARRAY") then {
	
	_NumArgs = count _this;
	_MenuCommandName = _this select 0;
	
	if ( _NumArgs >= 2 ) then {
		_SelectedGroups = + (_this select 1);
	};
} else {
	_MenuCommandName = _this;
};

//hintSilent format ["_MenuCommandName = %1", _MenuCommandName];

switch (_MenuCommandName) do {
	
	case "MOVE": { _this call F_ProcessNewWaypoints; };
		
	case "NEXTWP":		{ _SelectedGroups call F_DeleteGroupsNextWaypoints; };
	case "CANCELWP":	{ _SelectedGroups call F_DeleteGroupsLastWaypoints; };
	case "CANCELALLWP":	{ [_SelectedGroups,true] call F_DeleteGroupsWaypoints; };

	case "HOLDFIRE":		{ [_SelectedGroups,"BLUE"] call F_SetGroupsFireMode; };
	case "ONLY_DEFEND":		{ [_SelectedGroups,"GREEN"] call F_SetGroupsFireMode; };
	case "HOLDFIRE_ENGAGE":	{ [_SelectedGroups,"WHITE"] call F_SetGroupsFireMode; };
	case "OPENFIRE":		{ [_SelectedGroups,"YELLOW"] call F_SetGroupsFireMode; };
	case "OPENFIRE_ENGAGE":	{ [_SelectedGroups,"RED"] call F_SetGroupsFireMode; };

	case "SPEED_LIMITED":	{ [_SelectedGroups,"LIMITED"] call F_SetGroupsSpeed; };
	case "SPEED_NORMAL":	{ [_SelectedGroups,"NORMAL"] call F_SetGroupsSpeed; };
	case "SPEED_FULL":		{ [_SelectedGroups,"FULL"] call F_SetGroupsSpeed; };

	case "COMBAT_STEALTH":	{ [_SelectedGroups,"STEALTH"] call F_SetGroupsCombatMode; };
	case "COMBAT_DANGER":	{ [_SelectedGroups,"COMBAT"] call F_SetGroupsCombatMode; };
	case "COMBAT_AWARE":	{ [_SelectedGroups,"AWARE"] call F_SetGroupsCombatMode; };
	case "COMBAT_SAFE":		{ [_SelectedGroups,"SAFE"] call F_SetGroupsCombatMode; };
	case "COMBAT_CARELESS":		{ [_SelectedGroups,"CARELESS"] call F_SetGroupsCombatMode; };

	case "COLUMN":		{ [_SelectedGroups,"COLUMN"] call F_SetGroupsFormation; };
	case "STAG COLUMN":	{ [_SelectedGroups,"STAG COLUMN"] call F_SetGroupsFormation; };
	case "WEDGE":		{ [_SelectedGroups,"WEDGE"] call F_SetGroupsFormation; };
	case "ECH LEFT":	{ [_SelectedGroups,"ECH LEFT"] call F_SetGroupsFormation; };
	case "ECH RIGHT":	{ [_SelectedGroups,"ECH RIGHT"] call F_SetGroupsFormation; };
	case "VEE":			{ [_SelectedGroups,"VEE"] call F_SetGroupsFormation; };
	case "LINE":		{ [_SelectedGroups,"LINE"] call F_SetGroupsFormation; };
	case "FILE":		{ [_SelectedGroups,"FILE"] call F_SetGroupsFormation; };
	case "DIAMOND":		{ [_SelectedGroups,"DIAMOND"] call F_SetGroupsFormation; };

	case "SITREP":		{ [] spawn V_GroupsAndSubGroupsStatsHC; };
};

nil;
