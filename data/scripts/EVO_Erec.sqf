#include "macros.h"

#define defaultBehaviour "aware"

BIS_EVO_Erec =
{
	_placetag = _this select 0;
	_list = _this select 1;
	_disable = _this select 2;
	_towncount = _this select 3;
	_radio = radio1;
	_flags = _this select 5;
	_inf = 0; 
	_mec = 0; 
	_stat = 0; 
	_statAA = 0;
	_newunits = [];
	_rds = [];
	_type = ""; 
	_offobj = objNull;
	_taginf = "INF";
	_tagmec = "MEC";
	_c4 = [_radio] execVM "data\scripts\c4only.sqf";
	_rtobj = [_radio] execVM "data\scripts\rtobj.sqf";
	_pos = position _list;


	//EVALUATE player strategy
	 _aggressions = [AAaggr,TANKaggr,INFaggr,MECHaggr];
	 _total = 0;
	 {_total = _total + _x}forEach _aggressions;
	 _pied = [];
	 {_pied set [_forEachIndex, (_x/_total)]}forEach _aggressions;

	// systemChat format ["Aggression is %1",aggression];
	// systemChat format ["Pie is AA:%1, TANK:%3, INF:%4, MEC:%5",_pied select 0,_pied select 1, _pied select 2, _pied select 3];

	_inf = ceil((BIS_EVO_InfantrySpawn+(BIS_EVO_InfantrySpawn*(_pied select 2)))); // 24 - 188
	_mec = ceil((BIS_EVO_MechanizedSpawn+(BIS_EVO_MechanizedSpawn*(_pied select 3)))); // 4 - 48
	_aa =  ceil((BIS_EVO_aaSpawn+(BIS_EVO_aaSpawn*(_pied select 0))));	// 2 - 24

	_statAA = ceil((_mec)/2);
	_stat = ceil((_mec)/3);

	defenceReady = false;
	private ["_rng","_allvec"]; 
		
		_pos1 = getpos (_flags select 0);
		_pos2 = getpos (_flags select 1);
		_pos3 = getpos (_flags select 2);
		_pos4 = getpos (_flags select 3);

		if(isNil "_pos1") then {_pos1 = [(_pos select 0)+random(300),(_pos select 1),(_pos select 2)]};
		if(isNil "_pos2") then {_pos2 = [(_pos select 0),(_pos select 1)+random(300),(_pos select 2)]};
		if(isNil "_pos3") then {_pos3 = [(_pos select 0)-random(300),(_pos select 1),(_pos select 2)]};
		if(isNil "_pos4") then {_pos4 = getPos radio1};
		
	//HIKI SECTION
	while {surfaceIsWater _pos1} do 
	{
		_pos1 = [(_pos select 0)+random(300),(_pos select 1),(_pos select 2)];
	};
	while {surfaceIsWater _pos2} do 
	{
		_pos2 = [(_pos select 0),(_pos select 1)+random(300),(_pos select 2)];
	};
	while {surfaceIsWater _pos3} do 
	{
		_pos3 = [(_pos select 0)-random(300),(_pos select 1),(_pos select 2)];
	};
	while {surfaceIsWater _pos4} do {
		_pos4 = [(_pos select 0),(_pos select 1)-random(300),(_pos select 2)];
	};

	outpoints = [_pos1,_pos2,_pos3,_pos4];	

	//Handle defender ships
	fnc_shipSpawn = 
	{
		//_rnd = [[8,7,4,10,10,20,18]] call weightedRandomSimple;
		_vecT = ([EGG_EVO_ENEMYSHIPS] call fnc_pickvehicle);

		_pos = getPos (currentTown);
		_shipPos =  [];
		while { !(surfaceIsWater _shipPos)} do 
		{
			_shipPos = ([_pos, 700, 1400, 0, 2, 10,0,[],_pos] call BIS_fnc_findSafePos);
			sleep 0.1;	
		};
		
		_array = [_vecT,_shipPos,(EGG_EVO_ENEMYFACTION),1,1,0] call BIS_EVO_CreateVehicle;
		_grp = _array select 0;
		_vec = _array select 1;

		{_x addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}]} forEach (units _grp);

		[_grp,_pos,_vec] spawn fnc_waterPatrol;
	};

	//DEBUG juttu Unit color text
	fnc_hikiMarker = 
	{
		_unit = _this select 0;
		_color = _this select 1;
		_text = _this select 2;

		_markerName = format ["%1",_unit];
		_bunkerMarker = createMarkerLocal[_markerName,getPos _unit];
		_bunkerMarker setMarkerColorLocal _color;
		_bunkerMarker setMarkerTypeLocal "Dot";
		_bunkerMarker setMarkerTextLocal format ["%1",_text];
	};

	systemChat format ["Creating defense with %1: inf, %2: mec, %3: aa, %4: stataa, %5: stat", _inf,_mec,_aa,_statAA,_stat];

	
	//Ship defence
	if(currentTown in BIS_EVO_CoastalTowns) then 
	{
		_ships = (1+(aggression/10)) max 1 min 5;
		for "_i" from 0 to _ships do 
		{
			[] spawn fnc_shipSpawn;
			sleep 0.3;
		};
	};

	//Officer
	_type = EGG_EVO_meofficer select 0;
	_offGrp = createGroup (civilian);
	_offPos = [_pos, 1, 300,1,0,0.4,0,[],_pos] call BIS_fnc_findSafePos;
	_offobj = createVehicle [_type, _offPos, [], 1, "NONE"];Sleep BIS_EVO_GlobalSleep;
	[_offobj] join _offGrp;
	_offobj addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}];
	_offobj setVehicleInit "Ocap = [this] execVM 'data\scripts\submit.sqf'";
	_pobj = [_offobj] execVM "data\scripts\objoff.sqf";
	processInitCommands;

	//SPAA SPAWNS at 100 meter radius from flag
	_MakeAA =
	{
		Sleep 0.6;
		_respawnpoint = outpoints select curpoint;
		
		_allvecs = [];
		//Increasing aggression
		_rng = round(random(100+aggression));

		if(_rng < easyTreshold) then 
		 {
		 	_allvecs = EGG_EVO_spAAeasy; //mixed units reinforce
		 };
		if(_rng >= easyTreshold and _rng < hardTreshold) then 
		{
		 	_allvecs = EGG_EVO_spAAmedium; //mixed units reinforce
		};
	 	if(_rng >= hardTreshold) then 
		 {
		 	_allvecs = EGG_EVO_spAAhard; //mixed units reinforce
		};
		
		_vectype = [_allvecs] call fnc_pickvehicle;
		_respawnpoint = [_respawnpoint, 1, 400,1,0,0.4,0,[],_respawnpoint] call BIS_fnc_findSafePos;
	//	_vcl setdir round(random (360));
		_array = [_vectype,_respawnpoint,(EGG_EVO_ENEMYFACTION),0,random(360),0] call BIS_EVO_CreateVehicle;
		_grp = _array select 0;
		_vcl = _array select 1;
		[_vcl,"ColorRed","AA"] call fnc_hikiMarker;
		{_x setSkill skillfactor+(random 0.4);_x addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}]} forEach (units _grp);

		[_vcl] call BIS_EVO_Lock;
		
		_unattended = [_vcl] spawn {[_this select 0] call BIS_EVO_idelSVEC};
		
		[_vcl] execVM "data\scripts\EVO_VecRAA.sqf";
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
		curpoint =curpoint+1;
	};
	curpoint = 0;
	
	while {_AA > 0} do 
	{
		[] call _MakeAA;
		_AA=_AA-1;
		sleep 0.6;
	};

