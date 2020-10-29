//Eggbeast kill action - inspired by DayZ scripts by Rocket

//kill target 
Tman = _this select 0;
_player = _this select 1;

Tman removeAction EB_player_bkill;
EB_player_bkill = -1;
_player playMove "AmovPercMrunSrasWrflDf_AmovPercMevaSrasWrflDb";
//if CBA is running use this to play a global sound
[-1, {_man = _this select 0; _man say "stab";},[player]] call cba_fnc_globalExecute;	
sleep 0.5;
Tman switchmove "AmelPercMstpSnonWnonDnon_zasah7bricho";
//otherwise use this for private sound
//playsound "stab";
sleep 2;
Tman removeAction EB_player_kill;
Tman removeAction EB_player_bkill;
Tman removeAction EB_player_ckill;
Tman setdamage 1;

_player addscore 1;
