disableUserInput true;
removeallweapons player;
player setpos position jail;
player setdir 0;
bancount = bancount+1;
_pos = [(position player select 0),(position player select 1)+2.6,(position player select 2)+2];
//_m24 = "weaponholder" createVehicleLocal _pos;
//_m24 addMagazineCargo ["30Rnd_545x39_AK",1];
//_m24 addWeaponCargo ["Phone",1];
//_m24 setpos _pos;

_jailpos2 = getmarkerpos "jail_location";
_phonehint = createTrigger ["EmptyDetector", [_jailpos2 select 0, _jailpos2 select 1, _jailpos2 select 2]];
_phonehint setTriggerActivation ["WEST", "PRESENT", false];
_phonehint setSoundEffect ["Jay","Jay","",""];
_phonehint setTriggerStatements ["true", "", ""];

//if (bancount > 2) exitWith {hint "press Alt + F4 to exit"};

hint "hint: You have been punished for having a negative score. You will regain control after you have served your sentence of 60 seconds plus your score";

_i = -60;

while {_i != 0} do 
{
	titleText [format ["%1",_i],"plain down"];
//	_m24 addWeaponCargo ["Phone",1];
	_i = _i + 3;
	playSound "Jay";
	sleep 3.0;
};

//deletevehicle _m24;
deletevehicle _phonehint;

_phonehint2 = createTrigger ["EmptyDetector", [_jailpos2 select 0, _jailpos2 select 1, _jailpos2 select 2]];
_phonehint2 setTriggerActivation ["NONE", "PRESENT", false];
_phonehint2 setSoundEffect ["none","","",""];
_phonehint2 setTriggerStatements ["true", "", ""];
sleep 1.0;
deletevehicle _phonehint2;
player setdammage 1;
disableUserInput false;