// Spawn Mechanised units
	while {_mec > 0} do 
	{
		_allvec = [];
		_vecT = "";
		//Increasing aggression
		_rng = round(random(100+aggression));


		_allvec = EGG_EVO_MechEasy; //mixed units reinforce

		if(_rng >= easyTreshold and _rng < hardTreshold) then 
		{
		 	_allvec = EGG_EVO_MechMedium; //mixed units reinforce
		};
	 	if(_rng >= hardTreshold) then 
		{
		 	_allvec = EGG_EVO_MechHard; //mixed units reinforce
		};

		_array = [([_allvec] call fnc_pickvehicle),_pos,(EGG_EVO_ENEMYFACTION),300,180,0] call BIS_EVO_CreateVehicle;
		_grp = _array select 0;
		_vec = _array select 1;
		_rds = (_vec nearRoads 20);
		if(not Isnull (_rds select 0)) then
		{
			_vec setpos position (_rds select 0);
			_vec setdir (getdir (_rds select 0));
		}
		else
		{
			_vec setdir 180;
		};
		if(round(random 1) == 1) then
		{	
			_wp = _grp addWaypoint [(outpoints select 0), 0];
			_wp2 = _grp addWaypoint [(outpoints select 1), 0];
			_wp3 = _grp addWaypoint [(outpoints select 2), 0];
			_wp4 = _grp addWaypoint [(outpoints select 3), 0];
			[_grp, 4] setWaypointType "CYCLE";
		};		

		[_grp] call BIS_EVO_OrderSquad;
		_mec = _mec-1; //##9,8,7,6,5,4,3,2,1,0
		Sleep 0.6;
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
		{_x addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}]} forEach (units _grp);
	};

	if(true) then 
	{
		//CREATE S-300
		_posi = [_pos, 1, 1000,1,0,0.4,0,[],_pos] call BIS_fnc_findSafePos;
		_array = ["pook_30N6E_RU",_posi,(EGG_EVO_ENEMYFACTION),0,180,0] call BIS_EVO_CreateVehicle;
		_grp = _array select 0;
		_vec = _array select 1;
		{_x addEventHandler  ["killed", {[_this select 0,_this select 1] spawn mobjBury}]} forEach (units _grp);
		{_x setSkill skillfactor+(random 0.2);_x setDir 180} forEach (units _grp);
		{_x setBehaviour defaultBehaviour} forEach (units _grp);
//		_statAA = _statAA-1; //##4,3,2,1,0
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
		_vec setFuel 0;
		_sumark = [_vec,"RADAR",enemyMarkerColor,"plp_icon_sam",false,0.7] execVM "data\scripts\customMarker.sqf";
		[_vec] execVM "data\scripts\radar.sqf";
		Sleep 0.6;
	};

	if(true) then 
	{

		//CREATE S-300
		_posi = [_pos, 1, 1000,1,0,0.4,0,[],_pos] call BIS_fnc_findSafePos;
		_array = ["pook_SA20_static_RU",_posi,(EGG_EVO_ENEMYFACTION),0,180,0] call BIS_EVO_CreateVehicle;
		_grp = _array select 0;
		_vec = _array select 1;
		{_x addEventHandler  ["killed", {[_this select 0,_this select 1] spawn mobjBury}]} forEach (units _grp);
		{_x setSkill skillfactor+(random 0.2);_x setDir 180} forEach (units _grp);
		{_x setBehaviour defaultBehaviour} forEach (units _grp);
//		_statAA = _statAA-1; //##4,3,2,1,0
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
		_sumark = [_vec,"",enemyMarkerColor,"plp_icon_sam",false,0.7] execVM "data\scripts\customMarker.sqf";
		[_vec,objNull,5000,3] spawn enhanchedAA;
		Sleep 0.6;
	};

