// Attached to enemy prisoners and officers
_unit = _this select 0;
_user = _this select 1;
_usergroup = group _user;
[_unit] join grpNull;
_unit switchMove "AmovPercMstpSsurWnonDnon";
//added
_unit disableAI "AUTOTARGET";

WaitUntil {isNull BIS_EVO_sop};

_type = typeof _unit;
if (_type in EGG_EVO_PlayerOff) then
//if (_unit isKindOf "RU_Soldier_Officer") then
{	
	_txtpasshead = localize "STR_M04t66";//Officer Captured
	_txtpassbody = format["+%1 %2",20,localize "STR_M04t0_5"];//Points
	["#0000FF",_txtpasshead,_txtpassbody] call BIS_EVO_Message;
	if(BIS_EVO_MissionProgress == 0) then {BIS_EVO_sot = "radio1o"};
	if(BIS_EVO_MissionProgress == 1) then {BIS_EVO_sot = "radio2o"};
	if(BIS_EVO_MissionProgress == 2) then {BIS_EVO_sot = "radio3o"};
	if(BIS_EVO_MissionProgress == 3) then {BIS_EVO_sot = "radio4o"};
	if(BIS_EVO_MissionProgress == 4) then {BIS_EVO_sot = "radio5o"};
	if(BIS_EVO_MissionProgress == 5) then {BIS_EVO_sot = "radio6o"};
	if(BIS_EVO_MissionProgress == 6) then {BIS_EVO_sot = "radio7o"};
	if(BIS_EVO_MissionProgress == 7) then {BIS_EVO_sot = "radio8o"};
	if(BIS_EVO_MissionProgress == 8) then {BIS_EVO_sot = "radio9o"};
	if(BIS_EVO_MissionProgress == 9) then {BIS_EVO_sot = "radio10o"};
	if(BIS_EVO_MissionProgress == 10) then {BIS_EVO_sot = "radio11o"};
	BIS_EVO_sor = 20;BIS_EVO_sop = player;publicVariable "BIS_EVO_sor";publicVariable "BIS_EVO_sot";publicVariable "BIS_EVO_sop";
}
else
{
	_txtpasshead = localize "STR_M04t67";//Prisoner Captured
	_txtpassbody = format["+%1 %2",3,localize "STR_M04t0_5"];//points
	["#0000FF",_txtpasshead,_txtpassbody] call BIS_EVO_Message;
	BIS_EVO_sot = format["%1",_unit];BIS_EVO_sor = 3;BIS_EVO_sop = player;publicVariable "BIS_EVO_sor";publicVariable "BIS_EVO_sot";publicVariable "BIS_EVO_sop";
};

