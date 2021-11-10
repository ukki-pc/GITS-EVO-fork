//INPUT [POSITION,DIRECTION,COUNT]
spawn_defenderHelis = 
{
	_poscreate = _this select 0;
	_dirToObj = _this select 1;
	_count = _this select 2;
	_count = _count - 1;
	_pilot = createGroup (EGG_EVO_ENEMYFACTION);
	_allunits = EGG_EVO_mepilot;
	_maxu = (count _allunits)-1;
	_upos = [0,0];
	_objPos = getPos currentTown;
	//_recy = [_pilot,"none",objNull] spawn {[_this select 0,_this select 1,_this select 2] call BIS_EVO_gRecy};
	_helicopters = [];
	

	for "_i" from 0 to _count do
	{
		_d = 0;
		while {_d <= 2} do 
		{
			(EGG_EVO_mepilot select 0) createUnit [_upos, _pilot];
			_d = _d+1;
			Sleep BIS_EVO_GlobalSleep;
		};

		//adding hinds
			_heli = createVehicle [([EGG_EVO_helicopters] call fnc_pickvehicle),[(_poscreate select 0),( _poscreate select 1)], [], 0, "NONE"];Sleep BIS_EVO_GlobalSleep;
			_heli setdir _dirToObj;
			_sumark = [_heli] execVM "data\scripts\sumarker.sqf";
			_heli addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}];
			_helicopters = _helicopters + [_heli];

			(units _pilot select _i+_i) moveInDriver _heli;
			(units _pilot select _i+_i+1) moveInTurret[_heli,[0]];
	};

		//_handle = [_pilot] execVM "data\scripts\flightpath.sqf";
	{_x addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}]} forEach (units _pilot);

	waitUntil{sleep (round random(10)+4); defendAlarm};
	_heli engineon true;

	_pilot setFormation "VEE";
	_pilot setCombatMode "RED";

	[_pilot, 1] setWaypointPosition [_objPos, 0];

	_wp2 = _pilot addWaypoint [_objPos, 10];
	_wp2 setWaypointType "SAD";
	{_x setBehaviour "COMBAT"} forEach (units _pilot);

	(leader _pilot) commandMove _objPos;
	(leader _pilot) doMove _objPos;
};


spawn_helis = 
{
	_spawnpoint = ([airports,currentTown] call BIS_fnc_nearestPosition);   
	_poscreate = getPos _spawnpoint;
	_pilot = createGroup (EGG_EVO_ENEMYFACTION);
	_allunits = EGG_EVO_mepilot;
	_maxu = (count _allunits)-1;
	_upos = [0,0];
	_objPos = getPos currentTown;
	//_recy = [_pilot,"none",objNull] spawn {[_this select 0,_this select 1,_this select 2] call BIS_EVO_gRecy};
	_helicopters = [];
	_dirToObj = [_poscreate,_objPos] call BIS_EVO_GetRelDir;

	for "_i" from 0 to 0 do
	{
		_d = 0;
		while {_d <= 2} do 
		{
			(EGG_EVO_mepilot select 0) createUnit [_upos, _pilot];
			_d = _d+1;
			Sleep BIS_EVO_GlobalSleep;
		};

		//adding hinds
			_heli = createVehicle [([EGG_EVO_helicopters] call fnc_pickvehicle),[(_poscreate select 0)+(_i*50),( _poscreate select 1)], [], 50, "FLY"];Sleep BIS_EVO_GlobalSleep;
			_heli setdir _dirToObj;
			_sumark = [_heli] execVM "data\scripts\sumarker.sqf";

			_helicopters = _helicopters + [_heli];

			(units _pilot select _i+_i) moveInDriver _heli;
			(units _pilot select _i+_i+1) moveInTurret[_heli,[0]];
			_heli engineon true;
	};

	sleep 1;

	_pilot setFormation "VEE";
	_pilot setCombatMode "RED";

	//_handle = [_pilot] execVM "data\scripts\flightpath.sqf";
	{_x addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}]} forEach (units _pilot);

	{
	_x addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}];
	//_spawne = [_x] spawn {[_this select 0] call BIS_EVO_idelSVEC};
	} forEach _helicopters;

	[_pilot, 1] setWaypointPosition [_objPos, 0];

	_wp2 = _pilot addWaypoint [_objPos, 10];
	_wp2 setWaypointType "SAD";
	{_x setBehaviour "COMBAT"} forEach (units _pilot);

	(leader _pilot) commandMove _objPos;
	(leader _pilot) doMove _objPos;
};

