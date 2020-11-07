//makespetz.sqf - spetnaz assault event - makes truck (and soon to follow hind / boat) -borne spetnaz assault that spawns in village and seeks either the airfield or MHQ ambulance to destroy Blufor spawnbases

_deletespetz =
{
	_handle = [_spetz] execVM "data\scripts\delete.sqf";
};

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	//RESPAWN DELAY - half at start and half at end of function
	//a=60,b=45,c=30 respawn frequency fortype multiplied by
	//diffparam = difficulty values {60,45,30,15} {"Minimum", "Normal", "Hard", "Extreme"}
	_rv=BIS_EVO_airspawnfreqa;
//	_rf = 0.5*((_rv*10)+(4*(600/diffparam))+random 150); // varies from 1950 jets in easy to 750 hinds in extreme
	_rf = 4600 + (random 1200);
	sleep _rf;

	_allspawns = ["somref","somrefa","somrefb","parref","parrefa","parrefb"];
//	_allspawns = ["cayref","cayrefa","cayrefb","dolref","dolrefa","dolrefb"];
	_max = (count _allspawns)-1;
	_pos0 = GetMarkerPos (_allspawns select round random _max);

//	sleep 3;
//	hint format["x: %1 y: %2 Z: %3 ",(_pos0 select 0),(_pos0 select 1),(_pos0 select 2)];

	_pos1 = [(_pos0 select 0),(_pos0 select 1),(_pos0 select 2)];
	sleep 1;
	_pos2 = [(_pos0 select 0),(_pos0 select 1) - 15,(_pos0 select 2)];
	sleep 1;
	_pos3 = [(_pos0 select 0),(_pos0 select 1) - 30,(_pos0 select 2)];
	sleep 1;
	_pos4 = [(_pos0 select 0),(_pos0 select 1) - 45,(_pos0 select 2)];
	sleep 1;

_pos5 = [((_pos1 select 0) + random 5),((_pos1 select 1)+random 5),(_pos1 select 2)];
_pos6 = [((_pos2 select 0) + random 5),((_pos2 select 1)+random 5),(_pos2 select 2)];
_pos7 = [((_pos3 select 0) + random 5),((_pos3 select 1)+random 5),(_pos3 select 2)];
_pos8 = [((_pos4 select 0) + random 5),((_pos4 select 1)+random 5),(_pos4 select 2)];

_pos9 = [((_pos1 select 0) + random 5),((_pos1 select 1)+random 5),(_pos1 select 2)];
_pos10 = [((_pos2 select 0) + random 5),((_pos2 select 1)+random 5),(_pos2 select 2)];
_pos11 = [((_pos3 select 0) + random 5),((_pos3 select 1)+random 5),(_pos3 select 2)];
_pos12 = [((_pos4 select 0) + random 5),((_pos4 select 1)+random 5),(_pos4 select 2)];

_targblue = getmarkerpos "markerlkwwest"; 
sleep 2;
if(round (random 1) == 1) then {_targblue = getmarkerpos "hospital"};
sleep 2;

_spetz = createGroup (east);
		_allvecsNG = EGG_EVO_westveh9;
		_allvecsG = EGG_EVO_westveh8;
		_maxG = (count _allvecsG)-1;
		_maxNG = (count _allvecsNG)-1;
		_heli = createVehicle [_allvecsG select (round random _maxG), _pos1, [], 0, "NONE"];[_heli] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli] spawn {[_this select 0] call BIS_EVO_idelSVEC};
		_heli1 = createVehicle [_allvecsG select (round random _maxG), _pos2, [], 0, "NONE"];[_heli1] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli1] spawn {[_this select 0] call BIS_EVO_idelSVEC};
		_heli2 = createVehicle [_allvecsNG select (round random _maxNG), _pos3, [], 0, "NONE"];[_heli2] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli2] spawn {[_this select 0] call BIS_EVO_idelSVEC};
		_heli3 = createVehicle [_allvecsNG select (round random _maxNG), _pos4, [], 0, "NONE"];[_heli3] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli3] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_heli setdir 340;
_heli1 setdir 340;
_heli2 setdir 340;
_heli3 setdir 340;

_heli engineon true;
_heli1 engineon true;
_heli2 engineon true;
_heli3 engineon true;

//making infantry crews

_allunitsP = EGG_EVO_meofficer;
_max = (count _allunitsP)-1;

