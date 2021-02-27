// marks enemy vehs with a custom dot on the map
_unit = _this select 0;
_string = _this select 1;
_color = _this select 2;
_leader = gunner _unit;
_group = group _leader;
_unitm = format ["%1", _unit];
_markerobj = createMarker[_unitm,[getpos _unit select 0,getpos _unit select 1]];
_markerobj setMarkerType  "Dot";
_markerobj setMarkerColor _color;
_markerobj setMarkerText _string;

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	if (not canmove _unit) exitwith {deleteMarker _markerobj};
	_markerobj setMarkerPos [getpos _unit select 0,getpos _unit select 1];
	sleep 5;
};
