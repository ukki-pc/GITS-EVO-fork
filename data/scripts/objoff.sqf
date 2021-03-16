// server side capture officer script
_off = _this select 0;
_grp = group _off;

	_mark = format["M%1",_off];
	_search = createMarker [_mark, [-5000,-5000,0]];
	_search setMarkerType "plp_icon_photo";
	_search setMarkerText localize "STR_M04t47_0";//Capture Officer
	_search setMarkerColor "ColorGreenAlpha";

	_trgobj3 = createTrigger ["EmptyDetector", position _off];
	_trgobj3 setTriggerActivation [EGG_EVO_strPLAYERFACTION, "PRESENT", true];
	_trgobj3 setTriggerArea [200, 200, 0, false];
	for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
	{
		sleep 4.001;
		_allPlayers = call BIS_fnc_listPlayers;
		{	
			sleep 1;
			if (_x in list _trgobj3 and vehicle _x isKindOf "Man") then {_search setMarkerPos position _off};
		}forEach _allPlayers;
		_trgobj3 setpos position _off;
//		if ((group _off) != _grp) then {_loop=1};
		if (not (alive _off)) then {_loop=1};
	};
	deletevehicle _trgobj3;
	deletemarker _search;

