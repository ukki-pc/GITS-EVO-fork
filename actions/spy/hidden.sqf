_player = player;
//_loop=0;
_weaponclass = "";
_weaponcount =0;
_alarm = false;
_player setcaptive false;
EGG_hideweaponon = false;
EGG_drawweaponon = false;
EGG_spyactive = 1;
EGG_hidetotal = 6;

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{

//reset on death

	if (not (alive _player)) then 
	{
		_player setcaptive false;
		_player removeAction EGG_actionId9;
		_loop=1;
	};

//add HIDE WEAPON action

	if (EGG_spyactive == 1 and ! EGG_hideweaponon and EGG_hidetotal >0) then
	{
		EGG_actionId9 = _player addAction ["Hide Weapon", "actions\spy\hidew.sqf",[_this,0],1, false,  true,"test2"];
		EGG_hideweaponon = true;
	};
	sleep 0.1;

//add DRAW WEAPON action

	if (EGG_spyactive == 3 and ! EGG_drawweaponon) then
	{
		EGG_actionId9 = _player addAction ["Draw Weapon", "actions\spy\draww.sqf",[_this,0],1, false, true,"test2"];
		EGG_drawweaponon = true;
	};

	_weaponcount = (count weapons _player)-5;//for items
	_weaponclass = currentWeapon _player;
//	hintsilent format["weapon type: %1",_weaponclass];
//	hintsilent format["weapon count: %1",_weaponcount];
	sleep 0.1;

//monitors spy - if HIDE WEAPON action and no weapon is drawn then spy is concealed

	if (EGG_spyactive == 3 and _weaponcount <1 and _weaponclass =="" and !(captive _player) ) then 
	{
		_player setcaptive true;
		hintsilent "you are concealed";
	};

//monitor nearby enemies (within 15m)

	_nearbytargets = [];
	_nearbyenemy = 0;
	_countnear =0;
	_nearbytargets = _player nearTargets 15;//15m from player
	sleep 0.1;
	_countnear = count _nearbytargets;
	_i = 0;
	while {_countnear >0 and _i < _countnear} do 
	{
		if (((_nearbytargets select _i) select 2) == EAST) then {_nearbyenemy = _nearbyenemy +1};
		_i = _i + 1;
	};

//warn when enemy numbers increase

if ( (captive _player) and (_nearbyenemy >2) ) then 
	{
		hintsilent "Enemy patrol coming!";
	};
//hintsilent format["enemies: %1",_nearbyenemy];

//monitors spy - if a weapon is drawn and enemies are within 15m then spy is discovered

	if ( (captive _player) and (_nearbyenemy >0) and (_weaponcount >0) and (!_alarm) ) then {_alarm = true};

//monitors spy - if NO weapon is drawn but a large number of enemies are within 15m then spy is discovered

	if (captive _player and _nearbyenemy >8 and (!_alarm) ) then {_alarm = true};

//monitors spy - if he gets in a vehicle with enemy nearby then spy is discovered

	if (captive _player and _nearbyenemy >1 and vehicle _player !=_player and (!_alarm) ) then {_alarm = true};
sleep 0.1;

if (_alarm and captive _player) then
	{
		_player setcaptive false;
		hintsilent "The alarm has been raised!";
		_alarm = false;
		EGG_hidetotal = EGG_hidetotal -1;
		sleep 0.2;
		hintsilent format["Hides remaining: %1",EGG_hidetotal];
	};

//monitors spy - if he gets in a vehicle without enemy nearby then his cover is blown but no alarm is sounded

	if (captive _player and _nearbyenemy <1 and vehicle _player !=_player ) then 
	{
		_player setcaptive false;
		hintsilent "Your cover is blown";
		sleep 0.2;
	};

};

_player removeAction EGG_actionId9;
EGG_spyactive = 0;
Spymade = 0;
//PublicVariable Spymade;
exit
