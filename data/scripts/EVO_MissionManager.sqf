#include "macros.h"

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
	//Remove markers
	{
		_markerName = format ["%1",_x];
		deleteMarker _markerName;
		[_x] call fnc_deleteScreenmarker;
		deleteVehicle _x;
	} forEach bunkers;
	bunkers = [];
};

//Creates marker over bunkers
fnc_bunker_marker = 
{
	_bunker = _this select 0;
	_markerName = _this select 1;
	_markerText = _this select 2;

	//Bunker marker
	_mrktype = "plp_icon_flag";
	_bunkerMarker = createMarker[_markerName,getpos _bunker];
	_bunkerMarker setMarkerColor "ColorRED";
	_bunkerMarker setMarkerType _mrktype;
	{["sendToClient", [_x,fnc_changeScreenCtrl,[_bunker,enemycolor,5]]] call CBA_fnc_whereLocalEvent}forEach everyPlayer; //Broadcast color change
	_bunkerMarker setMarkerText _markerText;
};

fnc_init_bunker = 
{
	private ["_bunkerTypes","_times","_existingBunkers","_mkr","_nearestBunker","_pos","_bunkers","_bunkerRadiusMax","_roads","_distance","_farEnough","_bunker","_roads","_bunkerPos"];
	_bunkerTypes = ["FlagPole_EP1"];
	_times = _this select 0;
	_existingBunkers = _this select 1;
	_mkr = (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress);
	_pos = getPos _mkr;
	_bunkers = [];
	_bunkerRadiusMax = 150;

	for [{_loop=0}, {_loop<_times}, {_loop=_loop+1}] do
	{

		_bunker = createVehicle [[_bunkerTypes] call fnc_pickRandom,  _pos, [], 0, "NONE"];
		_roads = [];
		_bunkerPos = [_pos, 1, _bunkerRadiusMax,1,0,0.4,0,[],_pos] call BIS_fnc_findSafePos;
		_roads = _bunkerpos nearRoads 10;
		_allbunkers = _bunkers + _existingBunkers;
		_nearestBunker = [];
		_distance = 0;
		_farEnough = false;

		while {sleep BIS_EVO_frameDelay; count _roads > 0 or !_farEnough} do 
		{
			_bunkerPos = [_pos, 1, _bunkerRadiusMax,1,0,0.4,0,[],_pos] call BIS_fnc_findSafePos;
			_roads = _bunkerpos nearRoads 10;
				if(count _allbunkers > 0 ) then 
				{
					_bunkerPos = [_pos, 1, _bunkerRadiusMax,1,0,0.4,0,[],_pos] call BIS_fnc_findSafePos;
					_nearestBunker = [_allbunkers, _bunkerPos] call BIS_fnc_nearestPosition;
					_distance = _bunkerPos distance _nearestBunker;
					_farEnough = (_distance > _bunkerSpread) and (!surfaceIsWater _bunkerPos);
					_bunkerRadiusMax = _bunkerRadiusMax + 1;
				}
				else {_farEnough = true}; //If no bunkers exist then there is no blacklist positions
		};

		_bunker setPos _bunkerPos;
		_bunkers = _bunkers + [_bunker];

		sleep BIS_EVO_GlobalSleep;
	};
	_bunkers;
};



