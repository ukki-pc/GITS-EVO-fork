private ["_vehTier","_respawnTime","_objVeh","_vec"];
_objVeh = _this select 0;
_respawnTime = _this select 1;
_vehTier = _this select 2;

sleep _respawnTime;

    deletevehicle _objVeh;
    _vec = [_vehTier] spawn fnc_rndRewardVeh;
