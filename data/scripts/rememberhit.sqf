#define hitWait 60
local _vec = _this select 0;
local _lastHitter = _this select 1;
_vec setFuel 0;

if(isplayer _lastHitter) then {_vec setVariable ["lastHit",_lastHitter]};