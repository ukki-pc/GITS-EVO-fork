_user = _this select 0;
_var = _this select 1;
_usergroup = (group player);
_pos = [0,0,0];
_trgobj3 = objNull;
_start = [];
BIS_EVO_sobj1 = false;
_obj1 = [];
_guard=grpNull;
_guardb=grpNull;
_pilot=grpNull;

_txtcommon = localize "STR_M04t0_5";//points
_txtfailhead = localize "STR_M04t2_6";//failed
_txtpasshead = localize "STR_M04t1_9";//complete
_txtpassbody = format["+%1 %2",_var,_txtcommon];

_MissionBriefingLong = localize "STR_M04t33";//distress call
_MissionBriefingHUD = localize "STR_M04t31";//loc pilot
_MissionBriefingShort = localize "STR_M04t32";//csarII

_MissionBriefingHUD2 = localize "STR_M04t26_0";//secure area
_MissionBriefingHUD3 = localize "STR_M04t29_0";//rtb

_txthmid = localize "STR_M04t27_0";//area sec
_txtbmid = localize "STR_M04t34_0";//escort pilot

_txtfailbody = localize "STR_M04t35_0";//pilot killed

_deletemsar =
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
	Sleep 600.0;
	deleteVehicle _heli;
};

_Fail = 
{
	_obj1 settaskstate "Failed";
	["#FF0000",_txtfailhead,_txtfailbody] call BIS_EVO_Message;
	[] call _deletemsar;
};

[West,"HQ"] SideChat localize "STR_M04t64";//good luck

//adding area placement markers
_possw = getmarkerpos "mpilot";
_posne = getmarkerpos "mpilota";
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

//map
[1800] execVM "data\scripts\timer.sqf";
_mapview = [_pos,1] execVM "data\scripts\mismap.sqf";

waitUntil {player distance _pos < 1000 or not BIS_EVO_Onmission};
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

_heli = createVehicle ["UH1Wreck", _pos, [], 400, "NONE"];_recy = [_user,_heli] execVM "data\scripts\recycle.sqf";Sleep BIS_EVO_GlobalSleep;
_heli setDir (random 359);

_allunits = EGG_EVO_mfpilot;
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

_allunits = EGG_EVO_meguardb;
_max = count _allunits;

_unit = _guard createUnit [(_allunits select round random (_max - 1)), _ppos, [], 30, "NONE"];Sleep BIS_EVO_GlobalSleep;
_unit = _guard createUnit [(_allunits select round random (_max - 1)), _ppos, [], 30, "NONE"];Sleep BIS_EVO_GlobalSleep;

_allunits select (round random (_max - 1)) createUnit [_pos, _guardb];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos, _guardb];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos, _guardb];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos, _guardb];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos, _guardb];Sleep BIS_EVO_GlobalSleep;
_allunits select (round random (_max - 1)) createUnit [_pos, _guardb];Sleep BIS_EVO_GlobalSleep;

_wp1 = _guardb addWaypoint [_pos, 10];
_wp2 = _guardb addWaypoint [_ppos, 10];
_wp3 = _guardb addWaypoint [_pposb, 10];
_wp4 = _guardb addWaypoint [_ppos, 10];
[_guardb, 4] setWaypointType "CYCLE";

_allvecA = EGG_EVO_mevlight;
_maxA = count _allvecA;
_heli2 = createVehicle [(_allvecA select round random (_maxA - 1)), _pos, [], 0, "NONE"];
Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli2] spawn {[_this select 0] call BIS_EVO_idelSVEC};
[_heli2] call BIS_EVO_Lock;
_heli2 addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];
(units _guardb select 0) assignAsDriver _heli2;
(units _guardb select 0) moveInDriver _heli2;
(units _guardb select 1) assignAsGunner _heli2;
(units _guardb select 1) moveInGunner _heli2;

{_x addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}]} forEach (units _guard);
{_x addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}]} forEach (units _guardb);
_recy = [_user,_pilot] execVM "data\scripts\grecycle.sqf";
_recy = [_user,_guard] execVM "data\scripts\grecycle.sqf";
_recy = [_user,_guardb] execVM "data\scripts\grecycle.sqf";	

_pos = position vehicle (units _pilot select 0); 
//_pos = position vehicle _hostage;

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

sleep 1.0;

_MissionBriefingHUD = localize "str_m04t34_0";//escort pilot back to base
_obj1 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
_obj1 setSimpleTaskDestination position dropoff;
["#00FF00",_txthmid,_txtbmid] call BIS_EVO_Message;

[_hostage] join _usergroup;

_hostage setdamage 0;
_hostage setCaptive false;
_hostage enableAI "MOVE";
//adding
_hostage addWeapon "M9";_x addMagazine "15Rnd_9x19_M9";_x addMagazine "15Rnd_9x19_M9";_x addMagazine "15Rnd_9x19_M9";_x addMagazine "15Rnd_9x19_M9";	
_hostage doFollow (leader _usergroup);
 
for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 1.001;
//	if ((_hostage select 0) distance dropoff < 20) then {_loop=1};
	if (_hostage distance dropoff < 10) then {_loop=1};
	if (not alive _hostage) then {_loop=1};
	if (not BIS_EVO_Onmission) then {_loop=1;};
};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};
if (not alive _hostage) exitwith {[] call _Fail};

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

[] call _deletemsar;

_hostage doMove (position safty);
sleep 20.0;

deleteVehicle _hostage;


