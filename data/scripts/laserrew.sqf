// based on   http://forums.bistudio.com/showthread.php?t=98398&langid=3  by Bon_Inf*


private ["_xpos","_ypos","_dir","_min","_targetpos","_targetdistance","_aimpos"];
hint "laserrew start";
BLA_EVO_Laserunit=objNull;
_unit = _this select 2;    
_lasertarget = _this select 1;

_xpos = getPos _unit select 0;
_ypos = getpos _unit select 1;

_dir = _unit weaponDirection "Laserdesignator";
_dir = (_dir select 0) atan2 (_dir select 1);

_min = 20;

_targetpos = [getPos _lasertarget select 0, getPos _lasertarget select 1,0];
_targetdistance = _targetpos distance [getPos _unit select 0, getPos _unit select 1, 0];
_aimpos = [_xpos + _targetdistance*sin(_dir), _ypos + _targetdistance*cos(_dir),0];

if((_targetpos distance _aimpos)>_min) exitWith {hint "wrong laser"};
if((_targetpos distance _aimpos)<=_min) then
{
	BLA_EVO_Laserunit = _unit;
	publicVariable "BLA_EVO_Laserunit";
	hint  "Lasertarget match";
};


