// special action for engineers to erect a farp
//adding array for support trucks (see init)EGG_EVO_repairtruck

_trk=[];
_tpresent =0;
_trk = (nearestObjects [player, ["Car","Truck"], 50]);
sleep 0.5;
_tcount = (count _trk);

if (_tcount < 1) exitWith {hint localize "STR_M04t73"};

_tk = 0;
while {_tk <= _tcount} do 
{
	_ntk = (_trk select (_tk));
	_trktype = typeOf (vehicle _ntk);
	if (_trktype in EGG_EVO_repairtruck) then 
	{
		_tpresent =1;
		_tk=_tcount;
	};
	_tk = _tk+1;
	sleep 1;
};

if (_tpresent <1) exitWith {hint localize "STR_M04t73"};

if (player in list AirportIn) exitWith {hint localize "STR_M04t74"};

deletevehicle etent;
deletevehicle epad;
deletevehicle ebox;
deletevehicle tbox;

_mark = format["%1farp",(name player)];
deleteMarker _mark;

player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 3.0;
WaitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};

epad = "HeliH" createVehicle (position player);
_pos = position epad;

_pos2 = [_pos select 0,(_pos select 1) - 18,_pos select 2];
etent = "Camp" createVehicle _pos2;
_pos3 = [(_pos2 select 0)+3,(_pos2 select 1)+3,_pos2 select 2];
_pos4 = [(_pos2 select 0)+5,(_pos2 select 1)+5,_pos2 select 2];
ebox = "USBasicAmmunitionBox" createVehicle _pos3;
tbox = "TKVehicleBox_EP1" createVehicle _pos4;
tbox setAmmoCargo 0.2;
tbox setRepairCargo 0.2;
//ebox = "TKVehicleBox_EP1" createVehicle _pos3;

BIS_EVO_EngZone setpos _pos;	

etent addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];
ebox addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];

_mssg = format["%1's FARP",(name player)];
_medmark = createMarker [_mark, _pos];
_medmark setMarkerShape "ICON";
_medmark setMarkerType "b_hq";
_medmark setMarkerColor "ColorGreen";
_medmark setMarkerText _mssg;
_medmark setMarkerSize [0.5, 0.5];
