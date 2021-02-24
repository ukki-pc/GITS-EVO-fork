// client side recruit script
_type = _this select 0;
_activator = _this select 1;
BIS_EVO_rtype="none";

_grp = group player;
_count = (count units _grp);
_ainum = 0;
_ap = player;
_i = 0;
while {_i < _count} do 
{
	_ap = (units _grp select _i);
	if (not (isPlayer _ap)) then 
	{
		_ainum = _ainum +1;
	};
	_i = _i + 1;
};

//if (player != (leader group player)) exitwith {hint "You must be a leader to recruit"};

if (helpersparam == 0) exitwith {hint "AI Recruitment disabled"};

//if (score player < BIS_EVO_rank1 and helpersparam != 2 ) exitwith {[player,BIS_EVO_rank1] call BIS_EVO_RankReq;};

_txtpasshead = localize "STR_M04t96";
_txtpassbody = localize "STR_M04t99";

_Message = 
{
	_headcolor = _this select 0;
	_head = _this select 1;
	_body = _this select 2;
	_plaintext = format["%1: %2",_head,_body];
	_parsedtext = parseText format["<t color='%1'>%2</t><br/><br/><t color='FFFFFF'>%3</t>",_headcolor,_head,_body];
	_msg = [_parsedtext];
	_txt = composeText _msg;
	"" hintC _txt;
	_record = player createDiaryRecord ["diary", [localize "STR_M04t78", _plaintext]];
};


if (score player < BIS_EVO_rank1 and helpersparam != 2 and _ainum >= 1) exitwith {["#FF0000",_txtpasshead,_txtpassbody] call _Message};
if (score player < BIS_EVO_rank2 and helpersparam != 2 and _ainum >= 2) exitwith {["#FF0000",_txtpasshead,_txtpassbody] call _Message};
if (score player < BIS_EVO_rank3 and helpersparam != 2 and _ainum >= 3) exitwith {["#FF0000",_txtpasshead,_txtpassbody] call _Message};
if (score player < BIS_EVO_rank4 and helpersparam != 2 and _ainum >= 4) exitwith {["#FF0000",_txtpasshead,_txtpassbody] call _Message};
if (score player < BIS_EVO_rank5 and helpersparam != 2 and _ainum >= 5) exitwith {["#FF0000",_txtpasshead,_txtpassbody] call _Message};
if (score player < BIS_EVO_rank6 and helpersparam != 2 and _ainum >= 6) exitwith {["#FF0000",_txtpasshead,_txtpassbody] call _Message};
if (score player >= BIS_EVO_rank6 and helpersparam != 2 and _ainum >= 7) exitwith {["#FF0000",_txtpasshead,_txtpassbody] call _Message};
if (helpersparam == 2 and _ainum >= 8) exitwith {["#FF0000",_txtpasshead,_txtpassbody] call _Message};


_player = player;
_unitype = _type;
_grp = group _player;

_pos = position _player;
_unit = group _player createUnit [_unitype, [0,0,0], [], 0, "NONE"];Sleep BIS_EVO_GlobalSleep;
_unit setskill BIS_EVO_PlayerSkill;
//_lone = [_unit] execVM 'data\scripts\nohuman.sqf';
if(!inrepairzone) then 
{
	_vec = createVehicle ["ParachuteEast", _pos, [], 20, 'NONE'];Sleep BIS_EVO_GlobalSleep;
	_vec setpos [_pos select 0,_pos select 1,(_pos select 2)+ 120];
	_unit MoveInDriver _vec;
	WaitUntil {vehicle _unit == _unit};
	_unit setpos [(getpos _unit select 0),(getpos _unit select 1),0];
}
else
{	
	_unit setPosASL [(getPosASL _player select 0) + 1, (getPosASL _player select 1) +1, (getPosASL _player select 2)];
	_unit moveInDriver vehicle _player;
	_unit moveInGunner vehicle _player;
	_unit moveInCommander vehicle _player;
	_unit moveInCargo vehicle _player;
};

_unit setdammage 0;
_unit  addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];
_vecprotect = [_unit] execVM "data\scripts\aivec.sqf";

//[_unit] join _grp;
//BIS_EVO_runit = _unit;
//publicVariable "BIS_EVO_runit";