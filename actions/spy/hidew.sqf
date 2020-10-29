_player = player;

_pweapon = "";
_nearbytargetsb = [];
_nearbyenemyb = 0;
_countnearb = 0;
_nearbytargetsb = _player nearTargets 15;
sleep 0.1;
_countnearb = count _nearbytargetsb;
_k = 0;
while {_countnearb >0 and _k < _countnearb} do 
{
	if (((_nearbytargetsb select _k) select 2) == EAST) then {_nearbyenemyb = _nearbyenemyb +1};
	_k = _k + 1;
};

//hintsilent format["enemies2: %1",_nearbyenemyb];

if (_nearbyenemyb >=1) then {hintsilent "Enemies nearby - You must hide before you can conceal your weapon";
} else {

	if ( (primaryWeapon _player) != "") then
	{
		_pweapon = (primaryWeapon _player);
		_player action ["dropWeapon", _player, _pweapon];
	};

	BIS_EVO_pallammo = magazines _player;
	BIS_EVO_pweapons = weapons _player;
	removeAllWeapons _player;
	_player action ["handGunOff", _player]; 
	EGG_hideweaponon = false;
	_player removeAction EGG_actionId9;
	EGG_spyactive = 3;
	sleep 0.5;
};
