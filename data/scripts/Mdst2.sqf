//EXTERMINATE CULT mission
_user = _this select 0;
_var = _this select 1;
_usergroup = (group player);
_allobj = [];
_pos = [0,0,0];
_obj1 = [];
_guard=grpNull;
_guarda=grpNull;
_guardb=grpNull;

//added but not verified
_txtcommon = localize "STR_M04t0_5";// points
_txtfailhead = localize "STR_M04t2_6";//ass failed
_txtpasshead = localize "STR_M04t1_9";// ass comp
_txtpassbody = format["+%1 %2",_var,_txtcommon];

_MissionBriefingLong = localize "strn_x_mission_kill_them_all";//armor spotted
_MissionBriefingHUD = localize "init.sqf2_14";// secure village
_MissionBriefingShort = localize "strn_x_mission_kill_them_all";// kill em all
_txtfailbody = localize "str_t04_instructions_i_43";// wtf

_deletemdst2 =
{
	BIS_EVO_Onmission=false;
	player removeSimpleTask _obj1;
	sleep 12.0;
	_handle = [_guard] execVM "data\scripts\delete.sqf";
	_handle = [_guarda] execVM "data\scripts\delete.sqf";
	_handle = [_guardb] execVM "data\scripts\delete.sqf";
	_recy = [_user,_guard] execVM "data\scripts\grecycle.sqf";
	_recy2 = [_user,_guarda] execVM "data\scripts\grecycle.sqf";
	_recy3 = [_user,_guardb] execVM "data\scripts\grecycle.sqf";
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
	["#FF0000",_txtfailhead,_txtfailbody] call BIS_EVO_Message;
	[] call _deletemdst2;
};

[West,"HQ"] SideChat localize "STR_M04t64";

//LOCATIONS VARY ON RANK

_allobj = ["mrnd3","mrnd6","mrnd17","mrnd18","mrnd26"];

if(_var == 20) then
{
	_allobj = ["mrnd4","mrnd7","mrnd5","mrnd14","mrnd29"]
};
if(_var == 40) then
{
	_allobj = ["mrnd28","mrnd29","mrnd31","mrnd15","mrnd21","mrnd4","mrnd7","mrnd25","mrnd14","mrnd29"]
};

_max = (count _allobj)-1;
_rand =  _allobj select (round random _max);
_pos = getMarkerPos _rand;

_obj1 = player createSimpleTask ["obj1"];
_obj1 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
_obj1 setSimpleTaskDestination _pos;
_obj1 settaskstate "Created";
player setCurrentTask _obj1;

_mapview = [_pos,2] execVM "data\scripts\mismap.sqf";

if(_var == 10) then
{	
	[420,_pos] execVM "data\scripts\countdown.sqf";
};
if(_var == 20) then
{
	[600,_pos] execVM "data\scripts\countdown.sqf";
};
if(_var == 40) then
{
	[780,_pos] execVM "data\scripts\countdown.sqf";
};

if (_var != 10 && _var != 20 && _var != 40) then {hint "var error"; [] call _Fail};

waitUntil {player distance _pos < 1500 or not BIS_EVO_Onmission};
//if (_usergroup != (group _user) or not BIS_EVO_Onmission) exitwith {[] call _Fail};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};

//4 VEHICLES

_allvecA = EGG_EVO_mcvconvoya;
_allvecB = EGG_EVO_mcvconvoyb;
_allvecC = EGG_EVO_mcvconvoyc;
_allvecD = EGG_EVO_mcvconvoyd;

_maxA = count _allvecA;
_maxB = count _allvecB;
_maxC = count _allvecC;
_maxD = count _allvecD;

_heli = createVehicle [(_allvecA select round random (_maxA - 1)), _pos, [], 100, "NONE"];[_heli] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_pos = position _heli;
_heli1 = createVehicle [(_allvecB select round random (_maxB - 1)), _pos, [], 100, "NONE"];[_heli1] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_heli2 = createVehicle [(_allvecC select round random (_maxC - 1)), _pos, [], 100, "NONE"];[_heli2] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_heli3 = createVehicle [(_allvecD select round random (_maxD - 1)), _pos, [], 100, "NONE"];[_heli3] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;

_spawne = [_heli] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_spawne = [_heli1] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_spawne = [_heli2] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_spawne = [_heli3] spawn {[_this select 0] call BIS_EVO_idelSVEC};

_heli addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}];
_heli1 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}];
_heli2 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}];
_heli3 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}];

//GROUP 1 = 21 UNARMED CIVS

_guard = createGroup (east);

_allunits = EGG_EVO_civ5; //woodlanders
_max = (count _allunits)-1;

_extrmguard = 21;
_d = 0;
while {_d <= _extrmguard} do 
{
	_unit = _guard createUnit [_allunits select (round random _max), _pos, [], 6, "FORM"];
	[_unit] join _guard;
	_d = _d+1;
	Sleep BIS_EVO_GlobalSleep;
};

{_x addEventHandler ["killed", {_x setCombatMode "RED";commandStop _x;handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}]} forEach (units _guard);

