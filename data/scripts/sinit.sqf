// main server init
//_base = [] execvm "data\scripts\EVO_makebase.sqf"; // Creates the main west base

// _events = [] execVM "data\scripts\EVO_VecR.sqf"; // Vehicle respawn for non-respawning military vehicles
// _events = [] execVM "data\scripts\EVO_VecRm.sqf";// Vehicle respawn for respawning military vehicles
_events = [] execVM "data\scripts\EventsS.sqf"; // Common server events

sleep 1;

if(carrier) then {_events = [] execVM "data\scripts\vehicleRewards.sqf";};
_events = [] execVM "data\scripts\EVO_Erefway.sqf"; // Reinforcement waypoint generator
_events = [] execVM "data\scripts\EVO_FillInf.sqf"; // Fills out squads for cites
_events = [] execVM "data\scripts\EVO_gRecy.sqf";// Recycles groups
_events = [] execVM "data\scripts\EVO_Erec.sqf";	// City setup (radios,officers,group leaders)
_events = [] execVM "data\scripts\EVO_MissionManager.sqf";

mobjBury = compile preprocessFileLineNumbers "data\scripts\mobjbury.sqf";

//added
// _sin = [] execVM "data\scripts\sinitS.sqf";
Mthread = [] execVM "data\scripts\MainThread.sqf";


//DIsabled due to problems
//_mgun = [] execVM "data\scripts\manVehicle.sqf";

_handle = [] execVM "data\scripts\activeReinforce.sqf";



//DEBUG
//_bmb = [] execVM "data\scripts\enemyAirstrike.sqf";

Sleep 10.0;