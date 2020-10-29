Private["_roaddir","_playerdir","_pos1","_spawn","_pos1","_xy","_dirdif","_degrees","_cardir","_tmproad","_road","_road1","_road2","_CivCarCount","_CivCount","_direction"];

_Civs = [];
_CivCars = [];
_allRoads = [];

_Civs = EGG_EVO_allciv;
_CivCars = EGG_EVO_civall;
//added
_CivCount = (count _Civs) -1;
_CivCarCount = (count _Civcars) -1;

_MinSpawnDistance = 50;// Any players in this range will stop the unit spawning.
_MaxRoadSegements = 20; // How meny road segments to check for paths and spawn positions both ahead and behind the player.
_Maxspawn = 2;		// At any one time there can only be this amount of civ cars for this player.
_MinTime = 300; 			// minimum time to wait between traffic car spawns
_Rndspawntime = 4;          // The random amount of time between spawns which is added to the minimum.
_Side = "WEST";               // The side the units spawn for.

_EVO_CreateVehicle =
{
//function uses this 
//_array = [_carType,_spawn,(civilian),0,_cardir,_speed]
	_indx = _this select 0;
	_pos = _this select 1;
	_side = _this select 2;
	_radi = _this select 3;
	_dir = _this select 4;
	_vel = _this select 5;
	_grp = creategroup _side;
	_returnarray = [];
//	_type = (_CivCars select _indx) select 0;
	_type = _CivCars select _indx;
	_vec = createVehicle [_type, _pos, [], _radi, "NONE"];
	debuglog format["********************************************** Created Vehicle : Type = %1",_type];
	_vec setDir _dir;
	_vec engineOn true;	
	_vec setVelocity [(sin _dir*_vel),(cos _dir*_vel),0];
	Sleep BIS_EVO_GlobalSleep;
	[_vec] call BIS_EVO_Lock;

	_crewarray = [];
//	_crewarray = (_CivCars select _indx) select 1;
//	_crewarray = _Civs select round random _Civcount;//blazes
//	debuglog format["1:%1",_crewarray];//blazes
//	_crewarray = (_crewarray select 0);
//	debuglog format["2:%1",_crewarray];
//	_crewcount = (count _crewarray)-1;//blazes
//	_crewtype = _crewarray select (round random _crewcount);//blazes
	_crewtype =	_Civs select round random _Civcount;//blazes
	debuglog format["3:%1",_crewtype];
	if((_vec emptyPositions "driver") > 0) then 
	{
		_unit = _grp createUnit [_crewtype, _pos, [], 0, "NONE"];
		debuglog format["********************************************** Created Crew : Type = %1",_crewtype];
		_unit moveinDriver _vec;
	};		
	Sleep BIS_EVO_GlobalSleep;
	_vec addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
	_unattended = [_vec] spawn {[_this select 0] call BIS_EVO_idelSVEC};
	_returnarray = [_grp,_vec];
	_returnarray
};


 BIS_EVO_Navagate =
{
	_Proad = _this select 0;
	_ConnectRoads = 
	{
		_roadseg = _this select 0;
		_tmproad = roadsConnectedTo _roadseg;
		_tmpint = 0;
		_tmproad=_tmproad-_allRoads;
		_c = count _tmproad;	
		if(_c > 1) then {_tmpint = (round random (_c-1));_roadseg = (_tmproad select _tmpint)};
		if(_c == 1) then {_roadseg = (_tmproad select 0)};
		_allRoads = _allRoads+[_roadseg];
		_roadseg;
	};
	
	_tmproad = (roadsConnectedTo _Proad);
	_road1 =  _tmproad select 0;
	// DeadEnd
	if(count _tmproad == 1) then {_road2 = _Proad};
	//Two Way
	if(count _tmproad == 2) then {_road2 = _tmproad select 1};
	//Junction
	if(count _tmproad > 2) then {_road2 = _tmproad select (round random(count _tmproad-1))};
	
	_allRoads = [_Proad,_road1,_road2];
	_i = 0;
	while {_i < _MaxRoadSegements} do // Iterates through connecting road segments and finds the furthest from the players road segment in both directions
	{
		
		_road1 = [_road1] call _ConnectRoads;
		_road2 = [_road2] call _ConnectRoads;
		Sleep 0.03;
		_i = _i+1;
	};
	_newroads = [_road1,_road2];
	_newroads;
};

