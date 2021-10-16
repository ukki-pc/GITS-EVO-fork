#include "macros.h"
local _unit = _this select 0;
local _type = typeof _unit;

local _position = getPosASL _unit;
local _dir = getDir _unit;
sleep 2;
deleteVehicle _unit;
local _unit = _type createVehicle _position;
 _unit setPosASL _position;
 _unit setDir _dir;
local _dispname = [_type,"displayName","cfgVehicles"] call fnc_getCfgText;
local _sumark = [_unit,_dispname,EGG_EVO_friendlyColor,"dot",true,0.6] execVM "data\scripts\customMarker.sqf";
_unit addEventHandler ["killed", {local _nul = [_this select 0] execVM "data\scripts\playerVecKilled.sqf"}];