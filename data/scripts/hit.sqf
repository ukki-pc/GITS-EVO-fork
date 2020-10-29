private ["_unit", "_damage"];
_unit = _this select 0;
_damage = _this select 2;
 
if (_unit == player && _damage > 0.10) then //Make sure it really was the player unit that got damaged and that the damage was significant enough
{
   cutRsc ["BP_bloodScreen", "PLAIN", 0];
};

