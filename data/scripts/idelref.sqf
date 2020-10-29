// removes no longer required reinforcments
_group = _this select 0;
_pos = _this select 1;
_type = _this select 2;
_alist = _this select 3;
_elist = _this select 4;
sleep 10.0;


if(_type == 1) then 
{
	waitUntil {((vehicle leader _group) in list _elist) or count units _group == 0};

};
if(_type == 2) then 
{
	waitUntil {(count units _group == 0) or ((leader _group) distance _pos < 300)};
	
};
if(_type == 2 and (leader _group) distance _pos < 300) exitWith {_handle = [_group] execVM "data\scripts\delete.sqf"}; 



sleep 20.0;


for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	if((count units _group == 0) or (count list _alist == 0)) then {_loop=1};
	sleep 1.0;
};

if(count units _group > 0) then
{
	_del = [_group] spawn {[_this select 0] call EVO_Delete};
};
