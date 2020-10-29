private["_unit", "_soldier", "_action"];
_unit    = _this select 0;
_soldier = _this select 1;
_action  = _this select 2;

if (_soldier != driver _unit) exitWith
{
   titleText["You must be the pilot", "PLAIN DOWN"];
};

if (((getPos _unit select 2) < mando_hitch_min_height) || mando_hitch_no_check_for_drop) then
{
   mando_hitch_cargo  = objNull;
   mando_hitch_chopper = _unit;
   publicVariable "mando_hitch_cargo";
   publicVariable "mando_hitch_chopper";

   _unit removeAction _action;
   mando_lasthitch_acc = _unit addAction ["Pick up", "mando_hitch\mando_pickup.sqf"];
};
