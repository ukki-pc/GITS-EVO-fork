// client side vehicle purchase
_type = _this select 0;

_player = player;
_pos = position _player;

if (player in list LHDin) then 
{
	_pos = getmarkerpos "LHDVehBuy";
	_vec = createVehicle [_type, _pos, [], 20, 'NONE'];Sleep BIS_EVO_GlobalSleep;
	_vec setposASL [_pos select 0,_pos select 1,(_pos select 2)+ 17.5];
//	_vec setDir (getDir HMS-GITS);
	//systemChat format ["Your pos at: %1, Veh pos: %2",position player, position _vec]
}
else{
_vec = createVehicle [_type, _pos, [], 20, 'NONE'];
Sleep BIS_EVO_GlobalSleep;
	if(_vec isKindOf "Land") then 
	{
	_vec setVehicleInit "veh = [this, 10, 0, 0, FALSE, TRUE,""this setDammage 0.5,this setFuel 0""] execVM ""vehicle.sqf""";
	processInitCommands;
	};
	if(_vec isKindOf "Air") then 
	{
	_vec setVehicleInit "veh = [this, 600, 3, 0, FALSE, FALSE] execVM ""vehicle.sqf""";
	processInitCommands;
	};
};

