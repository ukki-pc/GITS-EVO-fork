//Picks item at random array position, allows mixed 1d-2d arrays
fnc_pickRandom = 
{
private ["_array","_count","_rnd","_object","_count","_isArray"];
_array = _this select 0;
_count = 0;
_rnd = 0;
_object = "";
_count = count _array;
_rnd = round(random((_count)-1));
_object = _array select _rnd;

_isArray = (typename _object == "ARRAY");
	if(_isArray) then 
	{
		_count = count (_object);
		_rnd = round(random((_count)-1));
		_object = _object select _rnd;
		_isArray = (typename _object =="ARRAY");
	};
_object;
};

_oldhour = param2;
//_fogmovetime = 900; // 15 mins
BIS_EVO_NoHumanLeader = [];
_EVO_Weath =
{
	_fogmovetime=_fogmovetime-3;
	_randx = 0;
	_randy = (random 14279);
	if ((position rainy select 0) > 16753) then
	{
		rainy setpos [_randx,_randy,0];
	};
	if ((position rainy2 select 0) > 16753) then
	{
		rainy2 setpos [_randx,_randy,0];
	};
	if ((position rainy3 select 0) > 16753) then
	{
		rainy3 setpos [_randx,_randy,0];
	};	
	if (_fogmovetime <= 0 and BIS_EVO_MissionProgress > 0) then
	{
		foggy setpos [random 12000,random 12000,0];
		_fogmovetime = 900;
	};	
	rainy  setpos [(position rainy select 0)+10,(position rainy select 1),0];"rainmark" setMarkerPos position rainy;
	rainy2 setpos [(position rainy2 select 0)+10,(position rainy2 select 1),0];"rainmark2" setMarkerPos position rainy2;
	rainy3 setpos [(position rainy3 select 0)+10,(position rainy3 select 1),0];"rainmark3" setMarkerPos position rainy3;
	foggy setpos [(position foggy select 0)+10,(position foggy select 1),0];"fogmark" setMarkerPos position foggy;
};

// Removes unused objects and weapon holders
/*
_EVO_Clean =
{
	{if(count units _x == 0) then {deletegroup _x}} foreach allGroups; // Remove empty groups
	_Objects = (getMarkerPos "ammob1") nearObjects 30;{if (_x isKindOf "WeaponHolder") then {deletevehicle _x}} forEach _Objects;
	_Objects = (getMarkerPos "ammob2") nearObjects 30;{if (_x isKindOf "WeaponHolder") then {deletevehicle _x}} forEach _Objects;
		{
			if(side _x == east) then 
			{
				if(not IsPlayer (leader _x)) then
				{
					if(not ((leader _x) in BIS_EVO_NoHumanLeader)) then 
					{
						_del = [_x] spawn {[_this select 0] call BIS_EVO_NoHuman};
						BIS_EVO_NoHumanLeader = BIS_EVO_NoHumanLeader+[_x]
					}
				
				}
			}
		} foreach allGroups;
	_mark = format["%1mash",dunit];
	deleteMarker _mark;
	_mark = format["%1farp",dunit];
	deleteMarker _mark;
};	
*/

//Counts alive units in a vehicle
countAliveCrew = 
{
	_crew = _this select 0;
	_numAlive = 0;

	{if(alive _x)then {_numAlive = _numAlive + 1}}forEach _crew;

	_numAlive;
};

_EVO_timesync =
{
	BIS_EVO_gdate = date;
	BIS_EVO_gdate_packed = str (BIS_EVO_gdate); publicvariable "BIS_EVO_gdate_packed";
	_oldhour = (date select 3);
};

//Picks weighted random from fed array
weightedRandomSimple = 
{
private ["_numbers","_totalTable","_total","_result","_rnd"];
_numbers = _this select 0;
_totalTable = [];
_total = 0;
_result = 0;

	{
		_total = _total + _x;
		_totalTable set [_forEachIndex, _total];
	}forEach _numbers;

	_rnd = round(random(_total));
	//Find random number which index it belongs to
	{
		if(_rnd <= _x) exitWith {_result = _forEachIndex};
	}forEach _totalTable;

	//systemChat format ["totalTable: %1. total: %2, result: %3",_totalTable,_total,_result];

	_result;
};

fnc_waterPatrol = 
{
	private ["_wp1","_ship","_group","_midPos","_radius"];

	#define minRange 700
	#define maxRange 2000
	#define shipWpLoc [_midPos, minRange, maxRange, 0, 2, 10,0] call BIS_fnc_findSafePos
	#define initPos [0,0,0]

	_group =  _this select 0;
	_midPos = _this select 1;
	_ship = _this select 2;

	_wp1 = _group addWaypoint [initPos, 1];

	while{[crew _ship] call countAliveCrew > 0} do
	{
		_wp1 setWaypointPosition [shipWpLoc,1];
		waitUntil{sleep 5; ((_ship distance waypointPosition _wp1) < 200)};
	};
};

chance = 
{
	_number = _this select 0;
	_rnd = round (random(100));

	//systemChat format ["got %1, generated %2",_number,_rnd];

	_rnd <= _number;
};

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{	
	_time = time;
	//[] call _EVO_Weath;
	sleep 1.011;
	//[] call BIS_EVO_Score;
	//sleep 1.011;
	//[] call _EVO_Clean;
	sleep 1.011;
	if (_oldhour != (date select 3)) then {[] call _EVO_timesync};
	_newtime = time - _time;	
};
