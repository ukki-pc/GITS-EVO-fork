#include "macros.h"
disableSerialization;
closeDialog 0;
private ["_player","_id","_map","_cursorPos","_rhqPositions","_lowRHQ","_vec","_isRHQ","_isMHQ","_nearestPoint", "_tpLoc","_isViableLoc","_enoughMoney","_travelAllowed","_inVehicle"];
sleep 0.3;
_player = _this select 0;
_id = _this select 2;
_map = objNull;
cityToTransfer = -1;
_cursorPos = [];
_rhqPositions = [];
travelCost = 0;
travelMarker = objNull;

BIS_EVO_LHDMarkers = [];

if(carrier) then {BIS_EVO_LHDMarkers = ["LHD1Marker"];};

BIS_EVO_SHIPSPAWNS = ["ship1","ship2"];
objectiveFlags = [];

_lowRHQ = format ["%1amb",player];
_vec =  (vehicle player);
_isRHQ = _vec getVariable ["RHQ",false];
_isMHQ = (_vec == MHQ);
_mhqMark = ["mhqmark"];


 { 
  _markerName = format ["%1",_x];

  if(_x  getVariable "OWNER" == EGG_EVO_PLAYERFACTION) then 
   {
      _flagMarkerName = format ["%1",_x];
      objectiveFlags = objectiveFlags + [_flagMarkerName];
    };

 }forEach bunkers;

/*
	_curLevel = perkOffLVL;
if(_curLevel < 4) then {
_rhqPositions = [_lowRHQ];
}
else {
_rhqPositions = RHQMarkers;
};
*/

_rhqPositions = RHQMarkers;

TeleportLocations = BIS_EVO_conqueredTowns + _rhqPositions + _mhqMark + BIS_EVO_LHDMarkers + BIS_EVO_SHIPSPAWNS + objectiveFlags + [farp1];

_nearestPoint = [TeleportLocations, position player] call BIS_fnc_nearestPosition;

_maxDistance = townTeleportDistance;

if(_nearestPoint in _rhqPositions) then {_maxDistance = rhqTeleportDistance;};

if(position player distance ([_nearestPoint] call fnc_getAnyPosition)  > _maxDistance) exitwith{hint "Cannot transfer from here!"};

openMap true;
hint "Pick a location to transfer to";

onMapSingleClick "
  travelMarker= createMarkerLocal ['markerRelo',[0,0,0]];
                  travelMarker setMarkerColor 'ColorBrown';
                travelMarker setMarkerType 'SELECT';
                travelMarker setMarkerAlpha 0;

mapRefresh = true;
_inVehicle = (vehicle player != player);
_nearestMarker = [TeleportLocations, _pos] call BIS_fnc_nearestPosition;
_markerPosition = [_nearestMarker] call fnc_getAnyPosition;

cityToTransfer = TeleportLocations find _nearestMarker;
_dist = _pos distance _markerPosition;

travelCost = 0;
_plyDist = (getPos player) distance _markerPosition;

if (_nearestMarker in BIS_EVO_MissionVillages and !_inVehicle) then {travelCost = round((_plyDist/1000))max 0 min 10;}
else{travelCost = 0};

if (_nearestMarker in BIS_EVO_MissionVillages and _inVehicle) then {travelCost = round((_plyDist/1000)*2)max 0 min 10;};

if(_dist < 300) then {'markerRelo' setMarkerPos _markerPosition; 'markerRelo' setMarkerAlpha 1;}
else
{
  deleteMarker 'markerRelo';
  cityToTransfer = -1;
};
if(cityToTransfer > -1) then 
{
  _trvStr = format ['Travel Price: $%1',travelCost];
  travelMarker setMarkerText _trvStr;
}
	else { hint 'No selection.'
};
true;";

waitUntil{!visibleMap};
onMapSingleClick "";
deleteMarker "markerRelo";
if(cityToTransfer < 0) exitWith{  hint "Relocation cancelled!"};

_tpLoc = teleportLocations select cityToTransfer;
_tpLocPos = [_tpLoc] call fnc_getAnyPosition;

_isViableLoc = (_tpLoc in BIS_EVO_conqueredTowns or _tpLoc in BIS_EVO_LHDMarkers or _tpLoc in _rhqPositions or _tpLoc in  _mhqMark or _tpLoc in BIS_EVO_SHIPSPAWNS or _tpLoc in objectiveFlags);
_enoughMoney = (travelCost <= money);
_traveAllowed = ((vehiclePlaced != 0) and !R3F_LOG_mutex_local_verrou and _enoughMoney and !(_vec isKindOf "Air") and !(_vec isKindOf "Ship"));
_inVehicle = (vehicle player != player);

if(_isViableLoc and _traveAllowed) then 
{
  //When player is not in a vehicle
  if !(_inVehicle) then 
  {
      //MHQ TELEPORT
    if(_tpLoc in _mhqMark) exitWith {
      [player,MHQ] execVM "data\scripts\auswahlw.sqf";
    // systemChat format ["location: %1, MHQMarker: %2",_tpLoc,MHQMarker];  
      };

        if(_tpLoc in  BIS_EVO_SHIPSPAWNS) exitWith {
          _ships = [bam,p72];
         _i = BIS_EVO_SHIPSPAWNS find _tpLoc;
         _svec = _ships select _i;
      [player,_svec] execVM "data\scripts\auswahlw.sqf";
    // systemChat format ["location: %1, MHQMarker: %2",_tpLoc,MHQMarker];  
      };

    Player setpos _tpLocPos;
    call fnc_hideMarkers;
    if(_tpLoc in BIS_EVO_LHDMarkers) then{
      Player setposASL [getpos player select 0,getpos player select 1,18];
    };
    _msg = format ["Travel costs: $%1",travelCost];
    ["sendToClient", [player,fnc_msg,["ss",_msg]]] call CBA_fnc_whereLocalEvent;
    ["sendToClient",[player,fnc_changeMoney,[-travelCost]]] call CBA_fnc_whereLocalEvent;
  }
  else
  {
    _crew = count crew vehicle player;
    if((_tpLoc in _rhqPositions) or (_tpLoc in _mhqMark) or (_isRHQ) or (_isMHQ)) exitWith {hint "Cannot Fast Travel There With a Vehicle"};
    if(_crew > 1) exitWith {hint "You cannot fast travel with AI"};
    vehicle player setpos _tpLocPos;
    call fnc_hideMarkers;
  //  {vehicle _x setpos _tpLoc} forEach crew vehicle player;
    if(_tpLoc in BIS_EVO_LHDMarkers) then 
    {
      //Player setposASL [getpos player select 0,getpos player select 1,18];
      vehicle player setpos _tpLocPos;{vehicle _x setpos _tpLocPos} forEach crew vehicle player;
      vehicle player setposASL [getpos vehicle player select 0,getpos vehicle player select 1,18];
      call fnc_hideMarkers;
    };
    _msg = format ["Travel costs: $%1",travelCost];
    ["sendToClient", [player,fnc_msg,["ss",_msg]]] call CBA_fnc_whereLocalEvent;
		["sendToClient",[player,fnc_changeMoney,[-travelCost]]] call CBA_fnc_whereLocalEvent;
  };
}
else{hint "Cannot fast travel"};