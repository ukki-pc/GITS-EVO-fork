// City Setup
_mkr = (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress);
_pos = getMarkerPos _mkr;


BIS_EVO_DetectEnemy = createTrigger ["EmptyDetector", _pos];
BIS_EVO_DetectEnemy setTriggerActivation [EGG_EVO_strENEMYFACTION, "PRESENT", true];
BIS_EVO_DetectEnemy setTriggerArea [500, 500, 0, true];
BIS_EVO_DetectEnemy setTriggerTimeout [2, 2, 2, true ];

BIS_EVO_DetectFriendly = createTrigger ["EmptyDetector", _pos];
BIS_EVO_DetectFriendly setTriggerActivation [EGG_EVO_strPLAYERFACTION, "PRESENT", true];
BIS_EVO_DetectFriendly setTriggerArea [600, 600, 0, true];
BIS_EVO_DetectFriendly setTriggerTimeout [2, 2, 2, true ];

BIS_EVO_MainObjective = createMarkerLocal ["MainObj", getMarkerPos _mkr];
BIS_EVO_MainObjective setMarkerColorLocal "ColorBlack";
BIS_EVO_MainObjective setMarkerAlpha 0.2;
BIS_EVO_MainObjective setMarkerShapeLocal "ELLIPSE";
BIS_EVO_MainObjective setMarkerSizeLocal [reinforceRange, reinforceRange];

manGunner=
{
	private ["_vehicles","_units","_unit","_unit","_car","_unit","_driver"];
    _vehicles = [];
	_units = [];
	_unit = objnull;
	_car = nil;

	//Find vehicle with turret but without gunner
	{
		//Empty vehicles are always returned as civilian
		if((side _x == civilian or side _x == EGG_EVO_ENEMYFACTION) and isnull gunner _x and count (_x weaponsTurret [0]) > 0 and canMove _x) then 
		{
			_vehicles = _vehicles + [_x];
		};
		sleep BIS_EVO_GlobalSleep;
	} foreach ( nearestobjects [position BIS_EVO_DetectEnemy,["LandVehicle"],300]);

	//Pick one randomly from the found vehicles
	_car = _vehicles select (round(random(count _vehicles)))-1;
	if !(isNil "_car") then 
	{
		{
			//get soldiers from near the vehicle
			if(!isPlayer _x and side _x == EGG_EVO_ENEMYFACTION and _x isKindOf "Man" and alive _x) then 
			{
				if(count _units < 5) then 
				{
					_units = _units + [_x];
				};
			};

			sleep BIS_EVO_GlobalSleep;
		} foreach ( nearestobjects [position _car,["Man"],200]);


	if(count _units > 0) then 
	{
		//Pick on unit at randomly
		//systemChat format ["%1",_units];
		_unit = _units select round ((random(count _units)-1));
		_unit assignAsGunner _car;
		[_unit] orderGetIn true;

		_driver = driver _car;

		if(!isNil "_driver") then 
		{
			commandStop _driver;
		};

		_unit setBehaviour "CARELESS";
	//systemChat format ["Sending %1 to %2", typeof _unit, typeof _car];

		for [{_rloop=0}, {_rloop<60}, {_rloop=_rloop + 1}] do
		{
			if(_unit in _car) then {_rloop = 60};
			sleep 4;
		};
	//	systemChat  "Embarked vehicle";
		_unit setBehaviour "AWARE";
	 };
	}
	//else{systemChat "No cars found";};
};

reinforcementLoop = 
{
	//Loop that calls reinforcements
	for [{_rloop=0}, {_rloop<1}, {_rloop=_rloop}] do
	{
			//Sleep with interrupt
			for [{_slploop=0}, {_slploop<reinfdelay}, {_slploop=_slploop+1}] do
			{
				sleep 1;
				if ( !(reinforcements)) then {_slploop=reinfdelay; _rloop = 1;};
				//check every minute
				if(_slploop != 0 and _slploop mod 60 == 0) then { _hook = [] spawn manGunner};
			};
			if ( !(reinforcements)) then {_rloop=1};
			_reinf = [] execVM "data\scripts\reinforce.sqf";
	};
};

//Increases aggression level
aggressionEvaluation = 
{
	if(BIS_EVO_MissionTowns select BIS_EVO_MissionProgress in BIS_EVO_MissionVillages) then 
	{
		aggression = aggression + 5;
		if(aggression > 100 ) then {aggression = 100};
	};
	if(BIS_EVO_MissionTowns select BIS_EVO_MissionProgress in BIS_EVO_MissionBigTowns) then 
	{
		aggression = aggression + 15;
		if(aggression > 100 ) then {aggression = 100};
	};
	if(BIS_EVO_MissionTowns select BIS_EVO_MissionProgress in BIS_EVO_MilitaryObjectives) then 
	{
		aggression = aggression - 10;
		if(aggression < 0 ) then {aggression = 0};
	};
	_allPlayers = call BIS_fnc_listPlayers;
	{["jed_aggr", [_x]] call CBA_fnc_whereLocalEvent;}foreach _allPlayers;
};

