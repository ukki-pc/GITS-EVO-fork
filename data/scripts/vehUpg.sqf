_upgVeh = _this select 0;

_vehicle = vehicle player;

_pos = getPosASL _vehicle;
_dir = getDir _vehicle;
deleteVehicle _vehicle;

_new = createVehicle [_upgVeh,  _pos, [], 0, "NONE"];
_new setPosASL _pos;
_new setDir _dir;
player moveInDriver _new;
