// Allows engineers to lock there repair vehicles
_vec = _this select 0;
_ver = _this select 3;
_vec removeaction BIS_EVO_elock;


if(_ver == 0) then
{
	BIS_EVO_elock = _vec addaction [localize "STR_M04t55", "data\scripts\englock.sqf",1,1, false, true,"test2"];
	_vec lock true;
};
if(_ver == 1) then
{	
	BIS_EVO_elock = _vec addaction [localize "STR_M04t54", "data\scripts\englock.sqf",0,1, false, true,"test2"];
	_vec lock false;
};
