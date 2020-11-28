//makes roaming fighters
for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	//RESPAWN DELAY - half at start and half at end of function
	//a=60,b=45,c=30 respawn frequency fortype multiplied by
	//diffparam = difficulty values {60,45,30,15} {"Minimum", "Normal", "Hard", "Extreme"}
	_rv=BIS_EVO_airspawnfreqa;
//	_rf = 0.5*((_rv*10)+(4*(600/diffparam))+random 150); // varies from 1950 jets in easy to 750 hinds in extreme
	_rf = 2600 + (random 1200);
	sleep _rf;
	_startsa = ["EnemyAir01","EnemyAir02","EnemyAir03","EnemyAir04","EnemyAir05","EnemyAir06","EnemyAir07","EnemyAir08"];
	_poscreate = getmarkerpos (_startsa select (round random 7));

	_rndx = random 600;
	_rndy = random 600;
	_kpos = [(_poscreate select 0)-300 +_rndx,(_poscreate select 1)-300+_rndy,500];
	
	_pilot = createGroup (west);

	_allunits = EGG_EVO_mepilot;
	_maxu = (count _allunits)-1;

	_upos = getmarkerpos "centerp";
	_dcounta = 3;
	_d = 0;
	while {_d <= _dcounta} do 
	{
		(_allunits select round random _maxu) createUnit [_upos, _pilot];Sleep BIS_EVO_GlobalSleep;
		_d = _d+1;
		sleep 0.1;
	};
	
	//_recy = [_pilot,"none",objNull] spawn {[_this select 0,_this select 1,_this select 2] call BIS_EVO_gRecy};
	_allvecs = EGG_EVO_mevairc;
	_max = (count _allvecs)-1;
	_heli = createVehicle [_allvecs select (round random _max), _kpos, [], 50, "FLY"];Sleep BIS_EVO_GlobalSleep;
	_heli setpos [getpos _heli select 0, getpos _heli select 1, 500];
	_heli setdir (random 100);
	_sumark = [_heli] execVM "data\scripts\sumarker.sqf";
	(units _pilot select 0) assignAsDriver _heli;
	(units _pilot select 1) assignAsGunner _heli;
	(units _pilot select 0) moveInDriver _heli;
	(units _pilot select 1) moveInGunner _heli;
	_heli engineon true;

//adding
	_heli1 = createVehicle [_allvecs select (round random _max), _kpos, [], 50, "FLY"];Sleep BIS_EVO_GlobalSleep;
	_heli1 setpos [getpos _heli1 select 0, getpos _heli1 select 1, 500];
	_heli1 setdir (random 100);
	_sumark = [_heli1] execVM "data\scripts\sumarker.sqf";
	(units _pilot select 2) assignAsDriver _heli1;
	(units _pilot select 3) assignAsGunner _heli1;
	(units _pilot select 2) moveInDriver _heli1;
	(units _pilot select 3) moveInGunner _heli1;
	_heli1 engineon true;

	_pilot setFormation "LINE";
	_pilot setCombatMode "RED";
	{_x addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}]} forEach (units _pilot);
	_heli addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
	_spawne = [_heli] spawn {[_this select 0] call BIS_EVO_idelSVEC};
//	_killh1 = [_heli,crew _heli] spawn {[_this select 0,_this select 1] call _killpilots};
//adding
	_heli1 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
	_spawne = [_heli1] spawn {[_this select 0] call BIS_EVO_idelSVEC};
//	_killh1 = [_heli1,crew _heli1] spawn {[_this select 0,_this select 1] call _killpilots};

	_handle = [_pilot] execVM "data\scripts\flightpath.sqf";

	_checkmis = [_heli] execVM "data\scripts\restrict_sus.sqf";
	_checkmis2 = [_heli1] execVM "data\scripts\restrict_sus.sqf";

	sleep 1.0;

/*
	waitUntil {(not (alive _heli) AND not (alive _heli1)) or (isNull (driver _heli) AND isNull (driver _heli1)) };
	if (alive _heli) then {_heli setdammage 1};
	if (alive _heli1) then {_heli1 setdammage 1};
	sleep _rf;
	if (alive (units _pilot select 0)) then {(units _pilot select 0) setdammage 1};
	if (alive (units _pilot select 1)) then {(units _pilot select 1) setdammage 1};
	if (alive (units _pilot select 2)) then {(units _pilot select 2) setdammage 1};
	if (alive (units _pilot select 3)) then {(units _pilot select 3) setdammage 1};
*/

	waitUntil {( ( (not(alive _heli)) AND (not(alive _heli1)) ) or ( (isNull (driver _heli)) AND (isNull (driver _heli1)) ) )};
	sleep 1.0;
	if (alive _heli) then {_heli setdammage 1};
	if (alive _heli1) then {_heli1 setdammage 1};
	sleep _rf;
	{if (alive _x) then {_x setdammage 1}} forEach (units _pilot);


};

