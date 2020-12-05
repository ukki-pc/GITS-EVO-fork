// marks enemy planes with a red dot on the map
_unit = _this select 0;
_leader = gunner _unit;
_group = group _leader;
_unitm = format ["%1", _unit];
_markerobj = createMarker[_unitm,[getpos _unit select 0,getpos _unit select 1]];
_markerobj setMarkerType  "Dot";
_markerobj setMarkerColor "ColorWhite";
_markerobj setMarkerText "Sea target";

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	if (not canmove _unit) exitwith {deleteMarker _markerobj};
	_markerobj setMarkerColor "ColorBlue";
	_markerobj setMarkerPos [getpos _unit select 0,getpos _unit select 1];
	sleep 5;
};
