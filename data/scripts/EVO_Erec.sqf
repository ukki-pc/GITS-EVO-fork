BIS_EVO_Erec =
{
	_placetag = _this select 0;
	_list = _this select 1;
	_disable = _this select 2;
	_towncount = _this select 3;
	_inf = 0; 
	_mec = 0; 
	_stat = 0; 
	_statAA = 0;
	_radio = objNull; 
	_inf = round(BIS_EVO_InfantrySpawn);
	_mec = round(BIS_EVO_MechanizedSpawn);
	_statAA = ceil((BIS_EVO_MechanizedSpawn)/2);
	_stat = ceil((BIS_EVO_MechanizedSpawn)/3);
	_radio = radio1;
	_newunits = [];
	_rds = [];
	_type = ""; 
	_offobj = objNull;
	_taginf = "INF";
	_tagmec = "MEC";
	_c4 = [_radio] execVM "data\scripts\c4only.sqf";
	_rtobj = [_radio] execVM "data\scripts\rtobj.sqf";
	_pos = position _list;

	defenceReady = false;
	private ["_rng","_allvec"]; 

		_pos1 = [(_pos select 0)+random(300),(_pos select 1),(_pos select 2)];
		_pos2 = [(_pos select 0),(_pos select 1)+random(300),(_pos select 2)];
		_pos3 = [(_pos select 0)-random(300),(_pos select 1),(_pos select 2)];
		_pos4 = [(_pos select 0),(_pos select 1)-random(300),(_pos select 2)];

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

	_outpoints = [_pos1,_pos2,_pos3,_pos4];	
	systemChat format ["Creating defense with %1: inf, %2: mec, %3: aastat, %4: stat", _inf,_mec,_statAA,_stat];

	//Officer
	_type = EGG_EVO_meofficer select 0;
	_offobj = createVehicle [_type, _pos, [], 300, "NONE"];Sleep BIS_EVO_GlobalSleep;
	_offobj addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];
	_offobj setVehicleInit "Ocap = [this] execVM 'data\scripts\submit.sqf'";
	_pobj = [_offobj] execVM "data\scripts\objoff.sqf";
	processInitCommands;

	// MANPAD ANTI-AIR defence
	_MakeAA =
	{
		Sleep 0.6;
		_respawnpoint = _outpoints select _curpoint;
		
		_allvecs = [];
		//Increasing aggression
		_rng = round(random(100+aggression));

		if(_rng < 100) then 
		 {
		 	_allvecs = EGG_EVO_spAAeasy; //mixed units reinforce
		 };
	 	if(_rng >= 100) then 
		 {
		 	_allvecs = EGG_EVO_spAAhard; //mixed units reinforce
		};
		
		_max = (count _allvecs)-1;
		_vcl = createVehicle [(_allvecs select (round random _max)), _respawnpoint, [], 120, "NONE"];
		_vcl setdir random 359;	
		_grp = createGroup (EGG_EVO_ENEMYFACTION);
		_type = EGG_EVO_enemy1 select 0;
		_unit1 = _grp createUnit [_type, _respawnpoint, [], 0, "FORM"];Sleep BIS_EVO_GlobalSleep;
		_unit2 = _grp createUnit [_type, _respawnpoint, [], 0, "FORM"];Sleep BIS_EVO_GlobalSleep;
		_unit3 = _grp createUnit [_type, _respawnpoint, [], 0, "FORM"];Sleep BIS_EVO_GlobalSleep;
		[_unit1,_unit2,_unit3] join _grp;
		{_x setSkill skillfactor+(random 0.4);_x addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}]} forEach (units _grp);
		_vcl addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];
		sleep 0.6;
		_unit1 moveInCommander _vcl;
		_unit2 moveInGunner _vcl;
		_unit3 moveInDriver _vcl;
		[_vcl] call BIS_EVO_Lock;
		_unattended = [_vcl] spawn {[_this select 0] call BIS_EVO_idelSVEC};
		
		[_vcl] execVM "data\scripts\EVO_VecRAA.sqf";
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
		_curpoint =_curpoint+1;
	};
	_curpoint = 0;
	_AA=4;
	while {_AA > 0} do 
	{
		[] call _MakeAA;
		_AA=_AA-1;
		sleep 0.6;
	};

// Spawn Mechanised units
	while {_mec > 0} do 
	{
		_allvec = EGG_EVO_MechEasy;
		//Increasing aggression
		_rng = round(random(100+aggression));

		 if(_rng < 60) then 
		 {
		 	_allvec = EGG_EVO_MechEasy; //mixed units reinforce
		 };
		if(_rng < 80) then 
		 {
		 	_allvec = EGG_EVO_MechEasy + EGG_EVO_MechMedium; //mixed units reinforce
		 };
	 	if(_rng >= 100) then 
		 {
		 	_allvec = EGG_EVO_MechMedium + EGG_EVO_MechHard; //mixed units reinforce
		};
		
		_max = (count _allvec)-1;
		_array = [_allvec select (round random _max),_pos,(EGG_EVO_ENEMYFACTION),300,180,0] call BIS_EVO_CreateVehicle;
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
			_wp = _grp addWaypoint [(_outpoints select 0), 0];
			_wp2 = _grp addWaypoint [(_outpoints select 1), 0];
			_wp3 = _grp addWaypoint [(_outpoints select 2), 0];
			_wp4 = _grp addWaypoint [(_outpoints select 3), 0];
			[_grp, 4] setWaypointType "CYCLE";
		};		
		[_grp] call BIS_EVO_OrderSquad;
		_mec = _mec-1; //##9,8,7,6,5,4,3,2,1,0
		Sleep 0.6;
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
		{_x addEventHandler ["killed", {handle = [_this select 0,"MEC",_this select 1] execVM "data\scripts\mobjbury.sqf"}]} forEach (units _grp);
	};

