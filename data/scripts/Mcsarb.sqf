//basic rank search and rescue (doctor) mission
_user = _this select 0;
_var = _this select 1;
//_usergroup = (group _user);
_usergroup = (group player);
_pos = [0,0,0];
_trgobj3 = objNull;
_start = [];
BIS_EVO_sobj1 = false;
_obj1 = [];
_guard=grpNull;
_guardb=grpNull;
_pilot=grpNull;

_txtcommon = localize "STR_M04t0_5";
_txtfailhead = localize "STR_M04t2_6";//failed
_txtpasshead = localize "STR_M04t1_9";//complete
_txtpassbody = format["+%1 %2",_var,_txtcommon];

_MissionBriefingLong = localize "STR_M04t25_0";
_MissionBriefingHUD = localize "STR_M04t23_0";
_MissionBriefingShort = localize "STR_M04t24";

_MissionBriefingHUD2 = localize "STR_M04t26_0";
_MissionBriefingHUD3 = localize "STR_M04t29_0";

_txthmid = localize "STR_M04t27_0";
_txtbmid = localize "STR_M04t28";

_txtfailbody = localize "STR_M04t30_0";

_deletemsarb =
{
	deleteVehicle _trgobj3;
	deleteMarkerLocal _start;
	BIS_EVO_Onmission=false;
	player removeSimpleTask _obj1;
	Sleep 1.0;
	_handle = [_guard] execVM "data\scripts\delete.sqf";
	Sleep 1.0;
	_handle = [_guardb] execVM "data\scripts\delete.sqf";
	Sleep 1.0;
	_handle = [_pilot] execVM "data\scripts\delete.sqf";	
};

_Fail = 
{
	_obj1 settaskstate "Failed";
	["#FF0000",_txtfailhead,_txtfailbody] call BIS_EVO_Message;
	[] call _deletemsarb;
};

[West,"HQ"] SideChat localize "STR_M04t64";

//adding area placement markers
_possw = getmarkerpos "mreporter";
_posne = getmarkerpos "mreportera";
_xmax = ((_posne select 0)-(_possw select 0))-400;
_ymax = ((_posne select 1)-(_possw select 1))-400;
//hint format["xmax: %1 ymax: %2",_xmax, _ymax];
//sleep 5;
_pos = [(((_possw select 0)+(random _xmax))+200),(((_possw select 1)+(random _ymax))+200),0];
//hint format["pos x: %1 y: %2 z: %3",(_pos select 0),(_pos select 1),(_pos select 2)];

_obj1 = player createSimpleTask ["obj1"];
_obj1 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
_obj1 setSimpleTaskDestination _pos;
_obj1 settaskstate "Created";
player setCurrentTask _obj1;

[1800] execVM "data\scripts\timer.sqf";
//map
_mapview = [_pos,1] execVM "data\scripts\mismap.sqf";

waitUntil {player distance _pos < 1500 or not BIS_EVO_Onmission};
//if (_usergroup != (group _user) or not BIS_EVO_Onmission) exitwith {[] call _Fail};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};

_pilot = createGroup (civilian);
_guard = createGroup (east);
_guardb = createGroup (east);

_rndx = random 400;
_rndy = random 400;
_rndbx = random 400;
_rndby = random 400;
_ppos = [(_pos select 0)-200 +_rndx,(_pos select 1)-200+_rndy,0];
_pposb = [(_pos select 0)-200 +_rndbx,(_pos select 1)-200+_rndby,0];

_allunits = EGG_EVO_mdoctor;
_max = count _allunits;
_hostage = _pilot createUnit [_allunits select (round random (_max - 1)), _ppos, [], 0, "NONE"];Sleep BIS_EVO_GlobalSleep;

{
_x disableAI "MOVE";
_x allowfleeing 0;
_x setBehaviour "Careless";
removeallweapons _x;
_x setCaptive true;
commandStop _x;
_x addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}]
} forEach units _pilot;

sleep 1.0;

{
_x switchMove "AmovPercMstpSsurWnonDnon";
} forEach units _pilot;

_allunits = EGG_EVO_meguard;
_max = count _allunits;

_allunits select (round random (_max - 1)) createUnit [_pposb, _guard];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pposb, _guard];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pposb, _guard];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pposb, _guard];Sleep BIS_EVO_GlobalSleep;

