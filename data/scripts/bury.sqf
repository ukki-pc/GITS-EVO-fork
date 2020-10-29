// Deletes dead Enemy
private ["_unit"]; 
_unit = _this select 0;

if (not (_unit isKindOf "Man")) then
{
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