EGG_EVO_mecreinf = 
{
	_alist = BIS_EVO_DetectEnemy;
	_curTown = currentTown;
	_radio = radio1;
	_objPos = position _curTown;
	_unit = objNull;
	_guardm = grpNull;
	_pos = objNull;
	_vec = objNull;
	_maxo = 0;
	_nearestMarker = "";
	_dist = 0;
	

	_reinforceTowns = [currentTown] call fnc_get_synchronized_towns;
	_reinforceTowns = _reinforceTowns-BIS_EVO_conqueredTowns;

	if(count _reinforceTowns < 1) exitWith{};

	_pos = position (_reinforceTowns select (round (random (count _reinforceTowns-1))));

	_tag = "MEC";
	//Increasing aggression
	_allvec = [];
	_rng = round(random(100+aggression));
		if(_rng < easyTreshold) then 
		{
		_allvec = EGG_EVO_MechEasy; //mixed units reinforce
		};
	if(_rng > easyTreshold and _rng < hardTreshold) then 
		{
		_allvec = EGG_EVO_MechEasy + EGG_EVO_MechMedium; //mixed units reinforce
		};
	if(_rng >= hardTreshold) then 
		{
		_allvec = EGG_EVO_MechMedium + EGG_EVO_MechHard; //mixed units reinforce
	};


	//systemchat format ["Random number was: %1", _rng];
	_rds = [];
	_rds = (_pos nearRoads 10);
	waitUntil{count _rds > 0};
	_cardir = (getdir (_rds select 0));
	_degrees = [_pos,position _alist] call BIS_EVO_GetRelDir;
	_dirdif = (_cardir-_degrees);
	if((_dirdif > 89) or (_dirdif < -89)) then{_cardir=_cardir-180};	
	_pos = position (_rds select 0);
	_vecT = [_allvec] call fnc_pickRandom;
	_array = [_vecT,_pos,(EGG_EVO_ENEMYFACTION),20,_cardir,0] call BIS_EVO_CreateVehicle;

	_guardm = _array select 0;
	_vec = _array select 1;
	_sumark = [_vec,"Mec","ColorBlack"] execVM "data\scripts\customMarker.sqf";
	[position _alist,_guardm,_objPos,_alist] call BIS_EVO_Erefway;
	sleep 1;
	[_guardm, 1] setWaypointCombatMode "RED";		
	{_x addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}]} forEach (units _guardm);
	_guardm setFormation "COLUMN";
	sleep 10;
	if(isNull driver _vec  ) then {deleteVehicle _vec; {_x setDammage 1}forEach (units _guardm)};
	//adding
	_recy = [objnull,_guardm] execVM "data\scripts\grecycle.sqf";
};

