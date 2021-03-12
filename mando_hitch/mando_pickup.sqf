private["_unit", "_soldier", "_action", "_units", "_cargo"];
_unit    = _this select 0;
_soldier = _this select 1;
_action  = _this select 2;

if (_soldier != driver _unit) exitWith
{
   titleText["You must be the pilot", "PLAIN DOWN"];
};

if (typeOf _unit in mando_hitch_heavies) then
{
   _units = nearestObjects [[getPos _unit select 0, getPos _unit select 1,getpos _unit select 2], mando_hitch_types+ mando_hitch_types_heavy, 5];
}
else
{
   _units = nearestObjects [[getPosASL _unit select 0, getPosASL _unit select 1,getPosASL _unit select 2], mando_hitch_types, 5];
};
_units = _units - [_unit];
if ((count _units) > 0) then
{
   _cargo = _units select 0;
   if ((side _cargo == civilian) || (side _cargo == side _soldier)) then
   {
      if ((getPos _unit select 2) < mando_hitch_min_height) then 
      {
         mando_hitch_cargo  = _cargo;
         mando_hitch_chopper = _unit;
         publicVariable "mando_hitch_cargo";
         publicVariable "mando_hitch_chopper";
         _unit removeAction _action;
         mando_lasthitch_acc = _unit addAction ["Drop cargo", "mando_hitch\mando_drop.sqf"];   
      };
   };
};
