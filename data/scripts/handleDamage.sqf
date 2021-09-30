_target = _this select 0;
_damage = _this select 1;

player setDammage (getDammage player)-(_damage*2);

systemChat format ["%1",((getDammage player))];