
_vehicle = _this select 0;
if(inrepairzone) then 
{
	_matches = 0;

	_matches = [typeof _vehicle] call fnc_countUpgrades;
	
	if(_matches>0) exitWith{hint format ["Vehicle upgrades available: %1", _matches]};
	if(_matches == 0)exitWith{hintsilent format ["No upgrades available for this vehicle!"];};
};

