//Eggbeast bayonet fold action 

_player = _this select 0;

_player selectweapon (primaryweapon _player);

_player removeAction EB_player_foldbayo;
_player playmove "AmovPercMstpSlowWrflDnon_seeWatch";

_wepcount = count EGG_bayoweps;
playsound "Bayo_off";
_i=0;
while {_i < _wepcount} do
{
	if ((primaryweapon _player)== (EGG_bayoweps select _i select 1) ) then 
	{
		_player removeweapon (EGG_bayoweps select _i select 1);
		_player addWeapon (EGG_bayoweps select _i select 0);
		_player selectWeapon (EGG_bayoweps select _i select 0);

	};
	_i=_i+1;
};
EB_player_foldbayo =-1;
