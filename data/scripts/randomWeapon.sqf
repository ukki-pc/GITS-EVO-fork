[private "_player","_gun""_guns","_ammo","_ammos","_rnd","_i","_rnd2","_item","_items"];
_player = _this select 0;

//create an array of guns
_guns = ["UZI_EP1", "MP5SD","M16A2"];

_rnd = floor random (count _guns);
_gun = _guns select _rnd;

	_ammoArray = getArray (configFile >> "CfgWeapons" >> _gun >> "magazines");
    _ammo = _ammoArray select 0;


//remove everything from the unit
removeAllWeapons _player;
if (_rnd <= 6) then {
	for [{_i=1},{_i<=2},{_i=_i+1}] do {
		_player addMagazine _ammo select 0;
	};
	_player addWeapon _gun;
};