switch(owner player) do {
case 0: 
    {
        BIS_EVO_EngZone = reng1;
    };
case 1: 
    {
        BIS_EVO_EngZone = reng2;
    };
case 2: 
    {
        BIS_EVO_EngZone = reng3;
    };
case 3: 
    {
        BIS_EVO_EngZone = reng4;
    };
};
/*
	if(player == enge1) then {BIS_EVO_EngZone = reng1};
	if(player == enge2 ) then {BIS_EVO_EngZone = reng2};
	if(player == enge3) then {BIS_EVO_EngZone = reng3};
	if(player == enge4) then {BIS_EVO_EngZone = reng4};

	if(player == engw1) then {BIS_EVO_EngZone = reng1};
	if(player == engw2) then {BIS_EVO_EngZone = reng2};
	if(player == engw3) then {BIS_EVO_EngZone = reng3};
	if(player == engw4) then {BIS_EVO_EngZone = reng4};
*/

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
/*
BIS_EVO_allvar = [BIS_EVO_end,BIS_EVO_MissionProgress,BIS_EVO_lives];
BIS_EVO_allvar_packed = str (BIS_EVO_allvar);
BIS_EVO_gdate_packed = str (BIS_EVO_gdate);
publicVariable "BIS_EVO_gdate_packed";
publicVariable "BIS_EVO_allvar_packed";
*/