
private ["_type","_posfire","_vdir","_dir","_missilebody","_speedini","_speedmax","_acceleration","_boomrange","_activerange","_modeinit","_cruisealt","_boomscript","_smokescript","_soundrsc","_sounddur","_endurance","_terrainavoidance","_updatefreq","_delayinit","_controltime","_detectable","_debug","_launchscript","_hagility","_vagility","_accuracy","_intercept","_scanarch","_scanarcv","_vangle","_missile","_target","_launcher"];
_missile = _this select 0;
_target = _this select 1;
_launcher = _this select 2;


if (alive _missile && alive _launcher) then
{
   _type = typeOf _missile;

   _posfire = _launcher worldToModel (getPos _missile);
   _vdir = vectorDir _missile;
   _dir = (_vdir select 0) atan2 (_vdir select 1);
   _missilebody      = _type;
   _speedini         = (speed _missile)/3.6;
   _speedmax         = 355;
   _acceleration     = 150;
   _boomrange        = 0;
   _activerange      = 850;
   _modeinit         = 0;
   _cruisealt        = 250;
   _boomscript       = mando_missile_path+"warheads\mando_missilehead1_nohe.sqf";
   _smokescript      = mando_missile_path+"exhausts\mando_missilesmoke1a.sqf";
   _soundrsc         = "";
   _sounddur         = 29;
   _endurance        = 15;
   _terrainavoidance = false;
   _updatefreq       = 0.5;
   _delayinit        = 0;
   _controltime      = 0;
   _detectable       = false;
   _debug            = false;
   _launchscript     = "";
   _hagility         = 90;
   _vagility         = 90;
   _accuracy         = 1;
   _intercept        = true;
   _scanarch         = 90;
   _scanarcv         = 90;
   _speedini = ((_speedini - (speed _launcher)/3.6) min _speedmax) min 300;
   _vangle = asin(_vdir select 2) - asin(vectorDir _launcher select 2);
   
   deleteVehicle _missile;

   [_launcher, _missilebody, _posfire, _dir, _vangle, _speedini, _speedmax, _acceleration, _target, _boomrange, _activerange, _modeinit, _cruisealt, _boomscript, _smokescript, _soundrsc, _sounddur, _endurance, _terrainavoidance, _updatefreq, _delayinit, _controltime, _detectable, _debug, _launchscript, _hagility, _vagility, _accuracy, _intercept, _scanarch, _scanarcv]execVM mando_missile_path+"mando_missile.sqf";

};