bunkerLoop = 
{
//	private ["_tickets","_bunkerObject","_markerName","_bunkerOwner","soundEnable"];	
	_bunkerObject = _this select 0;
	_flags = _this select 1;
	_markerText = _this select 2;
	_markerName = format ["%1",_bunkerObject];
	[_bunkerObject,_markerName,_markerText] call fnc_bunker_marker;

	//Ammobox
	_tbox = objnull;

	//Is random sometimes
	if(ceil random(3)>2) then 
	{
		_tbox = createVehicle ["USOrdnanceBox", getpos _bunkerObject, [], 10, "NONE"];
		[_tbox] call BIS_EVO_DropBox;
	};

	_tickets = maxTickets;
	_bunkerOwner = EGG_EVO_ENEMYFACTION;
	_bunkerObject setVariable ["OWNER", _bunkerOwner];

	_flag1 = _flags select 0;
	_flag2 = _flags select 1;
	soundEnable= true;

	//capture state for friendly captures
	_captured = false;
	_neutralized = false;
	_captureTick = maxCaptureTick; //Calculates time since player last captured this objective to avoid exploitation

	//Loop that handles bunker
	while{sleep calculationInterval; BIS_EVO_MissionProgress > -1} do
	{
		_baseTickets = _tickets;
		_capturingPlayers = [];
		_reward = 0;
		
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
		if(_baseTickets != _tickets) then //if no ticket change then no need for calculations
		{
			if(soundEnable) then 
			{
				soundEnable = false;
				[_bunkerObject,_capturingPlayers] spawn 
				{
					_source = _this select 0;
					_audioLength = 6.6-calculationInterval;
					_capturingPlayers = _this select 1;
					{
						["sendToClient", [_x, fnc_say3d,[_source,"flag_loop",20]]] call CBA_fnc_whereLocalEvent;
					}forEach _capturingPlayers;
					sleep (_audioLength);
					soundEnable = true;
				};
			};
			
			_ticketChange = _baseTickets - _tickets; //Calculate ticket change from this round
			_totalChange = abs(_tickets - maxTickets); //Calculates total change from max to current
			_change = _totalChange/rewardingInterval; //Calculates captured ticket count with interval
			_roundedChange = ceil(_change); //Rounds the change to ceiling

			//When player is capturing give reward
			if(!_captured and (_change == _roundedChange) and _ticketChange > 0) then //Gives player money everytime the 5 ticket interval is reached
			{
					_reward = tickRewawrd;
					_msg = format ["Capturing"];
				{
					["sendToClient", [_x,fnc_hudmessage,[_msg,_reward]]] call CBA_fnc_whereLocalEvent;
				} forEach _capturingPlayers;
			};

			//When player fully captures give reward
			if(_tickets == -maxTickets and !_captured) then 
			{
					_reward = floor(400*(_captureTick/240));
					_msg = format ["Fully Captured"];
				{
					["sendToClient", [_x,fnc_hudmessage,[_msg,_reward]]] call CBA_fnc_whereLocalEvent;
				} forEach _capturingPlayers;
			};

			//When player neturalizes give reward
			if(_tickets < 0 and !_captured and !_neutralized) then 
			{
				_reward = neuterReward;
					_msg = format ["Neutralization Bonus"];
				{
					["sendToClient", [_x,fnc_hudmessage,[_msg,_reward]]] call CBA_fnc_whereLocalEvent;
				} forEach _capturingPlayers;
			};
		};
		
		//When enemy faction neturalizes a flag
		if(_neutralized and _tickets >= 0 and _bunkerOwner == EGG_EVO_PLAYERFACTION) then 
		{
			_markerName setMarkerColor "ColorWhite";	
			_controlName = allBunkerControls select (bunkers find _bunkerObject);

			{
				["sendToClient", [_x,fnc_changeScreenCtrl,[_bunkerObject,neutralcolor,5]]] call CBA_fnc_whereLocalEvent; //Broadcast color change
				["sendToClient", [_x,fnc_playSound,["neutralizedcp_west"]]] call CBA_fnc_whereLocalEvent;
				_msg = format ["Outpost is being overrun!"];
				["sendToClient", [_x,fnc_msg,["gs",_msg]]] call CBA_fnc_whereLocalEvent;
			}forEach everyPlayer;
			_neutralized = false;
		};

		//When enemy captures back a flag
		if(_tickets == maxTickets and _bunkerOwner == EGG_EVO_PLAYERFACTION) then 
		{
			_markerName setMarkerColor "ColorRed";
			_controlName = allBunkerControls select (bunkers find _bunkerObject);
			_bunkerOwner = EGG_EVO_ENEMYFACTION;
			_bunkerObject setVariable ["OWNER", _bunkerOwner];
			{
				["sendToClient", [_x,fnc_changeScreenCtrl,[_bunkerObject,enemycolor,5]]] call CBA_fnc_whereLocalEvent; //Broadcast color change
				["sendToClient", [_x,fnc_playSound,["lostCP"]]] call CBA_fnc_whereLocalEvent;
				_msg = format ["Outpost is being overrun!"];
				["sendToClient", [_x,fnc_msg,["gs",_msg]]] call CBA_fnc_whereLocalEvent;
			}forEach everyPlayer;
			capturedFlags = capturedFlags - [_bunkerObject];
			publicVariable "capturedFlags";
			_captured = false;
			_neutralized = false;
		};

		//When player faction neturalizes a flag
		if(_tickets < 0 and _bunkerOwner == EGG_EVO_ENEMYFACTION) then 
		{
			_markerName setMarkerColor "ColorWhite";	
			_controlName = allBunkerControls select (bunkers find _bunkerObject);
			{
				["sendToClient", [_x,fnc_changeScreenCtrl,[_bunkerObject,neutralcolor,5]]] call CBA_fnc_whereLocalEvent; //Broadcast color change
			}forEach everyPlayer;
			//_bunkerOwner = EGG_EVO_PLAYERFACTION;
			//_bunkerObject setVariable ["OWNER", _bunkerOwner];
			_neutralized = true;
		};

		//When player side fully captures a flag
		if(_tickets == -maxTickets and !_captured) then 
		{
			_markerName setMarkerColor "ColorBlue";	
			_controlName = allBunkerControls select (bunkers find _bunkerObject);
			_bunkerOwner = EGG_EVO_PLAYERFACTION;
			_bunkerObject setVariable ["OWNER", _bunkerOwner];
				{
					["sendToClient", [_x,fnc_changeScreenCtrl,[_bunkerObject,playercolor,5]]] call CBA_fnc_whereLocalEvent; //Broadcast color change
					["sendToClient", [_x,fnc_playSound,["captureCP"]]] call CBA_fnc_whereLocalEvent;
					_msg = format ["Position clear and under control!"];
					["sendToClient", [_x,fnc_msg,["gs",_msg]]] call CBA_fnc_whereLocalEvent;
				}forEach everyPlayer;
			capturedFlags = capturedFlags + [_bunkerObject];
			publicVariable "capturedFlags";
			_captured = true;
			_captureTick = 0;
		};

		//Start ticking after capture
		if(_captured and {_captureTick < maxCaptureTick}) then {_captureTick = (_captureTick + 1)};

		//SET flags
		_zPos1 = (((abs(minHeight))*(_tickets/maxTickets))-abs(minHeight)) min 0 max minHeight;
		_zPos2 = (-((abs(minHeight))*(_tickets/maxTickets))-abs(minHeight)) min 0 max minHeight;
		_flag1 setPos [position _flag1 select 0, position _flag1 select 1,_zPos1];
		_flag2 setPos [position _flag2 select 0, position _flag2 select 1,_zPos2];
	};
	deleteVehicle _flag1;
	deleteVehicle _flag2;
	deletevehicle _tbox;
	deleteMarker _markerName;
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
	//["jed_aggr", [_x]] call CBA_fnc_whereLocalEvent;
};

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

	Sleep 2.0;
	while {sleep 1; BIS_EVO_MissionProgress != -1} do
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
		BIS_EVO_aaSpawn = 2 + round(aggression*0.1);

		radio1 setPos [(_pos select 0) + random(200) - random(200),(_pos select 1) + random(200) - random(200), 0];
		radio1 setDammage 0;

		_bunkercount = 3;

		if((BIS_EVO_MissionTowns select BIS_EVO_MissionProgress) in BIS_EVO_MissionBigTowns) then {_bunkercount = 4};


		//Count if pre set bunkers are found
		bunkers = [];
		preSetBunkers = [BIS_EVO_MissionTowns select BIS_EVO_MissionProgress] call fnc_get_synchronized_bunkers;
		bunkers = preSetBunkers;

		//TODO leave only most apart bunkers
		if(count bunkers > _bunkerCount) then 
		{
			_i = 0;
			for "_i" from 1 to (count bunkers - _bunkercount) do 
			{
				_rnd =  [bunkers] call fnc_pickRandom;
				bunkers = bunkers -[_rnd];
				deleteVehicle _rnd; //Delete them as they do not serve any puprose anymore
			};
		};

		if(count bunkers < _bunkerCount) then 
		{
			_newBunkers = [];
			_newBunkers = [_bunkerCount - count bunkers,bunkers] call fnc_init_bunker;
			bunkers = bunkers + _newBunkers;
		};

		_flags = [bunkers] call fnc_initFlags; 

		_screenMarkers = [];

		{_screenMarkers set [_forEachIndex,[_x]]}forEach bunkers;

		publicVariable "bunkers";

		{["sendToClient", [_x,fnc_broadcastFlags,[_screenMarkers]]] call CBA_fnc_whereLocalEvent} forEach everyPlayer;

		while{(surfaceIsWater position radio1)} do 
		{
			radio1 setPos [(_pos select 0) + random(200) - random(200),(_pos select 1) + random(200) - random(200), 0];
		};
		_bunkerNames = ["Flag A","Flag B","Flag C","Flag D"];
		{[_x,_flags select _forEachIndex,_bunkerNames select _forEachIndex] spawn bunkerLoop}forEach bunkers;
		[_mkr,BIS_EVO_DetectEnemy,BIS_EVO_DetectFriendly,BIS_EVO_MissionProgress,radio1,bunkers] call BIS_EVO_Erec;
		
	//	Sleep 10.0;

	reinfdelay = round (290-(aggression^1.14));
	reinforcements = true;
	[] spawn reinforcementLoop;
	
	[_mkr] spawn 
	{
		waitUntil{sleep 1; defendAlarm};
		{["sendToClient", [_x, fnc_say3d,[_this select 0,"alarm",2000]]] call CBA_fnc_whereLocalEvent} forEach everyPlayer;
	};

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
		{["sendToClient", [_x,fnc_cleanFlags]] call CBA_fnc_whereLocalEvent} forEach everyPlayer;
		//BIS_EVO_MissionProgress = BIS_EVO_MissionProgress + 1;
		publicVariable "BIS_EVO_MissionProgress";
		[] call fnc_playerBases;
		//player globalchat format ["BIS_EVO_MissionProgress: %1",BIS_EVO_MissionProgress]; 
	};
};
