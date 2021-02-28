// Arma 2 function

private ["_Func","_VM","_str","_SelectionBand","_ScriptHandle"];

_ScriptHandle = 0 spawn {};

_Func = compile preprocessFile "HCfunc\ReComplieScriptsFunc.sqf"; missionNamespace setVariable ["F_ReComplieScriptsFunc", _Func];
_VM = compile preprocessFile "HCfunc\ReComplieScriptsVM.sqf"; missionNamespace setVariable ["V_ReComplieScriptsVM", _VM];

[] call F_ReComplieScriptsFunc;


if ([] call F_NoHCModule) then {

	BIS_HC_path_menu = F_StandardMenuHandler;
	call F_ReInitHCExtState; 
	call F_InitArtillery;
	missionNamespace setVariable ["JustInitialised", true];
	missionNamespace setVariable ["HCExtCountEventHandlerInit", 0];

	// If (setGroupIconsSelectable true) is set onGroupIconOverEnter and onGroupIconOverLeave are not triggered.
	// However, onGroupIconClick seems to be triggered regardless.
	setGroupIconsSelectable true;
	
	onCommandModeChanged { _isHighCommand call F_DoOnHCModeEnterLeave; };
	onGroupIconOverEnter { _this call F_DoOnGroupIconOverEnterHC; };
	onGroupIconOverLeave { _this call F_DoOnGroupIconOverLeaveHC; };
	onGroupIconClick { [_this, hcSelected player] call F_DoOnGroupIconClickHC; };
	onHCGroupSelectionChanged{ [_group,_isselected] call F_DoHCGroupSelectionChanged; };
	
	//onPreloadStarted { 3 execVM "HCfunc\HCrep\ReInitHCExtEventHandlers.sqf"; };
	//onPreloadFinished { 2 execVM "HCfunc\HCrep\ReInitHCExtEventHandlers.sqf"; };
	
	0 call F_ReInitHCExtEventHandlers;
		
	_SelectionBand = createMarkerLocal ["HCExtSelectionBand",[0.0, 0.0]];
	_SelectionBand setMarkerColorLocal "ColorGreen";
	_SelectionBand setMarkerShapeLocal "RECTANGLE";
	_SelectionBand setMarkerBrushLocal "Border";
	_SelectionBand setMarkerDirLocal 0.0;
	_SelectionBand setMarkerAlphaLocal 0;
};

//Makes team switch units automatically moveable after team switching using the team switch dialog.
//Comment next line out if you don't want this feature.
//onTeamSwitch "selectPlayer (leader _from); {_x doFollow leader _from} foreach units _from; selectPlayer _to;";
onTeamSwitch { [_from, _to] call F_DoOnTeamSwitch; };

[] call M_WaypointMenuDef;
[] call M_menu;
[] call M_ExampleMenu;

"HCExtCommunication_menu" call F_SetCommsMenu;

//missionNamespace setVariable ["HCExtNullProcess", _ScriptHandle];
call F_CreateHCEnemyIcons;
missionNamespace setVariable ["HCExtShowEnemiesProcess", _ScriptHandle];

[100000, true, 0.3] spawn F_StartShowEnemiesProcess;

[] call F_HCExtInitIcons;

nil;
