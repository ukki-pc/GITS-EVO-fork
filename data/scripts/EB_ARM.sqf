//Replaces aircraft's turret
armTurret = 
{

	//_bomb = _this select 0;
	_weaponSystem = _this select 0;
	_magazineArray = getArray (configFile >> "CfgWeapons" >> _weaponSystem >> "magazines");
	_vec = (vehicle player);
	_veCC = typeof _vec;
	_mags = magazines _vec;
	_magCount = count _mags;
	_weapons = weapons _vec;


if( (inrepairzone) and (speed _vec > -2) and (speed _vec < 2) and (position _vec select 2 < 2.0) and (local _vec) and (perkparam == 1) and (EB_airload1 <0) ) then
{
	_inteksi = -1;
	_inteksi2 = _inteksi;
	{_inteksi = _weapons find _x; if(_inteksi > _inteksi2) then {_inteksi2 = _inteksi;} }forEach EB_turrets;
	if(_inteksi2 < 0) exitWith{hint "No turrets available for this plane"};
	_mag = _magazineArray select count _magazineArray-1;

  {_vec removemagazine _x}forEach _mags;
  {_vec removeweapon _x}forEach _weapons;
  _numOfMags = 1; //
  
	for "_x" from 0 to _numOfMags-1 do 
	{
			_mags set [_x,_mag];
			_weapons set [_inteksi2,_weaponSystem];
	};

	{_vec addMagazine _x} forEach _mags;
	{_vec addWeapon _x} forEach _weapons;

		_vec selectWeapon (_weapons select _inteksi2);
}
else {
  hint "Must be stationary at base!";
};
};

//Arms vehicle with weapons
armWeapon = {

	_bomb = _this select 0;
	_weaponSystem = _this select 1;
	_weaponSlot = _this select 2;
	_vec = (vehicle player);
	_veCC = typeof _vec;
	_mags = magazines _vec;
	_magCount = count _mags;
	_weps = weapons _vec;

		_maxAmmo = EGG_maxMissiles;

			switch(_vecC) do
			{
				case "F4M_Des":
				{
					_maxAmmo = 15;
				};
			};
			//systemChat str (_weps select _weaponSlot);
				if(_weps select _weaponSlot in EB_turrets or _weaponSlot < 1) exitWith {hint "Cannot change that";};

			if( (inrepairzone) and (speed _vec > -2) and (speed _vec < 2) and (position _vec select 2 < 2.0) and (local _vec) and (perkparam == 1) and (EB_airload1 <0) ) then
{
			// if(_magCount >= _maxAmmo) then 
			// {
			// 	hint format ["Max bomb count: %1 , Cannot put more bombs.", _maxAmmo];
			// };

			//Find the original weapon slot
			_ogMag = _mags select _weaponSlot;
			_ammoCount = ((_vec) ammo (weapons (_vec) select _weaponSlot));
			_ogMag = toUpper _ogMag;
			//systemChat format ["Selected: %1",_ogMag];
			_find = -1;
			_found = -1;
			_ogMi = [];
			

			{_vec removemagazine _x}forEach magazines _vec;
			{_vec removeweapon _x}forEach weapons _vec;

			 _weps	set [_weaponSlot, _weaponSystem];
			 _magazineArray = getArray (configFile >> "CfgWeapons" >> _weaponSystem >> "magazines");

			 _mag = _magazineArray select _ammoCount-1;

			 //Exceptions
			 switch (_weaponSystem) do {
				  case 'EB_AIM120_Launcher': {_mag = _magazineArray select _ammoCount;};
				  case 'EB_METEOR_Launcher': {_mag = _magazineArray select _ammoCount;};
					case 'EB_Mk83_Launcher': {_mag = _magazineArray select _ammoCount;};
					case 'EB_Mk770_Launcher': {_mag = _magazineArray select _ammoCount;};
				case 'EB_GBU12_Launcher': {_mag = _magazineArray select _ammoCount;};
			case 'EB_GBU12_Launcher': {_mag = _magazineArray select _ammoCount;};
			case 'EB_BombLauncher_kab500': {_mag = _magazineArray select _ammoCount;};
			case 'GLT_AM39_Launcher': {if(_ammoCount > 2) then {_ammoCount = 2;};_mag = _magazineArray select _ammoCount-1;};
			case 'GLT_GBU24_Launcher': {_mag = _magazineArray select 0; if(_ammoCount == 4) then {_mag = _magazineArray select 1;};if(_ammoCount == 6) then {_mag = _magazineArray select 2;};};
			case 'GLT_GBU53_Launcher': {_mag = _magazineArray select 0; if(_ammoCount == 4) then {_mag = _magazineArray select 1;};if(_ammoCount == 6) then {_mag = _magazineArray select 2;};};
			case 'GLT_GBU39_Launcher': {if(_ammoCount == 4) then {_mag = _magazineArray select 0;}; if(_ammoCount != 4)exitWith{hint "Needs 4 ammo slot";}};
			case 'GLT_KAB1500_Launcher': {if(_ammoCount == 2) then {_mag = _magazineArray select 1;}; if(_ammoCount == 4) then {_mag = _magazineArray select 2;};  if(_ammoCount != 2 and _ammoCount != 4)exitWith{hint "Needs 2 or 4 ammo slot";}};
			case 'GLT_AGM154A_Launcher': {if(_ammoCount == 2) then {_mag = _magazineArray select 1;}; if(_ammoCount == 4) then {_mag = _magazineArray select 2;};  if(_ammoCount != 2 and _ammoCount != 4)exitWith{hint "Needs 2 or 4 ammo slot";}};
			case 'GLT_AGM154A1_Launcher': {if(_ammoCount == 2) then {_mag = _magazineArray select 1;}; if(_ammoCount == 4) then {_mag = _magazineArray select 2;};  if(_ammoCount != 2 and _ammoCount != 4)exitWith{hint "Needs 2 or 4 ammo slot";}};
		
			
			};

			 _mags	set [_weaponSlot, _mag];
			 

			{_vec addMagazine _x}forEach _mags;
			{_vec addWeapon _x}forEach _weps;
			_vec selectWeapon (_weps select _weaponSlot);
/*
		_magaziinis =	getArray(configFile >> "CfgWeapons" >> (currentWeapon vehicle player) >> "magazines");
		hint str _magaziinis;
		_weaponz = currentWeapon vehicle player;
		_txt = format ["%2,%1",_magaziinis,_weaponz];
		copyToClipboard  _weaponz;
*/
				if(_magCount < _maxAmmo) then 
				{
					//_vec addWeapon _weaponSystem;
					//_vec addMagazine _bomb;
				};
}
else{
  hint "Must be stationary at base!";
};
	};