// animateRope.sqf
// � OCTOBER 2011 - norrin
private ["_heli", "_rope","_dbodown","_dbohg","_dbohgt"];

_heli = _this select 0;
_rope = _this select 1;
_dbodown = 0;
if (!local _heli) exitWith {};
// Pre-animate rope prior to attaching
_rope animate ["dborope2y",-0.7];	
_rope animate ["dborope19y",0.378];
_rope animate ["dborope2z", 0];
_rope animate ["dborope3z",-1];
_rope animate ["dborope4z",-3];
_rope animate ["dborope5z",-5];
_rope animate ["dborope6z",-7];
_rope animate ["dborope7z",-9];
_rope animate ["dborope8z",-11];
_rope animate ["dborope9z",-13.2];
_rope animate ["dborope10z",-14.4];
_rope animate ["dborope11z",-15.6];
_rope animate ["dborope12z",-16.8];
_rope animate ["dborope13z",-18];
_rope animate ["dborope14z",-19];
_rope animate ["dborope15z",-20];
_rope animate ["dborope16z",-21];
_rope animate ["dborope17z",-22];
_rope animate ["dborope18z",-23];
_rope animate ["dborope19z",-24];
_rope animate ["dborope3x",0];
_rope animate ["dborope4x",-0.15];
_rope animate ["dborope5x",0];
_rope animate ["dborope6x",0.1];
_rope animate ["dborope7x",0];
_rope animate ["dborope8x",-0.1];
_rope animate ["dborope9x",0];
_rope animate ["dborope10x",0.15];
_rope animate ["dborope11x",0];
_rope animate ["dborope12x",-0.1];
_rope animate ["dborope13x",0];
_rope animate ["dborope14x",0.1];
_rope animate ["dborope15x",0];
_rope animate ["dborope16x",-0.15];
_rope animate ["dborope17x",0];
_rope animate ["dborope18x",0.1];
_rope animate ["dborope19x",0];
sleep 2;
// Attach rope
_heli setVectorUp [0.001, 0.001, 1];
if (_rope isKindOf "dbo_rope1_GA") then 
{
	//Default
	detach _rope; _rope attachto [_heli,[0, 0, -7]];
	if(_heli isKindOf "UH60_Base") 			then {detach _rope; _rope attachto [_heli,[0.25, 1.9, -6.4]]};
	if(_heli isKindOf "UH60M_EP1") 			then {detach _rope; _rope attachto [_heli,[0.25, 1.9, -5.95]]};
	if(_heli isKindOf "FRL_UH60MT") 		then {detach _rope; _rope attachto [_heli,[0.25, 1.9, -5.95]]};
	if(_heli isKindOf "UH1_Base")  			then {detach _rope; _rope attachto [_heli,[0, -4, -7]]};
	if(_heli isKindOf "FRL_Mi8_MT_RUS")  			then {detach _rope; _rope attachto [_heli,[0, 0, -8.5]]};
	if(_heli isKindOf "Mi17_TK_EP1")  			then {detach _rope; _rope attachto [_heli,[-2, 0, -7.5]]};
	if(_heli isKindOf "Mi24_Base") 			then {detach _rope; _rope attachto [_heli,[-0.28,4.1,-6.5]]};
	if(_heli isKindOf "CH_47F_EP1")			then {detach _rope; _rope attachto [_heli,[-0.35,-8.2, -6.8]]};
	if(_heli isKindOf "MH6J_EP1")  			then {detach _rope; _rope attachto [_heli,[-0.075, 0, -5.55]]};
	if(_heli isKindOf "BAF_Merlin_HC3_D") 	then {detach _rope; _rope attachto [_heli,[0.37, 2.2, -5.9]]};
} else {
	detach _rope; _rope attachto [_heli,[-2, 0, -6.4]];
	if(_heli isKindOf "UH60_Base") 			then {detach _rope; _rope attachto [_heli,[-2.4, 1.9, -6.4]]};
	if(_heli isKindOf "UH60M_EP1") 			then {detach _rope; _rope attachto [_heli,[-2.4, 1.9, -5.95]]};
	if(_heli isKindOf "FRL_UH60MT") 			then {detach _rope; _rope attachto [_heli,[-2.4, 1.9, -5.95]]};
	if(_heli isKindOf "UH1_Base")  			then {detach _rope; _rope attachto [_heli,[-2.2, -4, -7]]};
	if(_heli isKindOf "FRL_Mi8_MT_RUS")  			then {detach _rope; _rope attachto [_heli,[-2, 0, -8.5]]};
	if(_heli isKindOf "Mi17_TK_EP1")  			then {detach _rope; _rope attachto [_heli,[0, 0, -7.5]]};
	if(_heli isKindOf "Mi24_Base") 			then {detach _rope; _rope attachto [_heli,[-2.1,4.1,-6.4]]};
	if(_heli isKindOf "CH_47F_EP1")			then {detach _rope; _rope attachto [_heli,[-1.85,-8.2, -6.8]]};
	if(_heli isKindOf "MH6J_EP1")  			then {detach _rope; _rope attachto [_heli,[-2.125, 0, -5.55]]};
};



