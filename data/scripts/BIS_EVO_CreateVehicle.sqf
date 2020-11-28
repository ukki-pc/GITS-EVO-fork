EGG_fnc_commonTurrets = 
{
	private ["_arr","_trts","_tvec"]; 
	_tvec = _this select 0;
	_arr = []; 
	_trts = configFile / "CfgVehicles" / typeOf _tvec / "Turrets";
	for "_i" from 0 to count _trts - 1 do 
	{ 
		_arr set [count _arr, [_i]];
		 for "_j" from 0 to count ( _trts / configName (_trts select _i) / "Turrets" ) - 1 do 
		{
			_arr set [count _arr, [_i, _j]];
		};
	};
	 _arr;
};

BIS_EVO_CreateVehicle =
{
	Private["_type","_pos","_side","_radi","_dir","_vel","_grp","_returnarray","_vec","_crewtype","_maxc","_maxcrew","_newmaxcrew","_unit","_vtarray","_ctr","_n"];

	_type = _this select 0;
	_pos = _this select 1;
	_side = _this select 2;
	_radi = _this select 3;
	_dir = _this select 4;
	_vel = _this select 5;
	_grp = creategroup _side;
	_returnarray = [];

	if (_type == "") exitwith {};

	_vec = createVehicle [_type, _pos, [], _radi, "NONE"];

	_vec setDir _dir;
	_vec engineOn true;	
	_vec setVelocity [(sin _dir*_vel),(cos _dir*_vel),0];
	Sleep BIS_EVO_GlobalSleep*3;

	_crewtype = getArray (configFile >> "CfgVehicles" >> _type >> "typicalCargo");

	_crewtype = EGG_EVO_west1;
	_maxc = (count _crewtype)-1;
	_maxcrew = 0;

	/*
	if (enemynumdiv==1) then 
	{
		_newmaxcrew = getNumber (configFile >> "CfgVehicles" >> _type >> "transportSoldier");
		if (_newmaxcrew > 0) then {_maxcrew = _newmaxcrew};
	};
	*/

	if((_vec emptyPositions "driver") > 0) then 
	{
		_unit = _grp createUnit [(_crewtype select round random _maxc), _pos, [], 5, "NONE"];
		_unit AssignasDriver _vec;
		_unit moveinDriver _vec;
	};
	Sleep BIS_EVO_GlobalSleep;

///////////////////finding turrets *REMOVED DUE TO BUG BELOW*

	//_vtarray = [_vec] call EGG_fnc_commonTurrets;
	//_ctr = count _vtarray;

//	_vtarraystr = str (_vtarray);
//	hint format ["vec %1 nt: %2 turr: %3",_type, _ctr, _vtarraystr];
/////////////filling turrets *REMOVED DUE TO SOME MEN NOT GOING INTO THE VEH*
/*
	if (_ctr > 0) then
	{
		_n = 0;
		while {_n < _ctr} do 
		{
			_unit = _grp createUnit [(_crewtype select round random _maxc), _pos, [], 5, "NONE"];sleep 0.01;
			_unit action ["getInTurret", _vec, (_vtarray select _n)];
			_n = _n+1;
			Sleep 0.1;
		};
	};
*/
//////////////////////////
	if((_vec emptyPositions "gunner") > 0) then 
	{
		_unit = _grp createUnit [(_crewtype select round random _maxc), _pos, [], 5, "NONE"];
		_unit AssignasGunner _vec;
		_unit moveinGunner _vec;
	};		
	Sleep BIS_EVO_GlobalSleep;
	if((_vec emptyPositions "commander") > 0) then 
	{
		_unit = _grp createUnit [(_crewtype select round random _maxc), _pos, [], 5, "NONE"];
		_unit AssignasCommander _vec;
		_unit moveinCommander _vec;
	};
	if (_maxcrew > 0) then
	{
		if (_maxcrew > 3) then
		{
			_newmaxcrew = round random _maxcrew;
			_n = 0;
			while {_n < _newmaxcrew} do 
			{
				_unit = _grp createUnit [(_crewtype select round random _maxc), _pos, [], 5, "NONE"];
				_unit assignAsCargo _vec;
				_unit moveinCargo _vec;
				_n = _n+1;
				Sleep 0.02;
			};
		};
	};
	[_vec] join _grp;
	Sleep BIS_EVO_GlobalSleep;
	_vec setdammage 0;
	_vec addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
	_unattended = [_vec] spawn {[_this select 0] call BIS_EVO_idelSVEC};
	_returnarray = [_grp,_vec];
	_returnarray;
};
