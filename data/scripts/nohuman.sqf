// removes ai team members on player disconnect
if (not isServer) exitwith {};
_unit = _this select 0;

sleep 5.0;
_count = 0;

sleep 20.0;
if(not isPlayer (leader group _unit)) then 
{
	sleep 20.0;
	if(not isPlayer (leader group _unit)) then 
	{	
		_unit setpos position vehicle _unit;
		_unit setDamage 1;
		hideBody _unit;
	};
};



