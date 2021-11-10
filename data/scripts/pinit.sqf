/*
0 spawn 
{
#define seconds 3540
#define hours 12
#define sleeptime 0.1
//1 Sec
#define skip 0.000277

	setDate [2020, 1, 7, 6, 0]; 
	for "_h" from 1 to hours do 
	{
		for "_s" from 1 to seconds do
		{
			_start = diag_tickTime;
			skipTime skip;
			sleep sleeptime;
			_difft = _difft + (diag_tickTime - _start);
		};
	};
};
*/
// player init
EB_airfn1=-1;
EB_airfn2=-1;
EB_airfn3=-1;
EB_airfn4=-1;
EB_airfn5=-1;
EB_airfn6=-1;
EB_airfn7=-1;


waitUntil{gameBegin == 1};

_cevents = [] execVM "data\scripts\EventsC.sqf"; // Common player events
Sleep 1.0;
// Special conditions for medics and engineers
_playertype = typeOf (vehicle player);
Sleep 0.2;

plays = [] execVM "data\scripts\update.sqf";
_pos = [0,0,0];

//_rain = [] execVM "data\scripts\rain.sqf";
_arm = [] execVM "data\scripts\EB_ARM.sqf";
//_fog = [] execVM "data\scripts\fog.sqf";
_cthread = [] execVM "data\scripts\MainThreadC.sqf";

//Alternating map marker sizes
//_mapF= [] execVM "data\scripts\mapFunctions.sqf";
waitUntil {!(isNull (findDisplay 46))};
//Bandage init
[player,0.2,0,-1,true] execVM "data\scripts\cly_heal.sqf";

(FindDisplay 46) DisplayAddEventHandler ["keydown","if (!dialog and (_this select 1) In actionKeys ""TeamSwitch"" ) then { a = createDialog 'evoUI';}"];
(FindDisplay 46) DisplayAddEventHandler ["keydown","if ((_this select 1) In actionKeys 'showMap' and !visibleMap) then { [] spawn fnc_mapActions}"];
(FindDisplay 46) DisplayAddEventHandler ["keydown","if((_this select 1) in actionKeys 'User16' ) then { if ( (missionNamespace getVariable 'perkSniperLVL' > -1) and vehicle player iskindof 'man') then {[cursorTarget,player] call fnc_spot}};"];
reloading = false;
menu = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) in actionKeys ""ReloadMagazine"") then {[] execVM 'actions\backpackreload.sqf'}"];
// _box = [0] call BIS_EVO_AmmoBox;
// _boxR = [0] call BIS_EVO_AmmoBoxR;
//added to make markers show up on first spawn
//player addweapon "ItemCompass";	
//player addweapon "ItemGPS";
//player addweapon "ItemMap";
//player addweapon "ItemRadio";
//player addweapon "ItemWatch";

//spawn = player execVM "data\scripts\spawn.sqf";

[] spawn fnc_marker_screen;