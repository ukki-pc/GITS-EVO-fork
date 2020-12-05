// makes roaming Hips

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	//RESPAWN DELAY - half at start and half at end of function
	//a=60,b=45,c=30 respawn frequency fortype multiplied by
	//diffparam = difficulty values {60,45,30,15} {"Minimum", "Normal", "Hard", "Extreme"}
	//_rv=BIS_EVO_airspawnfreqc;
//	_rf = 0.5*((_rv*10)+(4*(600/diffparam))+random 150); // varies from 1950 jets in easy to 750 hinds in extreme
	waitUntil{sleep 30; defenceReady and (BIS_EVO_MissionProgress == 0 or BIS_EVO_MissionProgress == 1 or BIS_EVO_MissionProgress == 2 or BIS_EVO_MissionProgress == 4 or BIS_EVO_MissionProgress == 6 or BIS_EVO_MissionProgress == 10)};
	_rf = 1800 + (random 1800); //30min base + 30min random
	//sleep _rf;
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
	_array = [_allvecs select (round random _max),_kpos,(west),20,_dir,0] call BIS_EVO_CreateVehicle;
		//_heli = createVehicle [(_allvecs select round random ((count _allvecs) - 1)),_kpos, [], 10, "NONE"];
	Sleep BIS_EVO_GlobalSleep;

		_crew = _array select 0;
		_ship = _array select 1;

	_sumark = [_ship] execVM "data\scripts\shimarker.sqf";
	_ship lock true;


	_unit = _crew createUnit [(_allunits select round random (_max - 1)), _kpos, [], 30, "NONE"];
	Sleep 0.3;
	_unit = _crew createUnit [(_allunits select round random (_max - 1)), _kpos, [], 30, "NONE"];
	Sleep 0.3;	
		_unit = _crew createUnit [(_allunits select round random (_max - 1)), _kpos, [], 30, "NONE"];
	Sleep 0.3;	
	//_unit = _crew createUnit [(_allunits select round random (_max - 1)), _kpos, [], 30, "NONE"];
	// (units _pilot select 0) moveInDriver _ship;
	// (units _pilot select 1) moveInTurret[_ship,[0]];
	 (units _crew select 2) moveInTurret[_ship,[1]];
	 sleep 0.3;
	   (units _crew select 3) moveInTurret[_ship,[2]];
	   sleep 0.3;
	    (units _crew select 4) moveInTurret[_ship,[3]];
	//_ship engineon true;
	//_handle = [_pilot] execVM "data\scripts\flightpath.sqf";
	{_x addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"; sleep 0.3}]} forEach (units _crew);

	_ship addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
	_spawne = [_ship] spawn {[_this select 0] call BIS_EVO_idelSVEC};
	_isWater= surfaceIsWater [(getMarkerpos (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress)select 0) + random(1000)-random(1000),(getMarkerpos (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress)select 1)+ random(1000)-random(1000)];
	sleep 1;

//DEBUG MARKER
/*
_markerobj = createMarker["hiki",getPos player];
_markerobj setMarkerType  "Dot";
_markerobj setMarkerColor "ColorGreen";
*/
_seaPos = [(getMarkerpos (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress)select 0),((getMarkerpos (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress))select 1)];

	while{!_isWater} do {
		_randomX = (500 + random(700)) * (1+random(-2));
		_randomY = (500 + random(500)) * (1+random(-2));

		_seaPos = [(getMarkerpos (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress)select 0) + _randomX,((getMarkerpos (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress))select 1) +_randomY];
		//_markerobj setMarkerPos [_seaPos select 0, _seaPos select 1];
		_isWater= surfaceIsWater _seaPos;
		sleep 1;
	};
	_handle = _crew addWaypoint [_seaPos, 0];//current town
	[_crew, 0] setWaypointType "MOVE";
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
	waitUntil { sleep 15; ( (not(alive _ship)) or ( (isNull (driver _ship)) && (isNull (gunner _ship))) ) };
	sleep 1.0;
	if (alive _ship) then {_ship setdammage 1};
	{if (alive _x) then {_x setdammage 1}} forEach (units _crew);
};