// Static AA
	_i=0;
	while {_statAA > 0} do 
	{
		_stattype = [EGG_EVO_statEnemyAA] call fnc_pickvehicle;
		_posi = [_pos, 1, 300,1,0,0.4,0,[],_pos] call BIS_fnc_findSafePos;
		_array = [_stattype,_posi,(EGG_EVO_ENEMYFACTION),0,180,0] call BIS_EVO_CreateVehicle;
		_grp = _array select 0;
		_vec = _array select 1;
		{_x addEventHandler  ["killed", {[_this select 0,_this select 1] spawn mobjBury}]} forEach (units _grp);
		{_x setSkill skillfactor+(random 0.2);_x setDir 180} forEach (units _grp);
		{_x setBehaviour defaultBehaviour} forEach (units _grp);
		_statAA = _statAA-1; //##4,3,2,1,0
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
		Sleep 0.6;
	};

		while {_stat > 0} do 
	{
		_stattype = [EGG_EVO_statEnemy] call fnc_pickvehicle;
		_posi = [_pos, 1, 300,1,0,0.4,0,[],_pos] call BIS_fnc_findSafePos;
		_array = [_stattype,_posi,(EGG_EVO_ENEMYFACTION),0,180,0] call BIS_EVO_CreateVehicle;
		_grp = _array select 0;
		_vec = _array select 1;
		{_x addEventHandler  ["killed", {[_this select 0,_this select 1] spawn mobjBury}]} forEach (units _grp);
		{_x setSkill skillfactor+(random 0.2);_x setDir 180} forEach (units _grp);
		{_x setBehaviour defaultBehaviour} forEach (units _grp);
		_stat = _stat-1; //##4,3,2,1,0

		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
		Sleep 0.6;
	};
	
//Radio defence
	if(_inf > 11) then
	{
		_grp = createGroup (EGG_EVO_ENEMYFACTION);
		_type = [enemyAll] call fnc_pickvehicle;
		_unit = _grp createUnit [_type, position _radio, [], 10, "FORM"];Sleep BIS_EVO_GlobalSleep;
//		_unit setSkill skillfactor+(random 0.2);
		_unit addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}]; 
		_wp = _grp addWaypoint [position _radio, 0];
		_wp2 = _grp addWaypoint [position _radio, 50];
		_wp3 = _grp addWaypoint [position _radio, 50];
		_wp4 = _grp addWaypoint [position _radio, 50];
		_wp5 = _grp addWaypoint [position _radio, 50];

		[_grp, 5] setWaypointType "CYCLE";
		[_grp] call BIS_EVO_FillInf;
		_inf=_inf-12;
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
	};
