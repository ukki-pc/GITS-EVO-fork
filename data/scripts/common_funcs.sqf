//Common functions for client and server
#include "macros.h"

//Picks item at random array position, allows mixed 1d-2d arrays
//INSERT ARRAY OR ARRAYS, RETURNS RANDOM INDEX FROM RANDOM ARRAY
fnc_pickRandom = 
{
private ["_array","_count","_rnd","_object","_count","_isArray"];
_array = _this select 0;
_count = 0;
_rnd = 0;
_object = "";
_count = count _array;
_rnd = round(random((_count)-1));
_object = _array select _rnd;

_isArray = (typename _object == "ARRAY");
	if(_isArray) then 
	{
		_count = count (_object);
		_rnd = round(random((_count)-1));
		_object = _object select _rnd;
		_isArray = (typename _object =="ARRAY");
	};
_object;
};

fnc_playerBases = 
{
	capturedAirportIn = (objective_1 in BIS_EVO_conqueredTowns);
	capturedFarp1 = true;
	capturedFarp2 = (objective_37 in BIS_EVO_conqueredTowns);
	capturedFarp3 = (objective_43 in BIS_EVO_conqueredTowns);
	capturedFarp4 = (objective_42 in BIS_EVO_conqueredTowns);
	capturedDock1 = (objective_19 in BIS_EVO_conqueredTowns);
};



enhanchedAA = 
{
#define maxZdiffDegrees 25
#define maxdirDegrees 30

_attacker = _this select 0;
_target = _this select 1;
_maxShootDist = _this select 2;
_difficulty = _this select 3;

_grp = group _attacker;
_dirToTarget = 0;
_zdiff = 0;
_azimut = 0;
_zVect = 0;
_hdiff = 0;
_alpha = 0;
_diff = 0;
_canshoot = false;
_visual = false;
sleep 0.1;
_isSam = _attacker isKindOf "Land";
_compatWeps = [];

//Get AA missiles
{
        _mag = (getArray (configFile >> "cfgWeapons" >> _x >> "Magazines"));
        if(count _mag == 0) exitWith {};
        _ammo =  (getText (configFile >> "CfgMagazines" >> _mag select 0 >> "ammo"));
        if(_ammo isKindOf "MissileBase") then {
        _cl =  (getNumber (configFile >> "CfgAmmo" >> _ammo >> "airLock"));
        if(_cl > 0) then {_compatWeps = _compatWeps + [_x]};
    };
}
forEach weapons _attacker;

if (count _compatWeps == 0) exitWith {systemChat "No compatible weapons found"};
if(_issam) then 
{
_samMark = createMarkerLocal [format["%1",_attacker],getPos _attacker];
_samMark setMarkerShapeLocal "Ellipse";
_samMark setMarkerSizeLocal [_maxShootDist,_maxShootDist];
};

while {alive _attacker} do
{
    if(!isNull _target) then {_attacker doTarget _target}
    else 
    {
        _seekTarget =  isnull _target;
        while {sleep _difficulty; _seekTarget} do
        {
            _target = assignedTarget _attacker;
            if(isNull _target) then { _target = (leader _grp) getVariable ["target",objnull]};
            {if(alive _x) then{_target = _x}} forEach detections;
            if(!alive _attacker) exitWith {systemChat "dead before even started"};
            _seekTarget =  isnull _target;
        };
        (leader _grp) setVariable ["target",_target];
    };

    systemChat "acquired target";

    _attacker selectWeapon (_compatWeps select (round random(count _compatWeps-1)));

    while {sleep 1; alive _attacker and alive _target} do 
    {
    _attacker reveal _target;
    _attacker dotarget _target;
    _attacker doFire _target;
        _distance = _attacker distance _target;
            if(_distance <= _maxShootDist) then 
            {
                _dirToTarget = [getpos _attacker,getpos _target] call BIS_EVO_GetRelDir;
                    //THx r3f
                _azimut = ((_attacker weaponDirection  currentWeapon _attacker) select 0) atan2 ((_attacker weaponDirection currentWeapon _attacker) select 1);
                _azimut = round (_azimut*100) / 100;
                if (_azimut < 0) then {_azimut = _azimut + 360};
                _diff = abs(_azimut - _dirToTarget);
                _zVect =  ((_attacker weaponDirection currentWeapon _attacker) select 2);
                
                _hdiff = ((getpos _attacker select 2) - (getPos _target select 2));
                _alpha = (_hdiff/_distance);
                _zDiff = abs deg(_alpha +_zVect);
                _intersect = terrainIntersect [getposASL _attacker, getPosASL _target];
                if(_isSam) then {_canshoot = (_diff <= maxdirDegrees and _zDiff <= maxZdiffDegrees and _zVect > 0 and !_intersect)} //Sams cannot shoot downwards
                else{_canshoot = (_diff <= maxdirDegrees and _zDiff <= maxZdiffDegrees and !_intersect)};

                if(_canshoot) then 
                {
                    //SHOOT THE MF
                    if(floor(random(_difficulty)) == 0) then
                    {
                        {
                            if(_attacker ammo _x > 0) exitWith 
                            {
                                systemChat "shoots";
                                
                                _attacker selectWeapon _x;
                                _attacker fireAtTarget [_target,_x];
                                sleep _difficulty;
                            };
                        } forEach _compatWeps;
                    };
                };
            }
            else {sleep 2};
        if(_attacker knowsAbout _target > 0) then {_visual = true};
        if(_attacker knowsAbout _target == 0 and _visual) exitWith {systemChat "Lost him"};
    };
    if(!alive _target) then {systemChat "ye he dead"};
    if(!alive _attacker) then {systemChat "ye me dead"};
    (leader _grp) setVariable ["target",objNull];
    _target = objnull;
};
};
// [ARRAY_TO_INSERT_TO,DATA_TO_INSERT,INDEX_TO_INSERT_TO] RETURNS FULL ARRAY
fnc_spliceToArray = 
{
	_sourceArray = _this select 0;
	_data = _this select 1;
	_spliceIndex = _this select 2;
	_returnArray = [];

	if(_spliceIndex >= count _sourceArray) then {_spliceIndex = count _sourceArray};

	for [{_i = 0}, {_i < count _sourceArray+1 }, {_i = _i + 1}] do 
	{
		if(_i < _spliceIndex) then {_returnArray = _returnArray + [_sourceArray select _i]};
		if(_i == _spliceIndex) then {_returnArray = _returnArray + _data};
		if(_i > _spliceIndex) then {_returnArray = _returnArray + [_sourceArray select _i-1]};

	};

	_returnArray;
};



