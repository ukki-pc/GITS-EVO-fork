// server side capture officer script
_off = _this select 0;
_grp = group _off;

	_mark = format["M%1",_off];
	_search = createMarker [_mark, [-5000,-5000,0]];
	_search setMarkerType "mil_join";
	_search setMarkerText localize "STR_M04t47_0";//Capture Officer
	_search setMarkerColor "ColorGreen";
	_search setMarkerSize [0.5, 0.5];

	_trgobj3 = createTrigger ["EmptyDetector", position _off];
	_trgobj3 setTriggerActivation ["WEST", "PRESENT", true];
	_trgobj3 setTriggerArea [200, 200, 0, false];
	for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
	{
		sleep 4.001;
		if (count list _trgobj3 > 0) then {_search setMarkerPos position _off};
		_trgobj3 setpos position _off;
//		if ((group _off) != _grp) then {_loop=1};
		if (not (alive _off)) then {_loop=1};
	};
	deletevehicle _trgobj3;
	deletemarker _search;

