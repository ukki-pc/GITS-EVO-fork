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
_EVO_timesync =
{
	BIS_EVO_gdate = date;
	BIS_EVO_gdate_packed = str (BIS_EVO_gdate); publicvariable "BIS_EVO_gdate_packed";
	_oldhour = (date select 3);
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
