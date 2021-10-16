_target = _this select 0;
_damage = _this select 1;

player setDammage ((getDammage player)-_damage);
_hitter = _this select 2;

[cursorTarget,_hitter] spawn fnc_spot;