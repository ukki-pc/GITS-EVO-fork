// Prevents A players AI from driving A vehicle the player does no have the required rank for.
_unit = _this select 0;
for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	if((vehicle _unit) != _unit) then 
	{
		if(_unit == driver (vehicle _unit)) then 
		{
			_spawn = [_unit,vehicle _unit] spawn {[_this select 0,_this select 1] call BIS_EVO_VecInit}
		};
	};
	if (not alive _unit) then {_loop=1};
	sleep 1;
};



