// Arma 2 function

private ["_SleepTime","_eh1","_eh2","_eh3","_eh4","_eh5","_eh6","_EventHandlerIDs"];


_SleepTime = _this;

// THE events added with ctrlAddEventHandler appear to need to be resetup when a saved game is reloaded.
// Need to findout how often this is called.

sleep _SleepTime;

if ( isnil "BIS_HC_mainscope" ) then {

	uinamespace setvariable ["_MainDisplay",finddisplay 46];
	uinamespace setvariable ["_Display",finddisplay 12];
	uinamespace setvariable ["_MapView",(findDisplay 12) displayCtrl 51];

	//Doing displayRemoveAllEventHandlers stops event handlers from working.
	//(uinamespace getvariable "_MapView") displayRemoveAllEventHandlers "mousemoving";
	//(uinamespace getvariable "_MapView") displayRemoveAllEventHandlers "mouseholding";
	//(uinamespace getvariable "_MapView") displayRemoveAllEventHandlers "mousebuttondown";
	//(uinamespace getvariable "_MapView") displayRemoveAllEventHandlers "mousebuttonup";

	//display displayRemoveEventHandler [handler name,id]

	_eh1 = -1;
	_eh2 = -1;
	_eh3 = -1;
	_eh4 = -1;
	_eh5 = -1;
	_eh6 = -1;

	_eh1 = (uinamespace getvariable "_MainDisplay") displayAddEventHandler ["keydown", "_temp = ['keydown',_this] call F_DoKeyDown;"];
	_eh2 = (uinamespace getvariable "_MainDisplay") displayAddEventHandler ["keyup", "['keyup',_this] call F_DoKeyUp;"];

	_eh3 = (uinamespace getvariable "_MapView") ctrlAddEventHandler ["mousemoving", "['mousemoving',_this] call F_DoMouseMovingHC;"];
	_eh4 = (uinamespace getvariable "_MapView") ctrlAddEventHandler ["mouseholding", "['mouseholding',_this] call F_DoMouseHoldingHC;"];
		
	_eh5 = (uinamespace getvariable "_MapView") ctrlAddEventHandler ["mousebuttondown", "['mousebuttondown',_this,hcSelected player] call F_DoMouseButtonDownHC;"];
	_eh6 = (uinamespace getvariable "_MapView") ctrlAddEventHandler ["mousebuttonup", "['mousebuttonup',_this,hcSelected player] call F_DoMouseButtonUpHC;"];

	_CountInit = missionNamespace getVariable "HCExtCountEventHandlerInit";
	missionNamespace setVariable ["HCExtCountEventHandlerInit", _CountInit + 1];

	//_EventHandlerIDs = [_eh1, _eh2, _eh3, _eh4, _eh5, _eh6];

	//missionNamespace setVariable ["HCExtCountEventHandlerIDs", _EventHandlerIDs];

	//Only one onPreloadFinished is allowed and once it has been called once it is erased!
	//onPreloadStarted { 3 execVM "HCfunc\HCrep\ReInitHCExtEventHandlers.sqf"; };
	//onPreloadFinished { 2 execVM "HCfunc\HCrep\ReInitHCExtEventHandlers.sqf"; };
	//onPreloadFinished { nil; };   
};

nil;
