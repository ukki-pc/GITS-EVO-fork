// run on player at death.
_player = _this select 0;
_grp = group _player;
_isLeader = (player == leader _grp);
_gcount = count units _grp;

//Score deduction

_removeScore = abs floor(money * deathScorePenalty)*-1;
["sendToClient", [_player,fnc_changeMoney,[_removeScore]]] call CBA_fnc_whereLocalEvent;
_msg = format ["%1 score lost upon death.",abs(_removeScore)];
["sendToClient", [_player,fnc_msg,["ss",_msg]]] call CBA_fnc_whereLocalEvent;

_player removeAllEventHandlers "Killed";
hideBody _player;