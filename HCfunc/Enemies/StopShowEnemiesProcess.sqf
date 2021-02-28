// Arma 2 function

private ["_ScriptHandle"];

_ScriptHandle = missionNamespace getVariable "HCExtShowEnemiesProcess";

terminate _ScriptHandle;
sleep 1.0;
call F_ClearHCShownEnemyIcons;

hintSilent format ["Process Terminated %1", _ScriptHandle];

sleep 10.0;

hintSilent format ["Process Terminated 10 secs %1", _ScriptHandle];

nil;