/*
//Officer defence
	if(_inf > 11) then
	{
		Sleep 0.6;
		_grp = createGroup (EGG_EVO_ENEMYFACTION);
		_type = [enemyAll] call fnc_pickRandom;
		_unit = _grp createUnit [_type, position _offobj, [], 10, "FORM"];Sleep BIS_EVO_GlobalSleep;
//		_unit setSkill skillfactor+(random 0.2);
		_unit addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\mobjbury.sqf"}];		
		_wp = _grp addWaypoint [position _offobj, 100];
		_wp2 = _grp addWaypoint [position _offobj, 100];
		_wp3 = _grp addWaypoint [position _offobj, 100];
		_wp4 = _grp addWaypoint [position _offobj, 100];
		_wp5 = _grp addWaypoint [position _offobj, 100];
		[_grp, 5] setWaypointType "CYCLE";
		[_grp] call BIS_EVO_FillInf;
		_inf=_inf-12;
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
	};

	//Radio defence2
	player sideChat format ["Radio defence2:%1:%2",_i,_inf];
	if(_inf > 11) then
	{
		Sleep 0.6;
		_grp = createGroup (EGG_EVO_ENEMYFACTION);
		_type = [enemyAll] call fnc_pickRandom;
		_unit = _grp createUnit [_type, position _radio, [], 10, "FORM"];Sleep BIS_EVO_GlobalSleep;
//		_unit setSkill skillfactor+(random 0.2);
		_unit addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\mobjbury.sqf"}];
		_wp = _grp addWaypoint [position _radio, 0];
		_wp2 = _grp addWaypoint [position _radio, 100];
		_wp3 = _grp addWaypoint [position _radio, 100];
		_wp4 = _grp addWaypoint [position _radio, 100];
		_wp5 = _grp addWaypoint [position _radio, 100];
		[_grp, 5] setWaypointType "CYCLE";
		[_grp] call BIS_EVO_FillInf;
		_inf=_inf-12;
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
	};
*/
//Spawn infantry

	while {_inf > 0} do 
	{
		_grp = createGroup (EGG_EVO_ENEMYFACTION);
		_type = [enemyOfficers] call fnc_pickvehicle;
		_unit = _grp createUnit [_type, _pos, [], 300, "FORM"];
		Sleep BIS_EVO_GlobalSleep;
		_rds = (_unit nearRoads 50);

		if(count _rds > 0) then 
		{
			_unit setpos position (_rds select 0);
		};			
//		_unit setSkill skillfactor+(random 0.2);
		_unit addEventHandler ["killed", {[_this select 0,_this select 1] spawn mobjBury}];
		_posasl = getPosASL _unit;
		
		if ((_posasl select 2) < 1.0) then 
		{
			_unit setpos _pos;
		};		
		if(round(random 1) == 1) then
		{
			_wp = _grp addWaypoint [outpoints select 0, 10];
			_wp2 = _grp addWaypoint [outpoints select 1, 10];
			_wp3 = _grp addWaypoint [outpoints select 2, 10];
			_wp4 = _grp addWaypoint [outpoints select 3, 10];
			[_grp, 4] setWaypointType "CYCLE";
		};
		[_grp] call BIS_EVO_FillInf;
		_inf = _inf-12; //##12 //##0
		Sleep 0.1;
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
	};

	_pads = (getpos currentTown nearObjects ["HeliH",500]);
	{
		if([80/(_forEachindex+1)] call chance) then {[getPos _x, direction _x, 1] spawn spawn_defenderHelis};
	}forEach _pads;

	_epads = (getpos currentTown nearObjects ["HeliHEmpty",500]);
	{
		
		_plane = createVehicle [([EGG_EVO_paradropPlanes]call fnc_pickvehicle), getPos _x, [], 0, "NONE"];
		_plane setDir (getDir _x);
	}forEach _epads;


systemChat "All created";
defenceReady = true;


/*
_ied = round(random BLA_EVO_IED);
//adding IED nutters
while {_ied > 0} do
	{
	      _pos = [((position _radio) select 0) +(random 250), ((position _radio) select 1) + (random 250), (position _radio) select 2];
	     _allciv = EGG_EVO_civ1;
     		_grp = createGroup (east);
	     _max = (count _allciv)-1;
     		_type = EGG_EVO_civ1 select (round(random _max));
		_unit = _grp createUnit [_type, _pos, [], 0, "NONE"];Sleep BIS_EVO_GlobalSleep;
		_unit addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\mobjbury.sqf"}];
		_unit setVehicleInit "null = [this,10,5,""Rnd"",""Sw"",0,""bin"","""",""Run""] execVM 'IED\IED_Man_v6.sqf'";
		processInitCommands;
		_ied = _ied - 1;
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
		Sleep 1;
	};
*/
//adding reinforcements loop here
};


