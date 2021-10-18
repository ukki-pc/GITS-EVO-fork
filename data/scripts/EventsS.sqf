// ServerSide events

//group bonus/cost- sensor 8 in mission

//Rewards player with money
BIS_EVO_Reward =
{
   _usergroup = _this select 0;
   _reward = _this select 1;
  	_msg = format ["Objective"];
	["sendToClient", [_usergroup,fnc_hudmessage,[_msg,_reward]]] call CBA_fnc_whereLocalEvent;
};

//adding individual player bonus/ reward - sensor 65 in mission
BIS_EVO_RewardC =
{
	_unit = _this select 0;
	_reward = _this select 1;
	_unit addscore _reward;
};


















