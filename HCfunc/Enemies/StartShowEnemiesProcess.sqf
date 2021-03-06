// Arma 2 function

private ["_TargetRange","_OnlyDoLeaders","_KnownValue","_ScriptHandle"];

_TargetRange = _this select 0;
_OnlyDoLeaders = _this select 1;
_KnownValue = _this select 2;

_ScriptHandle = missionNamespace getVariable "HCExtShowEnemiesProcess";

if ( scriptDone _ScriptHandle ) then {

	[_TargetRange, _OnlyDoLeaders, _KnownValue] spawn F_ShowEnemiesProcess;
	
	_ScriptHandle = [_TargetRange, _OnlyDoLeaders, _KnownValue] spawn F_ShowEnemiesProcess;
    missionNamespace setVariable ["HCExtShowEnemiesProcess", _ScriptHandle];
   // hintSilent "Show Enemies Process started.";
} else {
	//hintSilent "Show Enemies Process already running.";
};

nil;

