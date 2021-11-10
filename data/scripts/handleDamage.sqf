_target = _this select 0;
_damage = _this select 1;

player setDammage ((getDammage player)-_damage);
_hitter = _this select 2;

if(side _hitter == EGG_EVO_ENEMYFACTION) then {[_hitter,false] spawn fnc_spot;}; 