_count = (count BIS_EVO_MissionTowns);

Sleep 2.0;
while {BIS_EVO_MissionProgress != -1} do
{
 	_mkr = (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress);
 	_pos = getMarkerPos _mkr;

	BIS_EVO_DetectEnemy setpos _pos;
	BIS_EVO_DetectFriendly setpos _pos;
	"MainObj" setMarkerPos _pos;
	CityClear=false;

	//Calc some enemy power
	BIS_EVO_InfantrySpawn = 24 + round (aggression*0.7);
	BIS_EVO_MechanizedSpawn = 4 + round (aggression*0.2);

	
	///NON VILLAGE ROUTINE
	if !(BIS_EVO_MissionTowns select BIS_EVO_MissionProgress in BIS_EVO_MissionVillages) then
	{
		radio1 setPos [(_pos select 0) + random(200) - random(200),(_pos select 1) + random(200) - random(200), 0];
		while{(surfaceIsWater position radio1)} do 
		{
			radio1 setPos [(_pos select 0) + random(200) - random(200),(_pos select 1) + random(200) - random(200), 0];
		};
		[_mkr,BIS_EVO_DetectEnemy,BIS_EVO_DetectFriendly,BIS_EVO_MissionProgress] call BIS_EVO_Erec;
		
		Sleep 10.0;
		//_tempProgress = BIS_EVO_MissionProgress;
	//testing reinforce - removed from sinit
	reinfdelay = round (290-(aggression^1.14));
	//reinfdelay = 60;

	reinforcements = true;
	[] spawn reinforcementLoop;
	
		for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
		{
	//adding
			if (not (alive radio1)) then 
			{
				reinforcements = false;
				if ("Man" countType list BIS_EVO_DetectEnemy <= 4) then
				{
					if ("Tank" countType list BIS_EVO_DetectEnemy  == 0) then
					{
						if("Car" countType list BIS_EVO_DetectEnemy == 0) then
						{
							if ("Land" countType list BIS_EVO_DetectFriendly > 0) then{_loop=1};
						};
					};
				};
			};
		//	if(_tempProgress!=BIS_EVO_MissionProgress)then{_loop=1};
			Sleep 4;
		};
	}
	else 
	{
		radio1 setPos _pos;
		radio1 setPos [(getpos radio1 select 0) + 200 - random(200),(getpos radio1 select 1) + 200 - random(200), 0];
		[_mkr,BIS_EVO_DetectEnemy,BIS_EVO_DetectFriendly,BIS_EVO_MissionProgress] call BIS_EVO_Erec;
		
		Sleep 10.0;
	reinfdelay = round (320-(aggression^1.14));

	reinforcements = true;
	[] spawn reinforcementLoop;

		//_tempProgress = BIS_EVO_MissionProgress;
	//testing reinforce - removed from sinit
		for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
		{
				if ("Man" countType list BIS_EVO_DetectEnemy <= 8) then
				{
					if ("Tank" countType list BIS_EVO_DetectEnemy  == 0) then
					{
						reinforcements = false;
						if("Car" countType list BIS_EVO_DetectEnemy == 0) then
						{
							if ("Land" countType list BIS_EVO_DetectFriendly > 0) then{_loop=1};
						};
					};
				};
			//if(_tempProgress!=BIS_EVO_MissionProgress)then{_loop=1}; //Interrupt and cancel
			Sleep 4;
		};
	};

	{_handle = [_x] execVM "data\scripts\makepow.sqf"} forEach list BIS_EVO_DetectEnemy; //REMOVED
	{deleteVehicle _x }  forEach alldead;
	sleep 2;
	{_x addscore 10} forEach list BIS_EVO_DetectFriendly;

	[] call aggressionEvaluation;

	BIS_EVO_conqueredTowns = BIS_EVO_conqueredTowns + [BIS_EVO_MissionTowns select BIS_EVO_MissionProgress];

	publicVariable "BIS_EVO_conqueredTowns";
	[] call updCityMarkers;
	hint "Town captured";
	BIS_EVO_MissionProgress = -1;
	//BIS_EVO_MissionProgress = BIS_EVO_MissionProgress + 1;
	publicVariable "BIS_EVO_MissionProgress";
	//player globalchat format ["BIS_EVO_MissionProgress: %1",BIS_EVO_MissionProgress]; 
};
