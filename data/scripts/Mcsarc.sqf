//RENDITION MISSION
_user = _this select 0;
 _var = _this select 1;
_usergroup = (group player);
_pos = [0,0,0];
//added
_trgobj3 = objNull;
_start = [];
BIS_EVO_sobj1 = false;
_obj1 = [];
_guard=grpNull;
_guardb=grpNull;
_guardc=grpNull;
_pilot=grpNull;
_allobj = [];

_txtcommon = localize "STR_M04t0_5";
_txtfailhead = localize "STR_M04t2_6";//failed
_txtpasshead = localize "STR_M04t1_9";//complete
_txtpassbody = format["+%1 %2",_var,_txtcommon];

_MissionBriefingLong = localize "overview_c2b"; //cap officer
_MissionBriefingHUD = localize "strenemybaselocated"; //Enemy base located
_MissionBriefingShort = localize "STR_M04t24";//csar
//
_MissionBriefingHUD2 = localize "strwfcapture";//capture
_MissionBriefingHUD3 = localize "STR_M04t29_0";//rtb

_txthmid = localize "STR_M04t27_0";//a sec
_txtbmid = localize "str_t04_instructions_i_30";//escort back to base

_txtfailbody = localize "str_after_prizrak_killed_t_1";//pilot killed

_deletemsarc =
{
	deleteVehicle _trgobj3;
	deleteMarkerLocal _start;
	BIS_EVO_Onmission=false;
	player removeSimpleTask _obj1;
	sleep 2.0;
	_handle = [_guard] execVM "data\scripts\delete.sqf";
	_handle = [_guardb] execVM "data\scripts\delete.sqf";
	_handle = [_guardc] execVM "data\scripts\delete.sqf";
	_handle = [_pilot] execVM "data\scripts\delete.sqf";
	deleteVehicle _heli;
	deleteVehicle _heli1;
	deleteVehicle _heli2;
	deleteVehicle _heli3;
	deleteVehicle _heli4;
	deleteVehicle _heli5;
	deleteVehicle _heli6;
};

_Fail = 
{
	_obj1 settaskstate "Failed";
	hint "Rendition: Mission Failed\nOfficer dead";
	["#FF0000",_txtfailhead,_txtfailbody] call BIS_EVO_Message;
	[] call _deletemsarc;
};

[West,"HQ"] SideChat localize "STR_M04t64";
_allobj = ["mrnd24","mrnd25","mrnd26"];
if (_var == 40) then
{
	_allobj = ["mrnd24","mrnd25","mrnd26","mrnd27","mrnd28","mrnd29"]
};
if (_var == 30) then
{
	_allobj = ["mrnd27","mrnd28","mrnd29","mrnd30","mrnd23"]
};
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

if(_var == 20) then
{
	[1800] execVM "data\scripts\timer.sqf";
};

if(_var == 30) then
{
	[2100] execVM "data\scripts\timer.sqf";
};

if(_var == 40) then
{
	[2400] execVM "data\scripts\timer.sqf";
};

//map
_mapview = [_pos,1] execVM "data\scripts\mismap.sqf";

waitUntil {player distance _pos < 1500 or not BIS_EVO_Onmission};
//if (_usergroup != (group _user) or not BIS_EVO_Onmission) exitwith {[] call _Fail};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};

_pilot = createGroup (civilian);//officer

_allunits = EGG_EVO_meofficer;
_max = count _allunits;
_hostage = _pilot createUnit [_allunits select (round random (_max - 1)), _pos1, [], 0, "NONE"];Sleep BIS_EVO_GlobalSleep;

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

_guardc = createGroup (east);//2 bodyguards

_allunits = EGG_EVO_meguardc;
_max = count _allunits;

	_allunits select (round random (_max - 1)) createUnit [_pos1, _guardc];Sleep BIS_EVO_GlobalSleep;
	_allunits select (round random (_max - 1)) createUnit [_pos1, _guardc];Sleep BIS_EVO_GlobalSleep;	

_guardb = createGroup (east);//12 infantry

_dcounta = 11;
_d = 0;
while {_d <= _dcounta} do 
{
	_allunits select (round random (_max - 1)) createUnit [_pos2, _guardb];Sleep BIS_EVO_GlobalSleep;
	_d = _d+1;
	sleep 0.5;
};

	_wp1 = _guardb addWaypoint [_pos, 10];
	_wp2 = _guardb addWaypoint [_pos1, 10];
	_wp3 = _guardb addWaypoint [_pos3, 10];
	_wp4 = _guardb addWaypoint [_pos2, 10];
	[_guardb, 4] setWaypointType "CYCLE";

//vehicles

	_allvecA = EGG_EVO_mevlight;
	_allvecB = EGG_EVO_mevmed;
	_allvecC = EGG_EVO_mevheavya;
	_allvecD = EGG_EVO_mevheavyb;

	_maxA = count _allvecA;
	_maxB = count _allvecB;
	_maxC = count _allvecC;
	_maxD = count _allvecD;

	_heli = createVehicle [(_allvecA select round random (_maxA - 1)), _pos2, [], 0, "NONE"];
	Sleep BIS_EVO_GlobalSleep;
	_spawne = [_heli] spawn {[_this select 0] call BIS_EVO_idelSVEC};
