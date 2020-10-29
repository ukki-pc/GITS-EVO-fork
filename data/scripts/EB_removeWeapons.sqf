_player = player;
_vec = vehicle _player;
// systemChat format ["%1",(_player)];
// systemChat format ["%1",(_vec)];
_vecC = typeof _vec;

	_inrepairzone = ((_vec in list AirportIn) or (_vec in list farp1) or (_vec in list farp2) or (_vec in list farp3) or (_vec in list farp4) or (_vec in list reng1) or (_vec in list reng2) or (_vec in list reng3) or (_vec in list reng4) or (_vec in list dock1) or (_vec in list LHDin));
if( (_inrepairzone) and (speed _vec > -2) and (speed _vec < 2) and (position _vec select 2 < 2.0) and (local _vec) and (perkparam == 1) and (EB_airload1 <0) ) then
{

  _weapons = weapons _vec;
  {_vec removeweapon _x}forEach _weapons;
  _magazines = magazines _vec;
  {_vec removemagazine _x}forEach _magazines;

  if(_vecC == "F4M_Des") then
  {
    //This is dummy slot
    		_vec addMagazine "EB_1Rnd_pylonblank";
  };

_vec addMagazine "120Rnd_CMFlare_Chaff_Magazine";
_vec addweapon "CMFlareLauncher";
player selectWeapon "CMFlareLauncher";
_muzzles = getArray(configFile>>"cfgWeapons" >> "CMFlareLauncher" >> "muzzles");
player selectWeapon (_muzzles select 0);

  hint "Weapons removed!";
  
}
else {  
  hint "Must be stationary at base!";
  };

  