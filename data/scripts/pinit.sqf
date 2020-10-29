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
if (_playertype in EGG_EVO_PlayerEng) then
{
	if(player == eng1) then {BIS_EVO_EngZone = reng1};
	if(player == eng2) then {BIS_EVO_EngZone = reng2};
	if(player == eng3) then {BIS_EVO_EngZone = reng3};
	if(player == eng4) then {BIS_EVO_EngZone = reng4};	
};


// Create player
//if (editor==0) then {_intro = player execVM "data\scripts\intro.sqf";};

Sleep 0.5;
Mpage =[true,false,false,false,false];

// Event handler to know when a player was attacked by an enemy for healing.
player addEventHandler ["hit", 
{
	if (side (_this select 1) == east) then 
	{
		BIS_EVO_fattack = true;
	};
}];


//Event handler to reward points to laser wielding player
BIS_EVO_lunit=objNull;
"BIS_EVO_lunit" addPublicVariableEventHandler {if (currentWeapon player == "Laserdesignator") then 
{
	[_this select 0, _this select 1, player] execVM "data\scripts\laserrew.sqf"};
};
_pos = [0,0,0];


//_events = [] execVM "data\scripts\EVO_Vecinit.sqf"; // Player vehicles rank restriction system
_rain = [] execVM "data\scripts\rain.sqf";
_arm = [] execVM "data\scripts\EB_ARM.sqf";
//_fog = [] execVM "data\scripts\fog.sqf";
_cthread = [] execVM "data\scripts\MainThreadC.sqf";
//Ctraffic = [] execVM "data\scripts\BIS_EVO_CivTraffic.sqf";

(FindDisplay 46) DisplaySetEventHandler ["keydown","if ((_this select 1) In actionKeys ""TeamSwitch"") then {a = createDialog 'evoUI'}"];
_ambmarker = [] execVM "data\scripts\ambmarker.sqf";
_plyIncome = [] execVM "data\scripts\plyIncome.sqf";
_box = [0] call BIS_EVO_AmmoBox;
_boxR = [0] call BIS_EVO_AmmoBoxR;
//added to make markers show up on first spawn
[] call BIS_EVO_AssignTasks;
//player addweapon "ItemCompass";	
//player addweapon "ItemGPS";
//player addweapon "ItemMap";
//player addweapon "ItemRadio";
//player addweapon "ItemWatch";

//spawn = player execVM "data\scripts\spawn.sqf";
