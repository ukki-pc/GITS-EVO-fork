// Movement orders for patroling enemy Air.
_grp = _this select 0;
_countflt = (count BIS_EVO_MissionTowns)-1; //= 11

_wp = _grp addWaypoint [getMarkerpos (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress), 100];//current town

_iflt=0;
while {_iflt < 2} do 
{
	_wp = _grp addWaypoint [getMarkerpos (BIS_EVO_MissionTowns select (round random 4)), 100];//4 random towns
	_iflt=_iflt+1;
	Sleep 0.5;
};
while {_iflt < 4} do 
{
	_wp = _grp addWaypoint [getMarkerpos (BIS_EVO_MissionTowns select (round random _countflt)), 100];//4 random towns
	_iflt=_iflt+1;
	Sleep 0.5;
};
//adding to prevent sticking in sea or at spawnpoint
_wp = _grp addWaypoint [getMarkerpos "airfmarker", 100];//main airbase
[_grp, 6] setWaypointType "CYCLE";

_wp1 = _grp addWaypoint [[0,0,0], 10];

[_grp, 1] setWaypointStatements ["never", ""];

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{

	_allobj = BIS_EVO_MissionTowns;
	_currentobj = [];
	_max = count _allobj; //12
	_i = 0;
	while {_i < _max} do 
	{
		_marker = (_allobj select _i);
		_pos = getMarkerPos _marker;
		if ((_pos select 0) != 0) then 
		{
			_currentobj = _currentobj + [_marker];

		};
		_i = _i + 1;
		sleep 0.3;
	};
	_max = count _currentobj;
	_r = round random (_max - 1);
	_rand =  _currentobj select _r;
	_pos = getMarkerPos _rand;
	[_grp, 1] setWaypointPosition [_pos, 0];
	_grp setSpeedMode "LIMITED";
	if ((date select 3) < 4 or (date select 3) > 20) then
	{
		_grp setBehaviour "CARELESS";
		vehicle (units _grp select 0) action ["lightOn",vehicle (units _grp select 0)];
	};
	else;
	{
	};
	(units _grp select 0) commandFollow (units _grp select 0);
	Waituntil {(leader _grp) distance _pos < 200 or (count units _grp) == 0};
	if ((count units _grp) == 0) then {_loop=1;};	
	sleep 10.0;
};