BIS_EVO_mKamazOpen =
{
	_guardr = grpNull;
	_unit = objNull;
	_pos2 = objNull;
	_max = objnull;
	_alist = BIS_EVO_DetectEnemy;

	_curTown = currentTown;
	_reinforceTowns = [currentTown ]call fnc_get_synchronized_towns;
	_reinforceTowns = _reinforceTowns-BIS_EVO_conqueredTowns;

	if(count _reinforceTowns < 1) exitWith{};

	_objPos = position _curTown;

	_spawns = _reinforceTowns select (round (random (count _reinforceTowns-1)));
	_pos = position _spawns;
	_tag = "MEC";

	_allunits = enemyRiflemen;
	_max = count _allunits;
	_guardr = createGroup (EGG_EVO_ENEMYFACTION);
	_pos2 = position (_reinforceTowns select (round random (count _reinforceTowns-1)));
	_allvecs = EGG_EVO_mevconvoyb;
	_maxA = count _allvecs;
	_ural = createVehicle [(_allvecs select (round random (_maxA - 1))), _pos2,[], 0, "NONE"];
	[_ural] call BIS_EVO_Lock;
	_ural addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}];
	Sleep 0.2;
	_unit = _guardr createUnit [[enemyAll] call fnc_pickRandom, _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsDriver _ural;_unit moveInDriver _ural;
	Sleep 0.2;
	_unit = _guardr createUnit [[enemyAll] call fnc_pickRandom, _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsCargo _ural;_unit moveInCargo _ural;
	Sleep 0.2;
	_unit = _guardr createUnit [[enemyAll] call fnc_pickRandom, _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsCargo _ural;_unit moveInCargo _ural;
	Sleep 0.2;
	_unit = _guardr createUnit [[enemyAll] call fnc_pickRandom, _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsCargo _ural;_unit moveInCargo _ural;
	Sleep 0.2;
	_unit = _guardr createUnit [[enemyAll] call fnc_pickRandom, _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsCargo _ural;_unit moveInCargo _ural;
	Sleep 0.2;
	_unit = _guardr createUnit [[enemyAll] call fnc_pickRandom, _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsCargo _ural;_unit moveInCargo _ural;
	Sleep 0.2;
	_sumark = [_ural,"Ural","ColorRed","plp_icon_truck",false,0.8] execVM "data\scripts\customMarker.sqf";
	sleep 1;
	[position _alist,_guardr,_objPos,_alist] call BIS_EVO_Erefway;
	[_guardr, 1] setWaypointType "GETOUT";
	{_x addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}]; _x addmagazine ["EB_molotov_mag",2];} forEach (units _guardr);	
	_recy = [objnull,_guardr] execVM "data\scripts\grecycle.sqf";
	_guardr setFormation "COLUMN";
	[_guardr, 1] setWaypointCombatMode "RED";	
	[_guardr, 1] setWaypointSpeed "NORMAL";	
	sleep 10;
	if(isNull driver _ural  ) then {deleteVehicle _ural; {_x setDammage 1}forEach (units _guardr)};
	sleep 400;
	deleteVehicle _ural;
};

BIS_EVO_SHIPSUPPORT = {

	_rnd = [[8,7,4,10,20,2,8,10]] call weightedRandomSimple;
	_vecT = EGG_EVO_ENEMYSHIPS select _rnd;

	_targetPos = getPos currentTown;
	_startPoints = ["EnemyAir01","EnemyAir02","EnemyAir03","EnemyAir04","EnemyAir05","EnemyAir06","EnemyAir07","EnemyAir08"];
	_startPos = "";
	_targetMarker = "";
	_dist = 5000;
	_newDist = 0;
	_count = ((count _startPoints)-1);
	_startPoses = [];

	//DETERMINE THE CLOSEST REINFORCE POINT
	for [{_loop=0}, {_loop<count _startPoints}, {_loop=_loop+1}] do 
	{
		_targetMarker = _startPoints select _loop;
		_newDist = _targetPos distance (getMarkerPos _targetMarker);
		if(_newDist < _dist ) then {_startPoses = _startPoses + [_startPoints select _loop]; _dist = _newDist};
	};

	_rnd = round(random(count _startPoses-1));
	_startPos = _startPoses select _rnd;
	_shipPos =  getMarkerPos _startPos;

	_array = [_vecT,_shipPos,(EGG_EVO_ENEMYFACTION),300,180,0] call BIS_EVO_CreateVehicle;
	_grp = _array select 0;
	_vec = _array select 1;

	_sumark = [_vec,"","ColorRED","plp_icon_shipFrigate"] execVM "data\scripts\customMarker.sqf";

	{_x addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}]} forEach (units _grp);

	[_grp,_targetPos,_vec] spawn fnc_waterPatrol;
};

BIS_EVO_mKamazResupply =
{
	_alist = BIS_EVO_DetectEnemy;
	_radio = radio1;
	_unit = objNull;
	_guardm = grpNull;
	_pos = objNull;
	_vec = objNull;
	_maxo = 0;
	_nearestMarker = "";
	_dist = 0;
	eResupplying = true;
	
	_curTown =  currentTown;
	_reinforceTowns = [currentTown] call fnc_get_synchronized_towns;
	_reinforceTowns = _reinforceTowns-BIS_EVO_conqueredTowns;

	if(count _reinforceTowns < 1) exitWith{};

	_objPos = position _curTown;
	_spawns = _reinforceTowns select (round (random (count _reinforceTowns-1)));
	_tag = "MEC";

	//Increasing aggression
	_allvec = EGG_EVO_enemySupply;

		//systemchat format ["Random number was: %1", _rng];
		_maxo = (count _allvec)-1;	
		_rds = [];
		_rds = (_pos nearRoads 10);
		waitUntil{count _rds > 0};
		_cardir = (getdir (_rds select 0));
		_degrees = [_pos,position _alist] call BIS_EVO_GetRelDir;
		_dirdif = (_cardir-_degrees);
		if((_dirdif > 89) or (_dirdif < -89)) then{_cardir=_cardir-180};	
		_pos = position (_rds select 0);

		_array = [_allvec select (round random _maxo),_pos,(EGG_EVO_ENEMYFACTION),20,_cardir,0] call BIS_EVO_CreateVehicle;

		_guardm = _array select 0;
		_vec = _array select 1;
		_sumark = [_vec,"Ammo","ColorGreen"] execVM "data\scripts\customMarker.sqf";
		_wp = _guardm addWaypoint [_objPos, 100];
		_wp setWaypointType "GETOUT";
		sleep 1;
		[_guardm, 1] setWaypointCombatMode "RED";		
		{_x addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}]} forEach (units _guardm);
		_guardm setFormation "COLUMN";

		waitUntil{sleep 5;_vec distance _objPos < 100;};

		while {alive _vec} do 
		{
			{
				if(side _x == EGG_EVO_ENEMYFACTION and speed _vec < 5) then 
				{
					_x setvehicleammo 1;
					sleep 3;
				};
			} foreach ( nearestobjects [position _vec,["LandVehicle"],200]);
			sleep 60;
		};
		//adding
		_recy = [objnull,_guardm] execVM "data\scripts\grecycle.sqf";
		deleteVehicle _vec;
		eResupplying = false;
};


