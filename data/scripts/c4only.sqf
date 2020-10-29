// ensures the player uses a satchel to destroy the radio tower.
_radio = _this select 0;

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 1.0;
	_bomb = (_radio nearObjects ["PipeBomb",6]) select 0;	
	if(not isNull _bomb) then 
	{
		BIS_EVO_latk = nearestObject [_bomb, "Man"];
		WaitUntil {not alive BIS_EVO_latk or isNull _bomb};
		if((not alive BIS_EVO_latk) and (not isNull _bomb)) then {deletevehicle _bomb;BIS_EVO_latk = objNull};
		if(isNull _bomb and alive BIS_EVO_latk) then 
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