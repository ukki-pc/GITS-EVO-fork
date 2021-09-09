
// marks enemy vehs with a custom dot on the map
_unit = _this select 0;
_string = _this select 1;
_color = _this select 2;
_type = _this select 3;
_enableDir = _this select 4; // For top down vehicle markers
_scale = _this select 5;
_nameOverride = _this select 6; //If you want to specify the marker name

_unitm = format ["%1", _unit];
if !(isNil "_nameOverride") then {_unitm = format ["%1",_nameOverride]};
_markerobj = createMarker[_unitm,[getpos _unit select 0,getpos _unit select 1]];
if(isNil "_type") then {_markerobj setMarkerType  "Dot"}
else{_markerobj setMarkerType _type};
if(isNil "_enableDir") then {_enableDir = false};
if(isNil "_scale") then {_scale = 1;};

_markerobj setMarkerColor _color;
_markerobj setMarkerText _string;
_markerobj setMarkerSize [_scale,_scale];

_rot = _unit isKindOf "Plane";

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	if(_enableDir) then 
	{
		_dir = direction _unit;
		if(_rot) then {_markerobj setMarkerDir _dir} 
		else 
		{
			if(_dir < 180) then {_markerobj setMarkerType format ["%1R",_type]}
			else{_markerobj setMarkerType _type};
		};
	};
	if (not canmove _unit) exitwith {deleteMarker _markerobj};
	_markerobj setMarkerPos [getpos _unit select 0,getpos _unit select 1];
	sleep 5;
};
