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
