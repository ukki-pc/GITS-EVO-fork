// deletes side mission units on time limit failure 
_player = _this select 0;
_object = _this select 1;
_name = name _player;

_i=0;
while {_i <= 1799} do 
{	
	_i = _i+1;
	if (_name == BIS_EVO_dunit) then {_i = 1800};
	if (isNull _object) exitWith {};
	if (side _object == east) exitWith {};
	sleep 1.0;
};
sleep 4.0;
deletevehicle _object;

