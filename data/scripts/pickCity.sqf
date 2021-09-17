disableSerialization;
closeDialog 0;
sleep 0.3;

if(BIS_EVO_MissionProgress > -1) exitWith {hint "Mission already in progress."};

_player = _this select 0;
_id = _this select 2;
_map = objNull;
attackMarker = objNull;
reinfMarkers = [];
cityToAttackName = "";
mapRefresh = false;
reinfTowns = [];
syncTowns = [];
cityToAttack = -1;
connectedTowns = false;
coastalTown = false;
openMap true;
hint "Pick a city to assault";
mapclick = true;
_cursorPos = [];
onMapSingleClick "
attackMarker= createMarkerLocal ['cityMarker',[0,0,0]];
syncTowns = false;
attackMarker setMarkerColor 'ColorRed';
attackMarker setMarkerType 'selector_selectedEnemy';
connectedTOwns = false;

mapRefresh = true;
_nearestMarker = [BIS_EVO_MissionTowns, _pos] call BIS_fnc_nearestPosition;

cityToAttack = BIS_EVO_MissionTowns find _nearestMarker;
cityToAttackName = BIS_EVO_MissionTowns select CityToAttack;
_dist = _pos distance getPos _nearestMarker;

_friendlyCity = cityToAttackName in BIS_EVO_ConqueredTowns;
{deleteMarker _x} foreach reinfMarkers;
syncTowns =  [(BIS_EVO_MissionTowns select cityToAttack)] call fnc_get_synchronized_towns;
reinftowns = syncTowns - BIS_EVO_ConqueredTowns;
_reinftownNames = [];
coastalTown = cityToAttackName in BIS_EVO_CoastalTowns;

{
  if(_x in BIS_EVO_conqueredTowns) exitWith{connectedTowns = true};
}forEach syncTowns;

if(_dist < 600 and !_friendlyCity) then {'cityMarker' setMarkerPos getPos _nearestMarker;}
else {
deleteMarker 'cityMarker';
cityToAttack = -1;
};
if(cityToAttack > -1 and !_friendlyCity) then 
{
{deleteMarker _x} foreach reinfMarkers;
  {
    _reinftownNames = _reinftownNames + [BIS_EVO_MissionTownNames select (BIS_EVO_MissionTowns find _x)];
    _reinfMrkName = format ['%1_rmark',_x];
  _reinfMarker = createMarkerLocal [_reinfMrkName,[0,0,0]];
    _reinfMrkName setMarkerPos getPos _x;
    _reinfMarker setMarkerType 'selector_selectedFriendly';
    _reinfMarker setMarkerColor 'ColorRed';
    reinfMarkers = reinfMarkers + [_reinfMarker];
  } forEach reinftowns;
  hint format ['%1\nConnections: %2\nInfantry Garrison: %3\nVehicle Garrison: %4\nCoast: %5\nCan Attack: %6',(BIS_EVO_MissionTownNames select cityToAttack),count reinftowns,BIS_EVO_MissionTownInfGarrisons select cityToAttack,BIS_EVO_MissionTownVecGarrisons select cityToAttack,coastalTown, (connectedTowns or coastalTown)];
}
	else { hint 'No selection.';
  
  {deleteMarker _x} foreach reinfMarkers;
  sleep 0.1;
  reinfMarkers = [];
  };
true;";
while{visibleMap} do {sleep 0.04; "cityMarker" setMarkerDir (markerDir "cityMarker" + 1);};

waitUntil{!visibleMap};
onMapSingleClick "";
deleteMarker "cityMarker";

if(cityToAttack > -1 and !(cityToAttackName in BIS_EVO_conqueredTowns)) then 
{
  hint format ["Launching assault on %1!",BIS_EVO_MissionTownNames select cityToAttack];
  //BIS_EVO_MissionProgress = cityToAttack;
  //publicVariableServer "BIS_EVO_MissionProgress";
  ["jed_missionManager", [cityToAttack]] call CBA_fnc_globalEvent;
  closeDialog 0;
}
else 
{
  hint "Assault planning cancelled!";
  BIS_EVO_Onmission=false;
  {deleteMarker _x} foreach reinfMarkers;
  closeDialog 0;
};
