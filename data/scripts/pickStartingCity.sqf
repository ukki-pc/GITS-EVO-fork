disableSerialization;
closeDialog 0;
sleep 0.3;

if(BIS_EVO_MissionProgress > -1) exitWith {hint "Mission already in progress."};
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
hint "Pick an objective to start from";
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
  hint format ['%1\nConnections: %2\nCoast: %3\nCan Attack: %4',(BIS_EVO_MissionTownNames select cityToAttack),count reinftowns,coastalTown, (connectedTowns or coastalTown)];
}
	else { hint 'No selection.';
  
  {deleteMarker _x} foreach reinfMarkers;
  sleep 0.1;
  reinfMarkers = [];
  };
true;";
while{sleep BIS_EVO_frameDelay; visibleMap} do {"cityMarker" setMarkerDir (markerDir "cityMarker" + 1);};

waitUntil{sleep BIS_EVO_frameDelay; !visibleMap};
onMapSingleClick "";
deleteMarker "cityMarker";

if(cityToAttack > -1 and !(cityToAttackName in BIS_EVO_conqueredTowns)) then 
{
  hint format ["Launching assault on %1!",BIS_EVO_MissionTownNames select cityToAttack];
  BIS_EVO_MissionProgress = cityToAttack;
  publicVariableServer "BIS_EVO_MissionProgress";
  
  closeDialog 0;
}
else 
{
  hint "Assault planning cancelled!";
  BIS_EVO_Onmission=false;
  {deleteMarker _x} foreach reinfMarkers;
  closeDialog 0;
};
