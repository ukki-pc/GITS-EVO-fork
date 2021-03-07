// run on player at death.
_player = _this select 0;
_grp = group _player;
_isLeader = (player == leader _grp);
_gcount = count units _grp;

//Score deduction

_removeScore = abs floor(money * deathScorePenalty)*-1;
["jed_addMoney", [_player, _removeScore]] call CBA_fnc_whereLocalEvent;
_msg = format ["%1 score lost upon death.",abs(_removeScore)];
["jed_msg", [_player, _msg]] call CBA_fnc_whereLocalEvent;

_player removeAllEventHandlers "Killed";
hideBody _player;