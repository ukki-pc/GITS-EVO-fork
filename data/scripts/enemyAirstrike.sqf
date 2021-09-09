// Object, Direction, speed
BIS_EVO_SetVelocityVector =
{
    _object = _this select 0;
    _direction = _this select 1;
    _speed = _this select 2;
    _rndDir = random (1)-random(1);

    _object setdir _direction;
    _vel = velocity _object;

    _object setVelocity [
    (_vel select 0) + ((sin _direction+_rndDir) * _speed),
    (_vel select 1) + ((cos _direction+_rndDir) * _speed),
    (_vel select 2)];
};

    _bombzone = position player;
    _range = 500;	
    private ["pose","_unit","_vec","_heli0","_max","_maxv","_alist","_allunits2","_allvecs2","_pilot","_para","_radio","_posback","_pos1","_pos2","_sumark","_wp","_wp2","_wpx2","_i","_recy"]; 
    _startsd = ["EnemyAir01","EnemyAir02","EnemyAir03","EnemyAir04","EnemyAir05","EnemyAir06","EnemyAir07","EnemyAir08"];
    _closestMarker = [_startsd, _bombzone] call BIS_fnc_nearestPosition;
   // systemChat _closestMarker;
    _pos = objNull;
    _unit = objNull;
    _vec = objNull;
    _heli0 = objnull;
    _max = objnull;
    _maxv = objnull;
    _objPos = _bombzone;
    _pos = getMarkerPos _closestMarker;
    _posback = _bombzone;
    _pilot = createGroup (west);
    (EGG_EVO_mepilot select 0) createUnit [getmarkerpos "centerp", _pilot];Sleep BIS_EVO_GlobalSleep;
    //(EGG_EVO_mepilot select 0) createUnit [getmarkerpos "centerp", _pilot];Sleep BIS_EVO_GlobalSleep;
    _pos1 = [(_pos select 0)-_range -(random _range),(_pos select 1)+_range -(random _range),(200 + random 100)];
    _pos2 = [(_pos select 0)+_range +(random _range),(_pos select 1)+_range -(random _range),(200 + random 100)];
    _vecT = [EGG_EVO_mevairb] call fnc_pickRandom;
    _heli0 = createVehicle [_vecT,_pos1, [], 100, "FLY"];
    _sumark = [_heli0,"","ColorBlue","plp_icon_planeAttack",true,0.6] execVM "data\scripts\customMarker.sqf";
    //player moveInDriver _heli0;
    _heli0 setVelocity [0,0,0];
    _dir = [position _heli0, _objPos] call BIS_EVO_GetRelDir;
    //systemChat str _dir;

    _heli0 setdir _dir;
    _vel = velocity _heli0;
    _speed = 50;
    _heli0 setVelocity [
    (_vel select 0) + (sin _dir * _speed), 
    (_vel select 1) + (cos _dir * _speed), 
    100];

    _heli0 engineon true;
    (units _pilot select 0) assignAsDriver _heli0;
    (units _pilot select 1) assignAsGunner _heli0;
    (units _pilot select 0) moveInDriver _heli0;
    (units _pilot select 1) moveInGunner _heli0;

    _wp2 = _pilot addWaypoint [_posback, 10];
    {_x setBehaviour "careless"} forEach (units _pilot);

    (driver _heli0) commandMove _pos;
    (driver _heli0) doMove _pos;
    _heli0 flyInHeight 150;

    waitUntil {(_heli0 distance _posback) < (speed _heli0*2) or not (canmove _heli0)};


   // _bombs = ["EB_Bo_FAB500"];
   _bombs = ["EB_CBU98_Launcher"];
    if (canmove _heli0) then 
    {
        _count = 5;
        _i = 0;
        _bombT = [_bombs] call fnc_pickRandom;
        while {_i <= _count} do 
        {
            //systemChat format ["bomb%1",_i];
            //_vec = createVehicle ["ParachuteWest", _pos, [], 20, 'NONE'];

            _bombT = createVehicle [_bombT,[(position _heli0 select 0), (position _heli0 select 1), (position _heli0 select 2)-1], [], 0, "NONE"];
            [_bombT, getDir _heli0, 100] call BIS_EVO_SetVelocityVector;
            //_k setDir getDir _heli0;
            sleep 0.2;
            _i = _i + 1;
        };
    };

_wpx2 = _pilot addWaypoint [[0,0,0], 20];
[_pilot, 2] setWaypointType "MOVE";
    
    [] call BIS_EVO_CountDead;

    sleep 90;
    {deleteVehicle _x} forEach ([_heli0] + crew _heli0);
    if (!isNull _unit) then {deleteVehicle _unit};
    deleteGroup _pilot;