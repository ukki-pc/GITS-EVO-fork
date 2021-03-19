// marks enemy vehs with a custom dot on the map
_unit = _this select 0;
_string = _this select 1;
_color = _this select 2;
_type = _this select 3;
_enableDir = _this select 4; // For top down vehicle markers
_scale = _this select 5;


_leader = gunner _unit;
_group = group _leader;
_unitm = format ["%1", _unit];
_markerobj = createMarker[_unitm,[getpos _unit select 0,getpos _unit select 1]];
if(isNil "_type") then {_markerobj setMarkerType  "Dot"}
else{_markerobj setMarkerType _type};
if(isNil "_enableDir") then {_enableDir = false};
if(isNil "_scale") then {_scale = 1;};

_markerobj setMarkerColor _color;
_markerobj setMarkerText _string;
_markerobj setMarkerSize [_scale,_scale];

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	if(_enableDir) then {_markerobj setMarkerDir (direction _unit)};
	if (not canmove _unit) exitwith {deleteMarker _markerobj};
	_markerobj setMarkerPos [getpos _unit select 0,getpos _unit select 1];
	sleep 5;
};
