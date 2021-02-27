disableSerialization;
closeDialog 0;
sleep 0.3;

_player = _this select 0;
_id = _this select 2;
_map = objNull;
cityToTransfer = -1;
_cursorPos = [];
BIS_EVO_BaseMarkers = ["LHD1Marker"];
TeleportLocations = BIS_EVO_MissionTowns + BIS_EVO_BaseMarkers;
openMap true;
hint "Pick a location to transfer to";

onMapSingleClick "
  _marker= createMarker ['markerRelo',[0,0,0]];
                  _marker setMarkerColor 'ColorGreen';
                _marker setMarkerShape 'ELLIPSE';
                _marker setMarkerBrush 'Solid';
                _marker setMarkerSize [200, 200];

mapRefresh = true;
_nearestMarker = [TeleportLocations, _pos] call BIS_fnc_nearestPosition;
cityToTransfer = TeleportLocations find _nearestMarker;
_dist = _pos distance getMarkerPos _nearestMarker;

if(_dist < 300) then {'markerRelo' setMarkerPos getMarkerPos _nearestMarker;}
else
{
  deleteMarker 'markerRelo';
  cityToTransfer = -1;
};
if(cityToTransfer > -1) then 
{
  hint format ['Selected: %1', BIS_EVO_Townnames select 0];
}
	else { hint 'No selection.'
};
true;";

waitUntil{!visibleMap};
onMapSingleClick "";
deleteMarker "markerRelo";

if(TeleportLocations select cityToTransfer in BIS_EVO_conqueredTowns or TeleportLocations select cityToTransfer in BIS_EVO_BaseMarkers) then 
{
  hint  "Reloacting to a new location!";
    Player setpos getMarkerPos ((TeleportLocations) select cityToTransfer);
    if((TeleportLocations) select cityToTransfer == "LHD1Marker") then{
      Player setposASL [getpos player select 0,getpos player select 1,18];
    };
     closeDialog 0;
}
else 
{
  hint "Relocation cancelled!";
  closeDialog 0;
};
