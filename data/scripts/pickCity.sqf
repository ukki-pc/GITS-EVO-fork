BIS_EVO_allCities = [town2,town21,town13,town12,town22,town23,town10,town9,town7,town20,town4];
disableSerialization;
closeDialog 0;
sleep 0.3;

_player = _this select 0;
_id = _this select 2;
_map = objNull;
cityCount = count BIS_EVO_allCities;


mapRefresh = false;
cityToAttack = -1;
openMap true;
hint "Pick a city to assault";
mapclick = true;
_cursorPos = [];

onMapSingleClick "
  _marker= createMarker ['marker1',[0,0,0]];
                  _marker setMarkerColor 'ColorGreen';
                _marker setMarkerShape 'ELLIPSE';
                _marker setMarkerBrush 'Solid';
                _marker setMarkerSize [200, 200];

mapRefresh = true;
_nearestMarker = [BIS_EVO_MissionTowns, _pos] call BIS_fnc_nearestPosition;
cityToAttack = BIS_EVO_MissionTowns find _nearestMarker;
_dist = _pos distance getMarkerPos _nearestMarker;

if(_dist < 300) then {'marker1' setMarkerPos getMarkerPos _nearestMarker;}
else {
deleteMarker 'marker1';
cityToAttack = -1;
};
if(cityToAttack > -1) then {hint format ['Selected: %1', BIS_EVO_Townnames select cityToAttack];}
	else { hint 'No selection.'};
true;";



//if(BIS_EVO_MissionProgress != -1) exitWith{};


//if(BIS_EVO_Onmission) exitWith {openMap false;hint "Cannot launch during operation!";};

/*

while{visibleMap} do 
{  
	
	waitUntil{mapRefresh or !visibleMap};
  sleep 0.1;
      for [{_rloop=0}, {_rloop< citycount}, {_rloop=_rloop}] do 
      {




            if(!visiblemap) then {_rloop = cityCount+1};
            if ((BIS_EVO_allCities select _rloop) in list BIS_EVO_CityDetect ) then 
            {
              mapRefresh = false;
              _marker= createMarker ['marker1',[0,0,0]];
                BIS_EVO_CityDetect setPos [0,0,0];
                "marker1" setMarkerPos getPos (BIS_EVO_allCities select _rloop);
                  _marker setMarkerColor 'ColorBlack';
                _marker setMarkerShape 'ELLIPSE';
                _marker setMarkerBrush 'Solid';
                _marker setMarkerSize [200, 200];
                cityToAttack = _rloop;
                hint format  ["Picked city: %1 \n Click again to cancel \n Close map to Begin assault",BIS_EVO_Townnames select _rloop];
                waitUntil{mapRefresh or !visibleMap};
                if(!visiblemap) then {_rloop = cityCount+1};
              }
              else{
                   _rloop = _rloop +1;
                    };
              if(_rloop == citycount)then {
                mapRefresh = false;
                cityToAttack = -1;
                hint "No city selected";
                waitUntil{mapRefresh or !visibleMap};
                if(!visiblemap) then {_rloop = cityCount+1};
                _rloop = 0
              };
        };
      deleteMarker "marker1";
      deleteVehicle BIS_EVO_CityDetect;
	  *
};
*/


waitUntil{!visibleMap};
onMapSingleClick "";
deleteMarker "marker1";

if(cityToAttack > -1) then 
{
hint format ["Launching assault on %1!",BIS_EVO_Townnames select cityToAttack];
BIS_EVO_MissionProgress = cityToAttack;
publicVariable "BIS_EVO_MissionProgress";
//_events = [] execVM "data\scripts\EVO_MissionManager.sqf";
closeDialog 0;
}
else {
hint "Assault planning cancelled!";
BIS_EVO_Onmission=false;
closeDialog 0;
};