//INPUT object, RETURNS array of location objects
fnc_get_synchronized_towns = 
{
	private ["_targetTown","_synTowns","_allSyncs"];
	_targetTown = _this select 0;
	_synTowns = [];

	_allSyncs = synchronizedObjects _targetTown;

	{
		if(_x isKindOf "locationLogic") then 
		{
			_synTowns = _synTowns + [_x];
		};	
	}forEach _allSyncs;
	_synTowns;
};

//INPUT object, return array of bunker objects
fnc_get_synchronized_bunkers = 
{
	private ["_targetTown","_synTowns","_allSyncs"];
	_targetTown = _this select 0;
	_synTowns = [];

	_allSyncs = synchronizedObjects _targetTown;

	{
		if(_x isKindOf "Building") then 
		{
			_synTowns = _synTowns + [_x];
		};	
	}forEach _allSyncs;
	_synTowns;
};


//FINDS POSITION OF AN OBJECT OR A MARKER... INPUT ARRAY or STRING or OBJECT, RETURNS POS ARRAY
fnc_getAnyPosition = 
{
private ["_position","_return"];
  _position = _this select 0;
  _return = "";
  if(typeName _position == "ARRAY") then { _position = _position select 0};
  if(typeName _position == "STRING") then { _return = getMarkerPos _position}; 
  if(typeName _position == "OBJECT") then { _return = [getPos _position select 0,getpos _position select 1,0]};
  _return;
};

//SHOWS DEBUG MESSAGE IF EDITOR == 1
debugMessage = 
{
	if(editor == 1) then {
		systemChat format ["%1",_this select 0];
	};
};

BIS_Effects_globalEvent = 
{
	BIS_effects_gepv = _this;
	publicVariable "BIS_effects_gepv";
     _this call BIS_Effects_startEvent;
};

//INPUT [classname,cfgDataString,cfgFile] RETURN cfgString
//Example ["rh_ak","displayName","CfgWeapons"]
fnc_getCfgText = 
{
	private ["_classname","_return","_name","_data","_cfgFile"];
	_classname = _this select 0;
	_data = _this select 1;
	_cfgFile = _this select 2;
	_return = "";
	_name = getText(configFile >> _cfgFile >> _classname >> _data);
	if(!isNil "_name") then{_return = _name}else{_return = _classname};
	_return;
};

//INPUT [classname, cfgDataString] RETURN cfgDataValue
fnc_getCfgNumber = 
{
	private ["_classname","_return","_name","_data","_cfgFile"];
	_classname = _this select 0;
	_data = _this select 1;
	_cfgFile = _this select 2;
	_return = "";
	_name = getNumber(configFile >> _cfgFile >> _classname >> _data);
	if(!isNil "_name") then{_return = _name}else{_return = _classname};
	_return;
};
