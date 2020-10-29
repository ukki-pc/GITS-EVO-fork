_vec = _this select 0;

//EGG_problemcraft =  ["PRACS_TK_Su22","PRACS_TK_Su22_BMB","PRACS_TK_Su22_MSL","PRACS_TK_Su22_IND","PRACS_T K_Su22_STA","PRACS_TK_Su24Fencer","PRACS_TK_Su24Fencer_GBU","PRACS_TK_Su24Fencer_STK","PRACS_TK_MiG21"];

_type = (Typeof _vec);
if (_type in EGG_problemcraft) then 
{
	_vec removeweapon "PRACS_TK_AA8_Launcher";
	_vec removemagazinesturret ["PRACS_TK_AA8x2",[-1]];
	_vec removemagazinesturret ["PRACS_TK_AA8x4",[-1]];
	_vec removemagazinesturret ["PRACS_TK_AA8x6",[-1]];
	_vec removemagazinesturret ["PRACS_TK_AA8x2",[0]];
	_vec removemagazinesturret ["PRACS_TK_AA8x4",[0]];
	_vec removemagazinesturret ["PRACS_TK_AA8x6",[0]];
	_vec addweapon "R73Launcher";
	_vec addMagazine "4Rnd_R73";
	_vec addweapon "R73Launcher";
};