//4 IN TRUCK
	(units _guard select 0) assignAsDriver _heli;
	(units _guard select 0) moveInDriver _heli;
	sleep 0.2;
	(units _guard select 1) assignAsCargo _heli;
	(units _guard select 1) moveInCargo _heli;
	sleep 0.2;
	(units _guard select 2) assignAsCargo _heli;
	(units _guard select 2) moveInCargo _heli;
	sleep 0.2;
	(units _guard select 3) assignAsCargo _heli;
	(units _guard select 3) moveInCargo _heli;
	sleep 0.2;
//2 IN HATCHBACK
	(units _guard select 4) assignAsDriver _heli1;
	(units _guard select 4) moveInDriver _heli1;
	sleep 0.2;
	(units _guard select 5) assignAsCargo _heli1;
	(units _guard select 5) moveInCargo _heli1;
//1 ON BIKE
	sleep 0.2;
	(units _guard select 6) assignAsDriver _heli2;
	(units _guard select 6) moveInDriver _heli2;
//4 IN CAR
	sleep 0.2;
	(units _guard select 7) assignAsDriver _heli3;
	(units _guard select 7) moveInDriver _heli3;
	sleep 0.2;
	(units _guard select 8) assignAsCargo _heli3;
	(units _guard select 8) moveInCargo _heli3;
	sleep 0.2;
	(units _guard select 9) assignAsCargo _heli3;
	(units _guard select 9) moveInCargo _heli3;
	sleep 0.2;
	(units _guard select 10) assignAsCargo _heli3;
	(units _guard select 10) moveInCargo _heli3;

//10 ON FOOT

//GROUP 2 = 6 armed villagers + 4 more if major

_rndx = random 100;
_rndy = random 100;
_pos1 = [(_pos select 0)-50 +_rndx,(_pos select 1)-50+_rndy,0];

_allunits = EGG_EVO_civ6;//priests and doctors
_max = (count _allunits)-1;

_guarda = createGroup (east);

_extrmguard = 6;
if (_var == 40) then {_extrmguard = 12};

_d = 0;
while {_d <= _extrmguard} do 
{
	_unit = _guarda createUnit [_allunits select (round random _max), _pos1, [], 12, "FORM"];
	[_unit] join _guarda;
	_d = _d+1;
	Sleep BIS_EVO_GlobalSleep;
};


{_x addEventHandler ["killed", {_x setCombatMode "RED";commandStop _x;handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}]} forEach (units _guarda);

//GROUP 3 = LARGE GROUP OF 18 ARMED VILLAGERS 

_rndx1 = random 200;
_rndy1 = random 200;
_pos2 = [(_pos select 0)-100 +_rndx1,(_pos select 1)-100+_rndy1,0];

_guardb = createGroup (east);

_allunits = EGG_EVO_east5;//armed woodlanders
_max = (count _allunits)-1;

_extrmguard = 2;
if (_var == 40) then {_extrmguard = 23};

_d = 0;
while {_d <= _extrmguard} do 
{
	_unit = _guardb createUnit [_allunits select (round random _max), _pos2, [], 50, "NONE"];
	[_unit] join _guardb;
	_d = _d+1;
	Sleep BIS_EVO_GlobalSleep;
};

{_x addEventHandler ["killed", {_x setCombatMode "RED";commandStop _x;handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}]} forEach (units _guardb);

_heli4 = createVehicle ["Land_Ind_TankSmall", _pos1, [], 25, "NONE"];
_heli5 = createVehicle ["Land_Fire_barrel_burning", _pos1, [], 15, "NONE"];
_heli6 = createVehicle ["Land_tent_east", _pos1, [], 0, "NONE"];

sleep 1.0;

_heli = assignedVehicle (units _guard select 0);
_heli1 = assignedVehicle (units _guard select 4);
_heli2 = assignedVehicle (units _guard select 6);
_heli3 = assignedVehicle (units _guard select 7);

_obj1 setSimpleTaskDestination  position (leader _guard);

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
//	if ((count units _guard) == 0 or _usergroup != (group _user) or not BIS_EVO_Onmission) then {_loop=1;};
	if (count units _guard > 0) then {_obj1 setSimpleTaskDestination  position (leader _guard)};
	if ((count units _guard == 0) and (count units _guarda >0)) then {_obj1 setSimpleTaskDestination  position (leader _guarda)};
	if ((count units _guard == 0) and (count units _guarda == 0) and (count units _guardb >0)) then {_obj1 setSimpleTaskDestination  position (leader _guardb)};
	if ((count units _guard == 0) and (count units _guarda == 0) and (count units _guardb == 0)) then {_loop=1};
	if (not BIS_EVO_Onmission) then {_loop=1};
	sleep 1.001;
};

//if (_usergroup != (group _user) or not BIS_EVO_Onmission) exitwith {[] call _Fail};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};

{if(isplayer _x) then {_x doFollow leader _x}} foreach units (group player);

["#FF0000",_txtpasshead,_txtpassbody] call BIS_EVO_Message;
[West,"HQ"] SideChat localize "str_call_from_fob_m_3";
sleep 5;
[West,"HQ"] SideChat localize "str_nikolayevs_house_explosion_y_7";
sleep 5;
[West,"HQ"] SideChat localize "STR_M04t65";playSound "Goodjob";
BIS_EVO_punit = _usergroup;
BIS_EVO_prew  = _var;
publicVariable "BIS_EVO_prew";
publicVariable "BIS_EVO_punit";
_obj1 settaskstate "Succeeded";
sleep 1.0;
[] call _deletemdst2;
