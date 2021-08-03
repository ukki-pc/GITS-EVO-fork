// private ["_vec","_mrktype","_vecType","_markerobj6"];

_vec = _this select 0;
_vecType = typeOf _vec;

if(_vec getVariable ["spotted",false] or _vec isKindOf "Man") exitWith {};


_mrktype = "b_mech_inf";
if (_vec isKindOf "Car") then {_mrktype = "plp_icon_vehicle"};
if (_vec isKindOf "Tank") then {_mrktype = "plp_icon_tank"};
if (_vec isKindOf "Plane") then {_mrktype = "plp_icon_planeLight"};

_markerobj6 = createMarker[format["%1",_vec],[getpos _vec select 0,getpos _vec select 1]];
_markerobj6 setMarkerColor "ColorRed";
_markerobj6 setMarkerType _mrktype;
_vec setVariable ["spotted",true];

Hint "Spotted";

while {sleep 4;  alive _vec} do 
{
    if(visibleMap) then 
    {
        _markerobj6 setMarkerPos getPos _vec;
    };
};

deleteMarker _markerobj6;
