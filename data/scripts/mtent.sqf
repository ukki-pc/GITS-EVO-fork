// allows medics to build a mash
if (player in list AirportIn) exitWith {hint localize "STR_M04t76"};

deletevehicle mtent;
player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 3.0;
WaitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};

_mark = format["%1mash",(name player)];
deleteMarker _mark;
mtent = "Mash" createVehicle (position player);Sleep BIS_EVO_GlobalSleep;

mtent addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}];

_pos = position mtent;
_mssg = format["%1's MASH",(name player)];
_medmark = createMarker [_mark, _pos];
_medmark setMarkerShape "ICON";
_medmark setMarkerType "b_med";
_medmark setMarkerColor "ColorBlue";
_medmark setMarkerText _mssg;
_medmark setMarkerSize [0.5, 0.5];
