//rescue agent to carrier
_user = _this select 0;
 _var = _this select 1;
_usergroup = (group player);
_pos = [0,0,0];
_trgobj3 = objNull;
_start = [];
BIS_EVO_sobj1 = false;
_obj1 = [];
_mcsardga=grpNull;
_mcsardgb=grpNull;
_mcsardgc=grpNull;
_pilot=grpNull;
_allobj = [];

_txtcommon = localize "STR_M04t0_5";
_txtfailhead = localize "STR_M04t2_6";//failed
_txtpasshead = localize "STR_M04t1_9";//complete
_txtpassbody = format["+%1 %2",_var,_txtcommon];

_MissionBriefingLong = localize "str_start_razor_s_1";//meet agent long
_MissionBriefingHUD = localize "str_som_rescue_task_desc";//find and rescue
_MissionBriefingShort = localize "str_som_rescue_briefing_2";//rescue OP

_MissionBriefingHUD2 = localize "task_olegich_name";//meet agent
_MissionBriefingHUD3 = localize "str_som_escort_task_short";//escort

_txthmid = localize "STR_M04t27_0"; //area secure
_txtbmid = localize "str_som_escort_task_short";// escort

_txtfailbody = localize "str_som_transportation_debriefing_end2";//Disaster here. All of our passengers have been killed. Over.

_deletemcsard =
{
	deleteVehicle _trgobj3;
	deleteMarkerLocal _start;
	BIS_EVO_Onmission=false;
	player removeSimpleTask _obj1;
	sleep 1;
	_handle = [_mcsardga] execVM "data\scripts\delete.sqf";
	_handle = [_mcsardgb] execVM "data\scripts\delete.sqf";
	_handle = [_mcsardgc] execVM "data\scripts\delete.sqf";
	_handle = [_pilot] execVM "data\scripts\delete.sqf";
	sleep 0.5;
	deleteVehicle _heli;
	deleteVehicle _heli1;
	deleteVehicle _heli2;
	deleteVehicle _heli3;
	deleteVehicle _heli4;
	deleteVehicle _heli5;
	deleteVehicle _heli6;
};

_Faild = 
{
	_obj1 settaskstate "Failed";
	["#FF0000",_txtfailhead,_txtfailbody] call BIS_EVO_Message;
	hint "Rescue Agent: Mission Failed\nAgent dead";
	[] call _deletemcsard;
};

[West,"HQ"] SideChat localize "STR_M04t64";

_allobj = ["mrnd27","mrnd26","mrnd25","mrnd22","mrnd23","mrnd20","mrnd19","mrnd5","mrnd4","mrnd12","mrnd15","mrnd13"];

_max = count _allobj;
_r = round random (_max - 1);
_rand =  _allobj select _r;
_pos = getMarkerPos _rand;

_rndx = random 200;
_rndy = random 200;
_rndbx = random 200;
_rndby = random 200;
_rndcx = random 200;
_rndcy = random 200;
_rnddx = random 200;
_rnddy = random 200;

_pos1 = [(_pos select 0)-50,(_pos select 1)-50,0];
_pos2 = [(_pos select 0)-100 +_rndbx,(_pos select 1)-100+_rndby,0];
_pos3 = [(_pos select 0)-100 +_rndcx,(_pos select 1)-100+_rndcy,0];
_pos4 = [(_pos select 0)-100 +_rndx,(_pos select 1)-100+_rndy,0];
_pos5 = [(_pos select 0)-100 +_rnddx,(_pos select 1)-100+_rnddy,0];

_obj1 = player createSimpleTask ["obj1"];
_obj1 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
_obj1 setSimpleTaskDestination _pos;
_obj1 settaskstate "Created";
player setCurrentTask _obj1;

[1800] execVM "data\scripts\timer.sqf";

//map
_mapview = [_pos,1] execVM "data\scripts\mismap.sqf";

waitUntil {player distance _pos < 1500 or not BIS_EVO_Onmission};
//if (_usergroup != (group _user) or not BIS_EVO_Onmission) exitwith {[] call _Faild};
if (not BIS_EVO_Onmission) exitwith {[] call _Faild};

