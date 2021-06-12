disableSerialization;
closeDialog 0;
sleep 0.3;



_player = _this select 0;
_id = _this select 2;
_map = objNull;
cityToTransfer = -1;
_cursorPos = [];
_rhqPositions = [];
travelCost = 0;
travelMarker = objNull;

BIS_EVO_BaseMarkers = ["LHD1Marker"];
MHQMarker = ["MHQ"];

_lowRHQ = format ["%1amb",player];

	_curLevel = perkOffLVL;
if(_curLevel < 4) then {
_rhqPositions = [_lowRHQ];
}
else {
_rhqPositions = RHQMarkers;
};
// BIS_EVO_MissionTowns + BIS_EVO_BaseMarkers +
TeleportLocations = BIS_EVO_conqueredTowns + _rhqPositions + MHQMarker + BIS_EVO_BaseMarkers;

_nearestPoint = [TeleportLocations, position player] call BIS_fnc_nearestPosition;

_maxDistance = 300;

if(_nearestPoint in _rhqPositions) then {_maxDistance = 20;};

if(position player distance getmarkerpos _nearestPoint > _maxDistance) exitwith{hint "Cannot transfer from here!"};

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
cityToTransfer = TeleportLocations find _nearestMarker;
_dist = _pos distance getMarkerPos _nearestMarker;
travelCost = 0;
_plyDist = (getPos player) distance getMarkerPos _nearestMarker;

if (_nearestMarker in BIS_EVO_MissionVillages and !_inVehicle) then {travelCost = round((_plyDist/1000))max 0 min 10;}
else{travelCost = 0;};

if (_nearestMarker in BIS_EVO_MissionVillages and _inVehicle) then {travelCost = round((_plyDist/1000)*2)max 0 min 10;};

if(_dist < 300) then {'markerRelo' setMarkerPos getMarkerPos _nearestMarker; 'markerRelo' setMarkerAlpha 1;}
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
_inVehicle = (vehicle player != player);
if((TeleportLocations select cityToTransfer in BIS_EVO_conqueredTowns or TeleportLocations select cityToTransfer in BIS_EVO_BaseMarkers or TeleportLocations select cityToTransfer in _rhqPositions or TeleportLocations select cityToTransfer in MHQMarker)and travelCost <= money) then 
{
  //When player is not in a vehicle
  if !(_inVehicle) then { 
      //MHQ TELEPORT
    if(TeleportLocations select cityToTransfer in MHQMarker) exitWith {
      	if(!alive MHQ or (vehiclePlaced == 0) or (R3F_LOG_mutex_local_verrou)) exitWith{hint "You cannot do that right now."; };
      [player] execVM "data\scripts\auswahlw.sqf"};

      //Cant teleport when carrying static weapon
    if(TeleportLocations select cityToTransfer in _rhqPositions) exitWith {
      	if((vehiclePlaced == 0) or (R3F_LOG_mutex_local_verrou)) exitWith{hint "You cannot do that right now."; };
      };

    Player setpos getMarkerPos ((TeleportLocations) select cityToTransfer);
    if((TeleportLocations) select cityToTransfer == "LHD1Marker") then{
      Player setposASL [getpos player select 0,getpos player select 1,18];
    };
    _msg = format ["Travel costs: $%1",travelCost];
    ["jed_msg", [player, _msg]] call CBA_fnc_whereLocalEvent;
		["jed_addMoney", [player, -travelCost]] call CBA_fnc_whereLocalEvent;
  }
  else //When player is in a vehicle
  {
    vehicle player setpos  getMarkerPos ((TeleportLocations) select cityToTransfer);{vehicle _x setpos  getMarkerPos ((TeleportLocations) select cityToTransfer)} forEach crew vehicle player;
    if((TeleportLocations) select cityToTransfer == "LHD1Marker") then{
     // Player setposASL [getpos player select 0,getpos player select 1,18];
     vehicle player setpos getMarkerPos ((TeleportLocations) select cityToTransfer);{vehicle _x setpos getMarkerPos ((TeleportLocations) select cityToTransfer)} forEach crew vehicle player;
      vehicle player setposASL [getpos vehicle player select 0,getpos vehicle player select 1,18];
    };
    _msg = format ["Travel costs: $%1",travelCost];
    ["jed_msg", [player, _msg]] call CBA_fnc_whereLocalEvent;
		["jed_addMoney", [player, -travelCost]] call CBA_fnc_whereLocalEvent;
  };
}
else 
{
  hint "Relocation cancelled!";
  closeDialog 0;
};
