/*
if (local player) then
{
	PRIVATE ["_marker","_pos","_rnd","_h"];

	_marker = "HaloMarker";
	_rnd=Random(200);
	_h=8000;
	_pos = [getmarkerpos _marker select 0,getmarkerpos _marker select 1, _h+_rnd];
	player setpos _pos;
	[player,_h+_rnd] exec "\ca\air2\Halo\data\Scripts\HALO_init.sqs";

sleep 2;
Waituntil {vehicle player != player}; //i.e. =="BIS_Steerable_Parachute"
sleep 2;
Waituntil {vehicle player == player};//i.e. left parachute
//fix for HALO bug
(FindDisplay 46) DisplaySetEventHandler ["keydown","if ((_this select 1) In actionKeys ""TeamSwitch"") then {a = createDialog 'evoUI'}"];
//hint "T menu restored! Eggbeast you da man!";
};
*/
//#include "\CA\Missions_e\bootcamp\BootCamp_Shared\bootcamp_init.sqf";
//run advanced hints
[] call bis_fnc_hints;

//create an empty thread, to avoid 'BIS_AdvHints_Spawn' being nil at the beginning
if (isNil "BIS_AdvHints_Spawn") then {
	BIS_AdvHints_Spawn = [] spawn {
		waitUntil {false};
	};
};
execFSM "data\FSM\halo.fsm";
