// Clientside code for ordnance support
_type = _this select 0;
_size = _this select 1;
_countdown = _this select 2;
_ord = _this select 3;

_bpos = getmarkerpos "btarg";
deleteMarkerLocal "btarg";
_base = "HeliHEmpty" createVehicle _bpos; //edit

BIS_EVO_sup = player;
BIS_EVO_sut = _type;
//sur = [_base] call BIS_EVO_GridRef;

publicVariable "BIS_EVO_sut";
//publicVariable "sur";
publicVariable "BIS_EVO_sup";

//_k = createVehicle ["SmokeShellRed",_bpos, [], 0, "NONE"];
BIS_EVO_fmission = true;

_mark1 = format["%1Bomb1",time];
_mark2 = format["%1Bomb2",time];
_mark3 = format["%1Bomb3",time];

_bmark3 = createMarker [_mark3, _bpos];
_bmark3 setMarkerShape "ELLIPSE";
_bmark3 setMarkerType "Destroy";
_bmark3 setMarkerColor "ColorRed";
_bmark3 setMarkerSize [200, 200];

_bmark2 = createMarker [_mark2, _bpos];
_bmark2 setMarkerShape "ICON";
_bmark2 setMarkerType "FireMission";
_bmark2 setMarkerColor "ColorBlack";

_bmark = createMarker [_mark1, [(_bpos select 0)+3,(_bpos select 1)+3]];
_bmark = createMarker [_mark1, _bpos];
_bmark setMarkerShape "ICON";
_bmark setMarkerType "Flag";
_bmark setMarkerSize [1.0, 1.0];

_bzone = createTrigger ["EmptyDetector", _bpos];
_bzone setTriggerActivation ["ANY", "PRESENT", false];
_bzone setTriggerArea [_size, _size, 0, true ];

_men = 0;
_car = 0;
_tank = 0;
_score = 0;

_mssg = "";

_bombzone = getmarkerpos _mark1;

BIS_EVO_Nshock = 
{
	_base = _this select 0;
	_xPos = (position _base select 0);
	_yPos = (position _base select 1)-40;

	_howBigA = _this select 1;
	_howBigB = _this select 2;
	_tablesC = _this select 3;
	_angle = _this select 4;
	_i = 0;
	while {_i < 360} do {
		_x = (_howBigA * (sin _i));
		_y = (_howBigB * (cos _i));
		_x_rot = _xPos + _x*(cos _angle) - _y*(sin _angle);
		_y_rot = _yPos + _x*(sin _angle) + _y*(cos _angle);
		_k = createVehicle ["Bo_GBU12_LGB",[_x_rot, _y_rot,50], [], 0, "NONE"];
		_i = _i + (360/_tablesC);
	};
};

BIS_EVO_CountDead = 
{
	_list = list _bzone;
	if(count _list > 0) then
	{
		{
			if(_x isKindof "Man" and (side _x) == EGG_EVO_ENEMYFACTION) then {_men = _men + 1;_score = _score+1};
			if(_x isKindof "Car" and (side _x) == EGG_EVO_ENEMYFACTION) then {_car = _car + 1;_score = _score+3};
			if(_x isKindof "Tank" and (side _x) == EGG_EVO_ENEMYFACTION) then {_tank = _tank + 1;_score = _score+5};
			if(_x isKindof "Man" and (side _x) == EGG_EVO_PLAYERFACTION) then {_men = _men - 1;_score = _score-1};
			if(_x isKindof "Car" and (side _x) == EGG_EVO_PLAYERFACTION) then {_car = _car - 1;_score = _score-3};
			if(_x isKindof "Tank" and (side _x) == EGG_EVO_PLAYERFACTION) then {_tank = _tank - 1;_score = _score-5};		

		} forEach _list;
	};
};