BIS_EVO_MI17support =
{	
	_pos = objNull;
	_unit = objNull;
	_vec = objNull;
	_heli0 = objnull;
	_max = objnull;
	_maxv = objnull;
	_alist = BIS_EVO_DetectEnemy;
	_radio = radio1;
	_curTown =  currentTown;
	_objPos = position _curTown;
	_pos = _objPos;
	_posback = getmarkerpos "EnemyAir03";
	_pilot = createGroup (EGG_EVO_ENEMYFACTION);
	(EGG_EVO_mepilot select 0) createUnit [getmarkerpos "centerp", _pilot];Sleep BIS_EVO_GlobalSleep;
	(EGG_EVO_mepilot select 0) createUnit [getmarkerpos "centerp", _pilot];Sleep BIS_EVO_GlobalSleep;
	_pos1 = [(_pos select 0)-2000 -(random 2000),(_pos select 1)+2000 -(random 3000),(200 + random 100)];
	_pos2 = [(_pos select 0)+2000 +(random 2000),(_pos select 1)+2000 -(random 3000),(200 + random 100)];
	_allvecs2 = EGG_EVO_mevair3;
	_maxv = count _allvecs2;
	_heli0 = createVehicle [(_allvecs2 select round random (_maxv - 1)),_pos1, [], 500, "FLY"];Sleep BIS_EVO_GlobalSleep;
	_heli0 setpos [getpos _heli0 select 0, getpos _heli0 select 1, 200];
	_heli0 setdir (random 359);
	_heli0 engineon true;
	(units _pilot select 0) assignAsDriver _heli0;
	(units _pilot select 1) assignAsGunner _heli0;
	(units _pilot select 0) moveInDriver _heli0;
	(units _pilot select 1) moveInGunner _heli0;
	//[_unit, _string, _color, _markerType, _enableDir]
	_sumark = [_heli0,"","ColorRed","plp_icon_helicopterCargo",true] execVM "data\scripts\customMarker.sqf";
	_heli0 addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}];
	_wp = _pilot addWaypoint [_pos, 10];
	_wp2 = _pilot addWaypoint [_posback, 10];
	{_x setBehaviour "careless"} forEach (units _pilot);

	(driver _heli0) commandMove _pos;
	(driver _heli0) doMove _pos;
	_heli0 flyInHeight 150;

	waitUntil {(_heli0 distance _pos) < (random 200) or not (canmove _heli0)};


	if (canmove _heli0) then 
	{
		_para = createGroup (EGG_EVO_ENEMYFACTION);
		_count = 5;
		_i = 0;
		while {_i <= _count} do 
		{
			_pos = position _heli0;
			_unit = _para createUnit [[enemySpecops] call fnc_pickRandom, [0,0,0], [], 300, "NONE"];
			_unit setSkill skillfactor+(random 0.2);
			_unit addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}];
			[_unit] join _para;
			_vec = createVehicle ["ParachuteWest", _pos, [], 20, 'NONE'];
			_vec setpos [_pos select 0,_pos select 1,(_pos select 2)- 12];
			_unit MoveInDriver _vec;
			sleep 0.7;
			_i = _i + 1;
		};

		{_x setBehaviour "combat"; _x addmagazine "EB_molotov_mag"} forEach (units _para);
		[position _alist,_para,_objPos,_alist] call BIS_EVO_Erefway;
