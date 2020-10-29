//Eggbeast kill action - inspired by DayZ scripts by Rocket

//kill target 
Tman = _this select 0;
_player = _this select 1;

Tman removeAction EB_player_kill;
EB_player_kill = -1;


if (_player distance Tman > 2) then 
{
	_player playActionNow "GesturePoint";
	//if CBA is running use this to play a global sound
	[-1, {_man = _this select 0; _man say "throw";},[player]] call cba_fnc_globalExecute;	
	//otherwise use this for private sound
	//playsound "throw";
	sleep 0.3;
	Tman switchmove "AmelPercMstpSnonWnonDnon_zasah6hlava";
	hintsilent "Knife thrown";
	if ("EB_knife" in (magazines _player)) then {_player removemagazine "EB_knife";Tman addMagazine "EB_knife";};
	if ("EB_kabar" in (magazines _player)) then {_player removemagazine "EB_kabar";Tman addMagazine "EB_kabar";};
	if ("uns_kabar" in (magazines _player)) then {_player removemagazine "uns_kabar";Tman addMagazine "uns_kabar";};
	if ("uns_knife" in (magazines _player)) then {_player removemagazine "uns_knife";Tman addMagazine "uns_knife";};
	_player addscore 2
} else
{
	_player playActionNow "GestureAttack";
	//if CBA is running use this to play a global sound
	[-1, {_man = _this select 0; _man say "kill";},[player]] call cba_fnc_globalExecute;	
	//otherwise use this for private sound
//	playsound "kill";
	sleep 0.3;
	Tman switchmove "AmelPercMstpSnonWnonDnon_zasah7bricho";
	hintsilent "Stealth kill";
	_player addscore 4
};

sleep 2;
Tman removeAction EB_player_kill;
Tman removeAction EB_player_bkill;
Tman removeAction EB_player_ckill;
Tman setdamage 1;

/*
"walkf" - walk forward
"walkb" - walk backwards
"walkr" - strafe right
"walkl" - strafe left
"grabdrag" - initiate First Aid dragging animation
"stopdrag" - stops First Aid dragging animation
"reloadMagazine" - reloads the current magazine
"gestureFreeze" - hand signal "Freeze"
"GestureGo"
"GestureCover"
"GestureAttack"
"GestureCeaseFire"
"GestureFollow"
"GestureUp"
"GestureAdvance"
"GesturePoint"
*/
