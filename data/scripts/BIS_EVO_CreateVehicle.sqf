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

//Counts how many available seats and returns [_driver,_gunner,_commander,_cargoseats,_turretcount];
BIS_EVO_CountSeats =
{
_target = _this select 0;
_type = typeof _target;
_turretarrayname = [""];

	If (_target isKindOf "LandVehicle" || _target isKindOf "Air" || _target isKindOf "Ship") then 
	{	// check if the unit is a vehicle
		_weapdriv = getArray (configFile >> "cfgVehicles" >> _type >> "weapons");		// Pilot/Driver weapons
		_magsdriv = getArray (configFile >> "cfgVehicles" >> _type >> "magazines");		// Pilot/Driver magazines
		_drivhint = format ["<br/><br/><t color='#0000CC'>Driver Weapons:</t><br/>%1<br/><br/><t color='#0000CC'>Driver Magazines:</t><br/>%2", _weapdriv, _magsdriv];
		If (count _weapdriv == 0) then {_drivhint = ""};

		_mainturret = false;
		_hasturrets = false;
		If (isClass (configFile >> "cfgVehicles" >> _type >> "Turrets")) then {				// check if the unit has turrets
			If ((count (configFile >> "cfgVehicles" >> _type >> "Turrets")) > 1) then {		// Sometimes there are Turrets in the Turrets class (Air vehicles) and that turrets are dependent on the Mainturret class
				_turrets = configFile >> "cfgVehicles" >> _type >> "Turrets";
				_hasturrets = true;
			} else {
				_turrets = configFile >> "cfgVehicles" >> _type >> "Turrets" >> "MainTurret" >> "Turrets";	// If only the "Mainturret" class is in "Turrets" then use the lower class "Turrets" as the turrets (Tanks f.e.)
				_mainturret = true;
				_hasturrets = true;
			};
		} else {
			_turrets = [];		// If the turret check fails then there are no turrets
		};
		_turretcount = 
			If (_mainturret) then {
				(count _turrets) - 1;	// If the turrets are a lower class of MainTurret then substract 1 from the _turret count (CommanderOptics)
			} else {
				count _turrets;
		};
					
		If (_turretcount >= 1) then {
			for [{_i = 0}, {_i < _turretcount}, {_i = _i + 1}] do {
				_turretarrayname = _turretarrayname + [getText (_turrets select _i >> "gunnerName")];
				player globalchat format ["%1", _turretarrayname];
			};
		};

		_upperclass = configName (inheritsFrom (configFile >> "cfgVehicles" >> _type));
		_cargoseats = getNumber (configFile >> "cfgVehicles" >> _type >> "transportSoldier");
		_driver = getNumber (configFile >> "cfgVehicles" >> _upperclass >> "hasDriver");
		
		// Workaround to check if the vehicle has a gunner position
		_gunner = _target emptyPositions "Gunner";
		If (_gunner == 0) then {							// check if position is not empty (empty = 1)
			_gunner = switch (isNull (gunner _target)) do {	// check if a soldier is in gunner position
				case true : {0};							// no gunner in vehicle => there isn't a gunner position in that vehicle
				case false: {1};							// gunner is in vehicle
			};
		} else {									// if the script goes to the else code then the position is empty (1)
			_gunner = switch (_mainturret) do {		// check if the vehicle has multiple turrets which doesn't use the 
				case false : {0};					// mainturret as base class
				case true : {1};
			};
		};
		
		// Workaround to check if the vehicle has a commander position
		_commander = _target emptyPositions "commander";
		_effcom = effectiveCommander _target;
		If (_commander == 0) then {						// check if position is not empty (empty = 1)
			If (isNull (commander _target)) then {		// check if soldier is in commander position
				_commander = 0;							// no commander in vehicle => there isn't a commander position in that vehicle
			} else {
				_commander = 1;							// commander in vehicle
			};
		};
		
		// Total amount of seats
		_seats = If (_turretcount == -1) then {
				_cargoseats + _driver + _gunner + _commander + (_turretcount + 1);
			} else {
				_cargoseats + _driver + _gunner + _commander + _turretcount;
		};
		//Return free seat values
		_returnSeats = [_cargoseats,_turretcount];
		_returnSeats;
	};
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

	_crewtype = EGG_EVO_enemy1;
	_maxc = (count _crewtype)-1;
	_maxcrew = 0;


	//BANNED WEAPONS
	if(_type == "PRACS_TK_T80B") then {	_wps = weapons _vec - ["2A46MRocket"]; {_vec removeWeapon _x}forEach weapons _vec; {_vec addWeapon _x}forEach _wps;};

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
	sleep 0.5;
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
	_vec addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\mobjbury.sqf"}];
	_unattended = [_vec] spawn {[_this select 0] call BIS_EVO_idelSVEC};
	_returnarray = [_grp,_vec];
	_returnarray;
};
