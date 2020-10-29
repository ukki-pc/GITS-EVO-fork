//defence mission - requires 5 bases in mission file

_user = _this select 0;
_var = _this select 1;
_usergroup = (group player);
_pos = (position abase1);
_base = objNull;
//mbase = objNull;
_bases = [];
_trgobj3 = objNull;
_start = [];
BIS_EVO_sobj1=false;
_obj1 = [];
_guardb = grpNull;
_pilot = grpNull;

_txtcommon = localize "STR_M04t0_5";
_txtfailhead = localize "STR_M04t2_6";//failed
_txtpasshead = localize "STR_M04t1_9";//complete
_txtpassbody = format["+%1 %2",_var,_txtcommon];

_MissionBriefingLong = localize "STR_M04t38_0";
_MissionBriefingHUD = localize "STR_M04t36_0";
_MissionBriefingShort = localize "STR_M04t37_0";
_txtfailbody = localize "STR_M04t41_0";

_txthmid = localize "STR_M04t39_0";
_txtbmid = localize "STR_M04t40";

//adding
_bases = [abase1,abase2,abase3,abase4,abase5];
_max = (count _bases)-1;
cbase = _bases select (round random _max);
_pos = position cbase;

_deletemdef = 
{
	deleteVehicle _trgobj3;
	deleteMarkerLocal _start;
	BIS_EVO_Onmission=false;
	player removeSimpleTask _obj1;
	sleep 12.0;
	_handle = [_pilot] execVM "data\scripts\delete.sqf";
	Sleep 1.0;
	_handle = [_guardb] execVM "data\scripts\delete.sqf";
	deleteVehicle _heli;
	deleteVehicle _heli2;
	deleteVehicle _heli1;
};

_Fail = 
{
	_obj1 settaskstate "Failed";
	["#FF0000",_txtfailhead,_txtfailbody] call BIS_EVO_Message;
	[] call _deletemdef;
};

[West,"HQ"] SideChat localize "STR_M04t64";

_obj1 = player createSimpleTask ["obj1"];
_obj1 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
_obj1 setSimpleTaskDestination _pos;
_obj1 settaskstate "Created";
player setCurrentTask _obj1;

[1800] execVM "data\scripts\timer.sqf";
_mapview = [_pos,1] execVM "data\scripts\mismap.sqf";	

waitUntil {player distance _pos < 1500 or not BIS_EVO_Onmission};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};

_pilot = createGroup (west);
_allunits = EGG_EVO_mfteam;
_max = (count _allunits)-1;	

_dcounta = 12;
_d = 0;
while {_d <= _dcounta} do 
{
	_unit = _pilot createUnit [_allunits select (round random _max), _pos, [], 2, "FORM"];
	_unit addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
	[_unit] join _pilot;
	_d = _d+1;
	sleep 1;
};

_allvecA = EGG_EVO_mfvlighta;
_maxA = (count _allvecA)-1;
_heli1 = createVehicle [(_allvecA select (round random _maxA)), _pos, [], 0, "NONE"];Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli1] spawn {[_this select 0] call BIS_EVO_idelSVEC};
[_heli1] call BIS_EVO_Lock;
_heli1 setFuel 0.0;
_heli1 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
sleep 0.2;
(units _pilot select 0) assignAsDriver _heli1;
(units _pilot select 0) moveInDriver _heli1;
sleep 0.2;
(units _pilot select 1) assignAsGunner _heli1;
(units _pilot select 1) moveInGunner _heli1;
{commandStop _x;_x addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];_x commandFollow (leader _x)} forEach (units _pilot);
sleep 1.0;

_allvecB = EGG_EVO_mfhq;
_maxB = (count _allvecB)-1;

_heli = createVehicle [(_allvecB select (round random _maxB)), _pos, [], 30, "NONE"];Sleep BIS_EVO_GlobalSleep;
//_recy = [_user,_heli] execVM "data\scripts\grecycle.sqf";

_start = createMarkerLocal ["look", _pos];
_start setMarkerColorLocal "ColorGreen";
_start setMarkerShapeLocal "RECTANGLE";
_start setMarkerSizeLocal [200, 200];
_start setMarkerBrushLocal "FDiagonal";

_base = createTrigger ["EmptyDetector", _pos ];
_base setTriggerActivation ["ANY", "PRESENT", false];
_base setTriggerArea [200, 200, 0, true];

[player,_base,_pilot] execVM "data\scripts\bAttack.sqf";
[player,_base,_pilot] execVM "data\scripts\bAttack.sqf";

_countb = 0;
for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 1.001;
	if ((vehicle player) in list _base) then {_countb = _countb +1};//temp to take off noisy hint after leader death- else {["#FF0000",_txthmid,_txtbmid] call BIS_EVO_Message};
	if (_countb == 240) then 
	{
		_trgobj3 = createTrigger ["EmptyDetector", _pos ];
		_trgobj3 setTriggerActivation ["EAST", "NOT PRESENT", false];
		_trgobj3 setTriggerArea [300, 300, 0, true];
		_trgobj3 setTriggerStatements ["this", "BIS_EVO_sobj1 = true", ""];
		_trgobj3 setTriggerTimeout [20, 20, 20, true ];	
	};
	if (BIS_EVO_sobj1) then {_loop=1;};
//	if (_usergroup != (group _user)) then {_loop=1;};
	if (not BIS_EVO_Onmission) then {_loop=1;};
	if (count units _pilot == 0) then {_loop=1};
};

//if (_usergroup != (group _user)) exitwith {[] call _Fail};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};
if(count units _pilot == 0) exitwith {[] call _Fail};
[_usergroup, 1] setWaypointPosition [position player, 0];
{if(isplayer _x) then {_x doFollow leader _x}} foreach units (group player);
["#FF0000",_txtpasshead,_txtpassbody] call BIS_EVO_Message;
[West,"HQ"] SideChat localize "STR_M04t65";playSound "Goodjob";
BIS_EVO_punit = _usergroup;
BIS_EVO_prew  = _var;
publicVariable "BIS_EVO_prew";
publicVariable "BIS_EVO_punit";
_obj1 settaskstate "Succeeded";

sleep 1.0;

[] call _deletemdef;
