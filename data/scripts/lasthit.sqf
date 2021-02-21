// Prevents downing of a plane count as a suicide
private ["_unit","_tag","_curtownInf","_curtownMec","_lastHit"]; 
_victim = _this select 0;
_assaulter = _this select 1;

systemChat str _victim;
systemChat str _assaulter;

if(_victim != _assaulter) then 
	{
	systemChat format ["%1 was hit by %2",_victim,_assaulter];
	hitRegister = [_victim,_assaulter];

	hint str hitRegister;
};