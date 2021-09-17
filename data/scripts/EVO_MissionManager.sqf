missionManager =	
	{
	// City Setup
	_mkr = (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress);
	_pos = getPos _mkr;

	BIS_EVO_DetectEnemy = createTrigger ["EmptyDetector", _pos];
	BIS_EVO_DetectEnemy setTriggerActivation [EGG_EVO_strENEMYFACTION, "PRESENT", true];
	BIS_EVO_DetectEnemy setTriggerArea [500, 500, 0, true];
	BIS_EVO_DetectEnemy setTriggerTimeout [2, 2, 2, true ];

	BIS_EVO_DetectFriendly = createTrigger ["EmptyDetector", _pos];
	BIS_EVO_DetectFriendly setTriggerActivation [EGG_EVO_strPLAYERFACTION, "PRESENT", true];
	BIS_EVO_DetectFriendly setTriggerArea [600, 600, 0, true];
	BIS_EVO_DetectFriendly setTriggerTimeout [2, 2, 2, true ];

	BIS_EVO_MainObjective = createMarkerLocal ["MainObj", getPos _mkr];
	BIS_EVO_MainObjective setMarkerColorLocal "ColorBlack";
	BIS_EVO_MainObjective setMarkerAlpha 0.2;
	BIS_EVO_MainObjective setMarkerShapeLocal "ELLIPSE";
	BIS_EVO_MainObjective setMarkerSizeLocal [reinforceRange, reinforceRange];


	fnc_initFlags = 
	{
		_allbunkers = _this select 0;

		_enemyFlag = objNull;
		_playerFlag = objNull;
		
		_flags = [];

		{
			_bunkerPos = position _x;
			_playerFlag = "FlagCarrierBLUFOR_EP1";
			_enemyFlag = "FlagCarrierOPFOR_EP1";

			_playerFlagpole =  createVehicle [_playerFlag,  _bunkerPos, [], 0, "NONE"];
			_enemyFlagpole =  createVehicle [_enemyFlag, _bunkerPos, [], 0, "NONE"];
			_playerFlagpole setPos _bunkerPos;
			_enemyFlagpole setPos _bunkerPos;
			_flags set [_forEachIndex,[_enemyFlagpole,_playerFlagpole]];
		} forEach _allBunkers;
		_flags;
	};

	//Bunkers cleanup
	fnc_bunk_cleanup = 
	{
		_bunkers = _this select 0;

		//Remove markers
		{
		_markerName = format ["%1",_x];
		deleteMarker _markerName;
		} forEach _bunkers;

		//Remove bunker objects
		{deleteVehicle _x}forEach _bunkers;
	};

	//Creates marker over bunkers
	fnc_bunker_marker = 
	{
		private ["_bunker","_markerName","_mrkType","_bunkerMarker"];
		_bunker = _this select 0;
		_markerName = _this select 1;

		//Bunker marker
		_mrktype = "Strongpoint";
		_bunkerMarker = createMarker[_markerName,getpos _bunker];
		_bunkerMarker setMarkerColor "ColorRED";
		_bunkerMarker setMarkerType _mrktype;
		_controlName = allBunkerControls select (bunkers find _bunker);
		[_controlName,[0.62, 0, 0, 1]] call fnc_ctrlChangeColor;
		//_bunkerMarker setMarkerText "Bunker";
	};

	fnc_init_bunker = 
	{
		//private ["_bunkerTypes","_times","_mkr","_pos","_bunkers","_bunker","_roads","_bunkerPos"];
		_bunkerTypes = ["FlagPole_EP1"];
		_times = _this select 0;
		_existingBunkers = _this select 1;
		_mkr = (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress);
		_pos = getPos _mkr;
		_bunkers = [];
		_bunkerRadiusMax = 150;
		#define _bunkerSpread  100

		for [{_loop=0}, {_loop<_times}, {_loop=_loop+1}] do
		{

			_bunker = createVehicle [[_bunkerTypes] call fnc_pickRandom,  _pos, [], 0, "NONE"];
			_roads = [];
			_bunkerPos = [_pos, 0, _bunkerRadiusMax , 3, 0, 0.25, 0] call BIS_fnc_findSafePos;
			_roads = _bunkerpos nearRoads 10;

			_allbunkers = _bunkers + _existingBunkers;
			_nearestBunker = [];
			_distance = 0;
			_farEnough = false;


			while { count _roads > 0 or !_farEnough} do 
			{
				_bunkerPos = [_pos, 0, _bunkerRadiusMax, 3, 0, 0.25, 0] call BIS_fnc_findSafePos;
				_roads = _bunkerpos nearRoads 10;
					if(count _allbunkers > 0 ) then 
					{
						_nearestBunker = [_allbunkers,_bunkerPos] call BIS_fnc_nearestPosition;
						_distance = _bunkerPos distance _nearestBunker;
						_farEnough = (_distance > _bunkerSpread) and (!surfaceIsWater _bunkerPos);
						_bunkerRadiusMax = _bunkerRadiusMax + 1;
					}
					else {_farEnough = true}; //If no bunkers exist then there is no blacklist positions
				sleep BIS_EVO_frameDelay;
			};

			_roads = _bunkerPos nearRoads 50;
			
			//Direction setter
			if(count _roads > 0) then
			{
				_bunker setDir direction([_roads] call fnc_pickRandom);
			};
			

			_bunker setPos _bunkerPos;
			_bunkers = _bunkers + [_bunker];

			sleep 1;
		};
		_bunkers;
	};



	bunkerLoop = 
	{
	//	private ["_tickets","_cptString","_msg","_bunkerObject","_markerName","_bunkerOwner"];
		#define maxTickets 30
		#define captureRadius 30
		#define minTickets -30
		#define minHeight -7

		_bunkerObject = _this select 0;
		_flags = _this select 1;
		_markerName = format ["%1",_bunkerObject];
		[_bunkerObject,_markerName] call fnc_bunker_marker;

		_tickets = maxTickets;
		_bunkerOwner = EGG_EVO_ENEMYFACTION;
		_bunkerObject setVariable ["OWNER", _bunkerOwner];

		_flag1 = _flags select 0;
		_flag2 = _flags select 1;

		//capture state for friendly captures
		_captured = false;
		_capturingPlayers = [];


		//Loop that handles bunker
		while{ BIS_EVO_MissionProgress != -1} do
		{
			_baseTickets = _tickets;
			_capturingPlayers = [];
			//Find captors near the bunker
			{
				if(alive _x) then 
				{
					switch (side _X) do 
					{
						case EGG_EVO_PLAYERFACTION: 
						{
							_tickets = (_tickets -1) max minTickets min maxTickets;

							//Reward every 5 secs when player is capturing objective
							if(isPlayer _x) then 
							{
									_capturingPlayers = _capturingPlayers + [_x];
									//_cptString = format ["Capturing.. %1 seconds left.",_tickets];
									//titleText [_cptString, "PLAIN"];
							};
						};
						case EGG_EVO_ENEMYFACTION: 
						{
							_tickets = (_tickets +1) max minTickets min maxTickets;
						};
					};
				};
			} foreach ( nearestobjects [position _bunkerObject,["Land"],captureRadius]);

			//Reward players for capturing
			if(count _capturingPlayers > 0) then 
			{
				_ticketChange = _baseTickets - _tickets;
				_totalChange = abs(_tickets - maxTickets);
				_change = _totalChange/5;
				_roundedChange = ceil(_change);

				if(!_captured and (_change == _roundedChange) and _ticketChange > 0) then 
				{
					{
						_msg = format ["Capturing"];
						["fnc_hudMessage", [_x, _msg,20]] spawn CBA_fnc_whereLocalEvent;
						["jed_addMoney", [_x, 20]] call CBA_fnc_whereLocalEvent;
					} forEach _capturingPlayers;
				};

				if(_tickets == -maxTickets and !_captured) then 
				{
					{
						_msg = format ["Objective Capture"];
						["fnc_hudMessage", [_x, _msg,400]] spawn CBA_fnc_whereLocalEvent;
						["jed_addMoney", [_x, 400]] call CBA_fnc_whereLocalEvent;
					} forEach _capturingPlayers;
				};
			};

			if(_tickets >= 0 and _bunkerOwner == EGG_EVO_PLAYERFACTION) then 
			{
				_markerName setMarkerColor "ColorRed";
				_controlName = allBunkerControls select (bunkers find _bunkerObject);
				[_controlName,[0.62, 0, 0, 1]] call fnc_ctrlChangeColor;
				_bunkerOwner = EGG_EVO_ENEMYFACTION;
				_bunkerObject setVariable ["OWNER", _bunkerOwner];
				playsound "lostCP";
				_msg = format ["Outpost is being overrun!"];
    			["jed_SIDEmsg", [player, _msg]] call CBA_fnc_whereLocalEvent;
				_captured = false;
			};
			if(_tickets < 0 and _bunkerOwner == EGG_EVO_ENEMYFACTION) then 
			{
				_markerName setMarkerColor "ColorWhite";	
				_controlName = allBunkerControls select (bunkers find _bunkerObject);
				[_controlName,[1, 1, 1, 1]] call fnc_ctrlChangeColor;
				//_bunkerOwner = EGG_EVO_PLAYERFACTION;
				//_bunkerObject setVariable ["OWNER", _bunkerOwner];
			};
			if(_tickets == -maxTickets and !_captured) then 
			{
				_markerName setMarkerColor "ColorBlue";	
				_controlName = allBunkerControls select (bunkers find _bunkerObject);
				[_controlName,[0, 0, 0.62, 1]] call fnc_ctrlChangeColor;
				_bunkerOwner = EGG_EVO_PLAYERFACTION;
				_bunkerObject setVariable ["OWNER", _bunkerOwner];
				playsound "captureCP";
				_msg = format ["Position clear and under control!"];
				["jed_SIDEmsg", [player, _msg]] call CBA_fnc_whereLocalEvent;
				_captured = true;
			};

			//SET flags
			_zPos1 = (((abs(minHeight))*(_tickets/maxTickets))-abs(minHeight)) min 0 max minHeight;
			_zPos2 = (-((abs(minHeight))*(_tickets/maxTickets))-abs(minHeight)) min 0 max minHeight;
			_flag1 setPos [position _flag1 select 0, position _flag1 select 1,_zPos1];
			_flag2 setPos [position _flag2 select 0, position _flag2 select 1,_zPos2];
			sleep 1;
		};		
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
					if(_slploop != 0 and _slploop mod 60 == 0) then { 
						//Problem
					//	_hook = [] spawn manGunner
						};
				};
				if ( !(reinforcements)) exitWith {_rloop=1};
				_reinf = [] execVM "data\scripts\reinforce.sqf";
		};
	};

	//Increases aggression level
	changeAggression = 
	{
	private ["_curTown"];
	_curTown = BIS_EVO_MissionTowns select BIS_EVO_MissionProgress;
		if(_curTown in BIS_EVO_MissionVillages) then 
		{
			aggression = aggression + 4;
			if(aggression > 100 ) then {aggression = 100};
		};
		if(_curTown in BIS_EVO_MissionBigTowns) then 
		{
			aggression = aggression + 8;
			if(aggression > 100 ) then {aggression = 100};
		};
		if(_curTown in BIS_EVO_MilitaryObjectives) then 
		{
			aggression = aggression - 10;
			if(aggression < 0 ) then {aggression = 0};
		};
		["jed_aggr", [_x]] call CBA_fnc_whereLocalEvent;
	};

	_count = (count BIS_EVO_MissionTowns);

	Sleep 2.0;
	while {BIS_EVO_MissionProgress != -1} do
	{
		_mkr = (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress);
		_pos = getPos _mkr;

		BIS_EVO_DetectEnemy setpos _pos;
		BIS_EVO_DetectFriendly setpos _pos;
		"MainObj" setMarkerPos _pos;
		CityClear=false;

		//Calc some enemy power
		BIS_EVO_InfantrySpawn = 24 + round (aggression*0.7);
		BIS_EVO_MechanizedSpawn = 4 + round (aggression*0.2);

		radio1 setPos [(_pos select 0) + random(200) - random(200),(_pos select 1) + random(200) - random(200), 0];
		radio1 setDammage 0;

		_bunkercount = 2;

		if((BIS_EVO_MissionTowns select BIS_EVO_MissionProgress) in BIS_EVO_MissionBigTowns) then {_bunkercount = 3};


		//Count if pre set bunkers are found
		bunkers = [];
		bunkers = bunkers + [BIS_EVO_MissionTowns select BIS_EVO_MissionProgress] call fnc_get_synchronized_bunkers;

		//TODO Bunker system feed count
		if(count bunkers < _bunkerCount) then 
		{
			_newBunkers = [];
			_newBunkers = [_bunkerCount - count bunkers,bunkers] call fnc_init_bunker;
			bunkers = bunkers + _newBunkers;
		};

		_flags = [bunkers] call fnc_initFlags; 

		_screenMarkers = [];

		{_screenMarkers set [_forEachIndex,[_x]]}forEach bunkers;
		[_screenMarkers] spawn fnc_marker_screen;

		//[[bunkers select 0]] call fnc_marker_screen;

		while{(surfaceIsWater position radio1)} do 
		{
			radio1 setPos [(_pos select 0) + random(200) - random(200),(_pos select 1) + random(200) - random(200), 0];
		};
		[_mkr,BIS_EVO_DetectEnemy,BIS_EVO_DetectFriendly,BIS_EVO_MissionProgress,radio1] call BIS_EVO_Erec;
		
	//	Sleep 10.0;

	reinfdelay = round (290-(aggression^1.14));

	reinforcements = true;
	[] spawn reinforcementLoop;

	{[_x,_flags select _forEachIndex] spawn bunkerLoop}forEach bunkers;


		for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
		{
	//adding

			//Check if all outposts are captured
		_capturedBunkers = 0;
		{
			
				if(_x  getVariable "OWNER" == EGG_EVO_PLAYERFACTION) then {_capturedBunkers = _capturedBunkers + 1};
		}forEach bunkers;

		_captured = _capturedBunkers == count bunkers;

			if (_captured) then 
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


		{_handle = [_x] execVM "data\scripts\makepow.sqf"} forEach list BIS_EVO_DetectEnemy; //REMOVED

		sleep 2;
	//	{_x addscore 10} forEach list BIS_EVO_DetectFriendly;

	//	[] call aggressionEvaluation;

		BIS_EVO_conqueredTowns = BIS_EVO_conqueredTowns + [BIS_EVO_MissionTowns select BIS_EVO_MissionProgress];

		publicVariable "BIS_EVO_conqueredTowns";
		[BIS_EVO_MissionProgress] call updObjMarker;
		hint "Town captured";
		BIS_EVO_MissionProgress = -1;
		deleteMarker BIS_EVO_MainObjective;
		[bunkers] call fnc_bunk_cleanup;
		//BIS_EVO_MissionProgress = BIS_EVO_MissionProgress + 1;
		publicVariable "BIS_EVO_MissionProgress";
		//player globalchat format ["BIS_EVO_MissionProgress: %1",BIS_EVO_MissionProgress]; 
	};
};