//	[_heli] call BIS_EVO_Lock;
	_heli addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];

	_heli1 = createVehicle [(_allvecB select round random (_maxC - 1)), _pos3, [], 0, "NONE"];
	Sleep BIS_EVO_GlobalSleep;
	_spawne = [_heli1] spawn {[_this select 0] call BIS_EVO_idelSVEC};
//	[_heli1] call BIS_EVO_Lock;
	_heli1 addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];

	_heli2 = createVehicle [(_allvecC select round random (_maxD - 1)), _pos4, [], 0, "NONE"];
	Sleep BIS_EVO_GlobalSleep;
	_spawne = [_heli2] spawn {[_this select 0] call BIS_EVO_idelSVEC};
//	[_heli2] call BIS_EVO_Lock;
	_heli2 addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];

	_heli3 = createVehicle [(_allvecD select round random (_maxB - 1)), _pos5, [], 0, "NONE"];
	Sleep BIS_EVO_GlobalSleep;
	_spawne = [_heli3] spawn {[_this select 0] call BIS_EVO_idelSVEC};
//	[_heli3] call BIS_EVO_Lock;
	_heli3 addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];

	_heli4 = createVehicle [(EGG_EVO_meflag select 0), _pos1, [], 20, "NONE"];
	Sleep BIS_EVO_GlobalSleep;
	_spawne = [_heli4] spawn {[_this select 0] call BIS_EVO_idelSVEC};
	_heli4 addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];

	_heli5 = createVehicle ["Land_Fire_burning", _pos1, [], 20, "NONE"];
	Sleep BIS_EVO_GlobalSleep;
	_spawne = [_heli5] spawn {[_this select 0] call BIS_EVO_idelSVEC};
	_heli5 addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];

	_heli6 = createVehicle [(EGG_EVO_mehq select 0), _pos1, [], 10, "NONE"];
	Sleep BIS_EVO_GlobalSleep;
	_spawne = [_heli6] spawn {[_this select 0] call BIS_EVO_idelSVEC};
	_heli6 addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];

_guard = createGroup (east);//4 vehicles and 9 crew

_allunits = EGG_EVO_meguardd;
_max = count _allunits;

_dcounta = 8;
_d = 0;
while {_d <= _dcounta} do 
{
	(_allunits select round random (_max - 1)) createUnit [_pos, _guard];Sleep BIS_EVO_GlobalSleep;
	_d = _d+1;
	sleep 0.5;
};

(units _guard select 0) assignAsDriver _heli;
(units _guard select 0) moveInDriver _heli;
(units _guard select 1) assignAsCargo _heli;
(units _guard select 1) moveInCargo _heli;

(units _guard select 2) assignAsDriver _heli1;
(units _guard select 2) moveInDriver _heli1;
(units _guard select 3) assignAsGunner _heli1;
(units _guard select 3) moveInGunner _heli1;

(units _guard select 4) assignAsDriver _heli2;
(units _guard select 4) moveInDriver _heli2;
(units _guard select 5) assignAsGunner _heli2;
(units _guard select 5) moveInGunner _heli2;
(units _guard select 6) assignAsCargo _heli2;
(units _guard select 6) moveInCargo _heli2;

(units _guard select 7) assignAsDriver _heli3;
(units _guard select 7) moveInDriver _heli3;
(units _guard select 8) assignAsGunner _heli3;
(units _guard select 8) moveInGunner _heli3;

{_x addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}]} forEach (units _guard);
{_x addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}]} forEach (units _guardb);
{_x addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}]} forEach (units _guardc);

_recy = [_user,_pilot] execVM "data\scripts\grecycle.sqf";
_recy = [_user,_guard] execVM "data\scripts\grecycle.sqf";
_recy = [_user,_guardb] execVM "data\scripts\grecycle.sqf";	
_recy = [_user,_guardc] execVM "data\scripts\grecycle.sqf";	

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

//_pos = position vehicle (units _pilot select 0);
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
//if (_usergroup != (group _user)) exitwith {[] call _Fail};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};
if (not alive _hostage) exitwith {[] call _Fail};

sleep 1.0;

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
{if(isplayer _x) then {_x doFollow leader _x}} foreach units (group player);
["#FF0000",_txtpasshead,_txtpassbody] call BIS_EVO_Message;
[West,"HQ"] SideChat localize "STR_M04t65";playSound "Goodjob";
sleep 5;
[West,"HQ"] SideChat localize "str_m04t66";//officer cap

BIS_EVO_punit = _usergroup;
BIS_EVO_prew  = _var;
publicVariable "BIS_EVO_prew";
publicVariable "BIS_EVO_punit";
_obj1 settaskstate "Succeeded";
sleep 1.0;

[] call _deletemsarc;

_hostage doMove (position safty);
sleep 20.0;

deleteVehicle _hostage;
