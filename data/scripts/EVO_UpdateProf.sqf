// Builds a diary entries for selecting unit type based on rank.
_infantry = [["USMC_Soldier_LAT","USMC_Soldier"],["USMC_SoldierS","USMC_Soldier_MG","USMC_Soldier_AT"],["USMC_Soldier_GL","USMC_SoldierM_Marksman"],["USMC_Soldier_AR","USMC_Soldier_AA","USMC_SoldierS_Sniper"],[],[],[]];
_crew = [[],[],["USMC_Soldier_Pilot"],["USMC_Soldier_Crew"],[],[],[]];
_forcerecon = [[],[],[],[],["FR_Assault_R","FR_AR","FR_GL"],["FR_TL","FR_Marksman","FR_R"],["FR_Commander"]];
_command = [[],[],[],["USMC_Soldier_TL"],[],["USMC_Soldier_SL"],["USMC_Soldier_Officer"]];
_masterstring = "";

if (typeOf (vehicle player) == "USMC_Soldier_Medic" or typeOf (vehicle player) == "FR_Corpsman") then 
{
	_infantry = [["USMC_Soldier_Medic"],[],[],[],[],[],[]];
	_crew = [[],[],[],[],[],[],[]];
	_forcerecon = [[],[],["FR_Corpsman"],[],[],[]];
	_command = [[],[],[],[],[],[],[]];
};
if (typeOf (vehicle player) == "USMC_SoldierS_Engineer" or typeOf (vehicle player) == "FR_Sapper") then 
{
	_infantry = [["USMC_SoldierS_Engineer"],[],[],[],[],[],[]];
	_crew = [[],[],[],[],[],[],[]];
	_forcerecon = [[],[],["FR_Sapper"],[],[],[]];
	_command = [[],[],[],[],[],[],[]];
};
/*
BIS_EVO_ChangeModel =
{
	if(player in list airportin and not BIS_EVO_OnMission) then 
	{
		_pos = position player;
		_dir = direction player;
		_rank = rank player;
		_grp = group player;
		_gcount = count units _grp;
		_isLeader = (player == leader _grp);
		_oldplayer = player;
		_oldplayer setpos getMarkerpos "OffSide";
		_tgrp = creategroup (west);
		[_oldplayer] joinSilent (_tgrp);
		if(_gcount == 1) then {_grp = creategroup (west)};
		_player = _grp createUnit [BIS_EVO_PlayerModel, _pos, [], 0, "NONE"];
		_player setdir _dir;
		_player setUnitRank _rank;
		selectPlayer _player;
		if(_isLeader) then {_grp selectLeader player};
		_oldplayer removeAllEventHandlers "Killed";
		_oldplayer setdamage 1;
		hideBody _oldplayer;
		_spawn = player execVM "data\scripts\spawn.sqf";
		_cama = [player] spawn {[_this select 0] call BIS_EVO_CamPlayer};
	};
};
*/
BIS_EVO_CamPlayer =
{
	_player = _this select 0;
	_pos = (position vehicle player);
	_i = 1;
	_xPos = 0;
	_yPos = 0;
	_howBigA = 1;
	_howBigB = 1;
	_angle = direction player;
	_x = (_howBigA * (sin _i));
	_y = (_howBigB * (cos _i));
	_x_rot = _xPos + _x*(cos _angle) - _y*(sin _angle);
	_y_rot = _yPos + _x*(sin _angle) + _y*(cos _angle);		
	//preloadCamera _pos;
	_camera = "camera" camCreate _pos;
	_preload = [] spawn {waitUntil{preloadCamera _pos}};
	_camera cameraEffect ["internal","back"];
	_camera camSetFOV 0.7;
	_camera camSetTarget [_pos select 0,_pos select 1,(_pos select 2)+0.2];
	_camera camSetRelPos [-_x_rot,_y_rot,1.2];
	_camera camCommit 0;
	_camera camSetFocus [2, 50];
	waitUntil {camCommitted _camera}; // Look at player
	_camera camSetTarget [_pos select 0,_pos select 1,(_pos select 2)+1.6];
	_camera camCommit 4;
	waitUntil {camCommitted _camera};
	Sleep 1.0;
	player cameraEffect ["terminate","back"];
	camUseNVG false;
	camDestroy _camera;
	titleCut["", "BLACK in",1];
};
_rank = 0;
_newstring = "";
	if (score player >= BIS_EVO_rank1 && _rank == 0) then {_rank = 1};
	if (score player >= BIS_EVO_rank2 && _rank == 1) then {_rank = 2};
	if (score player >= BIS_EVO_rank3 && _rank == 2) then {_rank = 3};
	if (score player >= BIS_EVO_rank4 && _rank == 3) then {_rank = 4};
	if (score player >= BIS_EVO_rank5 && _rank == 4) then {_rank = 5};
	if (score player >= BIS_EVO_rank6 && _rank == 5) then {_rank = 6};

_assemblelist =  
{
	_list = _this select 0;
	_newstring = "";
	_count = _rank;
	_i = 0;
	while {_i <= _count} do 
	{	
		_units = (_list select _i);
		_arraycount = count _units;
		if(_arraycount > 0) then
		{
			while {_arraycount > 0} do 
			{
				_unit = _units select _arraycount-1;
				_name = getText (configFile >> "CfgVehicles" >> _unit >> "DisplayName");
				//_link = format ["<execute expression=""BIS_EVO_PlayerModel = &quot;%1&quot;"">%2</execute><br/>",_unit,_name];
				_link = format ["<executeClose expression=""BIS_EVO_PlayerModel = &quot;%1&quot;;[] call BIS_EVO_ChangeModel"">%2</execute><br/>",_unit,_name];
				_newstring = format["%1%2",_newstring,_link];
				_arraycount = _arraycount-1;
			};
		};
		_i = _i+1;
	};
	_newstring;
};

_cmdstring = "";
_infstring  = "";
_frstring = "";
_crewstring = "";

_cmdstring = format["<br/>%1<br/><br/>%2<br/>","COMMAND",[_command] call _assemblelist];
_frstring = format["<br/>%1<br/><br/>%2<br/>","FORCE RECON",[_forcerecon] call _assemblelist];
_crewstring = format["<br/>%1<br/><br/>%2<br/>","CREW",[_crew] call _assemblelist];
_infstring = format["<br/>%1<br/><br/>%2<br/>","INFANTRY",[_infantry] call _assemblelist];

_masterstring = format["%1%2%4%4",_infstring,_crewstring,_frstring,_cmdstring];

if(not (player diarySubjectExists "Prof")) then
{
	_subject = player createDiarySubject ["Prof", "Profession","\Ca\characters\data\portraits\comBarHead_usmc_soldier_ca"];
};

_record1 = player createDiaryRecord ["Prof", ["COMMAND",_cmdstring]];
_record2 = player createDiaryRecord ["Prof", ["FORCE RECON",_frstring]];
_record3 = player createDiaryRecord ["Prof", ["CREW",_crewstring]];
_record4 = player createDiaryRecord ["Prof", ["INFANTRY",_infstring]];


_record1 = player createDiaryRecord ["Diary", ["COMMAND",_cmdstring]];
_record2 = player createDiaryRecord ["Diary", ["FORCE RECON",_frstring]];
_record3 = player createDiaryRecord ["Diary", ["CREW",_crewstring]];
_record4 = player createDiaryRecord ["Diary", ["INFANTRY",_infstring]];