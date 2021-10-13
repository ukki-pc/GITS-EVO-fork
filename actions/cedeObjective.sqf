disableSerialization;
closeDialog 0;
sleep 0.3;

_faction = _this select 0;

_map = objNull;
attackMarker = objNull;

mapRefresh = false;
cityToAttack = -1;
openMap true;
hint "Pick a captured base";
mapclick = true;
_cursorPos = [];
_viableLocs = [[BIS_EVO_ConqueredTowns-BIS_EVO_cededCities,BIS_EVO_militaryObjectives]] call fnc_getSimiliarIndexes;

onMapSingleClick "
  attackMarker= createMarkerLocal ['cityMarker',[0,0,0]];
                  attackMarker setMarkerColor 'ColorRed';
                attackMarker setMarkerType 'selector_selectedEnemy';

mapRefresh = true;
_nearestMarker = [[[BIS_EVO_ConqueredTowns-BIS_EVO_cededCities,BIS_EVO_militaryObjectives]] call fnc_getSimiliarIndexes, _pos] call BIS_fnc_nearestPosition;
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
while{sleep BIS_EVO_frameDelay; visibleMap} do {"cityMarker" setMarkerDir (markerDir "cityMarker" + 1);};

waitUntil{!visibleMap};
onMapSingleClick "";
deleteMarker "cityMarker";

if(cityToAttack > -1 and (BIS_EVO_MissionTowns select cityToAttack in _viableLocs)) then 
{
  hint format ["CEDED CITY %1!",BIS_EVO_Townnames select 0];

  BIS_EVO_cededCities = BIS_EVO_cededCities + [BIS_EVO_MissionTowns select cityToAttack];
  BIS_EVO_cededOwners = BIS_EVO_cededOwners + [_faction];

  closeDialog 0;
}
else 
{
  hint "CEDE CANCELLED!";
  BIS_EVO_Onmission=false;
  closeDialog 0;
};
