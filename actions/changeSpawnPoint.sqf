disableSerialization;
closeDialog 0;
sleep 0.3;

_player = _this select 0;
_id = _this select 2;
_map = objNull;
attackMarker = objNull;

mapRefresh = false;
cityToAttack = -1;
openMap true;
hint "Pick a respawn point";
mapclick = true;
_cursorPos = [];

onMapSingleClick "
  attackMarker= createMarkerLocal ['cityMarker',[0,0,0]];
                  attackMarker setMarkerColor 'ColorRed';
                attackMarker setMarkerType 'selector_selectedEnemy';

mapRefresh = true;
_nearestMarker = [BIS_EVO_ConqueredTowns, _pos] call BIS_fnc_nearestPosition;
cityToAttack = BIS_EVO_MissionTowns find _nearestMarker;
_dist = _pos distance getPos _nearestMarker;

if(_dist < 300) then {'cityMarker' setMarkerPos getPos _nearestMarker;}
else {
deleteMarker 'cityMarker';
cityToAttack = -1;
};
if(cityToAttack > -1) then {hint format ['Selected: %1', BIS_EVO_Townnames select 0];}
	else { hint 'No selection.'};
true;";
while{visibleMap} do {sleep 0.04; "cityMarker" setMarkerDir (markerDir "cityMarker" + 1);};

waitUntil{!visibleMap};
onMapSingleClick "";
deleteMarker "cityMarker";

if(cityToAttack > -1 and (BIS_EVO_MissionTowns select cityToAttack in BIS_EVO_conqueredTowns)) then 
{
  hint format ["Selected respawnpoint on an %1!",BIS_EVO_Townnames select 0];

  respawnPoint = BIS_EVO_MissionTowns select cityToAttack;
  closeDialog 0;
}
else 
{
  hint "Respawnpoint cancelled!";
  BIS_EVO_Onmission=false;
  closeDialog 0;
};