_GetSpawnPos =
{

	 // determines where to spawn the car and what direction depending on the players direction,speed and the civ cars spawning road segments
	 //vector to the players road segment.
	_newroads = [_road] call  BIS_EVO_Navagate;
	_driveaway = false;
	_road1 = _newroads select 0;
	_road2 = _newroads select 1;
	_roaddir = getdir _road;
	_roadpos = getpos _road;
	_playerdir = getdir vehicle player;
	_withroaddir = (_roaddir-_playerdir < 89) and (_roaddir-_playerdir > -89);
	_speed =  (speed vehicle player);
	_dirUp = {_direction = "UP";_spawn = position _road2;_cardir = direction _road2;_pos1 = position _road1};
	_dirDn = {_direction = "DOWN";_spawn = position _road1;_cardir = direction _road1;_pos1 = position _road2};
	_checkSpawn = 
	{
		_LegalSpawn = true;
		{if((getpos (vehicle _x) distance _spawn < 200) and isPlayer _x) then {_LegalSpawn = false}} forEach allunits;
		_LegalSpawn
	};
	if(_speed > 25) then // Faster then 25 , spawning ahead
	{
		if(_withroaddir) then 
		{
			[] call _dirUp;
			_LegalSpawn = [] call _checkSpawn;
			if(_LegalSpawn) then 
			{
				if((round random 1) ==0) then // 50% chance the vehicle will be driving away from the player
				{
					_newroads = [_road2] call  BIS_EVO_Navagate;
					_road1 = _newroads select 0;
					_road2 = _newroads select 1;
					if(_road1 distance _road > _road2 distance _road) then {_pos1 = position _road1}else{_pos1 = position _road2};
					_driveaway = true;
				};
			}
			else
			{
			_road1 = objNull;_road2 = objNull;
			};
		}
		else
		{
			[] call _dirDn;
			_LegalSpawn = [] call _checkSpawn;
			if(_LegalSpawn) then 
			{			
				if((round random 1) ==0) then // 50% chance the vehicle will be driving away from the player
				{
					_newroads = [_road1] call  BIS_EVO_Navagate;
					_road1 = _newroads select 0;
					_road2 = _newroads select 1;
					if(_road1 distance _road > _road2 distance _road) then {_pos1 = position _road1}else{_pos1 = position _road2};
					_driveaway = true;
				};	
			}
			else
			{
				_road1 = objNull;_road2 = objNull;
			};
		};
	}
	else// Slower then 25 , spawning eachway
	{		
		if((round random 1) ==0) then 
		{
			[] call _dirDn;
			_LegalSpawn = [] call _checkSpawn;
			if(!_LegalSpawn) then 
			{
				[] call _dirUp;
				_LegalSpawn = [] call _checkSpawn;
				if(!_LegalSpawn) exitWith {_road1 = objNull;_road2 = objNull};
			}		
		}
		else
		{
			[] call _dirUp;
			_LegalSpawn = [] call _checkSpawn;
			if(!_LegalSpawn) then 
			{
				[] call _dirDn;
				_LegalSpawn = [] call _checkSpawn;
				if(!_LegalSpawn) exitWith {_road1 = objNull;_road2 = objNull};
			}
		};
	};
	_degrees = [_spawn,_roadpos] call BIS_EVO_GetRelDir;
	_dirdif = (_cardir-_degrees); // subtracting the spawned cars direction from the vector to player 
	_oldcardir = _cardir;
	_switch = false;
	// if the angle difference between vector to player and current civ car vector is to large it will flip 180 to correct
	if((_dirdif > 89) or (_dirdif < -89)) then{_cardir=_cardir-180;_switch = true};
	if(_driveaway) then {_cardir=_cardir-180};
};

