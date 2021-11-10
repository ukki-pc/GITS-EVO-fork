//Common functions for client and server
#include "macros.h"

//Picks item at random array position, allows mixed 1d-2d arrays
//INSERT ARRAY OR ARRAYS, RETURNS RANDOM INDEX FROM RANDOM ARRAY


//Returns random object or string from any dimension
fnc_pickRandom = 
{
    local _object = _this select 0;

    while{typename _object == "ARRAY"} do 
    {
        _object = _object select (round(random((count _object)-1)));
    };

    if (isNil "_object") exitWith{systemChat "error in random"; ""};

_object;
};

//Returns random vehicle class which exists
fnc_pickvehicle = 
{
    local _vec = "";
    while{ !(isClass(configFile >> "CfgVehicles" >> _vec)) } do
    {
        _vec = [_this select 0] call fnc_pickRandom;
    };
    _vec;
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
            if(!alive _attacker) exitWith {
               //systemChat "dead before even started";
            };
            _seekTarget =  isnull _target;
        };
        (leader _grp) setVariable ["target",_target];
    };

    // systemChat "acquired target";

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
                                //systemChat "shoots";
                                
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
        if(_attacker knowsAbout _target == 0 and _visual) exitWith {
           // systemChat "Lost him";
        };
    };
    if(!alive _target) then 
    {
     //   systemChat "ye he dead";
    };
    if(!alive _attacker) then {
      //  systemChat "ye me dead";
        };
    (leader _grp) setVariable ["target",objNull];
    _target = objnull;
};
};

fnc_countItems = 
{
    local _array = this select 0;
    local _item = _this select 1;
    local _return = 0;

    {if(_x == _item) then {_return = _return + 1}} forEach _array;

    _return;
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

fnc_distributeWeapons = 
{
    local _unit = _this select 0;
    removeAllWeapons _unit;
    local _wep = [rucheaps] call fnc_pickRandom;
    local _mag = ([(getArray (configFile >> "CfgWeapons" >> _wep >> "magazines"))] call fnc_pickRandom);
    _unit addWeapon _wep;
    _unit addMagazine _mag;
    _unit addMagazine _mag;
    _unit addMagazine _mag;
    _unit addMagazine _mag;
    _unit addMagazine _mag;
    
    local _name = (gettext (configFile >> "CfgWeapons" >> _wep >> "Displayname"));
    systemChat format ["%1 distributed",_name];
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

//Sets object to ASL height INSERT: [OBJECT , HEIGHT]
fnc_setObjHeight =
{
    local _object = _this select 0;
    local _zPos = _this select 1;
    local _newPos = getPosAsl _object;
    _newPos set [2,_zPos];
    _object setPosASL _newPos;
};

//INPUT [sourcePos,sourceDir,xOffset,yOffset,distance]
fnc_relativePosition =
{
    local _srcPos = _this select 0;
    local _srcDir = _this select 1;
    local _xOffet = _this select 2;
    local _yOffset = _this select 3;
    local _distance = _this select 4;
    local _height = _this select 5;

    

    local _testX = (_distance*cos(_srcDir)+(_srcPos select 0)-_xOffet);
    local _testY = ((_distance)*sin(_srcDir)+(_srcPos select 1)-_yOffset);

    if(isNil "_height") exitWith {[_testX,_testY]};
    [_testX,_testY,_height];
};

fnc_createCarrier = 
{
    _carrierType = _this select 0;
    _carrierPos = _this select 1;
    _LHDdir = _this select 2;
    // Original LHD placement script by ArMaTeC
    //Maybe add more carriers in the future?
    if (isServer) then {
        _LHDspawnpoint = [_carrierPos select 0,_carrierPos select 1, 0];
        switch (_carrierType) do
        {
        
            case "LHD":
            {
                deckHeight = LHDDECK;
                _parts = 
                [
                    "Land_LHD_house_1",
                    "Land_LHD_house_2",
                    "Land_LHD_elev_R",
                    "Land_LHD_1",
                    "Land_LHD_2",
                    "Land_LHD_3",
                    "Land_LHD_4",
                    "Land_LHD_5",
                    "Land_LHD_6"
                    //"JDG_carrier_Spawner"
                ];
                {
                    _dummy = _x createvehicle _LHDspawnpoint;
                    _dummy setdir _LHDdir;
                    _dummy setpos _LHDspawnpoint;
                } foreach _parts;
            };
            case "nimitz":
            {
                deckHeight = NIMITZDECK;
                 _parts = 
                [
                    // "Land_LHD_house_1",
                    // "Land_LHD_house_2",
                    // "Land_LHD_elev_R",
                    // "Land_LHD_1",
                    // "Land_LHD_2",
                    // "Land_LHD_3",
                    // "Land_LHD_4",
                    // "Land_LHD_5",
                    // "Land_LHD_6"
                    
                ];
                    _dummy = "JDG_carrier_Spawner" createvehicle _LHDspawnpoint;
                    _dummy setdir _LHDdir;
                    _dummy setpos _LHDspawnpoint;

            };
       
         };
    };
    true;
};

fnc_reveal = 
{
    local _target = _this select 0;
    local _enemies = _this select 1;

    {_x reveal _target} forEach _enemies;
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
