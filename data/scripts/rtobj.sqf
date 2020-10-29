// server side blow radiotower marker
_rt = _this select 0;

_mark = format["RT%1",_rt];
_search = createMarker [_mark, [-5000,-5000,0]];
_search setMarkerType "mil_destroy";
_search setMarkerText localize "STR_M04t48";//Radio Tower
_search setMarkerColor "ColorRed";
_search setMarkerSize [0.5, 0.5];

_trgobj3 = createTrigger ["EmptyDetector", position _rt];
_trgobj3 setTriggerActivation ["WEST", "PRESENT", true];
_trgobj3 setTriggerArea [200, 200, 0, false];
for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 4.001;
	if (count list _trgobj3 > 0) then {_search setMarkerPos position _rt};
	if (not (alive _rt)) then {_loop=1};
};
deletevehicle _trgobj3;
deletemarker _search;