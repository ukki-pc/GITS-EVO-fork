//Eggbeast handgun silencer removal action 

_player = _this select 0;

_player removeAction EB_player_rmvhsil;
_wepcount = count EGG_hsilweps;

_i=0;
while {_i<_wepcount} do
{
	if (_player hasweapon (EGG_hsilweps select _i select 1) ) then 
	{
		_player selectweapon (EGG_hsilweps select _i select 1);
		_player playmove "PistolMagazineReloadKneel";
		sleep 1;
		playsound "Sil_on";
		_player removeweapon (EGG_hsilweps select _i select 1);
		_player addweapon ("EB_ItemSil_hgun");
		_player addWeapon (EGG_hsilweps select _i select 0);
		_player selectWeapon (EGG_hsilweps select _i select 0);
	};
	_i=_i+1;
};
EB_player_rmvhsil =-1;
