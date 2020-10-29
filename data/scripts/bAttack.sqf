//defend mission part 2
_user = _this select 0;
_username = name _user;
_center = _this select 1;
_ggroup = _this select 2;
_pos = position _center;
_guardb = grpNull;
_usergroup = (group player);
_rndx = 0;
_rndy = 0;

waitUntil {player distance _pos < 40};

BIS_EVO_makeGb =
{
	_dir = round (random 3);
	if (_dir == 0) then //north
	{
		_rndx = random 500;
		_rndy = 500;
	};
	if (_dir == 1) then //south
	{
		_rndx = random 500;
		_rndy = 0;
	};	
	if (_dir == 2) then //east
	{
		_rndx = 500;
		_rndy = random 500;
	};
	if (_dir == 3) then //west
	{
		_rndx = 0;
		_rndy = random 500;		
	};
	_ppos = [(_pos select 0)-200 +_rndx,(_pos select 1)-200+_rndy,0];
	_guardb = createGroup (east);
	_allunits = EGG_EVO_meguarde;
	_max = (count _allunits)-1;	
	_dcountc = 15;
	_d = 0;
	while {_d <= _dcountc} do 
	{
		_unit = _guardb createUnit [_allunits select (round random _max), _ppos, [], 2, "FORM"];
		_unit addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
		[_unit] join _guardb;
		_d = _d+1;
		sleep 1;
	};
	_wp1 = _guardb addWaypoint [_pos, 0];
	_dice = round (random 1);
	if (_dice == 1) then
	{
		_allvecA = EGG_EVO_mevlight+EGG_EVO_mevmeda;
		_maxA = (count _allvecA)-1;
		_heli2 = createVehicle [(_allvecA select (round random _maxA)), _ppos, [], 2, "NONE"];Sleep BIS_EVO_GlobalSleep;
		_spawne = [_vec2] spawn {[_this select 0] call BIS_EVO_idelSVEC};
		[_heli2] call BIS_EVO_Lock;
		_heli2 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
		(units _guardb select 0) assignAsDriver _heli2;Sleep BIS_EVO_GlobalSleep;
		(units _guardb select 0) moveInDriver _heli2;Sleep BIS_EVO_GlobalSleep;
		(units _guardb select 1) assignAsGunner _heli2;Sleep BIS_EVO_GlobalSleep;
		(units _guardb select 1) moveInGunner _heli2;	
	};	
	{_x setCombatMode "RED";_x addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}]} forEach (units _guardb);
	_recy = [_user,_guardb] execVM "data\scripts\grecycle.sqf";
};

[] call BIS_EVO_makeGb;

_countd = 0;

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	_lcount = 0;
	{if(alive _x) then {_lcount = _lcount +1}} forEach units _guardb;
	if ((vehicle player) in list _center) then {_countd = _countd +1};
	if (_countd == 240) then {_loop=1};
	sleep 1.001;
	if(_lcount == 0) then {[] call BIS_EVO_makeGb};
	if (count units _ggroup == 0) then {_loop=1};
};

sleep 30.0;
_handle = [_guardb] execVM "data\scripts\delete.sqf";
