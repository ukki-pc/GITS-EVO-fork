_victim = _this select 0;
_shooter = _this select 1;
if(_shooter == player and _victim isKindOf "Man" and hitMarker) exitWith {3 cutRsc ["Hitmarker","PLAIN"];playSound "hmark";};