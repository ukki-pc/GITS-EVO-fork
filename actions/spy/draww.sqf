_player = player;
 
{_player addmagazine _x} forEach BIS_EVO_pallammo;
{_player addweapon _x} forEach BIS_EVO_pweapons;
_player removeAction EGG_actionId9;


if (count weapons _player > 5) then
//first 5 weapons are actually items

{
  private['_type', '_muzzles'];

  _type = ((weapons _player) select 5);//was 0
  // check for multiple muzzles (eg: GL)
  _muzzles = getArray(configFile >> "cfgWeapons" >> _type >> "muzzles");

  if (count _muzzles > 1) then
  {
    _player selectWeapon (_muzzles select 0);
  }
  else
  {
    _player selectWeapon _type;
  };
};
//_player selectweapon (handgun _player);
_player action ["WeaponInHand",_player];
EGG_drawweaponon = false;
EGG_spyactive = 1;
