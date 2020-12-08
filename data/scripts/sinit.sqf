// main server init
//_base = [] execvm "data\scripts\EVO_makebase.sqf"; // Creates the main west base

_events = [] execVM "data\scripts\EVO_VecR.sqf"; // Vehicle respawn for non-respawning military vehicles
_events = [] execVM "data\scripts\EVO_VecRm.sqf";// Vehicle respawn for respawning military vehicles
_events = [] execVM "data\scripts\EVO_VecRc.sqf";// Vehicle respawn for respawning civilian vehicles
_events = [] execVM "data\scripts\EventsS.sqf"; // Common server events

_events = [] execVM "data\scripts\EVO_Erefway.sqf"; // Reinforcement waypoint generator
_events = [] execVM "data\scripts\EVO_FillInf.sqf"; // Fills out squads for cites
_events = [] execVM "data\scripts\EVO_gRecy.sqf";// Recycles groups
_events = [] execVM "data\scripts\EVO_Erec.sqf";	// City setup (radios,officers,group leaders)

//added
_sin = [] execVM "data\scripts\sinitS.sqf";
Mthread = [] execVM "data\scripts\MainThread.sqf";

_events = [] execVM "data\scripts\EVO_MissionManager.sqf";

//FH is field hospital objct
wcam = fh addaction ["Save mission to clipboard", "actions\saveMission.sqf",0,1, false, true,"test2"];

//_reinf = [] execVM "data\scripts\reinforce.sqf";

//_handle = [] execVM "data\scripts\makespetz.sqf"; DELETED FR NOW

 _handle = [] execVM "data\scripts\makesuB.sqf";
 _handle = [] execVM "data\scripts\makehindv.sqf";
 _handle = [] execVM "data\scripts\makesu.sqf";
 _handle = [] execVM "data\scripts\makeka.sqf";
 _handle = [] execVM "data\scripts\makehindp.sqf";
 _handle = [] execVM "data\scripts\makehip.sqf";
 _handle = [] execVM "data\scripts\makeShip.sqf";

_allPlayers = call BIS_fnc_listPlayers;
if(EGG_EVO_LoadGame == 0) then 
{
    {["jed_addscore", [_x, 10]] call CBA_fnc_globalEvent}forEach _allPlayers;
};
if(editor == 1) then {
systemChat "sinit done";
};
Sleep 10.0;