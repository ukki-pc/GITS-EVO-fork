//makes black square dot at location of dropped vehicle or building and deletes unit after 30 mins
_unit = _this select 0;

_mrk = format["amo%1",time];

_bmark2 = createMarker [_mrk, position _unit];
_bmark2 setMarkerShape "ICON";
_bmark2 setMarkerType "Marker";
_bmark2 setMarkerColor "ColorBlack";
//_bmark2 setMarkerText "X";
_bmark2 setMarkerSize [0.5, 0.5];

sleep 1800.0; //30 min
deletevehicle _unit;
deletemarker _mrk;