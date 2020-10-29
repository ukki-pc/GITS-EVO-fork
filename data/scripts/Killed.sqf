// run on player at death.
_player = _this select 0;
_killer = _this select 1;
_grp = group _player;
_isLeader = (player == leader _grp);
_gcount = count units _grp;
_rank = rank player;
if(Param1 == 4) then
{
	BIS_EVO_lives = BIS_EVO_lives - 1;
	publicVariable "BIS_EVO_lives";
	_txtpasshead = localize "STR_M04t85";
	_txtcommon = localize "STR_M04t86";
	_txtpassbody = format["%1 %2",BIS_EVO_lives,_txtcommon];
	["#FF0000",_txtpasshead,_txtpassbody] call BIS_EVO_Message;
};
if(not (isPlayer _killer) and side _killer == east) then 
{
	_txtpasshead = localize "STR_M04t85";
	_txtpassbody = format[localize "STR_M04t87",name (leader _killer)];
	["#FF0000",_txtpasshead,_txtpassbody] call BIS_EVO_Message;
};

_removeScore = abs(score _player * deathScorePenalty)*-1;
["jed_addscore", [_player, _removeScore]] call CBA_fnc_globalEvent;

if ((date select 3) < 4 or (date select 3) > 20) then {camUseNVG true} else {camUseNVG false};

_camera = "camera" camCreate [(position _player select 0)-0.75, (position _player select 1)-0.75,(position _player select 2) + 0.5];
_preload = [] spawn {waitUntil{preloadCamera [4516.60,2606.42,1.73]}};
_camera cameraEffect ["internal","back"];

_camera camSetFOV 1;
_camera camSetTarget vehicle _player;
if(vehicle player != player) then {_camera camSetRelPos [0,10,1]}else{_camera camSetRelPos [0,2,1]};
_camera camCommit 0;
waitUntil {camCommitted _camera}; // Look at player

sleep 2.0; // Time for death anim to play

if (not isNull vehicle _killer) then {_camera camSetTarget vehicle _killer}else{_camera camSetTarget vehicle _player};
_camera camSetFOV 0.2;
_camera camCommit 4;
waitUntil {camCommitted _camera}; //look at killer

Sleep 3.0;

titleCut["", "BLACK out",2];

// Make new player
/*
_pos = GetmarkerPos "RESPAWN_WEST";
_tgrp = creategroup (west);
[player] joinSilent _tgrp;
if(_gcount == 1) then {_grp = creategroup (west)};
_player = _grp createUnit [BIS_EVO_PlayerModel, _pos, [], 0, "NONE"];
_player setUnitRank _rank;
selectPlayer _player;
if(_isLeader) then {_grp selectLeader player};
*/
Sleep 2.0;

_camera camPreparePos position player;
_camera camPrepareFOV 1;
_camera camCommitPrepared 0;

player cameraEffect ["terminate","back"];
camUseNVG false;
camDestroy _camera;
titleCut["", "BLACK in",1];
//_spawn = player execVM "data\scripts\spawn.sqf";
