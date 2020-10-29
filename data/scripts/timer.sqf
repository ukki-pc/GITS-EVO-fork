_time = _this select 0;
_fail = false;
_txtpasshead = localize "STR_M04t3_2";
_txtpassbody = localize "STR_M04t4";
while {_time >= 0} do 
{
	sleep 1.00;
	if (_time == 300) then {["#FF0000",_txtpasshead,_txtpassbody] call BIS_EVO_Message};
//	if (_time == 0 or not alive player) then {BIS_EVO_Onmission = false};	
	if (_time == 0) then {BIS_EVO_Onmission = false};	
	if (not BIS_EVO_Onmission) then {_time = 0};
	_time = _time - 1;
};
