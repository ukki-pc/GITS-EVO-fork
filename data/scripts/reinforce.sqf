// resupplies towns with reinforcements


private ["_allvec","_allvecs","_allvecs2","_spawn","_spawns","_radio","_alist","_tag","_type","_Allspawns","_wtime","_curtownInf","_basetownInf","_curtownMec","_basetownMec"]; 

	_spawn = [0,0,0];
	_spawns = [];
	_radio = objNull;
	_alist = objNull;
	_tag = "";
	_type = "";
	_Allspawns = [["1ref","1refa","1refb"],["2ref","2refa","2refb"],["3ref","3refa","3refb"],["4ref","4refa","4refb"],["5ref","5refa","5refb"],["6ref","6refa","6refb"],["7ref","7refa","7refb"],["8ref","8refa","8refb"],["9ref","9refa","9refb"],["10ref","10refa","10refb"],["11ref","11refa","11refb"]];
	_wtime = 0;
	_radio =radio1;
	_alist = BIS_EVO_DetectEnemy;

	_curTown = BIS_EVO_MissionTowns select BIS_EVO_MissionProgress;

	_curtownInf = round(((BIS_EVO_InfantrySpawn)/enemynumdiv));
	_basetownInf = round(((BIS_EVO_InfantryTarget))/enemynumdiv);
	_curtownMec = round(((BIS_EVO_MechanizedSpawn))/enemynumdiv);
	_basetownMec = round(((BIS_EVO_MechanizedTarget))/enemynumdiv);

	//systemChat format["CI:%1 BI:%2 CM:%3 BM:%4 ",_curtownInf,_basetownInf,_curtownMec,_basetownMec];
	sleep 1;

	BIS_EVO_mKamazOpen =
	{
		private ["_allunits","_guardr","_unit","pos2","_max","_alist","_Allspawns","_radio","_spawns","_allvecs","_maxA","_ural"]; 
		_guardr = grpNull;
		_unit = objNull;
		_pos2 = objNull;
		_max = objnull;
		_alist = BIS_EVO_DetectEnemy;

		_curTown =  BIS_EVO_MissionTowns select BIS_EVO_MissionProgress;
		_reinforceTowns = [(BIS_EVO_MissionTowns select BIS_EVO_MissionProgress) ]call fnc_get_synchronized_towns;
		_reinforceTowns = _reinforceTowns-BIS_EVO_conqueredTowns;

		if(count _reinforceTowns < 1) exitWith{};

		_objPos = position _curTown;

		_spawns = _reinforceTowns select (round (random (count _reinforceTowns-1)));
		_pos = position _spawns;
		_tag = "MEC";

		_allunits = EGG_EVO_enemy1;
		_max = count _allunits;
		_guardr = createGroup (EGG_EVO_ENEMYFACTION);
		_pos2 = position (_reinforceTowns select (round random (count _reinforceTowns-1)));
		_allvecs = EGG_EVO_mevconvoyb;
		_maxA = count _allvecs;
		_ural = createVehicle [(_allvecs select (round random (_maxA - 1))), _pos2,[], 0, "NONE"];
		[_ural] call BIS_EVO_Lock;
		_ural addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\mobjbury.sqf"}];
		Sleep 0.2;
		_unit = _guardr createUnit [(_allunits select (round random (_max - 1))), _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsDriver _ural;_unit moveInDriver _ural;
		Sleep 0.2;
		_unit = _guardr createUnit [(_allunits select round random (_max - 1)), _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsCargo _ural;_unit moveInCargo _ural;
		Sleep 0.2;
		_unit = _guardr createUnit [(_allunits select round random (_max - 1)), _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsCargo _ural;_unit moveInCargo _ural;
		Sleep 0.2;
		_unit = _guardr createUnit [(_allunits select round random (_max - 1)), _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsCargo _ural;_unit moveInCargo _ural;
		Sleep 0.2;
		_unit = _guardr createUnit [(_allunits select round random (_max - 1)), _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsCargo _ural;_unit moveInCargo _ural;
		Sleep 0.2;
		_unit = _guardr createUnit [(_allunits select round random (_max - 1)), _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsCargo _ural;_unit moveInCargo _ural;
		Sleep 0.2;
		_sumark = [_ural,"Ural","ColorRed","plp_icon_truck",false,0.8] execVM "data\scripts\customMarker.sqf";
		sleep 1;
		[position _alist,_guardr,_objPos,_alist] call BIS_EVO_Erefway;
		[_guardr, 1] setWaypointType "GETOUT";
		{_x addEventHandler ["killed", {handle = [_this select 0,_this select 1 ] execVM "data\scripts\mobjbury.sqf"}]; _x addmagazine ["EB_molotov_mag",2];} forEach (units _guardr);	
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

		_targetPos = getPos (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress);
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

		_sumark = [_vec,"Rekatti","ColorRED","plp_icon_shipFrigate"] execVM "data\scripts\customMarker.sqf";

		{_x addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\mobjbury.sqf"}]} forEach (units _grp);

		[_grp,_targetPos,_vec] spawn fnc_waterPatrol;
	};

	BIS_EVO_mKamazResupply =
	{
		private ["_Allspawns","_allobj","_wp","_alist","_radio","_unit","_guardm","_pos","_rng","_vec","_maxo","_spawns","_pos","_tag","_allvec","_rds","_cardir","_degrees","_dirdif","_array","_recy"]; 
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
		
		_curTown =  BIS_EVO_MissionTowns select BIS_EVO_MissionProgress;
		_reinforceTowns = [(BIS_EVO_MissionTowns select BIS_EVO_MissionProgress)] call fnc_get_synchronized_towns;
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
			{_x addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\mobjbury.sqf"}]} forEach (units _guardm);
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

/*
	BIS_EVO_MI17support =
	{	
		private ["pos","_unit","_vec","_heli0","_max","_maxv","_alist","_allunits2","_allvecs2","_pilot","_para","_radio","_posback","_pos1","_pos2","_sumark","_wp","_wp2","_wpx2","_i","_recy"]; 
		_pos = objNull;
		_unit = objNull;
		_vec = objNull;
		_heli0 = objnull;
		_max = objnull;
		_maxv = objnull;
		_alist = BIS_EVO_DetectEnemy;
		_allunits2 = EGG_EVO_enemy1;
		_max = count _allunits2;
		_radio = radio1;
		_curTown =  BIS_EVO_MissionTowns select BIS_EVO_MissionProgress;
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
		_heli0 addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\mobjbury.sqf"}];
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
				_unit = _para createUnit [_allunits2 select (round (random (_max - 1))), [0,0,0], [], 300, "NONE"];
				_unit setSkill skillfactor+(random 0.2);
				_unit addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\mobjbury.sqf"}];
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
*/

	BIS_EVO_rappelSupport =
	{	
		private ["pos","_unit","_vec","_heli0","_max","_maxv","_alist","_allunits2","_allvecs2","_pilot","_para","_radio","_posback","_pos1","_pos2","_sumark","_wp","_wp2","_wpx2","_i","_recy"]; 
		_pos = objNull;
		_unit = objNull;
		_vec = objNull;
		_heli0 = objnull;
		_max = objnull;
		_maxv = objnull;
		_alist = BIS_EVO_DetectEnemy;
		_allunits2 = EGG_EVO_enemy1;
		_max = count _allunits2;
		_radio = radio1;
		_curTown =  BIS_EVO_MissionTowns select BIS_EVO_MissionProgress;
		_objPos = position _curTown;
		_pos = _objPos;
		_posback = getmarkerpos "EnemyAir03";
		_pilot = createGroup (EGG_EVO_ENEMYFACTION);
		(EGG_EVO_mepilot select 0) createUnit [getmarkerpos "centerp", _pilot];Sleep BIS_EVO_GlobalSleep;
		(EGG_EVO_mepilot select 0) createUnit [getmarkerpos "centerp", _pilot];Sleep BIS_EVO_GlobalSleep;
		_pos1 = [(_pos select 0)-2000 -(random 2000),(_pos select 1)+2000 -(random 3000),(200 + random 100)];
		_pos2 = [(_pos select 0)+2000 +(random 2000),(_pos select 1)+2000 -(random 3000),(200 + random 100)];
		_allvecs2 = EGG_EVO_rappelChoppers;
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
		_heli0 addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\mobjbury.sqf"}];
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
				_unit = _para createUnit [_allunits2 select (round (random (_max - 1))), [0,0,0], [], 300, "NONE"];
				_unit setSkill skillfactor+(random 0.2);
				_unit addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\mobjbury.sqf"}];
				[_unit] join _para;
				_unit moveInCargo _heli0;
				sleep 0.7;
				_i = _i + 1;
			};

	  waitUntil{sleep 1; ((getpos _heli0) distance (waypointPosition _wp) < 100) or (speed _heli0 < 10) or !(canMove _heli0)};

	_heli0 flyInHeight 35;

    if(!canMove _heli0) exitWith{};
    nul = [_heli0, 1, 25,"data\scripts\gokys.sqf",30] execVM "fastRope\NORRN_fastRope_init.sqf";

			{_x setBehaviour "combat"; _x addmagazine "EB_molotov_mag"} forEach (units _para);
			[position _alist,_para,_objPos,_alist] call BIS_EVO_Erefway;
//adding
			_recy = [objnull,_para] execVM "data\scripts\grecycle.sqf";
			// sleep 10;
			// _wpx2 = _pilot addWaypoint [_posback, 20];
			// [_pilot, 2] setWaypointType "MOVE";
			// (driver _heli0) commandMove _posback;
			// (driver _heli0) doMove _posback;

    sleep 80;


    _dist = (getpos _heli0) distance (waypointPosition _wp);

    if(_dist < 300) then 
    {
		{deleteVehicle _x} forEach crew _heli0;
		deleteVehicle _heli0;
	};
};
	
	EGG_EVO_mecreinf = 
	{
		#define easyTreshold 100
		#define	hardTreshold 150
		private ["_Allspawns","_allobj","_alist","_radio","_unit","_guardm","_pos","_rng","_vec","_maxo","_spawns","_pos","_tag","_allvec","_rds","_cardir","_degrees","_dirdif","_array","_recy"]; 
		_alist = BIS_EVO_DetectEnemy;
		_curTown =  BIS_EVO_MissionTowns select BIS_EVO_MissionProgress;
		_radio = radio1;
		_objPos = position _curTown;
		_unit = objNull;
		_guardm = grpNull;
		_pos = objNull;
		_vec = objNull;
		_maxo = 0;
		_nearestMarker = "";
		_dist = 0;
		

		_reinforceTowns = [(BIS_EVO_MissionTowns select BIS_EVO_MissionProgress)] call fnc_get_synchronized_towns;
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
		{_x addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\mobjbury.sqf"}]} forEach (units _guardm);
		_guardm setFormation "COLUMN";
		sleep 10;
		if(isNull driver _vec  ) then {deleteVehicle _vec; {_x setDammage 1}forEach (units _guardm)};
		//adding
		_recy = [objnull,_guardm] execVM "data\scripts\grecycle.sqf";
	};

if ( (_curtownInf <= _basetownInf) and (reinforcements) ) then 
{
	_tag = "INF";	
	[] spawn BIS_EVO_mKamazOpen;
	//if !(eResupplying) then {[] spawn BIS_EVO_mKamazResupply;};
	//No choppy choppies in villages
	if !(BIS_EVO_MissionTowns select BIS_EVO_MissionProgress in BIS_EVO_MissionVillages) then 
	{
		[] spawn BIS_EVO_rappelSupport;
//		(BIS_EVO_Infantry select BIS_EVO_MissionProgress) set [0, (_curtownInf*enemynumdiv)+6];
	};



//	(BIS_EVO_Infantry select BIS_EVO_MissionProgress) set [0, (_curtownInf*enemynumdiv)+6];
	sleep 1;
};
//	(BIS_EVO_Mechanized select BIS_EVO_MissionProgress) set [0,0];
sleep 15;

if( (_curtownMec <= _basetownMec) and (reinforcements) ) then 
{
//	systemChat "reinforcing mechanized";
	[] spawn EGG_EVO_mecreinf;
//	(BIS_EVO_Mechanized select BIS_EVO_MissionProgress) set [0, (_curtownMec*enemynumdiv)+1];
	sleep 1;

	if(([15] call chance and _curTown in BIS_EVO_CoastalTowns)) then {[] spawn BIS_EVO_SHIPSUPPORT};
};
sleep 1;