_pilot = createGroup (civilian);//agent
//AGENT
_allunitsA = EGG_EVO_magent;
_max = count _allunitsA;
_hostage = _pilot createUnit [_allunitsA select (round random (_max - 1)), _pos1, [], 10, "NONE"];Sleep BIS_EVO_GlobalSleep;

{
	_x disableAI "MOVE";
	_x allowfleeing 0;
	_x setBehaviour "Careless";
	removeallweapons _x;
	_x setCaptive true;
	commandStop _x;
	_x addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}]
} forEach units _pilot;

sleep 1.0;
{
	_x switchMove "AmovPercMstpSsurWnonDnon";
} forEach units _pilot;

//GUARDS

_mcsardga = createGroup (east);//2 commanders
sleep 1;
_allunitsB = EGG_EVO_meofficer;
_max = count _allunitsB;
_allunitsB select (round random (_max - 1)) createUnit [_pos1, _mcsardga];Sleep BIS_EVO_GlobalSleep;
_allunitsB select (round random (_max - 1)) createUnit [_pos1, _mcsardga];Sleep BIS_EVO_GlobalSleep;	
{_x addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}]} forEach (units _mcsardga);
sleep 1;

//VEHICLES
_allvecA = EGG_EVO_mevlight;
_allvecB = EGG_EVO_mevmed;
_allvecC = EGG_EVO_mevheavya;
_allvecD = EGG_EVO_mevheavyb;

_maxA = count _allvecA;
_maxB = count _allvecB;
_maxC = count _allvecC;
_maxD = count _allvecD;

_heli = createVehicle [(_allvecA select round random (_maxA - 1)), _pos2, [], 10, "NONE"];Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_heli addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}];

_heli1 = createVehicle [(_allvecB select round random (_maxB - 1)), _pos3, [], 10, "NONE"];Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli1] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_heli1 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}];

_heli2 = createVehicle [(_allvecC select round random (_maxC - 1)), _pos4, [], 10, "NONE"];Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli2] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_heli2 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}];

_heli3 = createVehicle [(_allvecD select round random (_maxD - 1)), _pos5, [], 10, "NONE"];Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli3] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_heli3 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}];

_heli4 = createVehicle [(EGG_EVO_meflag select 0), _pos1, [], 20, "NONE"];Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli4] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_heli4 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}];

_heli5 = createVehicle [(EGG_EVO_mehq select 0), _pos1, [], 20, "NONE"];Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli5] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_heli5 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}];

_heli6 = createVehicle ["Land_Fire_burning", _pos1, [], 10, "NONE"];Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli6] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_heli6 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}];

// CREW INSURGENTS

sleep 1;
_mcsardgb = createGroup (east);//4 vehicles and 9 insurgent crew
sleep 1;

_allunitsJ = EGG_EVO_meguardd;
_max = (count _allunitsJ)-1;

_csardcounta = 8;
_d = 0;
while {_d <= _csardcounta} do 
{
	_unit = _mcsardgb createUnit [_allunitsJ select (round random _max), _pos, [], 6, "FORM"];
	_unit addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}];
	[_unit] join _mcsardgb;
	_d = _d+1;
	sleep 1;
};

(units _mcsardgb select 0) assignAsDriver _heli;
(units _mcsardgb select 0) moveInDriver _heli;
sleep 0.2;
(units _mcsardgb select 1) assignAsCargo _heli;
(units _mcsardgb select 1) moveInCargo _heli;
sleep 0.2;
(units _mcsardgb select 2) assignAsDriver _heli1;
(units _mcsardgb select 2) moveInDriver _heli1;
sleep 0.2;
(units _mcsardgb select 3) assignAsGunner _heli1;
(units _mcsardgb select 3) moveInGunner _heli1;
sleep 0.2;
(units _mcsardgb select 4) assignAsDriver _heli2;
(units _mcsardgb select 4) moveInDriver _heli2;
sleep 0.2;
(units _mcsardgb select 5) assignAsGunner _heli2;
(units _mcsardgb select 5) moveInGunner _heli2;
sleep 0.2;
(units _mcsardgb select 6) assignAsDriver _heli3;
(units _mcsardgb select 6) moveInDriver _heli3;
sleep 0.2;
(units _mcsardgb select 7) assignAsGunner _heli3;
(units _mcsardgb select 7) moveInGunner _heli3;

