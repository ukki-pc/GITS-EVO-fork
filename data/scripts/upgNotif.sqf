_vehicle = _this select 0;
_player = _this select 2;

if(isPlayer _player) exitWith 
{
	if(canRepair) then 
	{
		_matches = 0;
		_matches = [typeof _vehicle] call fnc_countUpgrades;
		if(_matches>0) exitWith{hint format ["Vehicle upgrades available: %1", _matches]};
		if(_matches == 0)exitWith{hintsilent format ["No upgrades available for this vehicle!"];};
	};
};
