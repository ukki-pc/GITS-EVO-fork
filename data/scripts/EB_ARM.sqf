//Replaces aircraft's turret
armTurret = 
{

	_bomb = _this select 0;
	_weaponSystem = _this select 1;
	_vec = (vehicle player);
	_veCC = typeof _vec;
	_mags = magazines _vec;
	_magCount = count _mags;
	_weapons = weapons _vec;

	_inrepairzone = ((_vec in list AirportIn) or (_vec in list farp1) or (_vec in list farp2) or (_vec in list farp3) or (_vec in list farp4) or (_vec in list reng1) or (_vec in list reng2) or (_vec in list reng3) or (_vec in list reng4) or (_vec in list dock1) or (_vec in list LHDin));
if( (_inrepairzone) and (speed _vec > -2) and (speed _vec < 2) and (position _vec select 2 < 2.0) and (local _vec) and (perkparam == 1) and (EB_airload1 <0) ) then
{

  {_vec removemagazine _x}forEach _mags;
  {_vec removeweapon _x}forEach _weapons;
  
		_mags set [0,"120Rnd_CMFlare_Chaff_Magazine"];
		_weapons set [0,"CMFlareLauncher"];
		_mags set [1,_bomb];
		_weapons set [1,_weaponSystem];


		{_vec addMagazine _x} forEach _mags;
		{_vec addWeapon _x} forEach _weapons;

		player selectWeapon "CMFlareLauncher";
		_muzzles = getArray(configFile>>"cfgWeapons" >> "CMFlareLauncher" >> "muzzles");
		player selectWeapon (_muzzles select 0);
}
else {
  hint "Must be stationary at base!";
};
};

//Arms vehicle with weapons
armWeapon = {

	_bomb = _this select 0;
	_weaponSystem = _this select 1;
	_vec = (vehicle player);
	_veCC = typeof _vec;
	_mags = magazines _vec;
	_magCount = count _mags;

		_maxAmmo = EGG_maxMissiles;

			switch(_vecC) do
			{
				case "F4M_Des":
				{
					_maxAmmo = 15;
				};
			};
	_inrepairzone = ((_vec in list AirportIn) or (_vec in list farp1) or (_vec in list farp2) or (_vec in list farp3) or (_vec in list farp4) or (_vec in list reng1) or (_vec in list reng2) or (_vec in list reng3) or (_vec in list reng4) or (_vec in list dock1) or (_vec in list LHDin));
if( (_inrepairzone) and (speed _vec > -2) and (speed _vec < 2) and (position _vec select 2 < 2.0) and (local _vec) and (perkparam == 1) and (EB_airload1 <0) ) then
{

			if(_magCount >= _maxAmmo) then 
			{
			_vec removeAction bombs;
				hint format ["Max bomb count: %1 , Cannot put more bombs.", _maxAmmo];
			};
				if(_magCount < _maxAmmo) then 
			{
				_vec addWeapon _weaponSystem;
				_vec addMagazine _bomb;
			};
}
else{
  hint "Must be stationary at base!";
};
	};