_allunitsP select (round random _max) createUnit [_pos5, _spetz];Sleep BIS_EVO_GlobalSleep;
sleep 0.2;
_allunitsP select (round random _max) createUnit [_pos6, _spetz];Sleep BIS_EVO_GlobalSleep;
sleep 0.2;
_allunitsP select (round random _max) createUnit [_pos7, _spetz];Sleep BIS_EVO_GlobalSleep;
sleep 0.2;
_allunitsP select (round random _max) createUnit [_pos8, _spetz];Sleep BIS_EVO_GlobalSleep;
sleep 0.2;
_allunitsP select (round random _max) createUnit [_pos9, _spetz];Sleep BIS_EVO_GlobalSleep;
sleep 0.2;
_allunitsP select (round random _max) createUnit [_pos10, _spetz];Sleep BIS_EVO_GlobalSleep;
sleep 0.2;

//hint format["6 Officer count %1",(count units _spetz)];


(units _spetz select 0) moveInDriver _heli;
sleep 0.2;
(units _spetz select 1) moveInGunner _heli;
sleep 0.2;
(units _spetz select 2) moveInDriver _heli1;
sleep 0.2;
(units _spetz select 3) moveInGunner _heli1;
sleep 0.2;
(units _spetz select 4) moveInDriver _heli2;
sleep 0.2;
(units _spetz select 5) moveInDriver _heli3;

//_allunits = ["RUS_Soldier_GL","RUS_Soldier_Marksman","RUS_Commander","RUS_Soldier1","RUS_Soldier2","RUS_Soldier3","RUS_Soldier_TL"];
_allunits = EGG_EVO_west3;
_max = count _allunits;

_allunits select (round random (_max - 1)) createUnit [_pos5, _spetz];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos6, _spetz];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos7, _spetz];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos8, _spetz];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos9, _spetz];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos10, _spetz];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos11, _spetz];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos12, _spetz];Sleep BIS_EVO_GlobalSleep;

(units _spetz select 6) moveInCargo _heli2;
sleep 0.2;
(units _spetz select 7) moveInCargo _heli2; 
sleep 0.2;
(units _spetz select 8) moveInCargo _heli2;
sleep 0.2;
(units _spetz select 9) moveInCargo _heli2; 
sleep 0.2;
(units _spetz select 10) moveInCargo _heli2; 
sleep 0.2;
(units _spetz select 11) moveInCargo _heli2; 
sleep 0.2;
(units _spetz select 12) moveInCargo _heli2; 
sleep 0.2;
(units _spetz select 13) moveInCargo _heli2; 

_allunits select (round random (_max - 1)) createUnit [_pos5, _spetz];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos6, _spetz];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos7, _spetz];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos8, _spetz];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos9, _spetz];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos10, _spetz];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos11, _spetz];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos12, _spetz];Sleep BIS_EVO_GlobalSleep;

(units _spetz select 14) moveInCargo _heli3; 
sleep 0.2;
(units _spetz select 15) moveInCargo _heli3; 
sleep 0.2;
(units _spetz select 16) moveInCargo _heli3; 
sleep 0.2;
(units _spetz select 17) moveInCargo _heli3; 
sleep 0.2;
(units _spetz select 18) moveInCargo _heli3; 
sleep 0.2;
(units _spetz select 19) moveInCargo _heli3; 
sleep 0.2;
(units _spetz select 20) moveInCargo _heli3; 
sleep 0.2;
(units _spetz select 21) moveInCargo _heli3; 


{_x addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}]} forEach (units _spetz);
_heli addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
_heli1 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
_heli2 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
_heli3 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];

_recy = [objnull,_spetz] execVM "data\scripts\grecycle.sqf";

_spetz setCombatMode "SAFE";

//hint format["spetsnaz embarked %1",(count units _spetz)];

[West,"HQ"] SideChat "Spetznaz assault imminent!";playSound "Incoming";

_spetz setFormation "COLUMN";
_spetz setSpeedMode "LIMITED";
_spetz setBehaviour "SAFE";

sleep 20;
_wp = _spetz addWaypoint [_targblue, 80];
[_spetz, 1] setWaypointType "HOLD";

waitUntil {(count units _spetz) < 1};

sleep 1.0;
[West,"HQ"] SideChat "Spetznaz assault defeated!";playSound "Goodjob";
sleep 2;
[] call _deletespetz;
sleep _rf;
};