//PARTISANS
_mcsardgc = createGroup (east);//12 partisans
sleep 2;

_allunitsK = EGG_EVO_meguarde;
_max = (count _allunitsK)-1;
_csardcount = 12;
_d = 0;
while {_d <= _csardcount} do 
{
	_unit = _mcsardgc createUnit [_allunitsK select (round random _max), _pos, [], 6, "FORM"];
	_unit addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}];
	[_unit] join _mcsardgc;
	_d = _d+1;
	sleep 1;
};

_wp1 = _mcsardgc addWaypoint [_pos, 10];
_wp2 = _mcsardgc addWaypoint [_pos1, 10];
_wp3 = _mcsardgc addWaypoint [_pos3, 10];
_wp4 = _mcsardgc addWaypoint [_pos2, 10];
[_mcsardgc, 4] setWaypointType "CYCLE";

_recy = [_user,_pilot] execVM "data\scripts\grecycle.sqf";
_recy = [_user,_mcsardga] execVM "data\scripts\grecycle.sqf";
_recy = [_user,_mcsardgb] execVM "data\scripts\grecycle.sqf";	
_recy = [_user,_mcsardgc] execVM "data\scripts\grecycle.sqf";	

_trgobj3 = createTrigger ["EmptyDetector", _pos];
_trgobj3 setTriggerActivation ["EAST", "NOT PRESENT", false];
_trgobj3 setTriggerArea [200, 200, 0, true];
_trgobj3 setTriggerTimeout [10, 10, 10, true ];
_trgobj3 setTriggerStatements ["this", "BIS_EVO_sobj1 = true", ""];

_start = createMarkerLocal ["look", _pos];
_start setMarkerColorLocal "ColorGreen";
_start setMarkerShapeLocal "RECTANGLE";
_start setMarkerSizeLocal [200, 200];
_start setMarkerBrushLocal "FDiagonal";

_obj1 setSimpleTaskDestination  _pos;

waitUntil {player distance _pos < 200 or not BIS_EVO_Onmission};

_obj1 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD2];

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 1.001;
	if (BIS_EVO_sobj1) then {_loop=1;};
//	if (_usergroup != (group _user)) then {_loop=1;};
	if (not BIS_EVO_Onmission) then {_loop=1;};
	if (not alive _hostage) then {_loop=1;};
};
//if (_usergroup != (group _user)) exitwith {[] call _Faild};
if (not BIS_EVO_Onmission) exitwith {[] call _Faild};
if (not alive _hostage) exitwith {[] call _Faild};

_obj1 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD3];
_obj1 setSimpleTaskDestination position Boathouse;
["#00FF00",_txthmid,_txtbmid] call BIS_EVO_Message;

[_hostage] join _usergroup;

_hostage setdamage 0;
_hostage setCaptive false;
_hostage enableAI "MOVE";
_hostage doFollow (leader _usergroup);

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 1.001;
	if (_hostage distance Boathouse < 10) then {_loop=1};
	if (not alive _hostage) then {_loop=1};
	if (not BIS_EVO_Onmission) then {_loop=1;};
};
if (not BIS_EVO_Onmission) exitwith {[] call _Faild};
if (not alive _hostage) exitwith {[] call _Faild};

_hostage action ["Eject",(vehicle _hostage)];	
unassignVehicle _hostage;
[_hostage] join grpNull;
{if(isplayer _x) then {_x doFollow leader _x}} foreach units (group player);
["#FF0000",_txtpasshead,_txtpassbody] call BIS_EVO_Message;
[West,"HQ"] SideChat localize "STR_M04t65";playSound "Goodjob";
BIS_EVO_punit = _usergroup;
BIS_EVO_prew  = _var;
publicVariable "BIS_EVO_prew";
publicVariable "BIS_EVO_punit";

_obj1 settaskstate "Succeeded";

[] call _deletemcsard;

_hostage doMove position Boathouse;  //may not move as sticks on carrier
sleep 20.0;

deleteVehicle _hostage;