// Animate rope deployment
while {(_dbodown <1)} do
{
	// RopeZ
	_rope animate ["dborope3z",0];
	_rope animate ["dborope4z",-1];
	_rope animate ["dborope5z",-3];
	_rope animate ["dborope6z",-4];
	_rope animate ["dborope7z",-5];
	_rope animate ["dborope8z",-6];
	_rope animate ["dborope9z",-7.1];
	_rope animate ["dborope10z",-7.8];
	_rope animate ["dborope11z",-8.7];
	_rope animate ["dborope12z",-9.5];
	_rope animate ["dborope13z",-10.1];
	_rope animate ["dborope14z",-10.8];
	_rope animate ["dborope15z",-11.5];
	_rope animate ["dborope16z",-12.1];
	_rope animate ["dborope17z",-12.5];
	_rope animate ["dborope18z",-13];
	_rope animate ["dborope19z",-13.4];
	sleep 0.5;
	// Straighten ropes
	_rope animate ["dborope3z",0];
	_rope animate ["dborope4z",0];
	_rope animate ["dborope5z",0];
	_rope animate ["dborope6z",0];
	_rope animate ["dborope7z",0];
	_rope animate ["dborope8z",0];
	_rope animate ["dborope9z",0];
	_rope animate ["dborope10z",0];
	_rope animate ["dborope11z",0];
	_rope animate ["dborope12z",0];
	sleep 0.2;
	_rope animate ["dborope13z",0];
	_rope animate ["dborope14z",0];
	_rope animate ["dborope15z",0];
	_rope animate ["dborope16z",0];
	_rope animate ["dborope17z",0];
	_rope animate ["dborope18z",0];
	_rope animate ["dborope19z",0.2];
	sleep 0.1;
	_dbohg = (getpos _heli select 2);
	_dbohgt = 0 - (_dbohg * 0.2);
	// RopeY
	_rope animate ["dborope3y",_dbohgt*.1];
	_rope animate ["dborope4y",_dbohgt*.15];
	_rope animate ["dborope5y",_dbohgt*.2];
	_rope animate ["dborope6y",_dbohgt*.25];
	_rope animate ["dborope7y",_dbohgt*.3];
	_rope animate ["dborope8y",_dbohgt*.35];
	_rope animate ["dborope9y",_dbohgt*.4];
	_rope animate ["dborope10y",_dbohgt*.45];
	_rope animate ["dborope11y",_dbohgt*.5];
	_rope animate ["dborope12y",_dbohgt*.55];
	_rope animate ["dborope13y",_dbohgt*.6];
	_rope animate ["dborope14y",_dbohgt*.65];
	_rope animate ["dborope15y",_dbohgt*.7];
	_rope animate ["dborope16y",_dbohgt*.8];
	_rope animate ["dborope17y",_dbohgt*.85];
	_rope animate ["dborope18y",_dbohgt*.9];
	_rope animate ["dborope19y",_dbohgt*.95];
	// RopeX
	_rope animate ["dborope3x",0];
	sleep 0.1;
	_rope animate ["dborope4x",0];
	sleep 0.1;
	_rope animate ["dborope5x",0];
	sleep 0.1;
	_rope animate ["dborope6x",0];
	sleep 0.1;
	_rope animate ["dborope7x",0];
	sleep 0.1;
	_rope animate ["dborope8x",0];
	sleep 0.1;
	_rope animate ["dborope9x",0];
	sleep 0.1;
	_rope animate ["dborope10x",0];
	sleep 0.1;
	_rope animate ["dborope11x",0];
	sleep 0.1;
	_rope animate ["dborope12x",0];
	sleep 0.1;
	_rope animate ["dborope13x",0];
	sleep 0.1;
	_rope animate ["dborope14x",0];
	sleep 0.1;
	_rope animate ["dborope15x",0];
	sleep 0.1;
	_rope animate ["dborope16x",0];
	sleep 0.1;
	_rope animate ["dborope17x",0];
	sleep 0.1;
	_rope animate ["dborope18x",0];
	sleep 0.1;
	_rope animate ["dborope19x",0];
	_dbodown = _dbodown + 1;
	sleep 2.5;
};