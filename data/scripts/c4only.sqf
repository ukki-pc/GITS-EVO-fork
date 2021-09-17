// ensures the player uses a satchel to destroy the radio tower.
_radio = _this select 0;

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 1.0;
	_bomb = objNull;
	_bombs = (_radio nearObjects ["PipeBomb",6]);
	_bombExists = count _bombs > 0;
	if(_bombExists) then {_bomb = _bombs select 0};

	if (_bombExists) then 
	{
		BIS_EVO_latk = nearestObject [_bomb, "Man"];
		WaitUntil {not alive BIS_EVO_latk or !alive _bomb};
		if((not alive BIS_EVO_latk) and (not alive _bomb)) then {deletevehicle _bomb;BIS_EVO_latk = objNull};
		if(!alive _bomb and alive BIS_EVO_latk) then 
		{
			_radio removealleventhandlers "hit";
			BIS_EVO_sot = format["%1",_radio];
			BIS_EVO_sor = 10;	
			BIS_EVO_sop = BIS_EVO_latk;
			BIS_EVO_latk = objNull;
			publicVariable "BIS_EVO_sot";
			publicVariable "BIS_EVO_sor";
			publicVariable "BIS_EVO_sop";
			_radio setdamage 1;
			_loop=1;
		};
	};
};