_SpawnCar =
{
	_pos = [];
	// Spawn the car
	_carType = round random _CivCarCount;
	_array = [];
	_speed = 0;
	_DeadEnd = false;           // Civ drives into dead end and gets out
	_rd1array = (roadsConnectedTo _road1);
	_rd2array = (roadsConnectedTo _road2);
	switch (_direction) do
	{
		 case "UP":
		{	
			_speed = (_rd2array select 0) distance (_rd2array select 1);
			if(count _rd1array == 1) then {_DeadEnd=true};
		};
		 case "DOWN":
		{
			_speed = (_rd1array select 0) distance (_rd1array select 1);
			if(count _rd2array == 1) then {_DeadEnd=true};
		};
	};
	_array = [_carType,_spawn,(civilian),0,_cardir,_speed] call _EVO_CreateVehicle;
	_passengers = _array select 0;
	_car = _array select 1;
	_driver = (units _passengers select 0);
	_driver doMove _pos1;
	_driver addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
	Sleep 0.1;
	// Navagation
	if(_DeadEnd)then
	{
		_wp1 = _passengers addWaypoint [_pos1, 10];Sleep 0.1;
		[_passengers,1] setWaypointType "GETOUT";
		_wp2 = _passengers addWaypoint [_pos1, 100];Sleep 0.1;
		[_passengers,2] setWaypointType "SAD";
		[_passengers, 2] setWaypointSpeed "LIMITED";Sleep 0.1;
	};
	if(_cardir >= 315 or _cardir < 45) then {_pos = [7000,13000,0]};//North
	if(_cardir >= 45 and _cardir < 135) then {_pos = [13000,7000,0]};//East
	if(_cardir >= 135 and _cardir < 225) then {_pos = [7000,3000,0]};//South
	if(_cardir >= 225 and _cardir < 315) then {_pos = [3000,7000,0]};//West
	_wp1 = _passengers addWaypoint [_pos, 100];
	Sleep 0.1;
	BIS_EVO_CivCount = BIS_EVO_CivCount+1;
	Sleep 0.1;
	_del = [_car,(leader _passengers)] spawn {[_this select 0,_this select 1,_this select 2] call BIS_EVO_Civdelete};
};	

BIS_EVO_Civdelete = 
{
	_car = _this select 0;
	_driver = _this select 1;
	_driver setBehaviour "CARELESS";
	Sleep 20; // A 20 second default lifetime.
	for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
	{
		Sleep 1.0;
		_inzone = false;
		{
			if(isPlayer _x) then 
			{
				if(getpos (vehicle _x) distance vehicle _driver < 300) then
				{
					_inzone = true;
				};
			}
		} forEach allunits;
		
		if(not _inzone) then {_loop=1};
		if(not alive _driver) then {_loop=1};
	};
	Sleep 2.0;

	_driver setpos [1000,1000,2000];
	deletevehicle _driver;
	if(count crew _car ==0) then  // car was not carjacked
	{	
		Sleep 30.0;
		deletevehicle _car;
	};
	BIS_EVO_CivCount = BIS_EVO_CivCount-1;
};

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	if(not isNull (vehicle player) and alive player) then 
	{
		_road=(((vehicle player) nearRoads 20) select 0);//players road segment
	};
	if(not isNull _road and BIS_EVO_CivCount < _maxspawn and not(vehicle player in list AirportIn) ) then 
	{
		[] call _GetSpawnPos;
		Sleep 0.1;
		_road = objNull;
		if((not isNull _road1) and (not isNull _road2)) then 
		{
			Sleep 0.1;
			[] call _SpawnCar;
			Sleep 0.1;
			_road1 = objNull;
			_road2 = objNull;
		};
	}
	else
	{
		//hint "Nullroad or maxspawn"
	};
	_pcount = 0;
	{if( isPlayer _x) then {_pcount = _pcount+1}} forEach allunits;
	_pcount = _pcount*2;
	Sleep _MinTime+_pcount+(random _Rndspawntime);
};
