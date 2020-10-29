// Puts enemy soldiers into the capture state.
_unit = _this select 0;
_grp = group _unit;

//hint "submit calling capture";

//if(_tag > 0) then {_unit removeaction _tag};
_tag = _unit addaction [localize "STR_M04xt10","data\scripts\capture.sqf",0,1, true, true,""]; // "Capture"

//if(_tag > 0) exitWith {_unit removeaction _tag};

if (isServer) then
//if (alive _unit) then
{
		removeallweapons _unit;
//adding
		_unit setBehaviour "Careless";
		_unit allowFleeing 0;
		commandStop _unit;
//
		_unit switchmove "amovpercmstpsnonwnondnon";
		_unit disableAI "AUTOTARGET";
		_unit addEventHandler ["killed", {BIS_EVO_sot = format["%1",(_this select 1)];BIS_EVO_sor = -5;BIS_EVO_sop = (_this select 1);publicVariable "BIS_EVO_sop";publicVariable "BIS_EVO_sot";publicVariable "BIS_EVO_sor";(_this select 0) removealleventhandlers "killed"}];
//		_unit disableAI "AUTOTARGET";
};

WaitUntil {not (alive _unit) or animationState _unit == "AmovPercMstpSsurWnonDnon"};
_unit removeaction _tag;

sleep 30.0;

deletevehicle _unit;