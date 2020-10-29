// City Setup
_mkr = (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress);
_pos = getMarkerPos _mkr;
BIS_EVO_DetectEast = createTrigger ["EmptyDetector", _pos];
BIS_EVO_DetectEast setTriggerActivation ["EAST", "PRESENT", true];
BIS_EVO_DetectEast setTriggerArea [500, 500, 0, true];
BIS_EVO_DetectEast setTriggerTimeout [2, 2, 2, true ];

BIS_EVO_DetectWest = createTrigger ["EmptyDetector", _pos];
BIS_EVO_DetectWest setTriggerActivation ["WEST", "PRESENT", true];
BIS_EVO_DetectWest setTriggerArea [600, 600, 0, true];
BIS_EVO_DetectWest setTriggerTimeout [2, 2, 2, true ];
_count = (count BIS_EVO_MissionTowns);

Sleep 2.0;
while {BIS_EVO_MissionProgress < _count} do
{
 	_mkr = (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress);
 	_pos = getMarkerPos _mkr;
	
	BIS_EVO_DetectEast setpos _pos;
	BIS_EVO_DetectWest setpos _pos;
	Sleep 2.0;
//adding
	CityClear=false;
	_nradio = (BIS_EVO_radios select BIS_EVO_MissionProgress);

	[_mkr,BIS_EVO_DetectEast,BIS_EVO_DetectWest,BIS_EVO_MissionProgress] call BIS_EVO_Erec;
	
	Sleep 10.0;

//testing reinforce - removed from sinit
	for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
	{
//adding
		if (not (alive _nradio)) then 
		{
			if ("Man" countType list BIS_EVO_DetectEast <= 4) then
			{
				if ("Tank" countType list BIS_EVO_DetectEast  == 0) then
				{
					if("Car" countType list BIS_EVO_DetectEast == 0) then
					{
						if ("Land" countType list BIS_EVO_DetectWest > 0) then{_loop=1};
					};
				};
			};
		};
		Sleep 4;
	};
	{_handle = [_x] execVM "data\scripts\makepow.sqf"} forEach list BIS_EVO_DetectEast;
	{_x addscore 10} forEach list BIS_EVO_DetectWest;
	BIS_EVO_MissionProgress = BIS_EVO_MissionProgress+1;
	publicVariable "BIS_EVO_MissionProgress";
	//player globalchat format ["BIS_EVO_MissionProgress: %1",BIS_EVO_MissionProgress]; 
};
