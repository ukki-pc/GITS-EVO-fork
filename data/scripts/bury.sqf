// Deletes dead Enemy
private ["_unit"]; 
_unit = _this select 0;
_killer = _this select 1;
_dispname = getText (configFile >> "cfgVehicles" >> typeof _unit >> "displayName");	// different displayname for different languages
_msg = "";

/*
if(_killer isKindOf "Man") then {hint "man kill"};
if(_killer isKindOf "Car") then {hint "Car kill"};
if(_killer isKindOf "Plane") then {hint "Plane kill"};
if(_killer isKindOf "Helicopter") then {hint "Heli kill"};
if(_killer isKindOf "Tank") then {hint "Tank kill"};
*/

if (_unit isKindOf "Man") then
{
	if(isPlayer _killer and hitMarker) then {["jed_hitMarker", [_killer]] call CBA_fnc_whereLocalEvent;};
	if(isPlayer _killer or isPlayer leader _killer) then 
	{
		if(!isPlayer _killer) then {_killer = leader _killer;};
		_msg = format ["1$ for killing: %1",_dispname];
		//["jed_msg", [_killer, _msg]] call CBA_fnc_whereLocalEvent;
		[_msg] call fnc_hudMessage_handler;
		["jed_addMoney", [_killer, 1]] call CBA_fnc_whereLocalEvent;
	};
	{_x setpos position _unit} forEach crew _unit;
	sleep 300.0;
	hideBody _unit;
};

if ( (_unit isKindOf "Car")) then
{
	if(isPlayer _killer and hitMarker) then {["jed_hitMarker", [_killer]] call CBA_fnc_whereLocalEvent;};
	if(isPlayer _killer or isPlayer leader _killer) then 
	{
		if(!isPlayer _killer) then {_killer = leader _killer;};
		_msg = format ["2$ for destroying: %1",_dispname];
		//["jed_msg", [_killer, _msg]] call CBA_fnc_whereLocalEvent;
		[_msg] call fnc_hudMessage_handler;
		["jed_addMoney", [_killer, 2]] call CBA_fnc_whereLocalEvent;
	};
	{_x setpos position _unit} forEach crew _unit;
	sleep 300.0;
	deletevehicle _unit;
};
if ( (_unit isKindOf "Plane")) then
{
	if(isPlayer _killer and hitMarker) then {["jed_hitMarker", [_killer]] call CBA_fnc_whereLocalEvent;};
	if(isPlayer _killer or isPlayer leader _killer) then 
	{
		if(!isPlayer _killer) then {_killer = leader _killer;};
		_msg = format ["5$ for destroying: %1",_dispname];
			[_msg] call fnc_hudMessage_handler;
		["jed_addMoney", [_killer, 5]] call CBA_fnc_whereLocalEvent;
	};
	{_x setpos position _unit} forEach crew _unit;
	sleep 300.0;
	deletevehicle _unit;
};
if ( (_unit isKindOf "Helicopter")) then
{
	if(isPlayer _killer and hitMarker) then {["jed_hitMarker", [_killer]] call CBA_fnc_whereLocalEvent;};
	if(isPlayer _killer or isPlayer leader _killer) then 
	{
		if(!isPlayer _killer) then {_killer = leader _killer;};
		_msg = format ["4$ for destroying: %1",_dispname];
			[_msg] call fnc_hudMessage_handler;
		["jed_addMoney", [_killer, 4]] call CBA_fnc_whereLocalEvent;
	};
	{_x setpos position _unit} forEach crew _unit;
	sleep 300.0;
	deletevehicle _unit;
};
if ( (_unit isKindOf "Tank")) then
{
	if(isPlayer _killer and hitMarker) then {["jed_hitMarker", [_killer]] call CBA_fnc_whereLocalEvent;};
	if(isPlayer _killer or isPlayer leader _killer) then 
	{
		if(!isPlayer _killer) then {_killer = leader _killer;};
		_msg = format ["3$ for destroying: %1",_dispname];
			[_msg] call fnc_hudMessage_handler;
		["jed_addMoney", [_killer, 3]] call CBA_fnc_whereLocalEvent;
	};
	{_x setpos position _unit} forEach crew _unit;
	sleep 300.0;
	deletevehicle _unit;
};

if ( (_unit isKindOf "Ship")) then
{
	if(isPlayer _killer and hitMarker) then {["jed_hitMarker", [_killer]] call CBA_fnc_whereLocalEvent;};
	if(isPlayer _killer or isPlayer leader _killer) then 
	{
		if(!isPlayer _killer) then {_killer = leader _killer;};
		_msg = format ["5$ for destroying: %1",_dispname];
			[_msg] call fnc_hudMessage_handler;
		["jed_addMoney", [_killer, 5]] call CBA_fnc_whereLocalEvent;
	};
	{_x setpos position _unit} forEach crew _unit;
	sleep 300.0;
	deletevehicle _unit;
};