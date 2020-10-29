_ver = _this select 3;
_vec = vehicle player;
_vec removeaction wcam;

if(not (_vec isKindOf "Air")) exitwith {};

if(_ver == 0) then
{
	wcame = _vec addEventHandler ["Fired", {[_this select 0,_this select 4] execVM "actions\miscam.sqf"}];
	wcam = _vec addaction ["Weapon Camera Off", "actions\wepcam.sqf",1,1, false, true,"test2"];
};
if(_ver == 1) then
{	
	wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"];
	_vec removeEventHandler ["Fired", wcame];
};