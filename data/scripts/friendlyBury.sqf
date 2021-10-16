// Deletes dead
private ["_unit"]; 
_unit = _this select 0;
_killer = _this select 1;
_dispname = getText (configFile >> "cfgVehicles" >> typeof _unit >> "displayName");	// different displayname for different languages
_msg = "";

if ( !(_unit isKindOf "Man")) then
{

	{_x setpos position _unit} forEach crew _unit;
	sleep 300.0;
	deletevehicle _unit;
};
if (_unit isKindOf "Man") then
{
	if(isPlayer _killer or isPlayer leader _killer) then 
	{
		if(!isPlayer _killer) then {_killer = leader _killer;};
		_msg = format ["-1$ penalty for killing: %1",_dispname];
		["sendToClient", [_killer,fnc_msg,["ss",_msg]]] call CBA_fnc_whereLocalEvent;
		["sendToClient",[_killer,fnc_changeMoney,[-1]]] call CBA_fnc_whereLocalEvent;
	};
	{_x setpos position _unit} forEach crew _unit;
	sleep 300.0;
	hideBody _unit;
};
