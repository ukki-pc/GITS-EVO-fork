BIS_EVO_Erec =
{
	_placetag = _this select 0;
	_list = _this select 1;
	_disable = _this select 2;
	_towncount = _this select 3;
	_inf = 0; 
	_mec = 0; 
	_stat = 0; 
	_radio = objNull; 
	_inf = round(((BIS_EVO_Infantry select _towncount) select 0)/2);
	_mec = round(((BIS_EVO_Mechanized select _towncount) select 0)/2);
	_stat = round((((BIS_EVO_Mechanized select _towncount) select 0)/2)/2);
	_radio = BIS_EVO_radios select _towncount;
	_newunits = [];
	_rds = [];
	_type = ""; 
	_offobj = objNull;
	_taginf = "INF";
	_tagmec = "MEC";
	_c4 = [_radio] execVM "data\scripts\c4only.sqf";
	_rtobj = [_radio] execVM "data\scripts\rtobj.sqf";
	_pos = position _list;
	_pos1 = [(_pos select 0)+300,(_pos select 1),(_pos select 2)];
	_pos2 = [(_pos select 0),(_pos select 1)+300,(_pos select 2)];
	_pos3 = [(_pos select 0)-300,(_pos select 1),(_pos select 2)];
	_pos4 = [(_pos select 0),(_pos select 1)-300,(_pos select 2)];

	_outpoints = [_pos1,_pos2,_pos3,_pos4];	

//Officer
	_type = EGG_EVO_meofficer select 0;
	_offobj = createVehicle [_type, _pos, [], 300, "NONE"];Sleep BIS_EVO_GlobalSleep;
	_offobj addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
	_offobj setVehicleInit "Ocap = [this] execVM 'data\scripts\submit.sqf'";
	_pobj = [_offobj] execVM "data\scripts\objoff.sqf";
	processInitCommands;
	Sleep 3;

//Radio defence
	if(_inf > 11) then
	{
		_grp = createGroup (east);
		_type = EGG_EVO_east1 select 0;
		_unit = _grp createUnit [_type, position _radio, [], 10, "FORM"];Sleep BIS_EVO_GlobalSleep;
//		_unit setSkill skillfactor+(random 0.2);
		_unit addEventHandler ["killed", {handle = [_this select 0,"INF"] execVM "data\scripts\mobjbury.sqf"}];		
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
	Sleep 2;
	if(_inf > 11) then
	{
		Sleep 1;
		_grp = createGroup (east);
		_type = EGG_EVO_east1 select 0;
		_unit = _grp createUnit [_type, position _offobj, [], 10, "FORM"];Sleep BIS_EVO_GlobalSleep;
//		_unit setSkill skillfactor+(random 0.2);
		_unit addEventHandler ["killed", {handle = [_this select 0,"INF"] execVM "data\scripts\mobjbury.sqf"}];		
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
		Sleep 1;
		_grp = createGroup (east);
		_type = EGG_EVO_east1 select 0;
		_unit = _grp createUnit [_type, position _radio, [], 10, "FORM"];Sleep BIS_EVO_GlobalSleep;
//		_unit setSkill skillfactor+(random 0.2);
		_unit addEventHandler ["killed", {handle = [_this select 0,"INF"] execVM "data\scripts\mobjbury.sqf"}];
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
	Sleep 2;
	while {_inf > 0} do 
	{
		_grp = createGroup (east);
		_type = EGG_EVO_east1 select 0;
		_unit = _grp createUnit [_type, _pos, [], 300, "FORM"];Sleep BIS_EVO_GlobalSleep;
		_rds = (_unit nearRoads 50);
		if(count _rds > 0) then 
		{
			_unit setpos position (_rds select 0);
		};			
//		_unit setSkill skillfactor+(random 0.2);
		_unit addEventHandler ["killed", {handle = [_this select 0,"INF"] execVM "data\scripts\mobjbury.sqf"}];
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

// Spawn Mechanised units
	Sleep 2;
	while {_mec > 0} do 
	{
		_allvecs = EGG_EVO_eastveh7;
		_max = (count _allvecs)-1;
		_array = [_allvecs select (round random _max),_pos,(east),300,180,0] call BIS_EVO_CreateVehicle;
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
		Sleep 1;
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
		{_x addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}]} forEach (crew _vec);
		{_x addEventHandler ["killed", {handle = [_this select 0,"MEC"] execVM "data\scripts\mobjbury.sqf"}]} forEach (units _grp);
	};

// Static Guns
	_i=0;
	while {_stat > 0} do 
	{
//added mortar etc
		_allvecs = EGG_EVO_eastveh13;
		_max = (count _allvecs)-1;
		_array = [_allvecs select (round random _max),_pos,(east),200,180,0] call BIS_EVO_CreateVehicle;
		_grp = _array select 0;
		{_x addEventHandler  ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}]} forEach (units _grp);
		{_x setSkill skillfactor+(random 0.2);_x setDir 180} forEach (units _grp);
		{_x setBehaviour "combat"} forEach (units _grp);
		_stat = _stat-1; //##4,3,2,1,0
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
		Sleep 1;
	};

// ANTI-AIR defence
	Sleep 1;
	_MakeAA =
	{
		Sleep 1;
		_respawnpoint = _outpoints select _curpoint;
		_allvecs = EGG_EVO_eastveh11;
		_max = (count _allvecs)-1;
		_vcl = createVehicle [(_allvecs select (round random _max)), _respawnpoint, [], 120, "NONE"];
		_vcl setdir random 359;	
		_grp = createGroup (east);
		_type = EGG_EVO_east1 select 0;
		_unit1 = _grp createUnit [_type, _respawnpoint, [], 0, "FORM"];Sleep BIS_EVO_GlobalSleep;
		_unit2 = _grp createUnit [_type, _respawnpoint, [], 0, "FORM"];Sleep BIS_EVO_GlobalSleep;
		_unit3 = _grp createUnit [_type, _respawnpoint, [], 0, "FORM"];Sleep BIS_EVO_GlobalSleep;
		[_unit1,_unit2,_unit3] join _grp;
		{_x setSkill skillfactor+(random 0.4);_x addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}]} forEach (units _grp);
		_vcl addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
		sleep 1.0;
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
		sleep 1;
	};

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
		_unit addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
		_unit setVehicleInit "null = [this,10,5,""Rnd"",""Sw"",0,""bin"","""",""Run""] execVM 'IED\IED_Man_v6.sqf'";
		processInitCommands;
		_ied = _ied - 1;
		_recy = [objnull,_grp] execVM "data\scripts\grecycle.sqf";
		Sleep 1;
	};
*/

//adding reinforcements loop here
	for [{_rloop=0}, {_rloop<1}, {_rloop=_rloop}] do
	{
		_reinf = [] execVM "data\scripts\reinforce.sqf";
		sleep reinfdelay;
		//sleep 120+(random 120);
		if (not (alive _radio)) then {_rloop=1};
	};

};


