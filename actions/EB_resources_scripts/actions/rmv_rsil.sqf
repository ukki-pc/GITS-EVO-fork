//Eggbeast handgun silencer removal action 

_player = _this select 0;

_player removeAction EB_player_rmvrsil;

_wepcount = count EGG_rsilweps;

_i=0;
while {_i<_wepcount} do
{
	if ((primaryweapon _player)== (EGG_rsilweps select _i select 1) ) then 
	{
		_player selectweapon (primaryweapon _player);
		_player playmove "AmovPercMstpSlowWrflDnon_seeWatch";
		playsound "Sil_on";
		sleep 1;
		_player removeweapon (EGG_rsilweps select _i select 1);
		_player addweapon ("EB_ItemSil_rifle");
		_player addWeapon (EGG_rsilweps select _i select 0);
		_player selectWeapon (EGG_rsilweps select _i select 0);
	};
	_i=_i+1;
};
EB_player_rmvrsil =-1;
