//Populates squads with infantry
BIS_EVO_FillInf = 
{
	_grp = _this select 0;
	_lpos = position leader _grp;

	_allunits = enemyAll;


	_rng = floor(random(aggression/20)+1);

	_grpskill = skillfactor+(_rng/10);
	_max = (count _allunits)-1;
	_infcount = 11;
	_j = 0;
	while {_j <= _infcount} do 
	{
		_nunit = [_allunits] call fnc_pickRandom;
		_unit = _grp createUnit [_nunit, _lpos, [], 0, "FORM"];
		_unit setSkill _grpskill;
		_unit addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\mobjbury.sqf"}];
		[_unit] join _grp;
		_j = _j+1;
		sleep 0.4;
	};
	[_grp] call BIS_EVO_OrderSquad;
};

BIS_EVO_OrderSquad = 
{
	_grp = _this select 0;

	_allbeh = ["SAFE","AWARE","COMBAT","STEALTH"];
	_max = (count _allbeh)-1;
	_grp setBehaviour (_allbeh select (round random _max));

	_allcom = ["YELLOW","RED"];
	_max = (count _allcom)-1;
	_grp setCombatMode (_allcom select (round random _max));

	//if((random 1) > 0.75) then {_grp enableAttack true}else {_grp enableAttack false};
	_grp setBehaviour "AWARE";
	_allform = ["COLUMN","STAG COLUMN","WEDGE","ECH LEFT","ECH RIGHT","VEE","LINE"];
	_max = (count _allform)-1;
	_grp setFormation (_allform select (round random _max));
};

BIS_EVO_FillInfDummy = 
{
	_grp = _this select 0;
	_lpos = position leader _grp;
	_spawned = [];
	_allunits = enemyRiflemen;	
	_max = (count _allunits)-1;
	_infcount = 11;
	_j = 0;
	while {_j <= _infcount} do 
	{
		_unit = createVehicle [_allunits select (round random _max), _lpos, [], 10, "NONE"];
		_spawned=_spawned+[_unit];
		_j = _j+1;
		sleep 0.4;
	};
	_spawned
};

BIS_EVO_InfDummyReplace = 
{
	_grp = _this select 0;
	_units = _this select 1;
	_infcount = (count _units)-1;
	_newunits = [];
	_unit = objnull;
	_pos = [];
	_dir = 0;
	_type = "";
	_j = 0;
	while {_j <= _infcount} do 
	{
		_unit = _units select _j;
		if(not isNull _unit) then 
		{
			_pos = position _unit;
			_dir = direction _unit;
			_type = typeOf _unit;
			_unit removeAllEventHandlers "Killed";
			deletevehicle _unit;
			_unit = _grp createUnit [_type, _pos, [], 0, "None"];
			_unit setPos _pos;
			_unit setDir _dir;
			_unit addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\mobjbury.sqf"}];
			_newunits=_newunits+[_unit];
		};
		sleep 0.4;
		_j=_j+1;
	};
	_newunits
};

BIS_EVO_InfReDummy = 
{
	_units = _this select 0;
	_infcount = (count _units)-1;
	_newunits = [];
	_unit = objnull;
	_pos = [];
	_dir = 0;
	_type = "";
	_j = 0;
	while {_j <= _infcount} do 
	{
		_unit = _units select _j;
		if(not isNull _unit) then 
		{
			_pos = position _unit;
			_dir = direction _unit;
			_type = typeOf _unit;
			_unit removeAllEventHandlers "Killed";
			deletevehicle _unit;
			_unit = createVehicle [_type, _pos, [], 0, "NONE"];
			_unit setPos _pos;
			_unit setDir _dir;
			_unit addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\mobjbury.sqf"}];
			_newunits=_newunits+[_unit];
		};
		sleep 0.4;
		_j=_j+1;
	};
	_newunits
};