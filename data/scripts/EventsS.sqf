// ServerSide events

//group bonus/cost- sensor 8 in mission

BLA_EVO_RewardL =
{
	_unit = _this select 0;
	_reward = _this select 1;
	_unit addScore _reward;
};
//Rewards player with money
BIS_EVO_Reward =
{
   _usergroup = _this select 0;
   _reward = _this select 1;
  	_msg = format ["Objective"];
	["sendToClient", [_usergroup,"hdm",[_msg,_reward]]] call CBA_fnc_whereLocalEvent;
};

//adding individual player bonus/ reward - sensor 65 in mission
BIS_EVO_RewardC =
{
	_unit = _this select 0;
	_reward = _this select 1;
	_unit addscore _reward;
};

BIS_EVO_Boarding =
{
	_unit = _this select 0;
	_position = _this select 1;

	if((_unit in list AirportIn) and _position != "Driver") then 
	{
		_getout = _unit addEventHandler ["GetOut", 
		{
			if((_this select 1) != "Driver") then 
			{	if ((_this select 0) distance airportin > 1000) then 
				{
					driver (_this select 0) addscore 1;
				};
				if ((_this select 0) distance airportin > 5000) then 
				{	
					driver (_this select 0) addscore 1;
				};			
			}
		}];
		if(_getout > 0) then 
		{
			_unit removeEventHandler ["GetOut", _getout];
		};
	};
	if(_unit distance airportin > 1000 and _position != "Driver") then
	{
		_unit removeEventHandler ["GetOut", 0];
	};
};


















