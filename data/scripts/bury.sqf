// Deletes dead Enemy
private ["_unit"]; 
_unit = _this select 0;
_killer = _this select 1;
_dispname = getText (configFile >> "cfgVehicles" >> typeof _unit >> "displayName");	// different displayname for different languages


if (not (_unit isKindOf "Man")) then
{
	if(isPlayer _killer) then 
	{
		systemChat format ["You destroyed: %1", _dispname];
	};
	{_x setpos position _unit} forEach crew _unit;
	sleep 300.0;
	deletevehicle _unit;
};
if (_unit isKindOf "Man") then
{
	if(not ((vehicle _unit) isKindOf "Man")) then {_unit setpos (position vehicle _unit)} ;
	sleep 310.0;
	hideBody _unit;
};
