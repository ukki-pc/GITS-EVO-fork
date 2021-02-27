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
BIS_EVO_MainObjective setMarkerShapeLocal "ELLIPSE";
BIS_EVO_MainObjective setMarkerSizeLocal [500, 500];

reinforcementLoop = 
{
	//Loop that calls reinforcements
	for [{_rloop=0}, {_rloop<1}, {_rloop=_rloop}] do
	{
		_reinf = [] execVM "data\scripts\reinforce.sqf";
		sleep reinfdelay;
		//sleep 120+(random 120);
		if ( !(reinforcements)) then {_rloop=1};
	};

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
	
	///NON VILLAGE ROUTINE
	if !(BIS_EVO_MissionTowns select BIS_EVO_MissionProgress in BIS_EVO_MissionVillages) then
	{
		radio1 setPos _pos;
		radio1 setPos [(getpos radio1 select 0) + 200 - random(200),(getpos radio1 select 1) + 200 - random(200), 0];


		[_mkr,BIS_EVO_DetectEnemy,BIS_EVO_DetectFriendly,BIS_EVO_MissionProgress] call BIS_EVO_Erec;
		
		Sleep 10.0;
		//_tempProgress = BIS_EVO_MissionProgress;
	//testing reinforce - removed from sinit

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

	BIS_EVO_conqueredTowns = BIS_EVO_conqueredTowns + [BIS_EVO_MissionTowns select BIS_EVO_MissionProgress];
	publicVariable "BIS_EVO_conqueredTowns";
	[] call updCityMarkers;
	hint "Town captured";
	BIS_EVO_MissionProgress = -1;
	//BIS_EVO_MissionProgress = BIS_EVO_MissionProgress + 1;
	publicVariable "BIS_EVO_MissionProgress";
	//player globalchat format ["BIS_EVO_MissionProgress: %1",BIS_EVO_MissionProgress]; 
};