//adding
		_recy = [objnull,_para] execVM "data\scripts\grecycle.sqf";
		sleep 10;
		_wpx2 = _pilot addWaypoint [_posback, 20];
		[_pilot, 2] setWaypointType "MOVE";
		(driver _heli0) commandMove _posback;
		(driver _heli0) doMove _posback;
	};
	sleep 90;
	{deleteVehicle _x} forEach ([_heli0] + crew _heli0);
	if (!isNull _unit) then {deleteVehicle _unit};
	deleteGroup _pilot;
};

BIS_EVO_rappelSupport =
{	
	_pos = objNull;
	_unit = objNull;
	_vec = objNull;
	_heli0 = objnull;
	_radio = radio1;
	_alist = BIS_EVO_DetectEnemy;
	_curTown =  currentTown;
	_objPos = position _curTown;
	_pos = _objPos;
	_posback = getmarkerpos "EnemyAir03";
	_pilot = createGroup (EGG_EVO_ENEMYFACTION);
	(EGG_EVO_mepilot select 0) createUnit [getmarkerpos "centerp", _pilot];Sleep BIS_EVO_GlobalSleep;
	(EGG_EVO_mepilot select 0) createUnit [getmarkerpos "centerp", _pilot];Sleep BIS_EVO_GlobalSleep;
	_pos1 = [(_pos select 0)-2000 -(random 2000),(_pos select 1)+2000 -(random 3000),(200 + random 100)];
	_pos2 = [(_pos select 0)+2000 +(random 2000),(_pos select 1)+2000 -(random 3000),(200 + random 100)];
	_heli0 = createVehicle [[EGG_EVO_rappelChoppers] call fnc_pickRandom,_pos1, [], 500, "FLY"];Sleep BIS_EVO_GlobalSleep;
	_heli0 setpos [getpos _heli0 select 0, getpos _heli0 select 1, 200];
	_heli0 setdir (random 359);
	_heli0 engineon true;
	(units _pilot select 0) assignAsDriver _heli0;
	(units _pilot select 1) assignAsGunner _heli0;
	(units _pilot select 0) moveInDriver _heli0;
	(units _pilot select 1) moveInGunner _heli0;
	//[_unit, _string, _color, _markerType, _enableDir]
	_sumark = [_heli0,"","ColorRed","plp_icon_helicopterCargo",true] execVM "data\scripts\customMarker.sqf";
	_heli0 addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}];
	_heli0 addMPEventHandler  ["MPHit", {handle = [(_this select 0),(_this select 1)] execVM "data\scripts\rememberHit.sqf"}];
	_wp = _pilot addWaypoint [_pos, 300];
	{_x setBehaviour "careless"} forEach (units _pilot);

	_pos = waypointPosition _wp;

	(driver _heli0) commandMove _pos;
	(driver _heli0) doMove _pos;
	_heli0 flyInHeight 35;

		_para = createGroup (EGG_EVO_ENEMYFACTION);
		_count = 5;
		_i = 0;
		while {_i <= _count} do 
		{
			_pos = position _heli0;
			_unit = _para createUnit [[enemySpecops] call fnc_pickRandom, [0,0,0], [], 300, "NONE"];
			_unit setSkill skillfactor+(random 0.2);
			_unit addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}];
			[_unit] join _para;
			_unit moveInCargo _heli0;
			sleep 0.7;
			_i = _i + 1;
		};

	waitUntil{sleep 2; ((getpos _heli0) distance (waypointPosition _wp) < 100) or (speed _heli0 < 10) or !(canMove _heli0)};

	_heli0 flyInHeight 35;

	if(!canMove _heli0) exitWith{};

	if(behaviour (units _pilot select 0)  != "CARELESS") then {systemChat "o he mad"; {doGetOut _X} forEach units _para; [_heli0] execVM "data\scripts\gokys.sqf"};

	nul = [_heli0, 1, 25,"data\scripts\gokys.sqf",30] execVM "fastRope\NORRN_fastRope_init.sqf";

			//{_x setBehaviour "combat"; _x addmagazine "EB_molotov_mag"} forEach (units _para);
			[position _alist,_para,_objPos,_alist] call BIS_EVO_Erefway;
	//adding
			_recy = [objnull,_para] execVM "data\scripts\grecycle.sqf";
	sleep 80;
	_dist = (getpos _heli0) distance (waypointPosition _wp);
	if(_dist < 300) then 
	{
		{deleteVehicle _x} forEach crew _heli0;
			_heli0 setDammage 1;
	};
};
	