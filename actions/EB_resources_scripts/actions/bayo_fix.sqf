//Eggbeast bayonet fix action 
//init contains array
//EGG_bayoweps = [["uns_ct56","uns_ct56bayo"],["uns_sks","uns_sksbayo"],["uns_ak47","uns_ak47bayo"]];

_player = _this select 0;

_player selectweapon (primaryweapon _player);

_player removeAction EB_player_fixbayo;
_player playmove "AmovPercMstpSlowWrflDnon_seeWatch";

playsound "Bayo_on";
_wepcount = count EGG_bayoweps;

_i=0;
while {_i<_wepcount} do
{
	if ((primaryweapon _player)== (EGG_bayoweps select _i select 0) ) then 
	{
		_player removeweapon (EGG_bayoweps select _i select 0);
		_player addWeapon (EGG_bayoweps select _i select 1);
		_player selectWeapon (EGG_bayoweps select _i select 1);
	};
	_i=_i+1;
};
EB_player_fixbayo =-1;

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
