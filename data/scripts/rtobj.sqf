// server side blow radiotower marker
_rt = _this select 0;

_mark = format["RT%1",_rt];
_search = createMarker [_mark, [-5000,-5000,0]];
_search setMarkerType "plp_icon_radiotower";
_search setMarkerText localize "STR_M04t48";//Radio Tower
_search setMarkerColor "ColorRed";
//_search setMarkerSize [0.5, 0.5];

_trgobj3 = createTrigger ["EmptyDetector", position _rt];
_trgobj3 setTriggerActivation [EGG_EVO_strPLAYERFACTION, "PRESENT", true];
_trgobj3 setTriggerArea [200, 200, 0, false];

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 4.001;
	_allPlayers = call BIS_fnc_listPlayers;
	{	sleep 1;
		if (_x in list _trgobj3 and vehicle _x isKindOf "Man") then {_search setMarkerPos position _rt};
	}forEach _allPlayers;
	if (not (alive _rt)) then {_loop=1};
};
deletevehicle _trgobj3;
deletemarker _search;