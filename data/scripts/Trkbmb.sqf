// awards points to persons aiming a laser at a target if it is killed by certain ammo
_unit = _this select 0;
_ammo = _this select 1;//new line
_bomb = (nearestObject [_unit, _ammo]);//new line
_pos = [0,0,0];
_score = score player;

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	if(isNull _bomb) then {_loop=1} else {
	_pos = position _bomb;
	_score = score player
	};
	sleep 1.0;
};

_laser = (nearestObject [_pos, "LaserTarget"]);
if(isNull _laser) exitWith {};
sleep 1.0;

_nscore = score player;
_total = _nscore - _score;

BIS_EVO_lunit = _laser;
BIS_EVO_lpoint = round (_total/2);
publicVariable "BIS_EVO_lunit";
publicVariable "BIS_EVO_lpoint";




