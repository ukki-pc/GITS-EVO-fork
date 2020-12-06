// makes roaming Ships

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	//RESPAWN DELAY - half at start and half at end of function
	//a=60,b=45,c=30 respawn frequency fortype multiplied by
	//diffparam = difficulty values {60,45,30,15} {"Minimum", "Normal", "Hard", "Extreme"}
	//_rv=BIS_EVO_airspawnfreqc;
//	_rf = 0.5*((_rv*10)+(4*(600/diffparam))+random 150); // varies from 1950 jets in easy to 750 hinds in extreme
	waitUntil{ sleep 30; defenceReady and (BIS_EVO_MissionProgress == 0 or BIS_EVO_MissionProgress == 1 or BIS_EVO_MissionProgress == 2 or BIS_EVO_MissionProgress == 4 or BIS_EVO_MissionProgress == 6 or BIS_EVO_MissionProgress == 10)};
	_rf = 1800 + (random 1800); //30min base + 30min random
	sleep _rf;
	_startsf = ["EnemyAir01","EnemyAir02","EnemyAir03","EnemyAir04","EnemyAir05","EnemyAir06","EnemyAir07","EnemyAir08"];
	_poscreate = getmarkerpos (_startsf select (round random 7));

	_ship = objNull;
	_crew = grpNull;

	_rndx = random 600;
	_rndy = random 600;
	_kpos = [(_poscreate select 0)-300 +_rndx,(_poscreate select 1)-300+_rndy];
	_allunits = EGG_EVO_mepilot;
	_maxu = (count _allunits)-1;

	_upos = getmarkerpos "centerp";
			//_recy = [_pilot,"none",objNull] spawn {[_this select 0,_this select 1,_this select 2] call BIS_EVO_gRecy};
	_dir = random(100);
	_allvecs = EGG_EVO_eastShips;
	_max = (count _allvecs)-1;
	//_heli = createVehicle [_allvecs select (round random _max), _kpos, [], 50];Sleep BIS_EVO_GlobalSleep;
	//_array = [_allvecs select (round random _max),_kpos,(west),20,_dir,0] call BIS_EVO_CreateVehicle;
	_ship = createVehicle [(_allvecs select round random ((count _allvecs) - 1)),_kpos, [], 10, "NONE"];
	Sleep BIS_EVO_GlobalSleep;

		//_crew = _array select 0;
		//_ship = _array select 1;

	_sumark = [_ship] execVM "data\scripts\shimarker.sqf";
	_ship lock true;
	Sleep BIS_EVO_GlobalSleep;
	_grpMenCount = 0;
	_crew = createGroup (west);
	Sleep BIS_EVO_GlobalSleep;

	//When creating units too fast, script may fail
	while{_grpMenCount < 5} do {
		_unit = _crew createUnit [EGG_EVO_mepilot select 0, _kpos, [], 30, "NONE"];
		Sleep 0.6;
		_grpMenCount = count units _crew;
		if(_grpMenCount == 1) then {(units _crew select (_grpMenCount-1)) moveInDriver _ship};
		if(_grpMenCount == 2) then {(units _crew select (_grpMenCount-1)) moveInCommander _ship};
		if(_grpMenCount > 1) then {(units _crew select (_grpMenCount-1)) moveInTurret[_ship,[_grpMenCount-2]]};
		sleep BIS_EVO_GlobalSleep;
	};
		_shipCrewCount = count crew _ship;

	{_x addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"; sleep 0.3}]} forEach (units _crew);
	_ship addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
	_spawne = [_ship] spawn {[_this select 0] call BIS_EVO_idelSVEC};
	_isWater= false;
	sleep 1;

//DEBUG MARKER
/*
_markerobj = createMarker["hiki",getPos player];
_markerobj setMarkerType  "Dot";
_markerobj setMarkerColor "ColorGreen";
*/
_seaPos = [];
_multp = [-1,1];
	while{!_isWater} do {
		_randomX = (500 + random(600)) *  ((_multp) select round random 1);
		_randomY = (500 + random(600)) *  ((_multp) select round random 1);

		_seaPos = [(getMarkerpos (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress)select 0) + _randomX,((getMarkerpos (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress))select 1) +_randomY];
	//	_markerobj setMarkerPos [_seaPos select 0, _seaPos select 1];
		_isWater= surfaceIsWater _seaPos;
		sleep 0.5;
	};
	

//	systemChat format ["ship starts to sail with: %1: men on board and groupsize of %2", _shipCrewCount, _grpMenCount];

/*
	waitUntil {(not (alive _heli) AND not (alive _heli1)) or (isNull (driver _heli) AND isNull (driver _heli1))};
	sleep 1.0;
	if (alive _heli) then {_heli setdammage 1;};
	if (alive _heli1) then {_heli1 setdammage 1;};
	sleep _rf;
	if (alive (units _pilot select 0)) then {(units _pilot select 0) setdammage 1};
	if (alive (units _pilot select 1)) then {(units _pilot select 1) setdammage 1};
	if (alive (units _pilot select 2)) then {(units _pilot select 2) setdammage 1};
	if (alive (units _pilot select 3)) then {(units _pilot select 3) setdammage 1};
	if (alive (units _pilot select 4)) then {(units _pilot select 4) setdammage 1};
	if (alive (units _pilot select 5)) then {(units _pilot select 5) setdammage 1};
	if (alive (units _pilot select 6)) then {(units _pilot select 6) setdammage 1};
	if (alive (units _pilot select 7)) then {(units _pilot select 7) setdammage 1};

*/
	waitUntil { sleep 15; _handle = _crew addWaypoint [_seaPos, 0]; [_crew, 0] setWaypointType "MOVE";( (not(alive _ship)) or ( (isNull (driver _ship)) && (isNull (gunner _ship))) ) };
	sleep 1.0;
	if (alive _ship) then {_ship setdammage 1};
	{if (alive _x) then {_x setdammage 1}} forEach (units _crew);
	sleep _rf;
};
