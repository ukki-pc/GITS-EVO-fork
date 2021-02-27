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
			
			if( (inrepairzone) and (speed _vec > -2) and (speed _vec < 2) and (position _vec select 2 < 2.0) and (local _vec) and (perkparam == 1) and (EB_airload1 <0) ) then
{
			// if(_magCount >= _maxAmmo) then 
			// {
			// 	hint format ["Max bomb count: %1 , Cannot put more bombs.", _maxAmmo];
			// };

			//Find the original weapon slot
			_ogMag = _mags select _weaponSlot;
			_ogMag = toUpper _ogMag;
			//systemChat format ["Selected: %1",_ogMag];
			_find = -1;
			_found = -1;
			_ogMi = [];
			for [{_i = 0}, {_i < count _weps}, {_i = _i + 1}] do 
			{
			_ogMi = getArray(configFile >> "CfgWeapons" >> _weps select _i >> "magazines");
			//systemChat format ["ogmi c %1", _ogMi];

			//Nested uppercasing loop
			
			 {
			 	_ogMi set [_forEachIndex, toUpper (_ogmi select _forEachIndex)];
			 } forEach _ogMi;

			

			if(_ogMag in _ogMi) then {_found = _i};
			};

			//systemChat format ["Found in index: %1",_found];
			if(_found < 0) then {hint "Cannot change that weapon!";}
			else{
			{_vec removemagazine _x}forEach magazines _vec;
			{_vec removeweapon _x}forEach weapons _vec;
			_ogWep = _weps select _found;

			 _weps	set [_found, _weaponSystem];
			 _magazineArray = getArray (configFile >> "CfgWeapons" >> _weaponSystem >> "magazines");

			 _mag = _magazineArray select 1;
			 _mags	set [_weaponSlot, _mag];
			 

			{_vec addMagazine _x}forEach _mags;
			{_vec addWeapon _x}forEach _weps;

			if(_magCount < _maxAmmo) then 
			{
				//_vec addWeapon _weaponSystem;
				//_vec addMagazine _bomb;
			};
			};
}
else{
  hint "Must be stationary at base!";
};
	};