_allunits select (round random (_max - 1)) createUnit [_ppos, _guardb];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_ppos, _guardb];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_ppos, _guardb];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_ppos, _guardb];Sleep BIS_EVO_GlobalSleep;
{_x addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}]} forEach (units _guard);
{_x addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}]} forEach (units _guardb);
_wp1 = _guardb addWaypoint [_pos, 20];
_wp2 = _guardb addWaypoint [_ppos, 20];
_wp3 = _guardb addWaypoint [_pposb, 20];
_wp4 = _guardb addWaypoint [_ppos, 20];
[_guardb, 4] setWaypointType "CYCLE";
_guardb setCurrentWaypoint [_guardb, 3];

_wp1 = _guard addWaypoint [_pos, 10];
_wp2 = _guard addWaypoint [_ppos, 10];
_wp3 = _guard addWaypoint [_pos, 10];
_wp4 = _guard addWaypoint [_ppos, 10];
[_guard, 4] setWaypointType "CYCLE";
_guard setCurrentWaypoint [_guard, 2];
{
	_x addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];
} forEach (units _guard);

{
	_x addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];
} forEach (units _guardb);

_recy = [_user,_pilot] execVM "data\scripts\grecycle.sqf";
_recy = [_user,_guard] execVM "data\scripts\grecycle.sqf";
_recy = [_user,_guardb] execVM "data\scripts\grecycle.sqf";	

//_pos = position vehicle (units _pilot select 0);

_trgobj3 = createTrigger ["EmptyDetector", _pos ];
_trgobj3 setTriggerActivation ["EAST", "NOT PRESENT", false];
_trgobj3 setTriggerArea [200, 200, 0, true];
_trgobj3 setTriggerTimeout [10, 10, 10, true];
_trgobj3 setTriggerStatements ["this", "BIS_EVO_sobj1 = true", ""];

_start = createMarkerLocal ["look", _pos];
_start setMarkerColorLocal "ColorGreen";
_start setMarkerShapeLocal "RECTANGLE";
_start setMarkerSizeLocal [200, 200];
_start setMarkerBrushLocal "FDiagonal";

_obj1 setSimpleTaskDestination _pos;

waitUntil {player distance _pos < 100 or not BIS_EVO_Onmission};

_obj1 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD2];

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 1.001;
	if (BIS_EVO_sobj1) then {_loop=1;};
//	if (_usergroup != (group _user)) then {_loop=1;};
	if (not BIS_EVO_Onmission) then {_loop=1;};
	if (not alive _hostage) then {_loop=1;};
};
//if (_usergroup != (group _user)) exitwith {[] call _Fail};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};
if (not alive _hostage) exitwith {[] call _Fail};

_obj1 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD3];
_obj1 setSimpleTaskDestination position dropoff;
["#00FF00",_txthmid,_txtbmid] call BIS_EVO_Message;

[_hostage] join _usergroup;

_hostage setdamage 0;
_hostage setCaptive false;
_hostage enableAI "MOVE";
_hostage doFollow (leader _usergroup);

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 1.001;
	if (_hostage distance dropoff < 10) then {_loop=1};
	if (not alive _hostage) then {_loop=1};
	if (not BIS_EVO_Onmission) then {_loop=1;};
};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};
if (not alive _hostage) exitwith {[] call _Fail};

_hostage action ["Eject",(vehicle _hostage)];	
unassignVehicle _hostage;
[_hostage] join grpNull;
//{if(isplayer _x) then {_x doFollow leader _x}} foreach units (group _user);
{if(isplayer _x) then {_x doFollow leader _x}} foreach units (group player);
["#FF0000",_txtpasshead,_txtpassbody] call BIS_EVO_Message;
[West,"HQ"] SideChat localize "STR_M04t65";playSound "Goodjob";
BIS_EVO_punit = _usergroup;
BIS_EVO_prew  = _var;
publicVariable "BIS_EVO_prew";
publicVariable "BIS_EVO_punit";
_obj1 settaskstate "Succeeded";

sleep 1.0;
[] call _deletemsarb;

_hostage doMove (position safty);
sleep 20.0;

deleteVehicle _hostage;
