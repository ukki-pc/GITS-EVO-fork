// Forces the group to delete when no longer used.
private ["_player","_grp"]; 
_player = _this select 0;
_grp = _this select 1;

if (isNull _grp) exitwith {};

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	if(count units _grp == 0) then {deleteGroup _grp;_loop=1};
	sleep 8.0+(round random 1);
};
