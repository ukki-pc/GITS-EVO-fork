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


_count = (count BIS_EVO_MissionTowns);

Sleep 2.0;
while {BIS_EVO_MissionProgress != -1} do
{
 	_mkr = (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress);
 	_pos = getMarkerPos _mkr;

	BIS_EVO_DetectEnemy setpos _pos;
	BIS_EVO_DetectFriendly setpos _pos;
	"MainObj" setMarkerPos _pos;

	
	Sleep 2.0;
//adding
	CityClear=false;

	//radio1 setVehiclePosition [(getMarkerPos[_mkr,true]), [], 200, "NONE"];
	radio1 setPos _pos;
	radio1 setPos [(getpos radio1 select 0) + 200 - random(200),(getpos radio1 select 1) + 200 - random(200), 0];


	//player setVehiclePosition [[1000,2000], ["Pos1","Pos2","Pos3"], 0, "CAN_COLLIDE"];

	_nradio = radio1;


	[_mkr,BIS_EVO_DetectEnemy,BIS_EVO_DetectFriendly,BIS_EVO_MissionProgress] call BIS_EVO_Erec;
	
	Sleep 10.0;
	_tempProgress = BIS_EVO_MissionProgress;
//testing reinforce - removed from sinit
	for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
	{
//adding
		if (not (alive _nradio)) then 
		{
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
		if(_tempProgress!=BIS_EVO_MissionProgress)then{_loop=1};
		Sleep 4;
	};
	{_handle = [_x] execVM "data\scripts\makepow.sqf"} forEach list BIS_EVO_DetectEnemy; //REMOVED
	{deleteVehicle _x }  forEach alldead;
	sleep 2;
	{_x addscore 10} forEach list BIS_EVO_DetectFriendly;

	BIS_EVO_conqueredTowns = BIS_EVO_conqueredTowns + [BIS_EVO_MissionTowns select BIS_EVO_MissionProgress];
	[] call updCityMarkers;
	publicVariable "BIS_EVO_conqueredTowns";
	hint "Town captured";
	BIS_EVO_MissionProgress = -1;
	//BIS_EVO_MissionProgress = BIS_EVO_MissionProgress + 1;
	publicVariable "BIS_EVO_MissionProgress";
	//player globalchat format ["BIS_EVO_MissionProgress: %1",BIS_EVO_MissionProgress]; 
};
