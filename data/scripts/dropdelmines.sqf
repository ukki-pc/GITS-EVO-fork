// Deletes a minefield after a while. 
_unit = _this select 0;

_mrk = format["amo%1",time];

_bmark2 = createMarker [_mrk, position _unit];
_bmark2 setMarkerShape "ICON";
_bmark2 setMarkerType "mil_warning";
_bmark2 setMarkerColor "ColorRed";
_bmark2 setMarkerText localize "str_dn_mines";//Mines
_bmark2 setMarkerSize [0.5, 0.5];

sleep 1800.0; //30 min
deletevehicle _unit;
deletemarker _mrk;