switch (_ord) do
{
/*
******ord numbers*******
1 ammo crate 
9 marker smoke 
10 inflatable boat 
11 smokescreen 
2 precision strike 
8 scout bike 
12 MG station
3 small artillery
13 mortar station
14 build fortification
4 cluster bomb
15 armoured boat
16 aa battery
5 large artillery
17 artillery cannon
6 chemical strike
18 HALO extraction
7 ICBM
*********colours********
ColorWhite		//ammo fort HALO
ColorBlue		//vehicle
ColorBlack		//smokescreen
ColourGreen		//marker
ColorRed 		//incoming munition
ColorYellow		//WMD
*/
	 case 1:
	{
		_k = createVehicle ["SmokeShell",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorWhite";
	};
	 case 2:
	{
		_k = createVehicle ["SmokeShellRed",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorRed";
	};
	 case 3:
	{
		_k = createVehicle ["SmokeShellRed",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorRed";
	};
	 case 4:
	{
		_k = createVehicle ["SmokeShellRed",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorRed";
	};
	 case 5:
	{
		_k = createVehicle ["SmokeShellRed",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorRed";
	};
	 case 6:
	{
		_k = createVehicle ["SmokeShellRed",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorYellow";
	};
	 case 7:
	{
		_k = createVehicle ["SmokeShellRed",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorYellow";
	};
	 case 8:
	{
		_k = createVehicle ["SmokeShellBlue",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorBlue";
	};
	 case 9:
	{
		_k = createVehicle ["SmokeShellGreen",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorGreen";
	};
	 case 10:
	{
		_k = createVehicle ["SmokeShellBlue",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorBlue";
	};
	 case 11:
	{
		_k = createVehicle ["SmokeShell",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorBlack";
	};
	 case 12:
	{
		_k = createVehicle ["SmokeShellBlue",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorBlue";
	};
	 case 13:
	{
		_k = createVehicle ["SmokeShellBlue",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorBlue";
	};
	 case 14:
	{
		_k = createVehicle ["SmokeShell",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorWhite";
	};
	 case 15:
	{
		_k = createVehicle ["SmokeShellBlue",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorBlue";
	};
	 case 16:
	{
		_k = createVehicle ["SmokeShellBlue",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorBlue";
	};
	 case 17:
	{
		_k = createVehicle ["SmokeShellBlue",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorBlue";
	};
	 case 18:
	{
		_k = createVehicle ["SmokeShell",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorWhite";
	};
	 case 19:
	{
		_k = createVehicle ["SmokeShellBlue",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorBlue";
	};
	 case 20:
	{
		_k = createVehicle ["SmokeShellBlue",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorBlue";
	};
	 case 21:
	{
		_k = createVehicle ["SmokeShellOrange",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorYellow";
	};
	 case 22:
	{
		_k = createVehicle ["SmokeShellRed",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorRed";
	};
	 case 23:
	{
		_k = createVehicle ["SmokeShellRed",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorRed";
	};
	 case 24:
	{
		_k = createVehicle ["SmokeShellOrange",_bpos, [], 0, "NONE"];
		_bmark2 setMarkerColor "ColorRed";
	};
	 case 25: // Vehicle ammo box
	{
//BIGPICKLE
		[-1, {_man = _this select 0; _man say "Resupply";},[player]] call cba_fnc_globalExecute;	
		_pos = (position _base);
		_obj_para = "ParachuteMediumEast_EP1" createVehicle [0,0,0];
		_obj_para setpos [_pos select 0,_pos select 1,(_pos select 2) +100];		
		_tbox = "PRACS_Vehicle_AmmoBox" createVehicle _pos;
		_tbox attachTo [_obj_para, [0,0,-1.6]];
		sleep 1.0;
		WaitUntil{(getpos _tbox select 2) < 0.01};
		detach _tbox;
		
		deletevehicle _tbox;
		_pos = position _tbox;
		_tbox = "PRACS_Vehicle_AmmoBox" createVehicle _pos;
		_tbox setAmmoCargo 0.2;
		_tbox setpos getpos _tbox;
		[_tbox] execVM "data\scripts\dropdel.sqf";
		_tbox setVehicleInit "[this] call BIS_EVO_DropBox";
		processInitCommands;	
	};
		 case 26: // Fuel barrels
	{
//BIGPICKLE
		[-1, {_man = _this select 0; _man say "Resupply";},[player]] call cba_fnc_globalExecute;	
		_pos = (position _base);
		_obj_para = "ParachuteMediumEast_EP1" createVehicle [0,0,0];
		_obj_para setpos [_pos select 0,_pos select 1,(_pos select 2) +100];		
		_tbox = "Barrels" createVehicle _pos;
		_tbox attachTo [_obj_para, [0,0,-1.6]];
		sleep 1.0;
		WaitUntil{(getpos _tbox select 2) < 0.01};
		detach _tbox;
		
		deletevehicle _tbox;
		_pos = position _tbox;
		_tbox = "Barrels" createVehicle _pos;
		_tbox setpos getpos _tbox;
		[_tbox] execVM "data\scripts\dropdel.sqf";
		_tbox setVehicleInit "[this] call BIS_EVO_DropBox";
		processInitCommands;	
	};
	case 27: //OWN airsupport
	{

		#define flyHeight 600
			_pos = objNull;
			_unit = objNull;
			_vec = objNull;
			_heli0 = objnull;
			_max = objnull;
			_maxv = objnull;
			_objPos = _bombzone;
			_pos = _bombzone;
			_posback = _bombzone;
			_range = 3000;
			_pilot = createGroup (west);
			(EGG_EVO_mepilot select 0) createUnit [getmarkerpos "centerp", _pilot];Sleep BIS_EVO_GlobalSleep;
			(EGG_EVO_mepilot select 0) createUnit [getmarkerpos "centerp", _pilot];Sleep BIS_EVO_GlobalSleep;
			//(EGG_EVO_mepilot select 0) createUnit [getmarkerpos "centerp", _pilot];Sleep BIS_EVO_GlobalSleep;
			_pos1 = [(_pos select 0)-_range -(random _range),(_pos select 1)+_range -(random _range),(700 + random 100)];
			_pos2 = [(_pos select 0)+_range +(random _range),(_pos select 1)+_range -(random _range),(700 + random 100)];
			_heli0 = createVehicle ["JS_FA18F",_pos1, [], 100, "NONE"];
			_sumark = [_heli0,"Friendly Air","ColorBlue","plp_icon_planeAttack",true,0.6] execVM "data\scripts\customMarker.sqf";
			//player moveInDriver _heli0;
			_heli0 setVelocity [0,0,0];
			_dir = [position _heli0, _objPos] call BIS_EVO_GetRelDir;

			_heli0 setPos [getpos (_x select 0), getpos (_x select 1), flyHeight];
			_heli0 flyInHeight flyHeight;

			(units _pilot select 0) setBehaviour "CARELESS";


			_heli0 setdir _dir;
			_vel = velocity _heli0;
			_speed = 50;
			_heli0 setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			100];

			_heli0 engineon true;
			(units _pilot select 0) assignAsDriver _heli0;
			(units _pilot select 1) assignAsGunner _heli0;
			(units _pilot select 0) moveInDriver _heli0;
			(units _pilot select 1) moveInGunner _heli0;
			_originalPly = player;

			//Player is gunner
			addSwitchableUnit (units _pilot select 1);
			setPlayable (units _pilot select 1);
			selectPlayer (units _pilot select 1);

			addSwitchableUnit _originalPly;
			setPlayable _originalPly;

			_wp1 = _pilot addWaypoint [_bombzone, 0];
			_timer = 120;

				while{_timer > 0} do
				{
					sleep 1;
				_timer = _timer -1;
				hintSilent format ["%1 seconds left", _timer];
				if([crew _heli0] call countAliveCrew < 1) exitWith{};
				};

			hint "Air Support ended";


			selectPlayer _originalPly;


				deleteVehicle _heli0;
				{deleteVehicle _x }forEach units _pilot;
				deleteGroup _pilot;
	};
	case 28: 
	{
		_cac = [] execVM "LDL_ac130\Actions\uav_action_map.sqf";
	};
};

_i = _countdown;
while {_i > -1} do 
{
	_mssg = format["%1's %2 :%3",(name player),_type,_i];
	_bmark2 setMarkerText _mssg;
	_bmark3 setMarkerSize [0, 0];
	_i = _i - 1;
	if((_ord == 7) and _i == 25) then 
	{
//		_base setVehicleInit "[this,6] execVM ""data\scripts\nuke.sqf""";
//		_base setVehicleInit "[this] execVM ""nuke\nukelaunch.sqs""";
		Groundzero = "HeliHEmpty" createVehicle (position _base);
		[] exec "nuke\nukeincoming.sqs";
		processInitCommands;
	};	
	sleep 0.5;
	_bmark3 setMarkerSize [_size, _size];
	sleep 0.5;
};

deletevehicle _k;

switch (_ord) do
{

	 case 1: //ammo box
	{
//BIGPICKLE
		[-1, {_man = _this select 0; _man say "Resupply";},[player]] call cba_fnc_globalExecute;	
		_pos = (position _base);
		_obj_para = "ParachuteMediumEast_EP1" createVehicle [0,0,0];
		_obj_para setpos [_pos select 0,_pos select 1,(_pos select 2) +100];		
		_tbox = "USOrdnanceBox" createVehicle _pos;
		_tbox attachTo [_obj_para, [0,0,-1.6]];
		sleep 1.0;
		WaitUntil{(getpos _tbox select 2) < 0.01};
		detach _tbox;
		
		deletevehicle _tbox;
		_pos = position _tbox;
		_tbox = "USOrdnanceBox" createVehicle _pos;
		_tbox setpos getpos _tbox;
		[_tbox] execVM "data\scripts\dropdel.sqf";
		_tbox setVehicleInit "[this] call BIS_EVO_DropBox";
		processInitCommands;	
	};
	 case 2: //precision strike
	{		
 //BIGPICKLE
       [-1, {_man = _this select 0; _man say "Airstrike";},[player]] call cba_fnc_globalExecute;	
		sleep 20.0;
		_k = createVehicle ["Bo_GBU12_LGB",[(position _base select 0), (position _base select 1)-50,50], [], 0, "NONE"];
		sleep 10;
		[] call BIS_EVO_CountDead;
	};
	 case 3: //small arty
	{
 //BIGPICKLE
       [-1, {_man = _this select 0; _man say "SmallArty";},[player]] call cba_fnc_globalExecute;	
		sleep 15.0;
		[] call BIS_EVO_CountDead;
		_i = 0;
		while {_i < 20} do {
			_k = createVehicle ["Sh_105_HE",[(position _base select 0), (position _base select 1),50], [], _size, "NONE"];
			_i = _i + 1;
			sleep 1.0;
		};
	};
	 case 4: //cluster bomb
	{
       [-1, {_man = _this select 0; _man say "NapalmStrike";},[player]] call cba_fnc_globalExecute;	
		sleep 5.0;
		_i = 0;
		while {_i < 6} do {
			_k = createVehicle ["Bo_Mk82",[(position _base select 0), (position _base select 1)-220,175], [], _size, "NONE"];
			_i = _i + 1;
			sleep 0.1;			
		};
		sleep 10;
		[] call BIS_EVO_CountDead;		
		
	};
	 case 5: // large arty
	{
//BIGPICKLE
		[-1, {_man = _this select 0; _man say "LargeArty";},[player]] call cba_fnc_globalExecute;	
		[] call BIS_EVO_CountDead;
		_i = 0;
		while {_i < 40} do {
			_k = createVehicle ["Sh_122_HE",[(position _base select 0), (position _base select 1),50], [], _size, "NONE"];
			_i = _i + 1;
			sleep 1.0;
		};		
	};
	 case 6: //MOAB
	{	
/*
		_k = createVehicle ["GLT_GBU43",[(position _base select 0), (position _base select 1)-220,190], [], 0, "NONE"];
		_k attachTo [_obj_para, [0,0,0]];
		sleep 10.0;
		[] call BIS_EVO_CountDead;
*/
       [-1, {_man = _this select 0; _man say "NapalmStrike";},[player]] call cba_fnc_globalExecute;	
		sleep 5.0;
		[] call BIS_EVO_CountDead;
		_i = 0;
		while {_i < 8} do {
			_k = createVehicle ["Bo_GBU12_LGB",[(position _base select 0), (position _base select 1),50], [], _size, "NONE"];
			_i = _i + 1;
			sleep 0.5;
		};		
	};
	 case 7: //nuke
	{
		[] call BIS_EVO_CountDead;
		[] exec "nuke\damage.sqs";
/*
		_objs = nearestObjects [_base, ["Man","Car","Tank","House","Strategic","NonStrategic"], 25];{if(not (_x isKindOf "Land_Antenna")) then {_x setdamage 1}} forEach _objs;
		sleep 0.5;
		_objs = nearestObjects [_base, ["Man","Car","Tank","House","Strategic","NonStrategic"], 50];{if(not (_x isKindOf "Land_Antenna")) then {_x setdamage 1}} forEach _objs;
		sleep 0.5;
		_objs = nearestObjects [_base, ["Man","Car","Tank","House","Strategic","NonStrategic"], 75];{if(not (_x isKindOf "Land_Antenna")) then {_x setdamage 1}} forEach _objs;
		sleep 0.5;
		_objs = nearestObjects [_base, ["Man","Car","Tank","House","Strategic","NonStrategic"], 100];{if(not (_x isKindOf "Land_Antenna")) then {_x setdamage 1}} forEach _objs;
		sleep 0.5;
		_objs = nearestObjects [_base, ["Man","Car","Tank","House","Strategic","NonStrategic"], 150];{if(not (_x isKindOf "Land_Antenna")) then {_x setdamage 1}} forEach _objs;
		sleep 0.5;
		_objs = nearestObjects [_base, ["Man","Car","Tank","House","Strategic","NonStrategic"], 200];{if(not (_x isKindOf "Land_Antenna")) then {_x setdamage 1}} forEach _objs;
*/
	};
	 case 8: //scout bike
	{
		[-1, {_man = _this select 0; _man say "Resupply"; }, [player]] call cba_fnc_globalExecute;	
		_pos = (position _base);
		_obj_para = "ParachuteMediumEast_EP1" createVehicle [0,0,0];
		_obj_para setpos [_pos select 0,_pos select 1,(_pos select 2) +100];		
		_tbox = "M1030" createVehicle _pos;
		_tbox attachTo [_obj_para, [0,0,-1.6]];
		sleep 1.0;
		WaitUntil{(getpos _tbox select 2) < 0.01};
		detach _tbox;

		_tbox setpos getpos _tbox;
		_tbox setDir direction player;
		_tbox engineon false;
		_tbox setDammage 0;
		[_tbox] execVM "data\scripts\dropdelm.sqf";
		processInitCommands;	
	};

//to add in 9-18 from csupport usc2

	case 9: //Marker Smoke
	{
		[-1, {_man = _this select 0; _man say "MarkerSmokeDist"; }, [player]] call cba_fnc_globalExecute;
		sleep 5;
		_i = 0;
		while {_i < 2} do 
		{
			_k = createVehicle ["SmokeShellGreen",[(position _base select 0), (position _base select 1),50], [], _size, "NONE"];
			_i = _i + 1;
			sleep 1.0;
		};	
		sleep 7.0;
//BIGPICKLE
		[-1, {_man = _this select 0; _man say "MarkerSmoke";}, [player]] call cba_fnc_globalExecute;
	};
	case 10: //Inflatable Boat
	{
		[-1, {_man = _this select 0; _man say "Resupply"; }, [player]] call cba_fnc_globalExecute;	 
		_pos = (position _base);
		_obj_para = "ParachuteMediumEast_EP1" createVehicle [0,0,0];
		_obj_para setpos [_pos select 0,_pos select 1,(_pos select 2) +100];	
		_tbox = "Zodiac" createVehicle _pos;

		_tbox attachTo [_obj_para, [0,0,-1.6]];
		sleep 1.0;
		WaitUntil{(getpos _tbox select 2) < 0.01};
		detach _tbox;

		_tbox setpos getpos _tbox;
		_tbox setDir (direction player-180);
		_tbox engineon false;
		_tbox setDammage 0;
		_tbox setVelocity [0, 0, 0];
		[_tbox] execVM "data\scripts\dropdelm.sqf";
		processInitCommands;	
	};

	case 11: //Smokescreen
	{
		[-1, {_man = _this select 0; _man say "SmokeScreenDist"; }, [player]] call cba_fnc_globalExecute;
		sleep 7;
		[-1, {_man2 = _this select 0; _man2 say "Resupply"; }, [player]] call cba_fnc_globalExecute;	
		_i = 0;
		while {_i < 8} do 
		{
			_k = createVehicle ["SmokeShell",[(position _base select 0), (position _base select 1),50], [], _size, "NONE"];
			_i = _i + 1;
			sleep 1.0;
		};
	};

	case 12: //MG Station
	{
		[-1, {_man = _this select 0; _man say "Resupply"; }, [player]] call cba_fnc_globalExecute;	
		_pos = (position _base);
		_tbox = "Fort_Nest_M240" createVehicle _pos;
		_tbox setpos getpos _tbox;
		_tbox setDir direction player;
		_tbox setDammage 0;
		[_tbox] execVM "data\scripts\dropdelm.sqf";
		processInitCommands;	
	};

	case 13: //Mortar Station
	{
		[-1, {_man = _this select 0; _man say "Resupply"; }, [player]] call cba_fnc_globalExecute;	
		_pos = (position _base);
		_obj_para = "ParachuteMediumEast_EP1" createVehicle [0,0,0];
		_obj_para setpos [_pos select 0,_pos select 1,(_pos select 2) +100];	
		_tbox = "2b14_82mm" createVehicle _pos;
		_tbox attachTo [_obj_para, [0,0,-1.6]];
		sleep 1.0;
		WaitUntil{(getpos _tbox select 2) < 0.01};
		detach _tbox;

		_tbox setpos getpos _tbox;
		_tbox setDir direction player;
		_tbox addmagazine "ARTY_8Rnd_82mmHE_2B14";
		_tbox addmagazine "ARTY_8Rnd_82mmHE_2B14";
		_tbox addmagazine "ARTY_8Rnd_82mmWP_2B14";
		_tbox addmagazine "ARTY_8Rnd_82mmWP_2B14";
		_tbox addmagazine "ARTY_8Rnd_82mmILLUM_2B14";
		_tbox addmagazine "ARTY_8Rnd_82mmILLUM_2B14";
		[_tbox] execVM "data\scripts\dropdelm.sqf";
		_tbox setDammage 0;
		processInitCommands;	
	};
	case 14: //Build fortification
	{
		[-1, {_man = _this select 0; _man say "Resupply"; }, [player]] call cba_fnc_globalExecute;	
		_pos = (position _base);
//		_tbox = "Land_Fort_Watchtower" createVehicle _pos;
		_tbox = "WarfareBDepot" createVehicle _pos;

//		_dirfort = ((getdir player)-180);
		_tbox setDir (direction player-180);
		_tbox setDammage 0;
		[_tbox] execVM "data\scripts\dropdelm.sqf";
		processInitCommands;	
	};

	case 15: //Armoured Boat
	{
		[-1, {_man = _this select 0; _man say "Resupply"; }, [player]] call cba_fnc_globalExecute;	
		_pos = (position _base);
		_obj_para = "ParachuteMediumEast_EP1" createVehicle [0,0,0];
		_obj_para setpos [_pos select 0,_pos select 1,(_pos select 2) +100];	
		_tbox = "pook_SOCR_H_M134b_US" createVehicle _pos;

		_tbox attachTo [_obj_para, [0,0,-1.6]];
		sleep 1.0;
		WaitUntil{(getpos _tbox select 2) < 0.01};
		detach _tbox;

		_tbox setpos getpos _tbox;
		_tbox setDir direction player;
		_tbox engineon false;
		_tbox setDammage 0;
		_tbox setVelocity [0, 0, 0];
		[_tbox] execVM "data\scripts\dropdelm.sqf";
		processInitCommands;	
	};

	case 16: //AA Battery
	{
		[-1, {_man = _this select 0; _man say "Resupply"; }, [player]] call cba_fnc_globalExecute;	
		_pos = (position _base);
		_obj_para = "ParachuteMediumEast_EP1" createVehicle [0,0,0];
		_obj_para setpos [_pos select 0,_pos select 1,(_pos select 2) +100];	
		_tbox = "ZU23_TK_GUE_EP1" createVehicle _pos;
		_tbox addmagazine "40Rnd_23mm_AZP85";
		_tbox addmagazine "40Rnd_23mm_AZP85";
		_tbox addmagazine "40Rnd_23mm_AZP85";
		_tbox addmagazine "40Rnd_23mm_AZP85";
		_tbox addmagazine "40Rnd_23mm_AZP85";
		_tbox addmagazine "40Rnd_23mm_AZP85";
		_tbox addmagazine "40Rnd_23mm_AZP85";

		_tbox attachTo [_obj_para, [0,0,-1.6]];
		sleep 1.0;
		WaitUntil{(getpos _tbox select 2) < 0.01};
		detach _tbox;

		_tbox setpos getpos _tbox;
		_tbox setDir direction player;
		[_tbox] execVM "data\scripts\dropdelm.sqf";
		_tbox setDammage 0;
		processInitCommands;	
	};
	case 17: //Artillery Cannon
	{
		[-1, {_man = _this select 0; _man say "Resupply"; }, [player]] call cba_fnc_globalExecute;	
		_pos = (position _base);
		_obj_para = "ParachuteMediumEast_EP1" createVehicle [0,0,0];
		_obj_para setpos [_pos select 0,_pos select 1,(_pos select 2) +100];	
		_tbox = "M119_US_EP1" createVehicle _pos;
		_tbox addmagazine "20Rnd_120mmSABOT_M1A2";
		_tbox addmagazine "ARTY_30Rnd_105mmSADARM_M119";
		_tbox addmagazine "ARTY_30Rnd_105mmLASER_M119";
		_tbox addmagazine "ARTY_30Rnd_105mmSMOKE_M119";
		_tbox addmagazine "ARTY_30Rnd_105mmILLUM_M119";
		_tbox addmagazine "ARTY_30Rnd_105mmWP_M119";
		_tbox addweapon "M256";

		_tbox attachTo [_obj_para, [0,0,-1.6]];
		sleep 1.0;
		WaitUntil{(getpos _tbox select 2) < 0.01};
		detach _tbox;

		_tbox setpos getpos _tbox;
		_tbox setDir direction player;
		[_tbox] execVM "data\scripts\dropdelm.sqf";
		_tbox setDammage 0;
		processInitCommands;	

		player moveInGunner _tbox;
		hint "press Weaponchange button on KeyBoard to switch between HE and AT Ammo";
	};
	case 18: //HALO Extraction
	{
		player SideChat localize "str_bardak_caught_b_1";
		sleep 15;
		_hump = [] execVM "data\scripts\parajump.sqf";
	};
	 case 19: //bike
	{
		[-1, {_man = _this select 0; _man say "Resupply"; }, [player]] call cba_fnc_globalExecute;	  
		_pos = (position _base);
		_obj_para = "ParachuteMediumEast_EP1" createVehicle [0,0,0];
		_obj_para setpos [_pos select 0,_pos select 1,(_pos select 2) +100];		
		_tbox = "ATV_US_EP1" createVehicle _pos;
		_tbox attachTo [_obj_para, [0,0,-1.6]];
		sleep 1.0;
		WaitUntil{(getpos _tbox select 2) < 0.01};
		detach _tbox;

		_tbox setpos getpos _tbox;
		_tbox setDir direction player;
		_tbox engineon false;
		_tbox setDammage 0;
		[_tbox] execVM "data\scripts\dropdelm.sqf";
		processInitCommands;	
	};
	 case 20: // Illumination
	{
		[-1, {_man = _this select 0; _man say "Resupply"; }, [player]] call cba_fnc_globalExecute;	  
		_flare_types = ["F_40mm_White"];
		//,"F_40mm_Green","F_40mm_Red","F_40mm _yellow"
		_flare_max = (count _flare_types)-1;
		_theflare = _flare_types select (round random _flare_max);
		while {_i < 30} do
		{
			_rand_flare = random 100;
			_flare = _theflare createVehicle [(getPos _base select 0)+(_rand_flare-50), (getPos _base select 1)+(_rand_flare-50), 400];
			_i = _i + 1;
			sleep 20+((_rand_flare+10)/10);
		}; 
	};
	 case 21: // Bombardment
	{
//BIGPICKLE
		[-1, {_man = _this select 0; _man say "NapalmStrike";}, [player]] call cba_fnc_globalExecute;	   
		[] call BIS_EVO_CountDead;
		_bomb_types = ["Sh_122_HE","Sh_125_HE","Bo_FAB_250","Sh_105_HE","G_40mm_HE","Bo_Mk82","Sh_85_HE","GrenadeHand","SmokeShellPurple","SmokeShellOrange"];
		_bomb_max = (count _bomb_types)-1;
		_i=0;
		while {_i < 40} do
		{
			_thebomb = _bomb_types select (round random _bomb_max);
			_rand_bomb = random 200;
			_bombard = _thebomb createVehicle [(getPos _base select 0)+(_rand_bomb-100), (getPos _base select 1)+(_rand_bomb-100), 180];
			_i = _i + 1;
			sleep 5+(random 10);
		}; 
	};
	 case 22: // Minefield
	{
		_i=0;
		while {_i < 20} do
		{
//			_rand_bomb = random 50;
			_bombard = createVehicle ["Mine",[(position _base select 0), (position _base select 1),0], [], 50, "NONE"];
//			_bombard = "Mine" createVehicle [(getPos _base select 0)+(_rand_bomb-25), (getPos _base select 1)+(_rand_bomb-25), 0];
			_i = _i + 1;
			sleep 1;
		}; 
		[_base] execVM "data\scripts\dropdelmines.sqf";
	};
	 case 23: //mortar barrage
	{
//BIGPICKLE
		[-1, {_man = _this select 0; _man say "MortarBarrage"; }, [player]] call cba_fnc_globalExecute;	  
//BIGPICKLE
		sleep 21;			
		[] call BIS_EVO_CountDead;
		_i = 0;
		while {_i < 2} do 
		{
			_k = createVehicle ["Sh_82_WP",[(position _base select 0), (position _base select 1),50], [], _size, "NONE"];
			_i = _i + 1;
			sleep 2.5;
		};
		_i = 0;
		while {_i < 10} do 
		{
			_k = createVehicle ["Sh_82_HE",[(position _base select 0), (position _base select 1),50], [], _size, "NONE"];
			_i = _i + 1;
			sleep 2.5;
		};
	};
	 case 24: // Trap field
	{
		_i=0;
		_bomb_types = EGG_EVO_Trapweapons;
		_bomb_max = (count _bomb_types)-1;
		while {_i < 10} do
		{
			_thebomb = _bomb_types select (round random _bomb_max);
			_rand_bomb = random 40;
			_bombard = _thebomb createVehicle [(getPos _base select 0)+(_rand_bomb-20), (getPos _base select 1)+(_rand_bomb-20),0];
			_i = _i + 1;
			sleep 1;
		}; 
		[_base] execVM "data\scripts\dropdelmines.sqf";
	};

};

deletevehicle _bzone;
deletemarker _mark1;
deletemarker _mark2;
deletemarker _mark3;
BIS_EVO_fmission = false;

/*
******ord numbers*******
1 ammo crate 
2 precision strike 
3 small artillery
4 cluster bomb
5 large artillery
6 chemical strike
7 ICBM
8 scout bike 
9 marker smoke 
10 inflatable boat 
11 smokescreen 
12 MG station
13 mortar station
14 build fortification
15 armoured boat
16 aa battery
17 artillery cannon
18 HALO extraction
*/

if(_ord != 1 and _ord != 8 and _ord != 9 and _ord != 10 and _ord != 11 and _ord != 12 and _ord != 13 and _ord != 14 and _ord != 15 and _ord != 16 and _ord != 17 and _ord != 18 and _ord != 19 and _ord != 20 and _ord != 22 and _ord != 24) then
{
	if(_ord == 2 or _ord == 4) then {sleep 5}; // Time to drop 50m
	_name = parseText format["<t color='#FFFFCC'>%1</t>",localize "STR_M04t92"];
	_separator1 = parseText "<br /><br />";
	_imen = parseText format["<t color='#FFFFFF'>%1 %2</t><br />",_men,localize "STR_M04t93"];
	_icar = parseText format["<t color='#FFFFFF'>%1 %2</t><br />",_car,localize "STR_M04t94"];
	_itank = parseText format["<t color='#FFFFFF'>%1 %2</t><br />",_tank,localize "STR_M04t95"];
	_tally = format["+%1 %2",_score,localize "STR_M04t0_5"];
	_iscore = parseText format["<t color='#FFFFFF'>%1</t><br />",_tally];
	_txt = composeText [_name,_separator1,_imen,_icar,_itank,_iscore];
	hint _txt;
	BIS_EVO_punitC = player;
	BIS_EVO_prewC  = _score;
	publicVariable "BIS_EVO_prewC";
	publicVariable "BIS_EVO_punitC";
};
sleep 60;
deletevehicle _base;

