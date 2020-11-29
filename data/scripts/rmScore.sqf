// run on player at death.
_player = _this select 0;
_killer = _this select 1;
_grp = group _player;
_isLeader = (player == leader _grp);
_gcount = count units _grp;
_score = score _player;

//Score deduction

_removeScore = abs floor(_score * deathScorePenalty)*-1;
["jed_addscore", [_player, _removeScore]] call CBA_fnc_globalEvent;
systemChat format ["%1 score upon death",_removeScore];
_player removeAllEventHandlers "Killed";
hideBody _player;