// Static AA
	_i=0;
	while {_statAA > 0} do 
	{
		_allvecs = EGG_EVO_statEnemyAA;
		_max = (count _allvecs)-1;
		_array = [_allvecs select (round random _max),_pos,(EGG_EVO_ENEMYFACTION),200,180,0] call BIS_EVO_CreateVehicle;
		_grp = _array select 0;
		_vec = _array select 1;
		_vec addEventHandler ["Fired", {handle = [_this select 0] execVM "data\scripts\xtraAmmo.sqf"}];
		{_x addEventHandler  ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}]} forEach (units _grp);
		{_x setSkill skillfactor+(random 0.2);_x setDir 180} forEach (units _grp);
		{_x setBehaviour "combat"} forEach (units _grp);
		_statAA = _statAA-1; //##4,3,2,1,0
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
		Sleep 0.6;
	};

		while {_stat > 0} do 
	{
		_allvecs = EGG_EVO_statEnemy;
		_max = (count _allvecs)-1;
		_array = [_allvecs select (round random _max),_pos,(EGG_EVO_ENEMYFACTION),200,180,0] call BIS_EVO_CreateVehicle;
		_grp = _array select 0;
		_vec = _array select 1;
		{_x addEventHandler  ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}]} forEach (units _grp);
		{_x setSkill skillfactor+(random 0.2);_x setDir 180} forEach (units _grp);
		{_x setBehaviour "combat"} forEach (units _grp);
		_stat = _stat-1; //##4,3,2,1,0
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
		Sleep 0.6;
	};
	
//Radio defence
	if(_inf > 11) then
	{
		_grp = createGroup (EGG_EVO_ENEMYFACTION);
		_type = EGG_EVO_enemy2 select round (random (count EGG_EVO_enemy2-1));
		_unit = _grp createUnit [_type, position _radio, [], 10, "FORM"];Sleep BIS_EVO_GlobalSleep;
//		_unit setSkill skillfactor+(random 0.2);
		_unit addEventHandler ["killed", {handle = [_this select 0,"INF",_this select 1] execVM "data\scripts\mobjbury.sqf"}]; 
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

//Officer defence
	if(_inf > 11) then
	{
		Sleep 0.6;
		_grp = createGroup (EGG_EVO_ENEMYFACTION);
		_type = EGG_EVO_enemy3 select round (random (count EGG_EVO_enemy3-1));
		_unit = _grp createUnit [_type, position _offobj, [], 10, "FORM"];Sleep BIS_EVO_GlobalSleep;
//		_unit setSkill skillfactor+(random 0.2);
		_unit addEventHandler ["killed", {handle = [_this select 0,"INF",_this select 1] execVM "data\scripts\mobjbury.sqf"}];		
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
	//player sideChat format ["Radio defence2:%1:%2",_i,_inf];
	if(_inf > 11) then
	{
		Sleep 0.6;
		_grp = createGroup (EGG_EVO_ENEMYFACTION);
		_type = EGG_EVO_enemy2 select round (random (count EGG_EVO_enemy2-1));
		_unit = _grp createUnit [_type, position _radio, [], 10, "FORM"];Sleep BIS_EVO_GlobalSleep;
//		_unit setSkill skillfactor+(random 0.2);
		_unit addEventHandler ["killed", {handle = [_this select 0,"INF",_this select 1] execVM "data\scripts\mobjbury.sqf"}];
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

//Spawn infantry

	while {_inf > 0} do 
	{
		_grp = createGroup (EGG_EVO_ENEMYFACTION);
		_type = EGG_EVO_enemy2 select 0;
		_unit = _grp createUnit [_type, _pos, [], 300, "FORM"];Sleep BIS_EVO_GlobalSleep;
		_rds = (_unit nearRoads 50);
		if(count _rds > 0) then 
		{
			_unit setpos position (_rds select 0);
		};			
//		_unit setSkill skillfactor+(random 0.2);
		_unit addEventHandler ["killed", {handle = [_this select 0,"INF",_this select 1] execVM "data\scripts\mobjbury.sqf"}];
		_posasl = getPosASL _unit;
		if ((_posasl select 2) < 1.0) then 
		{
			_unit setpos _pos;
		};		
		if(round(random 1) == 1) then
		{
			_wp = _grp addWaypoint [_pos, 400];
			_wp2 = _grp addWaypoint [_pos, 400];
			_wp3 = _grp addWaypoint [_pos, 400];
			[_grp, 3] setWaypointType "CYCLE";
		};
		[_grp] call BIS_EVO_FillInf;
		_inf = _inf-12; //##12 //##0
		Sleep 0.1;
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
	};

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
		_unit addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];
		_unit setVehicleInit "null = [this,10,5,""Rnd"",""Sw"",0,""bin"","""",""Run""] execVM 'IED\IED_Man_v6.sqf'";
		processInitCommands;
		_ied = _ied - 1;
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
		Sleep 1;
	};
*/
//adding reinforcements loop here


};


