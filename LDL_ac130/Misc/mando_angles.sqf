/* mando_angles.sqf v1.0 by Mandoble

   Returns the angle between obj1 and obj2, the degrees that obj1 needs to turn to have obj2 centered horizontally and
   check whether obj2 is inside field of view of obj1
   Negative means turning left, positive means turning right
   The returned value is in the form [angle, angle to turn, inside FOV true/false]

   Load and compile the function first in your init.sqs or init.sqf
   mando_angles = compile (preprocessFileLineNumbers "mando_angles.sqf");

   Then to call it:
   _angles = [firstobject, secondobject] call mando_angles;
   _angles select 0 = angle between firstobject and secondobject
   _angles select 1 = angle that firstobject needs to turn to have secondobject centered horizontally
   _angles select 2 = true if secondobject is inside field of view of firstobject
*/

private["_obj1", "_obj2", "_ang", "_dif", "_infov"];

_obj1    = _this select 0;
_obj2    = _this select 1;

_ang = ((getPos _obj2 select 0)-(getPos _obj1 select 0)) atan2 ((getPos _obj2 select 1)-(getPos _obj1 select 1));
_dif = (_ang - getDir _obj1);
if (_dif < 0) then {_dif = 360 + _dif;};
if (_dif > 180) then {_dif = _dif - 360;};
if (abs(_dif) < 43) then
{
   _infov = true;
}
else
{
   _infov = false;
};

[(_ang +360) % 360, _dif, _infov]