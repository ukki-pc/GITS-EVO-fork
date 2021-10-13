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

plays = [] execVM "data\scripts\update.sqf";


_pos = [0,0,0];

//_events = [] execVM "data\scripts\EVO_Vecinit.sqf"; // Player vehicles rank restriction system
//_rain = [] execVM "data\scripts\rain.sqf";
_arm = [] execVM "data\scripts\EB_ARM.sqf";
//_fog = [] execVM "data\scripts\fog.sqf";
_cthread = [] execVM "data\scripts\MainThreadC.sqf";

//Alternating map marker sizes
//_mapF= [] execVM "data\scripts\mapFunctions.sqf";

//Bandage init
[player,0.2,0,-1,true] execVM "data\scripts\cly_heal.sqf";

(FindDisplay 46) DisplayAddEventHandler ["keydown","if (!dialog and (_this select 1) In actionKeys ""TeamSwitch"" ) then { a = createDialog 'evoUI';}"];
(FindDisplay 46) DisplayAddEventHandler ["keydown","if((_this select 1) == 15 ) then { if ( (missionNamespace getVariable 'perkSniperLVL' > 1) and vehicle player iskindof 'man') then {[] call fnc_spotVeh;}};"];

// _box = [0] call BIS_EVO_AmmoBox;
// _boxR = [0] call BIS_EVO_AmmoBoxR;
//added to make markers show up on first spawn
//player addweapon "ItemCompass";	
//player addweapon "ItemGPS";
//player addweapon "ItemMap";
//player addweapon "ItemRadio";
//player addweapon "ItemWatch";

//spawn = player execVM "data\scripts\spawn.sqf";

