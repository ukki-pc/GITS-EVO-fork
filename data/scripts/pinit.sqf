// player init

EB_airfn1=-1;
EB_airfn2=-1;
EB_airfn3=-1;
EB_airfn4=-1;
EB_airfn5=-1;
EB_airfn6=-1;
EB_airfn7=-1;


_cevents = [] execVM "data\scripts\EventsC.sqf"; // Common player events
Sleep 1.0;
// Special conditions for medics and engineers
_playertype = typeOf (vehicle player);
Sleep 0.2;

if (_playertype in EGG_EVO_PlayerMedic)  then 
{
	_med = player execVM "data\scripts\med.sqf";
};
plays = [] execVM "data\scripts\update.sqf";


_pos = [0,0,0];


//_events = [] execVM "data\scripts\EVO_Vecinit.sqf"; // Player vehicles rank restriction system
_rain = [] execVM "data\scripts\rain.sqf";
_arm = [] execVM "data\scripts\EB_ARM.sqf";
//_fog = [] execVM "data\scripts\fog.sqf";
_cthread = [] execVM "data\scripts\MainThreadC.sqf";

//CLIENT SIDED ATM
//_sResp = [] execVM "data\scripts\strategicResponse.sqf"; //WIP


(FindDisplay 46) DisplaySetEventHandler ["keydown","if ((_this select 1) In actionKeys ""TeamSwitch"") then {a = createDialog 'evoUI'}"];
_box = [0] call BIS_EVO_AmmoBox;
_boxR = [0] call BIS_EVO_AmmoBoxR;
//added to make markers show up on first spawn
//player addweapon "ItemCompass";	
//player addweapon "ItemGPS";
//player addweapon "ItemMap";
//player addweapon "ItemRadio";
//player addweapon "ItemWatch";

//spawn = player execVM "data\scripts\spawn.sqf";

if(editor == 1) then {
systemChat "pinit done";
};