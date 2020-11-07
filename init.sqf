enableEnvironment true;
//creating center east/ setting relations
_SideHQ = createCenter east;
EAST setFriend [WEST, 0]; 
WEST setFriend [EAST, 0];

//rug_dsai settings [EAST, WEST, GUER, CIV, sideEnemy]
RUG_DSAI_SIDES = ["RUG_DSAIArab","RUG_DSAI","RUG_DSAIArab","RUG_DSAIArab","RUG_DSAIArab"];

EGG_sinit = 0;publicVariable "EGG_sinit";

//Air units respawn frequency for use with type of unit - multiplied by difficulty 60,30,10,5 (hardest)
BIS_EVO_airspawnfreqa = 60; //longest sleep = easier
BIS_EVO_airspawnfreqb = 45;
BIS_EVO_airspawnfreqa = 30;// shortest sleep = harder

/////////////////Dwarden fixing fire in the sky bug

BIS_Effects_EH_Killed=compile preprocessFileLineNumbers "new_effects\killed.sqf";
BIS_Effects_AirDestruction=compile preprocessFileLineNumbers "new_effects\AirDestruction.sqf";
BIS_Effects_AirDestructionStage2=compile preprocessFileLineNumbers "new_effects\AirDestructionStage2.sqf";

BIS_Effects_globalEvent = 
{
	BIS_effects_gepv = _this;
	publicVariable "BIS_effects_gepv";
     _this call BIS_Effects_startEvent;
};

BIS_Effects_startEvent = 
{
	switch (_this select 0) do 
	{
     		case "AirDestruction": 
		{
           	[_this select 1] spawn BIS_Effects_AirDestruction;
		};
           case "AirDestructionStage2": 
		{
           	[_this select 1, _this select 2, _this select 3] spawn BIS_Effects_AirDestructionStage2;
		};
           case "Burn": 
		{
           	[_this select 1, _this select 2, _this select 3, false, true] spawn BIS_Effects_Burn;
		};
	};
};
"BIS_effects_gepv" addPublicVariableEventHandler {(_this select 1) call BIS_Effects_startEvent;};

skillfactor = ((1 + random 2)/10);
Spymade = 0;
EGG_hidetotal = 6;

spawntype = param1;
helicopterhitch = param2;
EVOhour = paramsArray select 2;
grasslevel = paramsArray select 3;
if (grasslevel == 0) then {setTerrainGrid 50};
if (grasslevel == 1) then {setTerrainGrid 25};
if (grasslevel == 2) then {setTerrainGrid 12.5};
if (grasslevel == 3) then {setTerrainGrid 6.25};
if (grasslevel == 4) then {setTerrainGrid 3.125};
viewparam =  paramsArray select 4;
basebeam = paramsArray select 5;
gitsnades = paramsArray select 6;
EGG_EVO_allowpilots = paramsArray select 7;
ranklock = paramsArray select 8;
deathScorePenalty = paramsArray select 9;
rankscore = paramsArray select 10;
//adding	
helpersparam = paramsArray select 11;
performanceparam = paramsArray select 12;
perkparam = paramsArray select 13;
EGG_EVO_Artycost = paramsArray select 14;
//Note from Tox1m: paramsArray select 15 used by Revive script
enemynumdiv = paramsArray select 16;
reinfdelay = paramsArray select 17;
EGG_vecmods = paramsArray select 18;
//temp
EGG_unitwest = paramsArray select 19;
EX_EVO_vehPriceMultiplier = paramsArray select 20;
//Respawn settings
publicVariable "spawntype"; 
if (spawntype == 0 or spawntype == 1) then {server execVM "revive_init.sqf"};
if (spawntype == 2) then {"Respawn_west" setMarkerPos [(getMarkerPos "FahneLKW" select 0),(getMarkerPos "FahneLKW" select 1)]};

if (performanceparam == 1) then {enableEnvironment true};
if (performanceparam == 2) then {enableEnvironment false};

BIS_EVO_rank1 = (rankscore * 1);
BIS_EVO_rank2 = (rankscore * 2);
BIS_EVO_rank3 = (rankscore * 3);
BIS_EVO_rank4 = (rankscore * 4);
BIS_EVO_rank5 = (rankscore * 5);
BIS_EVO_rank6 = (rankscore * 6);

BIS_EVO_GlobalSleep = 0.1; // Global sleep is used after spawning a unit.
// Sub mission conditions
BIS_EVO_MissionProgress = 0; // counts towns captured, when it hits 11 , mission is over.
BIS_EVO_Onmission=false; 
BIS_EVO_sobj1=false;
BIS_EVO_radios = [parso1,somso1,cayso1,dolso1,ortso1,corso1,obrso1,bagso1,eposo1,masso1,pitso1]; // Each radio in each town
BIS_EVO_MissionTowns = ["mobj1","mobj2","mobj3","mobj4","mobj5","mobj6","mobj7","mobj8","mobj9","mobj10","mobj11"];// Each mission objectives town marker.

//adding strings for city names
//BIS_EVO_Townnames = ["CAINNA WIND","CAMARRA","KINSELLA","DJOLAN","KWAKO","DENDALA DISTRICT","BOLABONGO","ENGOR","CANTO","NUBAK","NUMBO"];// Each mission name used in eventsc, mainthreadc, sorew, briefing, used as _city = (BIS_EVO_Townnames select BIS_EVO_MissionProgress);

BIS_EVO_Townnames = ["LARENGA","URSANA","KIRABO","CANTO","ZEELOR","MANGOMAK","ENGOR","BOLABONGO","SWONTO","PINLEY","KINSELLA"];// Each mission name used in eventsc, mainthreadc, sorew, briefing, used as _city = (BIS_EVO_Townnames select BIS_EVO_MissionProgress);

BIS_EVO_Infantry = [[58,44],[60,48],[65,50],[68,52],[70,56],[75,60],[77,65],[80,68],[85,70],[88,73],[92,76]];//[Actual number of groups,Base number of groups]
BIS_EVO_Mechanized = [[19,14],[19,14],[19,14],[19,14],[19,14],[19,14],[19,14],[21,15],[21,17],[23,18],[23,20]];//[Actual number of groups,Base number of groups]

BIS_EVO_CivCount = 0; // Number of civilians spawned

BIS_EVO_vdist=viewparam;                          // clients saved view distance
BIS_EVO_avdist=viewparam;    			   // clients saved air vehicle view distance
//adding variable to set terrain grid and store it for each player
BIS_EVO_grid=grasslevel;    			   // clients saved terrain option
BIS_EVO_gdate = [2007,7,4,EVOhour,59];        // Current date and time

BIS_EVO_Playerlist = [];			   // List of player names.

BIS_EVO_Playercount = 1;			   // Amount of players in the game
BIS_EVO_lives=500;				   // Amount of deaths allowed in a game before it ends when paarm is active
BIS_EVO_PlayerSkill = 0.0;
BIS_EVO_allvar_packed = "";		   // String transmitted to JIP clients containing all vars.
BIS_EVO_end=false; 				   // Used to trigger the end of the game
BIS_EVO_sop=objNull; 			   // Sub objective player
BIS_EVO_sot=objNull; 			   // Sub objective target (radio or officer)
BIS_EVO_sor=0;			   		   // Sub objective reward

BIS_EVO_sup=objNull;			   // Player calling support
BIS_EVO_sut="";				   // Type of support called
BIS_EVO_sur="";

BIS_EVO_fattack=false; 			   // detects if the player was attacked by the enemy for medic rewards.
BIS_EVO_mpoint=objNull;			   // Player eligible for a medic reward.
BIS_EVO_epoint=objNull;			   // Player eligible for a repair reward.
BIS_EVO_dunit="none"; 			   // Name of disconnection player.
BIS_EVO_runit=objNull; 			   // Player who requires an AI recruit
BIS_EVO_rtype="none";			   // Type of AI to be delivered
BIS_EVO_tunit=objNull; 			   // Target player for a join group request 
BIS_EVO_junit = objNull;			   // Player who wishes to join the group
BIS_EVO_jgroup=grpNull; 			   // group junit wants to join

BIS_EVO_lunit = objNull; 			   // Laser target near the bomb site for shared point laser designation
BIS_EVO_lpoint = 2;      			   // Points the designator will receive.

BIS_EVO_punit=objNull;			   // Player requesting submission.
BIS_EVO_prew=0;       			   // reward score for mission etc group sharing of reward.
//adding
BIS_EVO_punitC=objNull;			   // Player requesting submission.
BIS_EVO_prewC=0;       			   // reward score for mission etc unique user reward or support cost.
BIS_EVO_aunit=objNull; 			   // Player who will be promoted
BIS_EVO_arank="NULL"; 			   // New rank the player will get

BIS_EVO_EngZone = objNull;		   //Engineer zone
BIS_EVO_elock = 0;     	   	   	   // Remembers if the engineer has his truck locked
BIS_EVO_ltrk = objNull;  			   // The truck that is locked
BIS_EVO_mtar=objNull; 			   // the target that the missile is attacking in AA warning
BIS_EVO_fmission=false;			   // Limits support to one request at a time.
BIS_EVO_latk=objNull; 			   // Person attacking a radio tower
10 setRadioMsg "NULL";
buyCoolDown = 0;

BIS_EVO_Objective0 = taskNull; // Idle objective
BIS_EVO_Objective1 = taskNull; //City 1 to
BIS_EVO_Objective2 = taskNull;
BIS_EVO_Objective3 = taskNull;
BIS_EVO_Objective4 = taskNull;
BIS_EVO_Objective5 = taskNull;
BIS_EVO_Objective6 = taskNull;
BIS_EVO_Objective7 = taskNull;
BIS_EVO_Objective8 = taskNull;
BIS_EVO_Objective9 = taskNull;
BIS_EVO_Objective10 = taskNull;
BIS_EVO_Objective11 = taskNull; // City 11
BIS_EVO_Objective12 = taskNull; // 

// Common function to lock vehicles.
BIS_EVO_Lock =
{
	_vec = _this select 0;
	if(Param1 == 7) then {_vec lock true} else {_vec lock false};
};

//High priority functions
_rng = [] execVM "data\scripts\weightedRandom.sqf";


// Detects empty enemy vehicles and deletes them.
BIS_EVO_IdelSVEC = 
{	
	_svec = _this select 0;
	for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
	{
		if(not alive _svec or count units _svec == 0) then {_loop=1};
		Sleep 4.0;
	};
	sleep 2.0;
	if(not alive _svec) exitWith {};
	sleep 300;
	if(count units _svec == 0) then 
	{
		{_x setpos position _svec} forEach crew _svec;
		sleep 1.0;
		deletevehicle _svec
	};
};

//sending player to valley to sort out type
//plays = [player] execVM "data\scripts\selectplayer.sqf";

//adding typical unit, vehicle, weapon and missile arrays
//#######################################################

//desert BAF
EGG_EVO_westplayer = ["BAF_Soldier_EN_DDPM","BAF_Soldier_EN_DDPM","BAF_Soldier_EN_DDPM","BAF_Soldier_EN_DDPM","BAF_Soldier_Officer_DDPM","BAF_Soldier_GL_DDPM","TK_CIV_Takistani04_EP1","BAF_Soldier_GL_DDPM","BAF_Soldier_AA_DDPM","BAF_Soldier_MG_DDPM","BAF_Soldier_AT_DDPM","BAF_Pilot_DDPM","BAF_Soldier_HAT_DDPM","BAF_Soldier_MG_DDPM","CIV_EuroMan02_EP1","BAF_Pilot_DDPM","BAF_Soldier_AAA_DDPM","BAF_Soldier_scout_DDPM","BAF_Soldier_Medic_DDPM","BAF_Soldier_SniperH_MTP","BAF_Soldier_Medic_DDPM","BAF_Soldier_Medic_DDPM","Dr_Hladik_EP1"];

//woodland BAF
if (EGG_unitwest == 1) then 
{
	EGG_EVO_westplayer = ["BAF_Soldier_EN_W","BAF_Soldier_EN_W","BAF_Soldier_EN_W","BAF_Soldier_EN_W","BAF_Soldier_Officer_W","BAF_Soldier_GL_W","Rocker4","BAF_Soldier_GL_W","BAF_Soldier_AA_W","BAF_Soldier_MG_W","BAF_Soldier_AT_W","BAF_Pilot_W","BAF_Soldier_HAT_W","BAF_Soldier_MG_W","Villager1","BAF_Pilot_W","BAF_Soldier_AAA_W","BAF_Soldier_scout_W","BAF_Soldier_Medic_W","BAF_Soldier_SniperH_W","BAF_Soldier_Medic_W","BAF_Soldier_Medic_W","Dr_Hladik_EP1"];
};

//US desert
if (EGG_unitwest == 2) then 
{
	EGG_EVO_westplayer =["US_Soldier_Engineer_EP1","US_Soldier_Engineer_EP1","US_Soldier_Engineer_EP1","US_Soldier_Engineer_EP1","US_Soldier_Officer_EP1","US_Soldier_GL_EP1","TK_CIV_Takistani04_EP1","US_Soldier_GL_EP1","US_Soldier_AA_EP1","US_Soldier_MG_EP1","US_Soldier_AT_EP1","US_Soldier_Pilot_EP1","US_Soldier_HAT_EP1","US_Delta_Force_MG_EP1","CIV_EuroMan02_EP1","US_Soldier_Pilot_EP1","US_Soldier_AA_EP1","US_Delta_Force_Marksman_EP1","US_Delta_Force_Medic_EP1","US_Soldier_SniperH_EP1","US_Soldier_Medic_EP1","US_Soldier_Medic_EP1","Dr_Hladik_EP1"];
};

//USMC woodland
if (EGG_unitwest == 3) then 
{
	EGG_EVO_westplayer = ["USMC_SoldierS_Engineer","USMC_SoldierS_Engineer","FR_Sapper","FR_Sapper","FR_Commander","FR_Assault_GL","Villager1","USMC_Soldier_GL","USMC_Soldier_AA","FR_AR","USMC_Soldier_AT","USMC_Soldier_Pilot","USMC_Soldier_HAT","USMC_Soldier_MG","Rocker4","USMC_Soldier_Pilot","USMC_Soldier_AA","FR_Marksman","FR_Corpsman","USMC_SoldierS_Sniper","USMC_Soldier_Medic","USMC_Soldier_Medic","Dr_Hladik_EP1"];
};

//ACR desert
if (EGG_unitwest == 4) then 
{
	EGG_EVO_westplayer = ["CZ_Soldier_Engineer_Dst_ACR","CZ_Soldier_Engineer_Dst_ACR","CZ_Soldier_Spec_Demo_Dst_ACR","CZ_Soldier_Spec_Demo_Dst_ACR","CZ_Special_Forces_TL_DES_EP1","CZ_Special_Forces_GL_DES_EP1","TK_CIV_Takistani04_EP1","CZ_Soldier_805g_Dst_ACR","CZ_Soldier_Spotter_ACR","CZ_Special_Forces_MG_DES_EP1","CZ_Soldier_RPG_Dst_ACR","CZ_Soldier_Pilot_EP1","CZ_Soldier_AT_DES_EP1","CZ_Soldier_MG_DES_EP1","CIV_EuroMan02_EP1","CZ_Soldier_Pilot_EP1","CZ_Soldier_Spotter_ACR","CZ_Special_Forces_Scout_DES_EP1","CZ_Soldier_medik_DES_EP1","CZ_Sharpshooter_DES_ACR","CZ_Soldier_medik_DES_EP1","CZ_Soldier_medik_DES_EP1","Dr_Hladik_EP1"];
};

//ACR woodland
if (EGG_unitwest == 5) then 
{
	EGG_EVO_westplayer = ["CZ_Soldier_Engineer_Wdl_ACR","CZ_Soldier_Engineer_Wdl_ACR","CZ_Soldier_Spec_Demo_Wdl_ACR","CZ_Soldier_Spec_Demo_Wdl_ACR","CZ_Soldier_Officer_Wdl_ACR","CZ_Soldier_805g_Wdl_ACR","Villager1","CZ_Soldier_805g_Wdl_ACR","CZ_Soldier_Recon_Wdl_ACR","CZ_Soldier_MG_Wdl_ACR","CZ_Soldier_RPG_Wdl_ACR","CZ_Soldier_Pilot_Wdl_ACR","CZ_Soldier_AT_Wdl_ACR","CZ_Soldier_MG2_Wdl_ACR","Rocker4","CZ_Soldier_Pilot_Wdl_ACR","CZ_Soldier_Recon_Wdl_ACR","CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR","CZ_Soldier_Spec2_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR","Dr_Hladik_EP1"];
};

//PMC/DE desert
if (EGG_unitwest == 6) then 
{
	EGG_EVO_westplayer = ["Soldier_Engineer_PMC","Soldier_Engineer_PMC","Soldier_Engineer_PMC","Soldier_Engineer_PMC","Soldier_TL_PMC","Soldier_GL_M16A2_PMC","TK_CIV_Takistani04_EP1","Soldier_GL_PMC","Soldier_AA_PMC","GER_Soldier_MG_EP1","Soldier_AT_PMC","Soldier_Pilot_PMC","Soldier_AT_PMC","Soldier_MG_PMC","CIV_EuroMan02_EP1","Soldier_Pilot_PMC","Soldier_AA_PMC","GER_Soldier_Scout_EP1","GER_Soldier_Medic_EP1","Soldier_Sniper_KSVK_PMC","GER_Soldier_Medic_EP1",
"GER_Soldier_Medic_EP1","Dr_Hladik_EP1"];
};

//PMC woodland+CDF
if (EGG_unitwest == 7) then 
{

	EGG_EVO_westplayer = ["Soldier_Engineer_PMC","Soldier_Engineer_PMC","UN_CDF_Soldier_B_EP1","UN_CDF_Soldier_B_EP1","UN_CDF_Soldier_Officer_EP1","Soldier_GL_M16A2_PMC","Villager1","UN_CDF_Soldier_EP1","Soldier_AA_PMC","UN_CDF_Soldier_MG_EP1","UN_CDF_Soldier_AT_EP1","UN_CDF_Soldier_Pilot_EP1","Soldier_AT_PMC","Soldier_MG_PKM_PMC","Rocker4","Soldier_Pilot_PMC","Soldier_Bodyguard_AA12_PMC","Soldier_Sniper_PMC","GER_Soldier_Medic_EP1","Soldier_Sniper_KSVK_PMC","Soldier_Medic_PMC","Soldier_Medic_PMC","Dr_Hladik_EP1"];
};

//PRACS
if (EGG_unitwest == 8) then 
{
	EGG_EVO_westplayer = ["PRACS_Paratrooper_ENG","PRACS_Paratrooper_ENG","PRACS_Regular_ENG","PRACS_Regular_ENG","PRACS_Paratrooper_O","PRACS_Paratrooper_GRE","Villager1","PRACS_Regular_GRE","PRACS_Paratrooper_AA","PRACS_Paratrooper_MG","PRACS_Paratrooper_AT","PRACS_Attack_Heli_pilot","PRACS_Paratrooper_HAT","PRACS_Paratrooper_ARM","Rocker4","PRACS_F16_Pilot","PRACS_Regular_AA","PRACS_Paratrooper_NVS","PRACS_Paratrooper_MED","PRACS_Sniper_TWS","PRACS_Regular_MED","PRACS_Regular_MED","Dr_Hladik_EP1"];
};

//########################################################
//new unsung factions

//		"US 25th Infantry Div. (65) (Unsung)",

if (EGG_unitwest == 9) then 
{
	EGG_EVO_westplayer = ["uns_US_25ID_ENG","uns_US_25ID_ENG","uns_US_25ID_DEM","uns_US_25ID_SAP","uns_US_25ID_PL","uns_US_25ID_GL","uns_civilian3","uns_US_25ID_MTSG","uns_US_25ID_RTO","uns_US_25ID_HMG","uns_US_25ID_SL","uns_pil1","uns_US_25ID_AT","uns_US_25ID_AHMG","uns_civilian1","uns_pilot5","uns_US_25ID_RTO","uns_US_25ID_SCT","uns_US_25ID_MED","uns_US_25ID_MRK","uns_US_25ID_MED","uns_US_25ID_MED","Dr_Hladik_EP1"];

//AI recruits
	EGG_EVO_west1 =["uns_US_25ID_TRI","uns_US_25ID_MED","uns_US_25ID_ENG","uns_US_25ID_RTO","uns_US_25ID_HMG","uns_US_25ID_AT","uns_pilot5","uns_US_25ID_MGSG","uns_US_25ID_MRK","uns_US_25ID_GL","uns_US_25ID_MTSG","uns_US_25ID_SLSG"];

};

//		"US 5th Spec. Forces Grp. (65) (Unsung)",
if (EGG_unitwest == 10) then 
{
	EGG_EVO_westplayer = ["uns_men_US_5SFG_ENG","uns_men_US_5SFG_ENG","uns_men_US_5SFG_DEM","uns_men_US_5SFG_SAP","uns_men_US_5SFG_PL","uns_men_US_5SFG_GL","uns_civilian3","uns_men_US_5SFG_GL2","uns_men_US_5SFG_RTO","uns_men_US_5SFG_HMG","uns_men_US_5SFG_SL","uns_pilot6","uns_men_US_5SFG_AT","uns_men_US_5SFG_AHMG","uns_civilian1","uns_pil1","uns_men_US_5SFG_RTO","uns_men_US_5SFG_SCT","uns_men_US_5SFG_MED","uns_men_US_5SFG_MRK","uns_men_US_5SFG_MED","uns_men_US_5SFG_MED","Dr_Hladik_EP1"];

//AI recruits
	EGG_EVO_west1 =["uns_men_US_5SFG_TRI","uns_men_US_5SFG_MED","uns_men_US_5SFG_ENG","uns_men_US_5SFG_RTO","uns_men_US_5SFG_HMG","uns_men_US_5SFG_AT","uns_pilot6","uns_men_US_5SFG_MGSG","uns_men_US_5SFG_MRK","uns_men_US_5SFG_GL2","uns_men_US_5SFG_MTSG","uns_men_US_5SFG_Mk18"];

};

//		"USMC (65) (Unsung)",
if (EGG_unitwest == 11) then 
{
	EGG_EVO_westplayer = ["uns_men_USMC_65_ENG","uns_men_USMC_65_ENG","uns_men_USMC_65_DEM","uns_men_USMC_65_SAP","uns_men_USMC_65_PL","uns_men_USMC_65_GL","uns_civilian3","uns_men_USMC_65_MTSG","uns_men_USMC_65_RTO","uns_men_USMC_65_HMG","uns_men_USMC_65_SL","uns_pilot3","uns_men_USMC_65_AT","uns_men_USMC_65_AHMG","uns_civilian1","uns_pilN2","uns_men_USMC_65_RTO","uns_men_USMC_65_SCT","uns_men_USMC_65_MED","uns_men_USMC_65_MRK","uns_men_USMC_65_MED","uns_men_USMC_65_MED","Dr_Hladik_EP1"];

//AI recruits
	EGG_EVO_west1 =["uns_men_USMC_65_TRI","uns_men_USMC_65_MED","uns_men_USMC_65_ENG","uns_men_USMC_65_RTO","uns_men_USMC_65_HMG","uns_men_USMC_65_AT","uns_pilot3","uns_men_USMC_65_MGSG","uns_men_USMC_65_MRK","uns_men_USMC_65_GL","uns_men_USMC_65_MTSG","uns_men_USMC_65_SLSG"];

};

//		"US 1st Infantry Div. (68) (Unsung)",
if (EGG_unitwest == 12) then 
{
	EGG_EVO_westplayer = ["uns_US_1ID_ENG","uns_US_1ID_ENG","uns_US_1ID_DEM","uns_US_1ID_SAP","uns_US_1ID_PL","uns_US_1ID_GL","uns_civilian3","uns_US_1ID_MTSG","uns_US_1ID_RTO","uns_US_1ID_HMG","uns_US_1ID_SL","uns_pil2","uns_US_1ID_AT","uns_US_1ID_AHMG","uns_civilian1","uns_pilot5","uns_US_1ID_RTO","uns_US_1ID_SCT","uns_US_1ID_MED","uns_US_1ID_MRK","uns_US_1ID_MED","uns_US_1ID_MED","Dr_Hladik_EP1"];

//AI recruits
	EGG_EVO_west1 =["uns_US_1ID_TRI","uns_US_1ID_MED","uns_US_1ID_ENG","uns_US_1ID_RTO","uns_US_1ID_HMG","uns_US_1ID_AT","uns_pilot5","uns_US_1ID_MGSG","uns_US_1ID_MRK","uns_US_1ID_GL","uns_US_1ID_MTSG","uns_US_1ID_SLSG"];

};

//		"USMC (68) (Unsung)",

if (EGG_unitwest == 13) then 
{
	EGG_EVO_westplayer = ["uns_men_USMC_68_ENG","uns_men_USMC_68_ENG","uns_men_USMC_68_DEM","uns_men_USMC_68_SAP","uns_men_USMC_68_PL","uns_men_USMC_68_GL","uns_civilian3","uns_men_USMC_68_MTSG","uns_men_USMC_68_RTO","uns_men_USMC_68_HMG","uns_men_USMC_68_SL","uns_pilN1","uns_men_USMC_68_AT","uns_men_USMC_68_AHMG","uns_civilian1","uns_pilot4","uns_men_USMC_68_RTO","uns_men_USMC_68_SCT","uns_men_USMC_68_MED","uns_men_USMC_68_MRK","uns_men_USMC_68_MED","uns_men_USMC_68_MED","Dr_Hladik_EP1"];

//AI recruits
	EGG_EVO_west1 =["uns_men_USMC_68_TRI","uns_men_USMC_68_MED","uns_men_USMC_68_ENG","uns_men_USMC_68_RTO","uns_men_USMC_68_HMG","uns_men_USMC_68_AT","uns_pilot4","uns_men_USMC_68_MGSG","uns_men_USMC_68_MRK","uns_men_USMC_68_GL","uns_men_USMC_68_MTSG","uns_men_USMC_68_SLSG"];

};

//		"USMC Force Recon (68) (Unsung)",

if (EGG_unitwest == 14) then 
{
	EGG_EVO_westplayer = ["uns_men_US_3FRC_ENG","uns_men_US_3FRC_ENG","uns_men_US_3FRC_DEM","uns_men_US_3FRC_SAP","uns_men_US_3FRC_PL","uns_men_US_3FRC_GL","uns_civilian3","uns_men_US_3FRC_MTSG","uns_men_US_3FRC_RTO","uns_men_US_3FRC_HMG","uns_men_US_3FRC_SL","uns_pilN1","uns_men_US_3FRC_AT","uns_men_US_3FRC_AHMG","uns_civilian1","uns_pilot3","uns_men_US_3FRC_RTO","uns_men_US_3FRC_SCT","uns_men_US_3FRC_MED","uns_men_US_3FRC_MRK","uns_men_US_3FRC_MED","uns_men_US_3FRC_MED","Dr_Hladik_EP1"];

//AI recruits
	EGG_EVO_west1 =["uns_men_US_3FRC_TRI","uns_men_US_3FRC_MED","uns_men_US_3FRC_ENG","uns_men_US_3FRC_RTO","uns_men_US_3FRC_HMG","uns_men_US_3FRC_AT","uns_pilot3","uns_men_US_3FRC_MGSG","uns_men_US_3FRC_MRK","uns_men_US_3FRC_GL","uns_men_US_3FRC_MTSG","uns_men_US_3FRC_SAP"];

};

//		"US 6th Spec. Forces Grp.(68) (Unsung)",

if (EGG_unitwest == 15) then 
{
	EGG_EVO_westplayer = ["uns_men_US_6SFG_ENG","uns_men_US_6SFG_ENG","uns_men_US_6SFG_DEM","uns_men_US_6SFG_SAP","uns_men_US_6SFG_PL","uns_men_US_6SFG_GL","uns_civilian3","uns_men_US_6SFG_GL2","uns_men_US_6SFG_RTO","uns_men_US_6SFG_HMG","uns_men_US_6SFG_SL","uns_pil1","uns_men_US_6SFG_AT","uns_men_US_6SFG_AHMG","uns_civilian1","uns_pilot6","uns_men_US_6SFG_RTO","uns_men_US_6SFG_SCT","uns_men_US_6SFG_MED","uns_men_US_6SFG_MRK","uns_men_US_6SFG_MED","uns_men_US_6SFG_MED","Dr_Hladik_EP1"];

//AI recruits
	EGG_EVO_west1 =["uns_men_US_6SFG_TRI","uns_men_US_6SFG_MED","uns_men_US_6SFG_ENG","uns_men_US_6SFG_RTO","uns_men_US_6SFG_HMG","uns_men_US_6SFG_AT","uns_pilot6","uns_men_US_6SFG_MGSG","uns_men_US_6SFG_MRK","uns_men_US_6SFG_GL2","uns_men_US_6SFG_MTSG","uns_men_US_6SFG_Mk18"];

};

//		"US 1AC Long Range Recon Patrol LRRP (Unsung)",

if (EGG_unitwest == 16) then 
{
	EGG_EVO_westplayer = ["uns_men_US_1AC_ENG","uns_men_US_1AC_ENG","uns_men_US_1AC_DEM","uns_men_US_1AC_SAP","uns_men_US_1AC_PL","uns_men_US_1AC_GL","uns_civilian3","uns_men_US_1AC_GL2","uns_men_US_1AC_RTO","uns_men_US_1AC_HMG","uns_men_US_1AC_SL","uns_pil1","uns_men_US_1AC_AT","uns_men_US_1AC_AHMG","uns_civilian1","uns_pilot2","uns_men_US_1AC_RTO","uns_men_US_1AC_SCT","uns_men_US_1AC_MED","uns_men_US_1AC_MRK","uns_men_US_1AC_MED","uns_men_US_1AC_MED","Dr_Hladik_EP1"];

//AI recruits
	EGG_EVO_west1 =["uns_men_US_1AC_TRI","uns_men_US_1AC_MED","uns_men_US_1AC_ENG","uns_men_US_1AC_RTO","uns_men_US_1AC_HMG","uns_men_US_1AC_AT","uns_pilot2","uns_men_US_1AC_MGSG","uns_men_US_1AC_MRK","uns_men_US_1AC_GL2","uns_men_US_1AC_MTSG","uns_men_US_1AC_SAP"];

};

//		"Civilian Irregular Defence Group CIDG (Unsung)",

if (EGG_unitwest == 17) then 
{
	EGG_EVO_westplayer = ["uns_men_CIDG_ENG","uns_men_CIDG_ENG","uns_men_CIDG_DEM","uns_men_CIDG_SAP","uns_men_CIDG_PL","uns_men_CIDG_GL","uns_civilian3","uns_men_CIDG_GL","uns_men_CIDG_RTO","uns_men_CIDG_HMG","uns_men_CIDG_SL","uns_pilot1","uns_men_CIDG_AT","uns_men_CIDG_HMG","uns_civilian1","uns_pil2","uns_men_CIDG_RTO","uns_men_CIDG_SCT","uns_men_CIDG_MED","uns_men_CIDG_MRK","uns_men_CIDG_MED","uns_men_CIDG_MED","Dr_Hladik_EP1"];

//AI recruits
	EGG_EVO_west1 =["uns_men_CIDG_S1","uns_men_CIDG_MED","uns_men_CIDG_ENG","uns_men_CIDG_RTO","uns_men_CIDG_HMG","uns_men_CIDG_AT","uns_pilot1","uns_men_CIDG_S4","uns_men_CIDG_MRK","uns_men_CIDG_GL","uns_men_CIDG_S7","uns_men_CIDG_SAP"];

};

//Duala/Afrenian desert was 10
if (EGG_unitwest == 18) then 
{
	EGG_EVO_westplayer = ["AFR_Soldier_Engineer","AFR_Soldier_Engineer","AFR_Soldier_Engineer","AFR_Guard_M1014","AFR_Soldier_Officer","AFR_Soldier_GL","ibr_africaman1","AFR_Guard_M16","AFR_Guard_AA","AFR_Soldier_MG","AFR_Soldier_AT","AFR_Soldier_Pilot","AFR_Soldier_HAT","AFR_Guard_AR","ibr_africaman2","AFR_Soldier_Stinger","AFR_Guard_Marksman","AFR_Soldier_Medic","AFR_Soldier_Sniper","AFR_Soldier_Medic","AFR_Soldier_Medic","Dr_Hladik_EP1"];
};

//Lingor woodland was 11
if (EGG_unitwest == 19) then 
{
	EGG_EVO_westplayer = ["LIN_Soldier_Engineer","LIN_Soldier_Engineer","LIN_Soldier_Engineer","LIN_Soldier_Engineer","LIN_Officer","LIN_Soldier_GL","ibr_lingorman1","LIN_Soldier_GL","LIN_Soldier_AA","LIN_Soldier_MG","LIN_Soldier_LAT","LIN_Soldier_Pilot","LIN_Soldier_HAT","LIN_Soldier_AR","ibr_lingorman2","LIN_Soldier_AA","LIN_Soldier_Spotter","LIN_Soldier_Medic","LIN_Soldier_Sniper","LIN_Soldier_Medic","LIN_Soldier_Medic","Dr_Hladik_EP1"];
};


//////////////////////////////////////////////


EGG_problemcraft =  ["PRACS_TK_Su22","PRACS_TK_Su22_BMB","PRACS_TK_Su22_MSL","PRACS_TK_Su22_IND","PRACS_T K_Su22_STA","PRACS_TK_Su24Fencer","PRACS_TK_Su24Fencer_GBU","PRACS_TK_Su24Fencer_STK","PRACS_TK_MiG21"];

EGG_EVO_repairtruck = ["MtvrRepair_DES_EP1","MtvrRepair","PRACS_M250_Repair","UralRepair_CDF","UralRepair_TK_EP1","UralRepair_INS","KamazRepair","T810Repair_ACR","t810_repair","pook_HEMTT_repair","pook_HEMTT_repair_US","pook_HEMTT_repair_CDF","pook_HEMTT_repair_CDF_IND"];

EGG_EVO_sniperhide = ["Land_sniper_hide_w_nato","Land_sniper_hide_d_nato","Land_sniper_hide_w_east","Land_sniper_hide_d_east"];


EGG_EVO_east10 = ["RU_Soldier_TL","RU_Soldier_SL","RU_Soldier_Medic","RU_Soldier","RU_Soldier2","RU_Soldier_AR","RU_Soldier_MG","RU_Soldier_AA","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_HAT","RU_Soldier_GL","RU_Soldier_Sniper","RU_Soldier_SniperH","RU_Soldier_Spotter","RU_Soldier_Marksman"];
EGG_EVO_east11 = ["MVD_Soldier","MVD_Soldier_MG","MVD_Soldier_Marksman","MVD_Soldier_GL","MVD_Soldier_AT","MVD_Soldier_Sniper","MVD_Soldier_TL"];
EGG_EVO_east12 = ["RUS_Soldier_Sab","RUS_Soldier_GL","RUS_Soldier_Marksman","RUS_Commander","RUS_Soldier1","RUS_Soldier2","RUS_Soldier3","RUS_Soldier_TL"];
//EGG_EVO_east4 = ["Ins_Lopotev","Ins_Commander","Ins_Bardak","Ins_Soldier_1","Ins_Soldier_2","Ins_Soldier_AA","Ins_Soldier_AT","Ins_Soldier_AR","Ins_Soldier_GL","Ins_Soldier_MG","Ins_Soldier_Medic","Ins_Soldier_CO","Ins_Soldier_Sab","Ins_Soldier_Sapper","Ins_Soldier_Sniper"];
//EGG_EVO_east5 = ["Ins_Villager3","Ins_Woodlander3","Ins_Woodlander2","Ins_Worker2","Ins_Villager4","Ins_Woodlander1"];
EGG_EVO_east6 = ["mas_gru_spet_tl_gd","mas_gru_spet_min_gd","mas_gru_spet_dem_iz","mas_gru_spet_min_ge","mas_gru_spet_dem_ge","mas_gru_spet_med2_ge","mas_gru_spet_med_iz","mas_gru_spet_med2_gd","mas_gru_spet_snp_ghil_kb","mas_gru_spet_snp_ghil_gd","mas_gru_spet_snp_iz","mas_gru_spet_spt_ghil_iz","mas_gru_spet_op1_kb","mas_gru_spet_op1_gd","RU_Soldier_AA","Ins_Soldier_AA","mas_gru_spet_mg_kb","mas_gru_spet_rpk_gd","mas_gru_spet_op2_iz","mas_gru_spet_op2_ge"];
EGG_EVO_east7 = ["MOL_Soldier_Officer","MOL_Soldier_Medic","MOL_Soldier_Engineer","MOL_Soldier_Rifleman","MOL_Soldier_GL","MOL_Guard_Marksman","MOL_Soldier_Sniper","MOL_Soldier_Spotter","MOL_Guard_AR","MOL_Soldier_MG","MOL_Soldier_AT","MOL_Soldier_LAT","MOL_Soldier_HAT","MOL_Guard_AA","MOL_Soldier_Crew"];
EGG_EVO_east8 = ["ibr_rebel11","ibr_rebel22","ibr_rebel33","ibr_rebel44","ibr_rebel55","ibr_rebel66","ibr_rebel77","ibr_rebel83","ibr_rebel95","ibr_rebel102","ibr_rebel111","ibr_rebel125","ibr_rebel132","ibr_rebel145"];
EGG_EVO_east9 = ["MIS_ISIS_04_Rif","MIS_ISIS_04_MG","MIS_ISIS_04_Med","MIS_ISIS_04_SVD","MIS_ISIS_04_TWS","MIS_ISIS_04_AT","MIS_ISIS_04_AA"];
EGG_EVO_east1= ["TK_Soldier_AA_EP1","TK_Soldier_AAT_EP1","TK_Soldier_MG_EP1","TK_Soldier_HAT_EP1","TK_Soldier_AR_EP1","TK_Commander_EP1","TK_Soldier_Engineer_EP1","TK_Soldier_GL_EP1","TK_Soldier_AMG_EP1","TK_Soldier_Medic_EP1","TK_Soldier_Officer_EP1","TK_Soldier_EP1","TK_Soldier_B_EP1","TK_Soldier_LAT_EP1","TK_Soldier_AT_EP1","TK_Soldier_Sniper_EP1","TK_Soldier_Spotter_EP1","TK_Soldier_SL_EP1"];
EGG_EVO_east2= ["TK_Aziz_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1","TK_Special_Forces_TL_EP1","TK_Soldier_SniperH_EP1","TK_Soldier_Sniper_Night_EP1","TK_Soldier_Night_1_EP1","TK_Soldier_Night_2_EP1","TK_Soldier_TWS_EP1"]; 
EGG_EVO_east3 = ["TK_INS_Soldier_AA_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Bonesetter_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_2_EP1","TK_INS_Soldier_EP1","TK_INS_Soldier_4_EP1","TK_INS_Soldier_3_EP1","TK_INS_Soldier_AAT_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_Sniper_EP1","TK_INS_Soldier_TL_EP1","TK_INS_Warlord_EP1"];
EGG_EVO_east4 = ["TK_INS_Soldier_AA_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Bonesetter_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_2_EP1","TK_INS_Soldier_EP1","TK_INS_Soldier_4_EP1","TK_INS_Soldier_3_EP1","TK_INS_Soldier_AAT_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_Sniper_EP1","TK_INS_Soldier_TL_EP1","TK_INS_Warlord_EP1"];
EGG_EVO_east5 = ["TK_Aziz_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1","TK_Special_Forces_TL_EP1","TK_Soldier_SniperH_EP1","TK_Soldier_Sniper_Night_EP1","TK_Soldier_Night_1_EP1","TK_Soldier_Night_2_EP1","TK_Soldier_TWS_EP1"]; 




EGG_EVO_west4 = ["USMC_Soldier_SL","USMC_Soldier_TL","USMC_Soldier","USMC_Soldier2","USMC_SoldierS","USMC_Soldier_Medic","USMC_SoldierS_Engineer","USMC_Soldier_AR","USMC_Soldier_MG","USMC_SoldierS_Sniper","USMC_SoldierS_Spotter","USMC_SoldierS_SniperH","USMC_SoldierM_Marksman","USMC_Soldier_AA","USMC_Soldier_AT","USMC_Soldier_LAT","USMC_Soldier_HAT","USMC_Soldier_GL"];
EGG_EVO_west3 = ["CDF_Commander","CDF_Soldier","CDF_Soldier_AR","CDF_Soldier_Crew","CDF_Soldier_GL","CDF_Soldier_Medic","CDF_Soldier_Militia","CDF_Soldier_RPG","CDF_Soldier_Marksman","CDF_Soldier_MG","CDF_Soldier_TL"];
EGG_EVO_west2 = ["FR_Commander","FR_TL","FR_R","FR_Sapper","FR_Corpsman","FR_AR","FR_GL","FR_AC","FR_Assault_R","FR_Assault_GL","FR_Marksman"];
EGG_EVO_west11 = ["AFR_Guard_AK","AFR_Guard_M1014","AFR_Guard_M16","AFR_Soldier_Officer","AFR_Soldier_Medic","AFR_Soldier_Engineer","AFR_Soldier_Rifleman","AFR_Soldier_GL","AFR_Guard_Marksman","AFR_Soldier_Sniper","AFR_Soldier_Spotter","AFR_Guard_AR","AFR_Soldier_MG","AFR_Soldier_AT","AFR_Soldier_LAT","AFR_Soldier_HAT","AFR_Guard_AA","AFR_Soldier_Crew"];
EGG_EVO_west5 = ["UK_SFD","UK_SFD1","UK_SFD2","UK_SFD3","UK_SFD4","UK_SFD5","UK_SFD6"];
EGG_EVO_west6 = ["UK_SFMSKD","UK_SFMSKD1","UK_SFMSKD2","UK_SFMSKD3","UK_SFMSKD4","UK_SFMSKD5","UK_SFMSKD6"];
EGG_EVO_west7 = ["UK_SFM","UK_SFM1","UK_SFM2","UK_SFM3","UK_SFM4","UK_SFM5","UK_SFM6"];
EGG_EVO_west8 = ["UK_SFMSKM","UK_SFMSKM","UK_SFMSM","UK_SFMSKM","UK_SFMSKM","UK_SFMSKM","UK_SFMSKM"];
EGG_EVO_west9 = ["UK_SFT","UK_SFT1","UK_SFT2","UK_SFT3","UK_SFT4","UK_SFT5","UK_SFT6"];
EGG_EVO_west10= ["UK_SFMSKT","UK_SFMSKT1","UK_SFMSKT","UK_SFMSKT","UK_SFMSKT","UK_SFMSKT","UK_SFMSKT"];
EGG_EVO_west1= ["BAF_Soldier_AA_MTP","BAF_Soldier_AAA_MTP","BAF_Soldier_AAT_MTP","BAF_Soldier_AHAT_MTP","BAF_Soldier_AAR_MTP","BAF_Soldier_AMG_MTP","BAF_Soldier_AT_MTP","BAF_Soldier_HAT_MTP","BAF_Soldier_AR_MTP","BAF_Soldier_EN_MTP","BAF_Soldier_GL_MTP","BAF_Soldier_FAC_MTP","BAF_Soldier_MG_MTP","BAF_Soldier_scout_MTP","BAF_Soldier_Marksman_MTP","BAF_Soldier_Medic_MTP","BAF_Soldier_Officer_MTP","BAF_Soldier_MTP","BAF_ASoldier_MTP","BAF_Soldier_L_MTP","BAF_Soldier_N_MTP","BAF_Soldier_SL_MTP","BAF_Soldier_SniperN_MTP","BAF_Soldier_SniperH_MTP","BAF_Soldier_Sniper_MTP","BAF_Soldier_spotter_MTP","BAF_Soldier_spotterN_MTP","BAF_Soldier_TL_MTP"];

EGG_EVO_civ1 = ["Damsel1","Damsel2","Damsel3","Damsel4","Damsel5","RU_Damsel1","RU_Damsel2","RU_Damsel3","RU_Damsel4","RU_Damsel5","Farmwife1","Farmwife2","Farmwife3","Farmwife4","Farmwife5","RU_Farmwife1","RU_Farmwife2","RU_Farmwife3","RU_Farmwife4","RU_Farmwife5"];
EGG_EVO_civ2 = ["HouseWife1","HouseWife2","HouseWife3","HouseWife4","HouseWife5","RU_HouseWife1","RU_HouseWife2","RU_HouseWife3","RU_HouseWife4","RU_HouseWife5","Sportswoman1","Sportswoman2","Sportswoman3","Sportswoman4","Sportswoman5","RU_Sportswoman1","RU_Sportswoman2","RU_Sportswoman3","RU_Sportswoman4","RU_Sportswoman5","WorkWoman1","WorkWoman2","WorkWoman3","WorkWoman3","WorkWoman4","WorkWoman5","RU_WorkWoman1","RU_WorkWoman2","RU_WorkWoman3","RU_WorkWoman3","RU_WorkWoman4","RU_WorkWoman5"];
EGG_EVO_civ3 = ["Madam1","Madam2","Madam3","Madam4","Madam5","RU_Madam1","RU_Madam2","RU_Madam3","RU_Madam4","RU_Madam5","Secretary","Secretary1","Secretary2","Secretary3","Secretary4","Secretary5","RU_Secretary1","RU_Secretary2","RU_Secretary3","RU_Secretary4","RU_Secretary5","Hooker1","Hooker2","Hooker3","Hooker4","Hooker5","RU_Hooker1","RU_Hooker2","RU_Hooker3","RU_Hooker4","RU_Hooker5","ValentinaFit","ValentinaVictim"];
EGG_EVO_civ4 = ["Worker1","Worker2","Worker3","Worker4","RU_Worker1","RU_Worker2","RU_Worker3","RU_Worker4","Citizen1","Citizen2","Citizen3","Citizen4","RU_Citizen1","RU_Citizen2","RU_Citizen3","RU_Citizen4","Profiteer1","Profiteer2","Profiteer3","Profiteer4","RU_Profiteer1","RU_Profiteer2","RU_Profiteer3","RU_Profiteer4","Rocker1","Rocker2","Rocker3","Rocker4","RU_Rocker1","RU_Rocker2","RU_Rocker3","RU_Rocker4","Villager1","Villager2","Villager3","Villager4","RU_Villager1","RU_Villager2","RU_Villager3","RU_Villager4","Functionary1","Functionary2","RU_Functionary1","RU_Functionary2"];
EGG_EVO_civ5 = ["Woodlander1","Woodlander2","Woodlander3","Woodlander4","RU_Woodlander1","RU_Woodlander2","RU_Woodlander3","RU_Woodlander4"];
EGG_EVO_civ6 = ["Priest","RU_Priest","Doctor","RU_Doctor","SchoolTeacher","RU_SchoolTeacher","Assistant","Pilot","RU_Assistant","Policeman","RU_Policeman","RU_Pilot"];

EGG_EVO_civ7 = ["ibr_africaman1","ibr_africaman2","ibr_africaman3","ibr_africaman4","ibr_africaman5","ibr_africaman6","ibr_africaman7","ibr_africaman1s","ibr_africaman2s","ibr_africaman3s","ibr_africaman4s","ibr_africaman5s","ibr_africaman6s","ibr_africaman7s"];

EGG_EVO_civ1 = ["TK_CIV_Takistani01_EP1","TK_CIV_Takistani02_EP1","TK_CIV_Takistani03_EP1","TK_CIV_Takistani04_EP1","TK_CIV_Takistani05_EP1","TK_CIV_Takistani06_EP1","TK_CIV_Worker01_EP1","TK_CIV_Worker02_EP1","TK_CIV_Woman01_EP1","TK_CIV_Woman02_EP1","TK_CIV_Woman03_EP1"];
EGG_EVO_civ6 = ["Dr_Hladik_EP1","CIV_EuroMan01_EP1","CIV_EuroMan02_EP1","Haris_Press_EP1","Dr_Annie_Baker_EP1","CIV_EuroWoman01_EP1","CIV_EuroWoman02_EP1","Rita_Ensler_EP1"];

EGG_EVO_allciv = EGG_EVO_civ1+EGG_EVO_civ6;

//VEHICLE ARRAYS

//choppers
EGG_EVO_westveh1 = ["MH60S","UH1Y","AH1Z","AH64D","AH64D_Sidewinders","MV22","Mi24_D","Mi17_CDF","Mi17_medevac_CDF"];
//EGG_EVO_westveh1 = ["AH64D_EP1","AH6J_EP1","CH_47F_EP1","MH6J_EP1","UH60M_EP1","BAF_Apache_AH1_D","CH_47F_BAF","BAF_Merlin_HC3_D","AW159_Lynx_BAF"];
//planes
EGG_EVO_westveh2 = ["F35B","AV8B","AV8B2","A10","C130J","Su25_CDF"];
//EGG_EVO_westveh2 = ["C130J_US_EP1","A10_US_EP1"];
//mod choppers
EGG_EVO_westveh3 = ["RAF_Chin47","rksl_lynx_ah7_gpmg","rksl_lynx_ah7_1gpmg","rksl_lynx_ah7_4tow","rksl_lynx_ah9_1","rksl_lynx_ah7se_gpmg","MH6","AH6","UH60MG","UH60","MH6_RACS","AH6_racs","UH60MGRACS","UH60Racs","ffaa_famet_tigre","ffaa_famet_tigre_AT","CSJ_oh6","CSJ_oh6a","CSJ_UH1Slick","CSJ_UH1supply","CSJ_UH1Gun","CSJ_GHornet","CSJ_UH1transport","CSJ_UH1med"];
//mod planes
EGG_EVO_westveh4 = ["EP3_A10_CAS","EP3_A10_CBU","EP3_A10","GLT_Falcon_mk82","GLT_Falcon_CAP","GLT_Falcon_MR","GLT_Falcon_AGM","GLT_Falcon_GBU","GLT_Falcon_euro_mk82","GLT_Falcon_euro_cap","GLT_Falcon_euro","GLT_Falcon_euro_AGM","GLT_Falcon_euro_GBU","4emesh","4emesh2","4emeshracs","rksl_efa_fgr4_13","rksl_efa_fgr4_2","rksl_efa_fgr4_11","rksl_efa_fgr4_19","GLT_Falcon_lg_AGM","GLT_Falcon_lg_cap","GLT_Falcon_lg_mk82","GLT_Falcon_lg","IkaR_F14_AIM_54_ir","IkaR_F14_AGM_65_ir","IkaR_F14_GBU_12_ir","IkaR_F14_AIM_54","IkaR_F14_AGM_65","IkaR_F14_GBU_12","IkaR_F14_GBU_12_racs","IkaR_F14_AIM_54L","f15c_mod_mesh","f15c_grey_mesh","f15c_blue_mesh","f15e_blue_mesh","f15e_mk84_mesh","f15e_cbu_mesh","f15e_cbug_mesh","f15e_bluec_mesh","f15e_cbuc_mesh","STI_A10_GREY","STI_A10_HOG_GREY","STI_A10_SHARK_GREY","STI_A10_PANTH_GREY","STI_A10_BLACK","STI_A10_HOG_BLACK","STI_A10_SHARK_BLACK","STI_A10_PANTH_BLACK","STI_A10_GREEN","STI_A10_HOG_GREEN","STI_A10_SHARK_GREEN","STI_A10_DESERT","STI_A10_WINTER"];
//unarmed
//EGG_EVO_westveh5 = ["HMMWV","HMMWV_Ambulance","UralOpen_CDF","Ural_CDF","UralReammo_CDF","UralRefuel_CDF","UralRepair_CDF","UAZ_CDF","BMP2_Ambul_CDF","MMT_USMC","M1030","MTVR","MtvrReammo","MtvrRefuel","MtvrRepair"];
EGG_EVO_westveh5 = ["BAF_ATV_D","BAF_Offroad_D","ATV_US_EP1","MTVR_DES_EP1","MtvrReammo_DES_EP1","MtvrRefuel_DES_EP1","MtvrRepair_DES_EP1","M1133_MEV_EP1","SUV_PMC_BAF","SUV_UN_EP1"];
//light armed
//EGG_EVO_westveh6 = ["HMMWV_Armored","HMMWV_M2","HMMWV_MK19","HMMWV_TOW","LAV25_HQ","UAZ_MG_CDF","UAZ_AGS30_CDF","BRDM2_CDF","BRDM2_ATGM_CDF","BMP2_HQ_CDF","GRAD_CDF"];
EGG_EVO_westveh6 = ["LandRover_Special_CZ_EP1","BAF_Jackal2_GMG_W","BAF_Jackal2_L2A1_W","BAF_Jackal2_GMG_D","BAF_Jackal2_L2A1_D","M113_UN_EP1","HMMWV_M1035_DES_EP1","HMMWV_M1151_M2_DES_EP1","HMMWV_M998_crows_M2_DES_EP1","HMMWV_M998_crows_MK19_DES_EP1","HMMWV_M998A2_SOV_DES_EP1","HMMWV_MK19_DES_EP1","HMMWV_TOW_DES_EP1"];
//heavy armed
//EGG_EVO_westveh7 = ["AAV","LAV25","M1A1","M1A2_TUSK_MG","BMP2_CDF","T72_CDF","MLRS","T34"];
EGG_EVO_westveh7 = ["M1135_ATGMV_EP1","M1130_CV_EP1","M1126_ICV_M2_EP1","M1126_ICV_mk19_EP1","M1129_MC_EP1","M1128_MGS_EP1","M1A1_US_DES_EP1","M1A2_US_TUSK_MG_EP1","MLRS_DES_EP1","M2A2_EP1","M2A3_EP1","BAF_FV510_D","BAF_FV510_W"];
//unarmed mod
EGG_EVO_westveh8 = ["AFR_Pinz_police","ukf_110_des","ukf_110_wld"];
//EGG_EVO_westveh8 = ["uns_truck_open","uns_truck_closed","uns_m37b1"];
//light armed mod
EGG_EVO_westveh9 = ["M113","M113_RACS","Chenowth","vil_m113a2","vil_m113a3","sti_Stryker_ICV_M2","sti_Stryker_ICV_MK19","sti_Stryker_ICV_TOW","RE_landrover6x6","RE_landrover","ukf_wmik_des","ukf_wmik_gmg_des","UKF_WMIK_GPMG_des","ukf_wmik_wld","ukf_wmik_gmg_wld","UKF_WMIK_GPMG_WLD","ukf_jackal_mwmik","ukf_jackal_mwmik_gmg","ukf_jackal_mwmik_gpmg","ukf_jackal_wd_mwmik","ukf_jackal_wd_mwmik_gmg","ukf_jackal_wd_mwmik_gpmg"];
//EGG_EVO_westveh9 = ["Chenowth","vil_m113a2","vil_m113a3","uns_m43","uns_guntruck","uns_guntruckM55","uns_m113","uns_m113a"];
//heavy armed mod
EGG_EVO_westveh10 = ["vil_bradley_a1","vil_bradley_gr","vil_bradley_a2D","vil_bradley_a2","vil_m109_sph","sa_bmd2_cdf","sa_bmd2_chdkz"];
//EGG_EVO_westveh10 = ["vil_m109_sph","sa_bmd2_cdf","sa_bmd2_chdkz","uns_m60a1","uns_m48a3","uns_m48a3_1","uns_m48a3_2"];
//AA
EGG_EVO_westveh11 = ["HMMWV_Avenger","ZSU_CDF"];
//EGG_EVO_westveh11 = ["HMMWV_Avenger","ZSU_CDF","M6_EP1"];
//AA mod
EGG_EVO_westveh12 = ["Vulcan","Vulcan_RACS","vil_bradley_a6","vil_bradley_a6D"];
//EGG_EVO_westveh12 = ["uns_m163"];
//statics
EGG_EVO_westveh13 = ["Fort_Nest_M240","M2HD_mini_TriPod","M2StaticMG","DSHKM_CDF","DSHkM_Mini_TriPod_CDF","MK19_TriPod","AGS_CDF","2b14_82mm","2b14_82mm_CDF","M252","SPG9_CDF","M119","D30_CDF","TOW_TriPod","Stinger_Pod","ZU23_CDF"];
//EGG_EVO_westveh13 = ["BAF_GMG_Tripod_D","BAF_GPMG_Minitripod_D","BAF_L2A1_Minitripod_D","BAF_L2A1_Tripod_D","BAF_GMG_Tripod_W","BAF_GPMG_Minitripod_W","BAF_L2A1_Minitripod_W","BAF_L2A1_Tripod_W","Stinger_Pod_US_EP1","M119_US_EP1"];
//EGG_EVO_westveh13 = ["Fort_Nest_M240","M2HD_mini_TriPod","M2StaticMG","DSHKM_CDF","DSHkM_Mini_TriPod_CDF","2b14_82mm","2b14_82mm_CDF","M252","SPG9_CDF","M119","D30_CDF","ZU23_CDF","uns_m2","uns_m2_2","uns_m2_3","CSJ_Quad50"];

//Roaming Hips
EGG_EVO_eastheli1 = ["UH1H_TK_EP1","ibr_gazelle_armed","FRL_Mi17_1_TAK","FRL_Mi17_TAK","FRL_Mi17_TVK_TAK","FRL_Mi17_TVK_TAK_AGM","FRL_Mi17_TVK_TAK_MR","FRL_Mi17_TVK_TAK_BMB","FRL_Mi24D_TK_CAP","FRL_Mi24D_TK_CAS","FRL_Mi24D_TK_HCAS","FRL_Mi24D_TK_AGM","FRL_Mi24D_TK_MR","FRL_Mi24D_TK_BMB","FRL_Mi24D_TK_LRCAS","FRL_Mi24D_TK_SEAD"];//makehip

//["Mi24_D_TK_EP1","Mi17_TK_EP1","Mi17_Ins","Mi17_rockets_RU"];
EGG_EVO_eastheli2 = ["FRL_Mi8_AMTSh_RUS","FRL_Mi8_AMTSh_RUS_HCAS","FRL_Mi8_AMTSh_AGM","FRL_Mi8_AMTSh_MR","FRL_Mi8_AMTSh_BMB","FRL_Mi8_MTV3_RUS","FRL_Mi8_MTV3_RUS_HCAS","FRL_Mi8_MTV3_RUS_AGM","FRL_Mi8_MTV3_RUS_MR","FRL_Mi8_MTV3_RUS_BMB","FRL_Mi24V_TK_CAP","FRL_Mi24V_TK_CAS","FRL_Mi24V_TK_HCAS","FRL_Mi24V_TK_AGM","FRL_Mi24V_TK_MR","FRL_Mi24V_TK_BMB","FRL_Mi24V_TK_LRCAS","FRL_Mi24V_TK_SEAD","FRL_Mi24P_TK_CAP","FRL_Mi24P_TK_CAS","FRL_Mi24P_TK_HCAS","FRL_Mi24P_TK_AGM","FRL_Mi24P_TK_MR","FRL_Mi24P_TK_BMB","FRL_Mi24P_TK_LRCAS","FRL_Mi24P_TK_SEAD"];//makehindp //"Mi24_P","Mi24_V","Mi24_D_TK_EP1"

//Roaming hinds
EGG_EVO_eastheli3 = ["FRL_Mi8_MTKO_RUS","FRL_Mi8_MTKO_RUS_HCAS","FRL_Mi8_MTKO_RUS_AGM","FRL_Mi8_MTKO_RUS_MR","FRL_Mi8_MTKO_RUS_BMB","FRL_Mi28D_TK_CAP","FRL_Mi28D_TK_CAS","FRL_Mi28D_TK_HCAS","FRL_Mi28D_TK_AGM","FRL_Mi28D_TK_MR","FRL_Mi28D_TK_BMB","FRL_Mi28D_TK_LRCAS","FRL_Mi28D_TK_SEAD","FRL_Ka52_CAP_D","FRL_Ka52_CAS_D","FRL_Ka52_HCAS_D","FRL_Ka52_AGM_D","FRL_Ka52_MR_D","FRL_Ka52_BMB_D","FRL_Ka52_LRCAS_D","FRL_Ka52_SEAD_D"];//makeka //"Ka52","UH1H_TK_EP1","ibr_gazelle_armed","CMA_Mi28_N_RUS"

EGG_EVO_mevaira = EGG_EVO_eastheli1+EGG_EVO_eastheli2+EGG_EVO_eastheli3;//hindv
//planes
EGG_EVO_mevairb = ["Su25_TK_EP1","ibrPRACS_MiG21_AGmol","ibrPRACS_MiG21mol","mig15bis_4_tak","mig15bis_fighterBomber_tak","mig15bis_5_tak"];//makesub

EGG_EVO_mevairc = ["FRL_Su34_D_CAP","FRL_Su34_D_CAS","FRL_Su34_D_HCAS","FRL_Su34_D_EHCAS","FRL_Su34_D_AGM","FRL_Su34_D_MR","FRL_Su34_D_LBMB","FRL_Su34_D_BMB","FRL_Su34_D_HBMB","FRL_Su34_D_LGB","FRL_Su34_D_SEAD","An2_TK_EP1","PRACS_Su24Fencer","ibr_viggen1","ibr_viggen4","ibr_viggen3"];//makesu
EGG_EVO_eastveh2 = EGG_EVO_mevairc+EGG_EVO_mevairb;

//EGG_EVO_eastveh1 = ["Mi24_D_TK_EP1","Mi17_TK_EP1","UH1H_TK_EP1"];
//EGG_EVO_eastveh2 = ["An2_TK_EP1","L39_TK_EP1","Su25_TK_EP1"];
//mod choppers
EGG_EVO_eastveh3 = ["CMA_Mi28_N_RUS","KA50"];
//mod planes
EGG_EVO_eastveh4 = ["RKTSU33B1","RKTSU33MR","RKTSU33AA","RKTSU33AG","IkaR_F14_AIM_54_ir","IkaR_F14_AGM_65_ir","IkaR_F14_GBU_12_ir"];
//EGG_EVO_eastveh4 = ["GLT_Su34_TAK_Bomber","GLT_Su34_TAK_Fighter"];
//unarmed
//EGG_EVO_eastveh5 = ["UAZ_INS","UralOpen_INS","Ural_INS","UralRepair_INS","UralReammo_INS","UralRefuel_INS","EB_GAZ_Vodnik_MedEvac_TK","Kamaz","KamazOpen","KamazRepair","KamazReammo","KamazRefuel","BMP2_Ambul_INS"];

//EB armour
EGG_EVO_eastveh5 = ["TT650_TK_EP1","SUV_TK_EP1","UAZ_Unarmed_TK_EP1","V3S_TK_EP1","V3S_Open_TK_EP1","Old_bike_TK_INS_EP1","M113Ambul_TK_EP1","UralSupply_TK_EP1","UralSalvage_TK_EP1","UralReammo_TK_EP1","UralRefuel_TK_EP1","UralRepair_TK_EP1","EB_BMP2_Ambul_TK","EB_GAZ_Vodnik_MedEvac_TK"];

//light armed
//EGG_EVO_eastveh6 = ["UAZ_MG_INS","UAZ_AGS30_INS","UAZ_AGS30_RU","UAZ_SPG9_INS","Offroad_DSHKM_INS","Pickup_PK_INS","BRDM2_INS","BRDM2_ATGM_INS","BMP2_HQ_INS","EB_GAZ_Vodnik_HMG_TK","EB_GAZ_Vodnik_TK","Ural_ZU23_INS","GRAD_INS","BTR90_HQ"];

EGG_EVO_eastveh6 = ["LandRover_MG_TK_EP1","LandRover_SPG9_TK_EP1","UAZ_AGS30_TK_EP1","UAZ_MG_TK_EP1","Ural_ZU23_TK_EP1","LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1","BRDM2_TK_EP1","BRDM2_ATGM_TK_EP1","BTR60_TK_EP1","M113_TK_EP1","BTR40_TK_INS_EP1","BTR40_MG_TK_INS_EP1","BMP2_HQ_TK_EP1","EB_GAZ_Vodnik_TK","GRAD_TK_EP1","pook_brdm2AGS_TKINS","pook_brdm2AA_TKINS","pook_brdm2RKT_TKINS","pook_brdm2PKM_TAK","pook_brdm2HQcomm_TAK","pook_brdm2HQ_TKINS","pook_brdm2DSHK_TAK","pook_brdm2AT5_TAK","pook_brdm2AT3c_TKINS","pook_brdm2AT3_TKINS","pook_brdm2AT2_TKINS","pook_brdm2M_TAK","pook_brdm2_TAK","pook_brdm2_sa9_TAK"];

//heavy armed
//EGG_EVO_eastveh7 = ["BMP2_INS","T72_INS","BMP3","BTR90","T90"];

//EB_armour
//Mechanized town initial defence
EGG_EVO_eastveh7 = ["EB_BTR90_HQ_TK","EB_BTR90_TK","EB_GAZ_Vodnik_HMG_TK","EB_BMP3_TK","BMP2_TK_EP1","BVP1_TK_ACR","T72_INS","T72_RU","T72_TK_EP1","EB_T72B_RU","T90","T34_TK_EP1","EB_OT34_TK","EB_T34_76_TK","EB_T34_85_TK","T55_TK_EP1","EB_OT55_TK"];

//,"vil_bmp1","vil_bmp1p","vil_bmp2d","vil_2s1","vil_t55","vil_t55m_pol","vil_t62m","vil_t64","vil_t64bv","vil_t72M_nsv","vil_t80b","vil_t80bv_c2","vil_t80U_C","sa_bmd2_rus1","sa_bmd2_rus2","sa_bmd2_rus3","sa_bmd2_rus4","sa_bmd2_des","sa_bmd2k","sa_bmd2k_rus1","sa_bmd2k_rus2","sa_bmd2k_rus3","sa_bmd2k_rus4","sa_bmdk_des","vil_t90_1"

//unarmed mod
EGG_EVO_eastveh8 = ["AFR_Pinz"];
//EGG_EVO_eastveh8 = ["uns_nvatruck_open","uns_nvatruck_refuel","uns_nvatruck_reammo"];
//light armed mod
EGG_EVO_eastveh9 = ["Mech_BTR70M","Mech_BTR70"];
//heavy armed mod
EGG_EVO_eastveh10 = ["ibr_T55","vil_bmp1","vil_bmp1p","vil_bmp2d","vil_2s1_easy_arty","vil_2s1","vil_t55","vil_t55m_pol","vil_t62m","vil_t64","vil_t64bv","vil_t72M_nsv","vil_t80b","vil_t80bv_c2","vil_t80U_C","sa_bmd2","sa_bmd2_rus1","sa_bmd2_rus2","sa_bmd2_rus3","sa_bmd2_rus4","sa_bmd2_des","sa_bmd2_ua","sa_bmd2_peace","sa_bmd2k","sa_bmd2k_rus1","sa_bmd2k_rus2","sa_bmd2k_rus3","sa_bmd2k_rus4","sa_bmdk_des","sa_bmd2k_peace"];
//AA
//EGG_EVO_eastveh11 = ["ZSU_INS","2S6M_Tunguska"];

//Town inital aa defence
EGG_EVO_eastveh11 = ["ZU23_TK_INS_EP1","Ural_ZU23_TK_EP1","ZSU_TK_EP1","ZU23_TK_EP1","pook_brdm2AA_TKINS","pook_brdm2_sa9_TAK"];
//AA mod
EGG_EVO_eastveh12 = ["3LB_SA6_des","3LB_SA6_olv"];
//statics
//EGG_EVO_eastveh13 = ["INS_WarfareBMGNest_PK","DSHKM_Ins","DSHkM_Mini_TriPod","KORD","AGS_RU","AGS_Ins","2b14_82mm_INS","SPG9_Ins","D30_Ins","D30_RU","Metis","ZU23_Ins","Igla_AA_pod_East"];

//Town initial staic defence
EGG_EVO_eastveh13 = ["Igla_AA_pod_TK_EP1","AGS_TK_EP1","D30_TK_EP1","KORD_high_TK_EP1","KORD_TK_EP1","Metis_TK_EP1","2b14_82mm_TK_EP1","AGS_TK_INS_EP1","D30_TK_INS_EP1","DSHKM_TK_INS_EP1","DSHkM_Mini_TriPod_TK_INS_EP1","2b14_82mm_TK_INS_EP1","SPG9_TK_INS_EP1"];

//used in makespetz
EGG_EVO_eastveh14 = ["BTR40_MG_TK_INS_EP1","BRDM2_TK_GUE_EP1","BTR40_TK_GUE_EP1","BTR60_TK_EP1","M113_TK_EP1","BMP2_INS","UAZ_MG_INS","pook_brdm2AGS_TKINS","pook_brdm2RKT_TKINS","pook_brdm2PKM_TAK","pook_brdm2HQ_TKINS","pook_brdm2DSHK_TAK","pook_brdm2M_TAK","pook_brdm2_TAK"];

EGG_EVO_eastveh15 = ["UralOpen_INS","Ural_INS","Kamaz","KamazOpen"];

//civ 1 seater
//EGG_EVO_civveh1 = ["tractor","MMT_Civ","TT650_Civ"];
EGG_EVO_civveh1 = ["TT650_TK_CIV_EP1","Old_bike_TK_CIV_EP1","Old_moto_TK_Civ_EP1"];
//civ multi seater
//EGG_EVO_civveh2 = ["Skoda","SkodaBlue","SkodaRed","SkodaGreen","datsun1_civil_1_open","datsun1_civil_2_covered","datsun1_civil_3_open","hilux1_civil_1_open","hilux1_civil_2_covered","hilux1_civil_3_open","car_hatchback","Lada1","car_sedan","Lada2","LadaLM","car_hatchback","VWGolf"];
EGG_EVO_civveh2 = ["Lada1_TK_CIV_EP1","Lada2_TK_CIV_EP1","LandRover_TK_CIV_EP1","hilux1_civil_3_open_EP1","S1203_TK_CIV_EP1","SUV_TK_CIV_EP1","UAZ_Unarmed_TK_CIV_EP1","Volha_1_TK_CIV_EP1","Volha_2_TK_CIV_EP1","VolhaLimo_TK_CIV_EP1","S1203_ambulance_EP1"];
//EGG_EVO_civveh3 = ["Ikarus","UralCivil2","UralCivil","V3S_Civ"];
EGG_EVO_civveh3 = ["Ikarus_TK_CIV_EP1","Ural_TK_CIV_EP1","V3S_Open_TK_CIV_EP1"];
EGG_EVO_civall = EGG_EVO_civveh1+EGG_EVO_civveh2+EGG_EVO_civveh3;

//moved hybrid arrays

//adding soldier class types for data/scripts/spawn.sqf

//officer classes
EGG_EVO_playerOff = ["uns_men_US_Arty_XO","uns_men_US_Arty_AXO","uns_men_CIDG_COM","uns_men_CIDG_PL","uns_men_US_1AC_COM","uns_men_US_1AC_PL","uns_US_25ID_COM","uns_US_25ID_PL","uns_US_1ID_COM","uns_US_1ID_PL","uns_men_USMC_65_COM","uns_men_USMC_65_PL","uns_men_USMC_68_COM","uns_men_USMC_68_PL","uns_men_US_3FRC_COM","uns_men_US_3FRC_PL","uns_men_US_5SFG_COM","uns_men_US_5SFG_PL","uns_men_US_6SFG_COM","uns_men_US_6SFG_PL","UN_CDF_Soldier_Officer_EP1","BAF_Soldier_Officer_W","BAF_Soldier_Officer_DDPM","CZ_Soldier_Office_DES_EP1","CZ_Soldier_SL_DES_EP1","CZ_Soldier_Officer_Wdl_ACR","CZ_Soldier_Leader_Wdl_ACR","CZ_Special_Forces_TL_DES_EP1","CZ_Soldier_Spec1_Wdl_ACR","US_Soldier_Officer_EP1","Soldier_TL_PMC","GER_Soldier_TL_EP1","CDF_Commander","CDF_Soldier_TL","USMC_Soldier_Officer","FR_Commander","FR_TL","USMC_Soldier_TL","USMC_Soldier_SL","RU_Soldier_Officer","RU_Commander","RUS_Commander","RUS_Soldier_TL","Ins_Commander","Ins_Soldier_CO","Ins_Bardak","Ins_Lopotev","MVD_Soldier_TL","mas_gru_spet_tl_gd","mas_gru_spet_tl_ge","mas_gru_spet_tl_kb","mas_gru_spet_tl_iz","UK_SFMSKD1","AFR_Officer","AFR_Soldier_Officer","MOL_officer","MOL_Soldier_Officer","BAF_Soldier_Officer_MTP","TK_Soldier_Officer_EP1","TK_Aziz_EP1","TK_Commander_EP1","TK_INS_Warlord_EP1","TK_Special_Forces_TL_EP1","TK_INS_Soldier_TL_EP1","uns_nva1","uns_nva1a","uns_nva1b","uns_nva1c","uns_nva9b","uns_nva9c","uns_rf_vc1","uns_rf_vc9a","uns_mf_vc1a","uns_mf_vc1b","uns_mf_vc2a","uns_mf_vc9a","uns_guerrilla1","uns_usmc_1a","uns_usmc_1b","uns_usmc_1c","uns_usmc_1d","uns_usmc_1e","uns_usmc_1f","uns_army_1a","uns_army_1aa","uns_army_2a","uns_army_2aa","uns_army_3a","uns_army_3aa","uns_lrrp_1a","uns_lrrp_1aa","uns_lrrp_2a","uns_lrrp_2aa","uns_sf_1a","uns_sf_1aa","uns_sf_2a","uns_sf_2aa","s_tigerian1","s_tigerian2"]; 

//medic classes
EGG_EVO_playerMedic = ["uns_men_CIDG_MED","uns_men_US_1AC_MED","uns_US_25ID_MED","uns_US_1ID_MED","uns_men_USMC_65_MED","uns_men_USMC_68_MED","uns_men_US_3FRC_MED","uns_men_US_5SFG_MED","uns_men_US_6SFG_MED","BAF_Soldier_Medic_W","BAF_Soldier_Medic_DDPM","US_Delta_Force_Medic_EP1","CZ_Soldier_medik_DES_EP1","CZ_Soldier_Medic_Wdl_ACR","US_Soldier_Medic_EP1","Soldier_Medic_PMC","GER_Soldier_Medic_EP1","CDF_Soldier_Medic","USMC_Soldier_Medic","FR_Corpsman","FR_Sykes","RU_Soldier_Medic","Ins_Soldier_Medic","mas_gru_spet_med2_ge","mas_gru_spet_med_iz","mas_gru_spet_med2_gd","UK_SFMSKD4","UK_SFT4","AFR_Medic","AFR_Soldier_Medic","MOL_Medic","MOL_Soldier_Medic","BAF_Soldier_Medic_MTP","TK_Soldier_Medic_EP1","uns_nva2med","uns_nva11a","uns_nva11b","uns_rf_vc2a","uns_rf_vc11a","uns_mf_vc11a","uns_usmc_2amed","uns_usmc_2bmed","uns_usmc_2cmed","uns_usmc_2dmed","uns_army_2amed","uns_army_2bmed","uns_lrrp_2amed","uns_lrrp_2aamed","uns_lrrp_2abmed","uns_lrrp_2acmed","uns_lrrp_2admed","uns_lrrp_2aemed","uns_sf_2amed","fsp_tigerian4","s_tigerian9"];

//engineer classes
EGG_EVO_playerEng = ["uns_men_CIDG_DEM","uns_men_CIDG_SAP","uns_men_CIDG_ENG","uns_men_US_1AC_DEM","uns_men_US_1AC_SAP","uns_men_US_1AC_ENG","uns_US_1ID_ENG","uns_US_1ID_DEM","uns_US_1ID_SAP","uns_US_25ID_ENG","uns_US_25ID_SAP","uns_US_25ID_DEM","uns_men_USMC_65_DEM","uns_men_USMC_65_ENG","uns_men_USMC_65_SAP","uns_men_USMC_68_ENG","uns_men_USMC_68_DEM","uns_men_USMC_68_SAP","uns_men_US_3FRC_DEM","uns_men_US_3FRC_SAP","uns_men_US_3FRC_ENG","uns_men_US_5SFG_DEM","uns_men_US_5SFG_SAP","uns_men_US_5SFG_ENG","uns_men_US_6SFG_DEM","uns_men_US_6SFG_SAP","uns_men_US_6SFG_ENG","UN_CDF_Soldier_B_EP1","BAF_Soldier_EN_W","BAF_Soldier_EN_DDPM","CZ_Soldier_Engineer_Dst_ACR","CZ_Soldier_Engineer_Wdl_ACR","CZ_Soldier_Spec_Demo_Dst_ACR","CZ_Soldier_Spec_Demo_Wdl_ACR","US_Soldier_Engineer_EP1","Soldier_Engineer_PMC","USMC_SoldierS_Engineer","FR_Sapper","Ins_Soldier_Sapper","Ins_Soldier_Sab","RUS_Soldier_Sab","mas_gru_spet_min_gd","mas_gru_spet_dem_iz","mas_gru_spet_min_ge","mas_gru_spet_dem_ge","UK_SFMSKD6","UK_SFT6","AFR_Guard_M1014","AFR_Soldier_Engineer","MOL_Soldier_Engineer","BAF_Soldier_EN_MTP","uns_nva6sap","uns_nva6asap","uns_nva6bsap","uns_nva12a","uns_nva12b","uns_nva12c","uns_nva12d","uns_rf_vc6asap","uns_rf_vc6bsap","uns_mf_vc6asap","uns_mf_vc6bsap","uns_usmc_8ac","uns_usmc_8bc","uns_army_7arto","uns_army_7brto","uns_sf_11a","uns_sf_11b","uns_sf_11c","uns_cidg_9a","uns_cidg_10a","fsp_tigerian3","s_tigerian8"];

//sniper classes
EGG_EVO_playerSniper = ["uns_men_CIDG_SCT","uns_men_CIDG_MRK","uns_men_US_1AC_SCT","uns_men_US_1AC_MRK","uns_US_1ID_SCT","uns_US_1ID_MRK","uns_US_25ID_SCT","uns_US_25ID_MRK","uns_men_USMC_65_SCT","uns_men_USMC_65_MRK","uns_men_USMC_68_SCT","uns_men_USMC_68_MRK","uns_men_US_3FRC_SCT","uns_men_US_3FRC_MRK","uns_men_US_5SFG_SCT","uns_men_US_5SFG_MRK","uns_men_US_6SFG_SCT","uns_men_US_6SFG_MRK","BAF_Soldier_SniperH_W","BAF_Soldier_scout_W","US_Delta_Force_Marksman_EP1","BAF_Soldier_scout_DDPM","CZ_Sharpshooter_DES_ACR","CZ_Soldier_Sniper_EP1","CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_Sniper_ACR","CZ_Special_Forces_Scout_DES_EP1","CZ_Soldier_Spec2_Wdl_ACR","US_Soldier_SniperH_EP1","Soldier_Sniper_KSVK_PMC","Soldier_Sniper_PMC","GER_Soldier_Scout_EP1","CDF_Soldier_Marksman","USMC_SoldierS_SniperH","USMC_SoldierS_Sniper","USMC_SoldierM_Marksman","FR_Marksman","RU_Soldier_Sniper","RU_Soldier_SniperH","RU_Soldier_Marksman","Ins_Soldier_Sniper","MVD_Soldier_Sniper","MVD_Soldier_Marksman","RUS_Soldier_Marksman","mas_gru_spet_snp_ghil_kb","mas_gru_spet_snp_ghil_gd","mas_gru_spet_snp_iz","UK_SFMSKD5","UK_SFMSKT5","AFR_Guard_M16","AFR_Soldier_Sniper","AFR_Guard_Marksman","MOL_Guard_Marksman","MOL_Soldier_Sniper","BAF_Soldier_scout_MTP","BAF_Soldier_Marksman_MTP","BAF_Soldier_SniperN_MTP","BAF_Soldier_SniperH_MTP","BAF_Soldier_Sniper_MTP","TK_Soldier_Sniper_EP1","TK_INS_Soldier_Sniper_EP1","BAF_Soldier_Marksman_DDPM","uns_nva5sni","uns_local_vc1e","uns_local_vc2c","uns_rf_vc5asni","uns_rf_vc5bsni","uns_mf_vc5asni","uns_usmc_7arto","uns_usmc_7brto","uns_sf_7arto","uns_sf_7aarto","uns_cidg_11a","fsp_tigerian5","s_tigerian7"];
//BAF_Soldier_Marksman_DDPM

//spotter classes
EGG_EVO_playerSpot = ["uns_men_CIDG_RTO","uns_men_US_1AC_RTO","uns_US_25ID_RTO","uns_US_1ID_RTO","uns_men_USMC_65_RTO","uns_men_USMC_68_RTO","uns_men_US_3FRC_RTO","uns_men_US_5SFG_RTO","uns_men_US_6SFG_RTO","CZ_Soldier_DES_EP1","CZ_Soldier_B_DES_EP1","CZ_Soldier805_DES_ACR","CZ_Soldier_Wdl_ACR","CZ_Soldier_805_Wdl_ACR","CZ_Special_Forces_DES_EP1","USMC_SoldierS_Spotter","mas_gru_spet_spt_ghil_iz","AFR_Guard_M9","AFR_Soldier_Spotter","MOL_Soldier_Spotter","BAF_Soldier_spotter_MTP","BAF_Soldier_spotterN_MTP"];

//grenadier classes
EGG_EVO_playerGL = ["uns_men_CIDG_GL","uns_men_US_1AC_GL","uns_men_US_1AC_GL2","uns_men_US_1AC_MTSG","uns_US_1ID_GL","uns_US_1ID_MTSG","uns_US_25ID_MTSG","uns_US_25ID_GL","uns_men_USMC_65_MTSG","uns_men_USMC_65_GL","uns_men_USMC_68_MTSG","uns_men_USMC_68_GL","uns_men_US_3FRC_MTSG","uns_men_US_3FRC_GL","uns_men_US_5SFG_MTSG","uns_men_US_5SFG_Mk18","uns_men_US_5SFG_GL","uns_men_US_5SFG_GL2","uns_men_US_6SFG_MTSG","uns_men_US_6SFG_Mk18","uns_men_US_6SFG_GL","uns_men_US_6SFG_GL2","UN_CDF_Soldier_EP1","BAF_Soldier_GL_W","US_Delta_Force_Assault_EP1","BAF_Soldier_GL_DDPM","CZ_Soldier_805g_Dst_ACR","CZ_Soldier_805g_Wdl_ACR","CZ_Special_Forces_GL_DES_EP1","US_Soldier_GL_EP1","Soldier_GL_M16A2_PMC","Soldier_GL_PMC","GER_Soldier_EP1","CDF_Soldier_GL","USMC_Soldier_GL","FR_Assault_GL","FR_GL","FR_AC","FR_Cooper","RU_Soldier_GL","Ins_Soldier_GL","RUS_Soldier_GL","MVD_Soldier_GL","mas_gru_spet_op1_gd","mas_gru_spet_op1_kb","UK_SFD1","AFR_Guard_M16","AFR_Soldier_GL","MOL_Soldier_GL","BAF_Soldier_GL_MTP","TK_Soldier_GL_EP1","uns_usmc_6agren","uns_army_6agren","uns_lrrp_6agren","uns_cidg_8d","uns_cidg_10d","uns_cidg_11c","fsp_tigerian2","s_tigerian4"];

//Anti air classes
EGG_EVO_playerAA = ["uns_US_1ID_MGAASG","uns_US_25ID_MGAASG","uns_men_USMC_65_MGAASG","uns_men_USMC_68_MGAASG","Soldier_Bodyguard_AA12_PMC","BAF_Soldier_AAA_W","BAF_Soldier_AA_W","BAF_Soldier_AAA_DDPM","BAF_Soldier_AA_DDPM","CZ_Soldier_Spotter_ACR","CZ_Soldier_Recon_Wdl_ACR","US_Soldier_AA_EP1","Soldier_AA_PMC","USMC_Soldier_AA","RU_Soldier_AA","Ins_Soldier_AA","UK_SFD3","UK_SFT5","AFR_Soldier_Stinger","AFR_Soldier_Igla","AFR_Guard_AA","MOL_Soldeir_AA","BAF_Soldier_AA_MTP","BAF_Soldier_AAA_MTP","TK_Soldier_AA_EP1","s_tigerian11"];

//anti tank classes
EGG_EVO_playerAT = ["uns_men_CIDG_AT","uns_men_US_1AC_AT","uns_US_1ID_AT","uns_US_25ID_AT","uns_men_USMC_65_AT","uns_men_USMC_68_AT","uns_men_US_3FRC_AT","uns_men_US_5SFG_AT","uns_men_US_6SFG_AT","UN_CDF_Soldier_AAT_EP1","UN_CDF_Soldier_AT_EP1","BAF_Soldier_HAT_W","BAF_Soldier_AT_W","BAF_Soldier_AAT_DDPM","BAF_Soldier_HAT_DDPM","CZ_Soldier_RPG_Ass_Dst_ACR","CZ_Soldier_AT_DES_EP1","CZ_Soldier_RPG_Dst_ACR","CZ_Soldier_RPG_Ass_Wdl_ACR","CZ_Soldier_AT_Wdl_ACR","CZ_Soldier_RPG_Wdl_ACR","US_Soldier_AT_EP1","US_Soldier_HAT_EP1","Soldier_AT_PMC","CDF_Soldier_RPG","USMC_Soldier_AT","USMC_Soldier_LAT","USMC_Soldier_HAT","RU_Soldier_HAT","RU_Soldier_AT","RU_Soldier_LAT","Ins_Soldier_AT","MVD_Soldier_AT","mas_gru_spet_op2_ge","mas_gru_spet_op2_iz","UK_SFMSKD3","UK_SFT3","AFR_Soldier_AT","AFR_Soldier_LAT","AFR_Soldier_HAT","MOL_Soldier_AT","MOL_Soldier_LAT","MOL_Soldier_HAT","BAF_Soldier_AAT_MTP","BAF_Soldier_AHAT_MTP","BAF_Soldier_AT_MTP","BAF_Soldier_HAT_MTP","TK_Soldier_HAT_EP1","TK_Soldier_AT_EP1","TK_INS_Soldier_AT_EP1","uns_nva4rpg","uns_nva4arpg","uns_rf_vc4a","uns_rf_vc4b","uns_mf_vc4a","uns_mf_vc4b","uns_usmc_8b","uns_usmc_8bb","uns_usmc_8f","uns_usmc_8fb","uns_usmc_8g","uns_usmc_8gb","uns_army_8a","uns_army_8ba","uns_army_8bb","uns_army_8bd","uns_army_8c","uns_army_8cc","uns_army_8da","uns_army_8db","uns_army_8dd","uns_lrrp_8a","uns_lrrp_8b","uns_lrrp_8c","uns_lrrp_8d","uns_lrrp_8e","uns_lrrp_8f","uns_lrrp_8g","uns_lrrp_8h","uns_lrrp_8i","uns_lrrp_8j","uns_lrrp_9a","uns_lrrp_9b","uns_lrrp_9c","uns_lrrp_9d","uns_lrrp_9e","uns_lrrp_9f","uns_lrrp_9g","uns_lrrp_9h","uns_lrrp_9i","uns_lrrp_9j","uns_sf_8a","uns_sf_8b","uns_sf_8c","uns_sf_9a","uns_sf_9b","uns_sf_9c","uns_sf_10a","uns_sf_10b","uns_sf_10c","s_tigerian10"];

//machinegunner classes
EGG_EVO_playerMG = ["uns_men_CIDG_HMG","uns_men_US_1AC_HMG","uns_men_US_1AC_AHMG","uns_men_US_1AC_MGSG","uns_US_1ID_HMG","uns_US_1ID_AHMG","uns_US_1ID_MGSG","uns_US_25ID_HMG","uns_US_25ID_AHMG","uns_US_25ID_MGSG","uns_men_USMC_65_HMG","uns_men_USMC_65_AHMG","uns_men_USMC_65_MGSG","uns_men_USMC_68_HMG","uns_men_USMC_68_AHMG","uns_men_USMC_68_MGSG","uns_men_US_3FRC_HMG","uns_men_US_3FRC_AHMG","uns_men_US_3FRC_MGSG","uns_men_US_5SFG_HMG","uns_men_US_5SFG_AHMG","uns_men_US_5SFG_MGSG","uns_men_US_6SFG_HMG","uns_men_US_6SFG_AHMG","uns_men_US_6SFG_MGSG","UN_CDF_Soldier_AMG_EP1","UN_CDF_Soldier_MG_EP1","BAF_Soldier_AR_W","BAF_Soldier_MG_W","US_Delta_Force_MG_EP1","BAF_Soldier_MG_DDPM","CZ_Soldier_AMG_DES_EP1","CZ_Soldier_MG2_Dst_ACR","CZ_Soldier_MG_DES_EP1","CZ_Soldier_MG2_Wdl_ACR","CZ_Soldier_MG_Wdl_ACR","CZ_Special_Forces_MG_DES_EP1","CZ_Soldier_Spec3_Wdl_ACR","US_Soldier_MG_EP1","Soldier_MG_PKM_PMC","Soldier_MG_PMC","GER_Soldier_MG_EP1","CDF_Soldier_AR","CDF_Soldier_MG","USMC_Soldier_MG","USMC_Soldier_AR","FR_AR","FR_Rodriguez","RU_Soldier_MG","RU_Soldier_AR","Ins_Soldier_AR","Ins_Soldier_MG","MVD_Soldier_MG","mas_gru_spet_mg_kb","mas_gru_spet_rpk_gd","UK_SFMSKD2","UK_SFT2","AFR_Soldier_MG","AFR_Guard_AR","MOL_Soldier_MG","MOL_Guard_AR","BAF_Soldier_AAR_MTP","BAF_Soldier_AMG_MTP","BAF_Soldier_AR_MTP","BAF_Soldier_MG_MTP","TK_Soldier_MG_EP1","TK_Soldier_AMG_EP1","TK_INS_Soldier_MG_EP1","TK_Special_Forces_MG_EP1","uns_nva3mg","uns_nva3amg","uns_nva10a","uns_nva10b","uns_rf_vc3a","uns_rf_vc3b","uns_rf_vc10a","uns_mf_vc3a","uns_mf_vc3b","uns_mf_vc10a","uns_mf_vc10b","uns_usmc_3amg","uns_usmc_3bmg","uns_army_3amg","uns_army_3bmg","uns_army_3cmg","uns_lrrp_3amg","uns_sf_3amg","uns_sf_3bmg","uns_sf_3cmg","s_tigerian5","s_tigerian6"];

//pilot classes
EGG_EVO_playerPilot = ["uns_pil1","uns_pil2","uns_pilN1","uns_pilN2","uns_pilot1","uns_pilot2","uns_pilot3","uns_pilot4","uns_pilot5","uns_pilot6","UN_CDF_Soldier_Pilot_EP1","BAF_Pilot_W","BAF_Pilot_DDPM","CZ_Soldier_Pilot_EP1","CZ_Soldier_Pilot_Wdl_ACR","US_Soldier_Pilot_EP1","US_Pilot_Light_EP1","Soldier_Pilot_PMC","USMC_Soldier_Pilot","RU_Soldier_Pilot","Ins_Soldier_Pilot","AFR_Soldier_Pilot","MOL_Soldier_Pilot","BAF_Pilot_MTP","TK_Soldier_Pilot_EP1","s_tigerian13"];

//crew classes
EGG_EVO_playerCrew = ["CZ_Soldier_Crew_Dst_ACR","CZ_Soldier_Crew_Wdl_ACR","Soldier_Crew_PMC","USMC_Soldier_Crew","CDF_Soldier_Crew","USMC_LHD_Crew_White","USMC_LHD_Crew_Blue","USMC_LHD_Crew_Brown","USMC_LHD_Crew_Green","USMC_LHD_Crew_Red","USMC_LHD_Crew_Purple","USMC_LHD_Crew_Yellow","RU_Soldier_Crew","GUE_Soldier_Crew","Ins_Soldier_Crew","MOL_Soldier_Crew","AFR_Soldier_Crew","TK_Soldier_Crew_EP1","s_tigerian12"];

//adding default troops and vehicles for missions

EGG_EVO_spytype = ["B_Soldier_lite_F","O_Soldier_lite_F","C_man_1_1_F","TK_CIV_Takistani04_EP1","CIV_EuroMan01_EP1","CIV_EuroMan02_EP1","Dr_Hladik_EP1","Dr_Annie_Baker_EP1","TK_INS_Bonesetter_EP1","TK_CIV_Woman02_EP1","TK_CIV_Woman01_EP1","TK_GUE_Soldier_5_EP1","TK_INS_Soldier_AT_EP1","TK_Special_Forces_MG_EP1","Villager1","rocker4","ibr_africaman1","ibr_africaman2","ibr_lingorman1","ibr_lingorman2","uns_civilian3","uns_civilian1"];

EGG_EVO_mdoctor = ["Doctor","Dr_Hladik_EP1","Dr_Annie_Baker_EP1"];
EGG_EVO_mfpilot = ["BAF_Pilot_MTP"];
EGG_EVO_magent = ["CIV_EuroWoman01_EP1","CIV_EuroWoman02_EP1","Rita_Ensler_EP1"];

EGG_EVO_mfteam = EGG_EVO_west4;

EGG_EVO_mepilot = ["TK_Soldier_Pilot_EP1"];
EGG_EVO_meofficer = ["BAF_Soldier_Officer_MTP"];
EGG_EVO_mecrew = ["TK_Soldier_Crew_EP1"];
EGG_EVO_meguard = ["TK_Aziz_EP1","TK_Commander_EP1","TK_Soldier_MG_EP1","TK_Soldier_HAT_EP1"];
EGG_EVO_meguardb = ["TK_Soldier_AMG_EP1","TK_Soldier_Sniper_EP1","TK_Special_Forces_TL_EP1"];
EGG_EVO_meguardc = ["TK_Soldier_MG_EP1","TK_Soldier_HAT_EP1","TK_Soldier_Sniper_EP1","TK_Soldier_Medic_EP1","TK_Soldier_GL_EP1","TK_Soldier_B_EP1","TK_Soldier_AA_EP1"];
EGG_EVO_meguardd = ["TK_Soldier_EP1","TK_Soldier_HAT_EP1","TK_Soldier_Sniper_EP1","TK_Soldier_Medic_EP1","TK_Soldier_GL_EP1","TK_Soldier_AT_EP1","TK_Soldier_AA_EP1"];
EGG_EVO_meguarde = ["TK_INS_Soldier_TL_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_EP1","TK_INS_Soldier_2_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_Sniper_EP1"];
//["Ins_Villager3","Ins_Woodlander3","Ins_Woodlander2","Ins_Worker2","Ins_Villager4","Ins_Woodlander1"]; //need to make taki
EGG_EVO_meguardf = ["TK_Soldier_AR_EP1","TK_Soldier_Sniper_EP1","TK_Special_Forces_TL_EP1"];
EGG_EVO_meguardg = ["TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1","TK_Special_Forces_TL_EP1","TK_Soldier_GL_EP1","TK_Soldier_AT_EP1","TK_Soldier_Sniper_EP1"];

EGG_EVO_mfvlight = EGG_EVO_westveh5;
//["BAF_ATV_D","BAF_Offroad_D","ATV_US_EP1","MTVR_DES_EP1","MtvrReammo_DES_EP1","MtvrRefuel_DES_EP1","MtvrRepair_DES_EP1","M1133_MEV_EP1","SUV_PMC_BAF","SUV_UN_EP1"];
EGG_EVO_mfvlighta = EGG_EVO_westveh6;
EGG_EVO_mevlight = ["BTR40_MG_TK_INS_EP1","BTR40_TK_INS_EP1","BRDM2_TK_EP1","LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1"];
EGG_EVO_mevlighta =["UAZ_AGS30_TK_EP1","UAZ_MG_TK_EP1","LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1","pook_brdm2AGS_TKINS","pook_brdm2AA_TKINS","pook_brdm2RKT_TKINS","pook_brdm2PKM_TAK","pook_brdm2HQcomm_TAK","pook_brdm2HQ_TKINS","pook_brdm2DSHK_TAK","pook_brdm2AT5_TAK","pook_brdm2AT3c_TKINS","pook_brdm2AT3_TKINS","pook_brdm2AT2_TKINS","pook_brdm2M_TAK","pook_brdm2_TAK","pook_brdm2_sa9_TAK"];
EGG_EVO_mevmed = ["UAZ_AGS30_TK_EP1","BTR60_TK_EP1","Ural_ZU23_TK_EP1","BRDM2_TK_EP1","M113_TK_EP1","BMP2_HQ_TK_EP1"];

EGG_EVO_mevmeda = ["BTR60_TK_EP1","BRDM2_TK_EP1","M113_TK_EP1","BMP2_HQ_TK_EP1"];

EGG_EVO_mevheavya = ["T72_TK_EP1","BMP2_TK_EP1","T55_TK_EP1","T34_TK_EP1"];
//,"vil_bmp1","vil_bmp1p","vil_bmp2d","vil_2s1","vil_t55","vil_t55m_pol","vil_t62m","sa_bmd2_rus4","sa_bmd2_des","sa_bmd2k","sa_bmd2k_rus1","sa_bmd2k_rus2","sa_bmd2k_rus3","sa_bmd2k_rus4","sa_bmdk_des"

EGG_EVO_mevheavyb = ["M113_TK_EP1","T72_TK_EP1","ZSU_TK_EP1","Mi24_D_TK_EP1","MAZ_543_SCUD_TK_EP1"];
//,"vil_t64","vil_t64bv","vil_t72M_nsv","vil_t80b","vil_t80bv_c2","vil_t80U_C","vil_t90_1"
EGG_EVO_mevconvoya = ["UralRefuel_TK_EP1","UralRepair_TK_EP1","UralReammo_TK_EP1"];

//Reinfocing infatry vehicles
EGG_EVO_mevconvoyb = ["V3S_TK_EP1","V3S_Open_TK_EP1"];

EGG_EVO_mevaira = ["Mi24_D_TK_EP1","Mi17_TK_EP1","UH1H_TK_EP1","Ka52","UH1H_TK_EP1"];
//,"ibr_gazelle_armed","CMA_Mi28_N_RUS"
EGG_EVO_mevairb = ["L39_TK_EP1","Su25_TK_EP1"];
//,"ibrPRACS_MiG21_AGmol","ibrPRACS_MiG21mol","mig15bis_4_tak","mig15bis_fighterBomber_tak","mig15bis_5_tak"

//Reinforce paradrop vehicles
EGG_EVO_mevair3 = ["An2_TK_EP1","Mi17_TK_EP1","Mi24_D_TK_EP1","UH1H_TK_EP1"];

EGG_EVO_mcvconvoya = ["Ikarus_TK_CIV_EP1","Ural_TK_CIV_EP1","V3S_Open_TK_CIV_EP1"];
EGG_EVO_mcvconvoyb = ["Lada1_TK_CIV_EP1","Lada2_TK_CIV_EP1","LandRover_TK_CIV_EP1","hilux1_civil_3_open_EP1","S1203_TK_CIV_EP1","SUV_TK_CIV_EP1","UAZ_Unarmed_TK_CIV_EP1"];
EGG_EVO_mcvconvoyc =["TT650_TK_CIV_EP1","Old_bike_TK_CIV_EP1","Old_moto_TK_Civ_EP1"];
EGG_EVO_mcvconvoyd = ["Volha_1_TK_CIV_EP1","Volha_2_TK_CIV_EP1","VolhaLimo_TK_CIV_EP1","S1203_ambulance_EP1"];


EGG_EVO_mehq = ["BMP2_HQ_TK_unfolded_EP1"];
EGG_EVO_meflag = ["FlagCarrierTK_EP1"];
EGG_EVO_mfhq =["USMC_WarfareBFieldhHospital","CDF_WarfareBFieldhHospital","USMC_WarfareBAircraftFactory","LAV25_HQ_unfolded","CDF_WarfareBBarracks"];// meeds taki

//adding weapon type arrays for actions/makestatic.sqf
// All weapons that count for AA class static bonus
EGG_EVO_AAirweapons = ["Stinger","Strela","Igla","uns_sa7","uns_sa7_loaded"];

// All weapons that count for AT class static bonus
EGG_EVO_ATweapons = ["Javelin","MetisLauncher","RPG18","SMAW","M136","RPG7V","FFAA_Armas_C90","FFAA_Armas_C100","ukf_law80launcher","VIL_RPG7V_PGO","VIL_RPG7d_PGO","VIL_RPG16","VILAS_RPG22","VILAS_RPG26","VIL_RPG29","VIL_RPO_A","M47Launcher_EP1","MAAWS","BAF_NLAW_Launcher","uns_m72","uns_rpg2","uns_rpg7"];

// All weapons that count for MG class static bonus
// All weapons that count for MG class static bonus updated RH OA
EGG_EVO_MGweapons = ["M240","M249","PK","RPK_74","Pecheneg","MK_48","m8_SAW","MG36","MG36_camo","m240_scoped_EP1","M249_EP1","M249_m145_EP1","M249_TWS_EP1","M60A4_EP1","Mk_48_DES_EP1","BAF_L7A2_GPMG","BAF_L110A1_Aim","ukf_L86A2LSW_susat","ukf_gpmg","VIL_PKM_N","VIL_PKP","VIL_PK","VIL_RPK74M_N","VIL_RPK74M","VIL_RPK74","VIL_RPK","FFAA_Armas_MG3","FFAA_Armas_MG4","FFAA_Armas_Minimi","FFAA_Armas_MG4_acog","uns_bar","uns_m60","uns_m63a","uns_m60shorty","uns_rpd","uns_rpdsog","uns_rpk","RH_M249","RH_M249acog","RH_M249elcan","RH_M249p","RH_M249pelcan","RH_M249pacog","RH_Mk48mod1","RH_Mk48mod1acog","RH_Mk48mod1elcan","RH_M60E4_EOTECH","RH_MK43_ACOG","RH_MK43_ELCAN","RH_rpk47","RH_rpk74","RH_rpk74m","RH_rpk74m1p29"];

// All weapons that count for GL class static bonus
EGG_EVO_GLweapons = ["M16A2GL","M16A4_GL","M16A4_ACG_GL","M4A1_HWS_GL","M4A1_RCO_GL","M4A1_HWS_GL_camo","M4A1_HWS_GL_SD_Camo","m8_carbineGL","AK_74_GL","AK_107_GL_pso","AK_107_GL_kobra","BAF_L85A2_UGL_ACOG","BAF_L85A2_UGL_Holo","BAF_L85A2_UGL_SUSAT","AK_74_GL_kobra","M4A3_RCO_GL_EP1","Mk13_EP1","M32_EP1","M79_EP1","SCAR_L_CQC_EGLM_Holo","SCAR_L_STD_EGLM_RCO","SCAR_L_STD_EGLM_TWS","SCAR_H_STD_EGLM_Spect","FFAA_Armas_FN_fal_m203","FFAA_Armas_HKAG36","FFAA_Armas_HKAG36Acog","ukf_L85A2AG36_susat","VIL_AEK_GL","VIL_AK_74M_GP","VIL_AKS_74P_GP","VIL_AKS_74_GP","VIL_AKM_GL","VIL_Abakan_GP","VIL_Groza_GL","uns_ex41","uns_m203_20","uns_m203_30","uns_m79","RH_m4cgl","RH_m4glaim","RH_m4cglacog","RH_M4gleotech_wdl","RH_m4cgleotech","RH_m4sdgl","RH_m4ctsdglaim","RH_m4ctsdglacog","RH_M4sdgleotech_wdl","RH_m4ctsdgleotech","RH_m16a1gl","RH_m16a4glacog","RH_m16a4glaim","RH_m16a4gleotech","RH_hk416sgl","RH_hk416glaim","RH_hk416sdgl","RH_hk416sgleotech","RH_hk416sglacog","RH_ak102gl","RH_Scarl_gl","RH_Scarl_gl_aim","RH_Scarl_gl_acog","RH_Scarl_gl_eotech","RH_Scarl_sd_gl_aim","RH_Scarl_sd_gl_acog","RH_Scarl_sd_gl_eotech","RH_Scarh_gl","RH_Scarh_gl_aim","RH_Scarh_gl_acog","RH_Scarh_gl_eotech","RH_Scarh_sd_gl_aim","RH_Scarh_sd_gl_eotech","RH_ak47gl","RH_akmgl","RH_rk95ag","RH_rk95sdag","RH_an94gl","RH_aks74upt","RH_aks74uptsp","RH_aks74uptk","RH_ak74gl","RH_ak74kgl","RH_aks74gl","RH_aks74kgl","RH_oc14gl","RH_oc14glsp","RH_ak74mgl","RH_ak74mkgl","RH_ak74mglsp","RH_ak74mgl1p29","RH_aks74mgl","RH_aks74mkgl","RH_aks74mglsp","RH_aks74mgl1p29","RH_ak103gl","RH_ak103kgl","RH_ak103glsp","RH_ak103gl1p29","RH_aks74pgl","RH_aks74pkgl","RH_aks74pglsp","RH_aks74pgl1p29","RH_ak104gl","RH_ak104kgl","RH_ak104glsp","RH_ak104gl1p29","RH_ak105gl","RH_ak105kgl","RH_ak105glsp","RH_ak105gl1p29","RH_ak107gl","RH_ak107kgl","RH_ak107glsp","RH_ak107gl1p29","RH_hk417sgl","RH_hk417sglaim","RH_hk417sglacog","RH_hk417sgleotech","RH_acrgl","RH_acrglacog","RH_acrglaim","RH_acrgleotech","RH_mp5a5eodRFX","RH_M4CTSDGLACOG_F","RH_M4CTSDGL_F","RH_XM8DGL","RH_SCARH_GL_SPECTERDR","RH_SCARLB_SD_GL_AIM","RH_SCARLB_GL_ACOG","RH_Mk18glaeot","RH_mk18dcglacog","RH_m4gl","RH_m4sdglaim","RH_m4sdglacog","RH_m16a2gl","RH_m16a3sgl"];

//All weapons that class as a tripwire or trap (requires uns_traps)
EGG_EVO_Trapweapons = ["uns_Tripwire1a","uns_Tripwire1a_2","uns_Tripwire1b","uns_Tripwire1b_2","uns_Tripwire2a","uns_Tripwire2a_2","uns_Tripwire2b","uns_Tripwire2b_2","uns_m16apmine","uns_Punji1","uns_Punji1_b","uns_Punji2","uns_Punji2_b","uns_punji3","uns_artilleryround1a","uns_artilleryround1b","uns_artilleryround1c","uns_TripwireM49","uns_TripwireM49_2"];

//all missiles
EGG_EVO_miscamwepsM = ["M_Sidewinder_AA","M_Sidewinder_AA_F35","M_Strela_AA","M_Igla_AA","M_Stinger_AA","M_AT2_AT","M_AT6_AT","M_AT9_AT","M_AT5_AT","M_AT10_AT","M_AT11_AT","M_AT13_AT","M_TOW_AT","M_TOW2_AT","M_Hellfire_AT","M_Maverick_AT","M_Vikhr_AT","M_Ch29_AT","M_R73_AA","M_9M311_AA","GLT_AIM9M_AA","GLT_AIM9X_AA","GLT_AIM120_AA","GLT_AIM7_AA","GLT_AIM54_AA","GLT_R3_AA","GLT_R27_AA","GLT_R73_AA","GLT_R77_AA","GLT_R550_AA","IkaR_F14_AIM9_ir","IkaR_F14_AIM54_ir","RKTF15_AIM9","RKTF15_AIM120","ffaa_Mistral_AA","GLT_Sidewinder_AA","GLT_SidewinderX_AA","GLT_AIM7E_AA","GLT_Maverick_AG","GLT_Harpoon_LGM","GLT_AGM65_AG","GLT_AGM84_AG","GLT_AGM88_AG","GLT_AGM114_AG","GLT_CH15_AG","GLT_CH29L_AG","GLT_CH29T_AG","GLT_CH59_AG","GLT_CH31_AG","GLT_AM39_AG","GLT_AS4_AG","IkaR_F14_AGM65_ir","ffaa_spike_AT","RKTF4HarmRaila","RKTF4SparrowRaila","RKT_Kitchen","RKT_Ch29_AT","RKT_R27_AA","RKT_R73_AA","RKSL_LYNX_TOW_AT","M_AT9_Mi28","RKSL_brimstone_rack","RKSL_harpoon","rksl_agm119mk3","rksl_aim9m","rksl_aim132","rksl_irist","rksl_aim120","rksl_meteor","RKSL_stormshadow","RKSL_ALARM"];

//all airborne bombs
EGG_EVO_miscamwepsB = ["Bo_GBU12_LGB","Bo_GBU12_LGB_F35","Bo_FAB_250","RKTF4BLUBomb","RKTF4BombRaila","Bo_kb500_LGB","Bo_fb250_FFB","RKSL_PAVE2_500","RKSL_PAVE4_500","RKSL_PAVE2_1000","RKSL_GP_500","RKSL_GP_500RET","RKSL_GP_1000","RKSL_GP_1000RET","GLT_FAB250_Bo","GLT_FAB500_Bo","GLT_MK81_Bo","GLT_MK82_Bo","GLT_MK82_Bo","GLT_MK84_Bo","GLT_AGM154_LGB","GLT_GBU12_LGB","GLT_GBU53_LGB","GLT_KAB250_LGB","GLT_KAB500_LGB","GLT_KAB1500_LGB","IkaR_F14_GBU12_ir","RKTF15E_GBU10Bomb","RKTF15E_mk82Bomb","RKTF15E_cbuBomb","RKTF15E_mk84Bomb"];

//all laser guided weapons
EGG_EVO_LaserLauncher = ["BombLauncher","BombLauncherF35","BombLauncherA10","HellfireLauncher","GLT_GBU12_Launcher","GLT_AGM154_Launcher","GLT_GBU53_Launcher","GLT_FFARLauncher_laser","GLT_Ch29LauncherLaser"];

BIS_EVO_aaweapons = ["M_Vikhr_AT","M_9M311_AA","M_R73_AA","M_Strela_AA","M_Igla_AA","M_Stinger_AA","M_Sidewinder_AA","M_Sidewinder_AA_F35","GLT_Sidewinder_AA","GLT_SidewinderX_AA","GLT_AIM120_AA","GLT_AIM7E_AA","GLT_AIM9M_AA","GLT_AIM9X_AA","GLT_AIM7_AA","GLT_AIM54_AA","GLT_R3_AA","GLT_R27_AA","GLT_R73_AA","GLT_R77_AA","GLT_R550_AA","IkaR_F14_AIM9_ir","IkaR_F14_AIM54_ir","RKTF15_AIM9","RKTF15_AIM120","ffaa_Mistral_AA"]; // All ammo that will set off a missile warning

//BIS_EVO_pallammo = ["pipebomb","Laserbatteries","HandGrenade_West","HandGrenade_West","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","7rnd_45ACP_1911","7rnd_45ACP_1911","7rnd_45ACP_1911","7rnd_45ACP_1911"];
// The players default load out
//BIS_EVO_pweapons = ["BAF_L85A2_RIS_SUSAT","Colt1911","Laserdesignator","NVGoggles"]; 
// The players default load out
BIS_EVO_PlayerModel = "BAF_Soldier_W"; 
	BIS_EVO_pallammo = ["pipebomb","LWS_Laserbatteries","HandGrenade_West","HandGrenade_West","30Rnd_556x45_G36SD","30Rnd_556x45_G36SD"];
	BIS_EVO_pweapons = ["DM_CAMO_M4_CCO_IR_FG","Laserdesignator","EB_S10","EB_ItemSil_hgun","EB_ItemSil_rifle","EB_ItemSiphon"];

// The players default Model

if (gitsnades == 1) then 
{
	BIS_EVO_pallammo = ["pipebomb","LWS_Laserbatteries","HandGrenade_West","HandGrenade_West","30Rnd_556x45_G36SD","30Rnd_556x45_G36SD"];
	BIS_EVO_pweapons = ["DM_CAMO_M4_CCO_IR_FG","Laserdesignator","EB_S10","EB_ItemSiphon"];
//	BIS_EVO_pallammo = ["pipebomb","EB_m67gren","EB_m61gren","EB_M118_mag_remote","LWS_Laserbatteries","EB_m34gren","30Rnd_556x45_G36SD","30Rnd_556x45_G36SD","17Rnd_9x19_glock17","17Rnd_9x19_glock17","EB_SmokeShellChem"];
//	BIS_EVO_pweapons = ["M4A3_CCO_EP1","glock17_EP1","Laserdesignator","EB_S10","EB_ItemSil_hgun","EB_ItemSil_rifle","EB_ItemSiphon"];
//EB_resources mod - knife and fuel

	EB_player_fillfuel = 	-1;
	EB_player_siphonfuel = -1;
	EB_player_refuelAction = -1;
	EB_myCursorTarget = objNull;
	EB_myCursorTarget2 = objNull;
	EB_myCursorTarget3 = objNull;
	EB_player_kill = -1;
	EB_player_bkill = -1;
	EB_player_ckill = -1;
//set up bayonet class weapons
	EB_player_foldbayo =-1;
	EB_player_fixbayo =-1;
//set up silenced class weapons
	EB_player_rmvhsil =-1;
	EB_player_fixhsil =-1;
	EB_player_rmvrsil =-1;
	EB_player_fixrsil =-1;

	EGG_rsilweps = [["AKS_74_U","AKS_74_UN_kobra"],["Bizon","bizon_silenced"],["G36C","G36_C_SD_eotech"],["M4A1_Aim_camo","M4A1_AIM_SD_camo"],["M4A1_HWS_GL_camo","M4A1_HWS_GL_SD_Camo"],["MP5A5","MP5SD"],["G36C_camo","G36_C_SD_camo"],["SCAR_H_CQC_CCO","SCAR_H_CQC_CCO_SD"],["SCAR_H_LNG_Sniper","SCAR_H_LNG_Sniper_SD"],["Scar_L_CQC","Scar_L_CQC_CCO_SD"],["m8_carbine","m8_holo_sd"],["m8_tws","m8_tws_sd"],["Evo_ACR","evo_sd_ACR"],["CZ805_A2_ACR","CZ805_A2_SD_ACR"],["RH_bizon","RH_bizonsd"],["R3F_Famas_F1_EOT","R3F_Famas_F1_EOT_HG_SD"],["R3F_Famas_F1_J4_M203","R3F_Famas_F1_J4_M203_SD"],["R3F_Famas_surb_AIM_HG","R3F_Famas_surb_AIM_SD"],["R3F_Famas_surb","R3F_Famas_surb_EOT_SD"],["R3F_HK417S_EOT_HG","R3F_HK417S_HG_SD"],["R3F_FRF2_J8","R3F_FRF2_J8_SD"],["LEN_L119A1_Acog_HG","LEN_L119A1_Acog_CQB_SD_HG"],["LEN_L119A1_EOT_CQB","LEN_L119A1_EOT_CQB_SD"],["LEN_L119A1_EOT_PF","LEN_L119A1_EOT_PF_SD"],["C1987_MP7","C1987_MP7_sd"],["C1987_MP7_eot_t","C1987_MP7_eot_sd_t"],["C1987_MP7_acog","C1987_MP7_acog_sd"],["C1987_MP7_t","C1987_MP7_sd_t"],["C1987_MP7_eot","C1987_MP7_eot_sd"],["C1987_MP7_zp_t","C1987_MP7_zp_sd_t"],["C1987_MP7_acog_t","C1987_MP7_acog_sd_t"],["FHQ_RSASS_TAN","FHQ_RSASS_SD_TAN"],["FHQ_RSASS_TWS_TAN","FHQ_RSASS_TWS_SD_TAN"],["FHQ_XM2010_DESERT","FHQ_XM2010_SD_DESERT"],["FHQ_XM2010_NV_DESERT","FHQ_XM2010_NV_SD_DESERT"],["FHQ_XM2010_TWS_DESERT","FHQ_XM2010_TWS_SD_DESERT"],["FHQ_MSR_DESERT","FHQ_MSR_SD_DESERT"],["FHQ_MSR_NV_DESERT","FHQ_MSR_NV_SD_DESERT"],["FHQ_MSR_TWS_DESERT","FHQ_MSR_TWS_SD_DESERT"],["FHQ_ACR_WDL_IRN_F","FHQ_ACR_WDL_IRN_SD_F"],["FHQ_ACR_WDL_RCO_F","FHQ_ACR_WDL_RCO_SD_F"],["FHQ_ACR_WDL_HWS_F","FHQ_ACR_WDL_HWS_SD_F"],["FHQ_ACR_WDL_G33_F","FHQ_ACR_WDL_G33_SD_F"],["FHQ_ACR_WDL_HAMR_F","FHQ_ACR_WDL_HAMR_SD_F"],["FHQ_ACR_WDL_HAMR_GL_F","FHQ_ACR_WDL_HAMR_GL_SD_F"],["FHQ_ACR_WDL_CCO_F","FHQ_ACR_WDL_CCO_SD_F"],["FHQ_ACR_WDL_IRN_GL_F","FHQ_ACR_WDL_IRN_GL_SD_F"],["FHQ_ACR_WDL_RCO_GL_F","FHQ_ACR_WDL_RCO_GL_SD_F"],["FHQ_ACR_WDL_CCO_GL_F","FHQ_ACR_WDL_CCO_GL_SD_F"],["FHQ_ACR_WDL_HWS_GL_F","FHQ_ACR_WDL_HWS_GL_SD_F"],["FHQ_ACR_WDL_G33_GL_F","FHQ_ACR_WDL_G33_GL_SD_F"],["RH_tmp","RH_tmpsd"],["RH_tmpaim","RH_tmpsdaim"],["RH_uzi","RH_uzisd"],["RH_mp7aim","RH_mp7sdaim"],["RH_mp7eot","RH_mp7sdeot"],["RH_mk14","RH_mk14SD"],["RH_mk14t","RH_mk14tsd"],["RH_MK14AIM","RH_MK14SDAIM"],["RH_MK14EOTECH","RH_MK14SDEOTECH"],["RH_m4","RH_m4sd"],["RH_m4a1eotech","RH_m4sdeotech"],["RH_mk18","RH_mk18sd"],["RH_Mk18aim","RH_Mk18sdaim"],["RH_mk18eot","RH_mk18sdeot"],["RH_Mk18acog","RH_Mk18sdacog"],["RH_m21","RH_MK21A5SD"],["RH_p90i","RH_p90isd"],["RH_p90aim","RH_p90sdaim"],["RH_ump","RH_umpsd"],["RH_umpaim","RH_umpsdaim"],["RH_umpeot","RH_umpsdeot"],["RH_kriss","RH_krisssd"],["RH_krisseot","RH_krisssdeot"],["RH_mk12mod1","RH_mk12sd"],["RH_M14EBRSP","RH_M14EBRSP_SD"],["RH_akms","RH_akmssd"],["RH_oc14sp","RH_oc14sdsp"],["RH_rk95aim","RH_rk95sdaim"],["RH_gr1sp","RH_gr1sdsp"],["SUD_AK74m_F","SUD_AK74m_s_f"],["SUD_AK74m_F_1p78","SUD_AK74m_s_1p78"],["SUD_AK74m_F_pso","SUD_AK74m_s_f_pso"],["SUD_AK74m_TB","SUD_AK74m_s_tb"],["SUD_AK74m_F_C","SUD_AK74m_s_f_c"],["SUD_AK74m_TB_C","SUD_AK74m_s_tb_c"],["SUD_AK74m_tb_1p78","SUD_AK74m_s_tb_1p78"],["SUD_AK74m_tb_pso","SUD_AK74m_s_tb_pso"],["SUD_AK74m_F_n","SUD_AK74m_s_f_n"],["SUD_AK74m_tb_n","SUD_AK74m_s_tb_n"],["DM_CAMO_M4_EO_IR_FG","DM_CAMO_M4_EO_IR_SIL_FG"],["DM_CAMO_M4_EO_IR_GL","DM_CAMO_M4_EO_IR_SIL_GL"],["DM_CAMO_M4_EO_LP_FG","DM_CAMO_M4_EO_LP_SIL_FG"],["DM_CAMO_M4_EO_LP_GL","DM_CAMO_M4_EO_LP_SIL_GL"],["DM_CAMO_M4_CCO_IR_FG","DM_CAMO_M4_CCO_IR_SIL_FG"],["DM_CAMO_M4_CCO_IR_GL","DM_CAMO_M4_CCO_IR_SIL_GL"],["DM_CAMO_M4_CCO_LP_FG","DM_CAMO_M4_CCO_LP_SIL_FG"],["DM_CAMO_M4_CCO_LP_GL","DM_CAMO_M4_CCO_LP_SIL_GL"],["DM_CAMO_M4_RCO_IR_FG","DM_CAMO_M4_RCO_IR_SIL_FG"],["DM_CAMO_M4_RCO_IR_GL","DM_CAMO_M4_RCO_IR_SIL_GL"],["DM_CAMO_M4_RCO_LP_FG","DM_CAMO_M4_RCO_LP_SIL_FG"],["DM_CAMO_M4_RCO_LP_GL","DM_CAMO_M4_RCO_LP_SIL_GL"]];
	EGG_hsilweps = [["Colt1911","EB_m1911SD"],["UZI_EP1","UZI_SD_EP1"],["M9","M9SD"],["Makarov","MakarovSD"],["CZ_75_SP_01_PHANTOM","CZ_75_SP_01_PHANTOM_SD"],["RH_pm","RH_pmsd"],["RH_aps","RH_apssd"],["C1987_P99_green","C1987_P99_green_sd"],["C1987_P99_green_laser","C1987_P99_green_laser_sd"],["RH_m1911","RH_m1911sd"],["RH_usp","RH_uspsd"],["ACR_GLOCK17","ACR_GLOCK17SD"],["RH_m9","RH_m9sd"],["RH_mk22v","RH_mk22vsd"]];
	EGG_bayoweps = [["AK_47_M","AK_47_S"],["M16A2","M16A4"],["AK_74","AKS_74"],["Sa58P_EP1","Sa58V_EP1"],["M4A1","M4A1_Aim"]];

};


//Tasks

"0" objstatus "Active";
"1" objstatus "Active";
"2" objstatus "Active";
"3" objstatus "Active";
"4" objstatus "Active";
"5" objstatus "Active";
"6" objstatus "Active";
"7" objstatus "Active";
"8" objstatus "Active";
"9" objstatus "Active";
"10" objstatus "Active";
"11" objstatus "Active";
"12" objstatus "Active";

setDate BIS_EVO_gdate;
_base = [] execVM "data\scripts\BIS_EVO_GetRelDir.sqf";
_spawnv = [] execVM "data\scripts\BIS_EVO_CreateVehicle.sqf";

//EB_Air (+duala, pracs and rksl!!)
EGG_vecmods = 1;

if (isServer) then 
{
	{_x addEventHandler ["hit", {if((_this select 1) != BIS_EVO_latk) then {(_this select 0) setdamage 0}}]} forEach BIS_EVO_radios;
//blazes
	onplayerconnected "
//	plays = [_name] execVM ""data\scripts\selectplayer.sqf"";
	update = [_name] execVM ""data\scripts\update.sqf"";
	if (BIS_EVO_dunit == _name) then {BIS_EVO_dunit = ""none""};
	";

	onPlayerDisconnected "
	BIS_EVO_dunit = _name;
	_mark = format[""%1mash"",BIS_EVO_dunit];
	deleteMarker _mark;
	_mark = format[""%1farp"",BIS_EVO_dunit];
	deleteMarker _mark;
	[] execVM ""data\scripts\noplayermove.sqf"";
	";

//	waituntil {!isnil "bis_fnc_init"}; LHD1 call BIS_EW_fnc_createLHD;
	[EGG_vecmods] execVM "data\scripts\makebase.sqf";
	//NO LHD HERE
//	[EGG_vecmods,18] execVM "data\scripts\makeLHD.sqf";
};

if ((helicopterhitch ==2) || (helicopterhitch ==3) ) then
{
	mando_hitch_no_check_for_drop = true;
	mando_hitch_types = ["Landvehicle","ship", "Air", "ReammoBox", "StaticWeapon"]; //, "Static"
	[24]execVM"mando_hitch\mando_hitch.sqf";
	[["UH1Y","MV22","MH60S","AH1Z","Ka52","Ka52Black","Mi24_D","Mi24_P","Mi24_V","Mi17_Civilian","Mi17_medevac_CDF","Mi17_CDF","Mi17_medevac_RU","Mi17_rockets_RU","Mi17_medevac_Ins","Mi17_Ins","AH64D","AH64D_Sidewinders","CMA_Mi28_N_RUS","CMA_Mi28_RUS","rksl_lynx_ah7_gpmg","rksl_lynx_ah7_1gpmg","rksl_lynx_ah7_4tow","rksl_lynx_ah9_1","MH6","AH6","UH60MG","UH60","MH6_RACS","AH6_racs","UH60MGRACS","UH60Racs","RAF_Chin47","AH64D_EP1","AH6J_EP1","CH_47F_EP1","MH6J_EP1","UH60M_EP1","BAF_Apache_AH1_D","CH_47F_BAF","BAF_Merlin_HC3_D","AW159_Lynx_BAF","UH1H_TK_EP1","UH1H_TK_GUE_EP1","ffaa_famet_tigre_AT","ffaa_famet_tigre","Ka60_PMC","Ka60_GL_PMC","Mi171Sh_rockets_CZ_EP1","Mi24_D_TK_EP1","Mi17_TK_EP1","ibr_as350","ibr_as350_armed","ibr_as350_specops","ibr_gazelle_armed","ibr_as350_jungle","TIG_UH1H","Mi171Sh_CZ_EP1","AH6X_EP1","ad_hh60g","ad_mh60k","ad_mh60k_black","ad_mh60k_erfs","ad_mh60k_erfs_black","PRACS_AH1S","PRACS_MH6J","PRACS_AH6J","PRACS_CH53","PRACS_CH46","PRACS_puma330_MG","PRACS_puma330_Marine","PRACS_puma330_MED","PRACS_UH1H","PRACS_AB212","PRACS_AB212_M","PRACS_AB212_cas","PRACS_AB212_CAS_M","PRACS_AB212_CAS_MAT","uns_ch34","uns_ch34army","uns_ch47","uns_ch53","uns_oh58a","uns_oh58b","CSJ_UH1transport","CSJ_UH1med","CSJ_oh6","CSJ_oh6a","csj_ch46","CSJ_UH1Slick","CSJ_UH1supply","csj_uh1gun","csj_ghornet","CSJ_AH1g","Mi24_D_CZ_ACR","FRL_Mi24D_CAP","FRL_Mi24D_CAS","FRL_Mi24D_HCAS","FRL_Mi24D_AGM","FRL_Mi24D_MR","FRL_Mi24D_BMB","FRL_Mi24D_LRCAS","FRL_Mi24D_SEAD","FRL_Mi24D_D_CAP","FRL_Mi24D_D_CAS","FRL_Mi24D_D_HCAS","FRL_Mi24D_D_AGM","FRL_Mi24D_D_MR","FRL_Mi24D_D_BMB","FRL_Mi24D_D_LRCAS","FRL_Mi24D_D_SEAD","FRL_Mi24D_CDF_CAP","FRL_Mi24D_CDF_CAS","FRL_Mi24D_CDF_HCAS","FRL_Mi24D_CDF_AGM","FRL_Mi24D_CDF_MR","FRL_Mi24D_CDF_BMB","FRL_Mi24D_CDF_LRCAS","FRL_Mi24D_CDF_SEAD","FRL_Mi24D_TK_CAP","FRL_Mi24D_TK_CAS","FRL_Mi24D_TK_HCAS","FRL_Mi24D_TK_AGM","FRL_Mi24D_TK_MR","FRL_Mi24D_TK_BMB","FRL_Mi24D_TK_LRCAS","FRL_Mi24D_TK_SEAD","FRL_Mi24V_CAP","FRL_Mi24V_CAS","FRL_Mi24V_HCAS","FRL_Mi24V_AGM","FRL_Mi24V_MR","FRL_Mi24V_BMB","FRL_Mi24V_LRCAS","FRL_Mi24V_SEAD","FRL_Mi24V_D_CAP","FRL_Mi24V_D_CAS","FRL_Mi24V_D_HCAS","FRL_Mi24V_D_AGM","FRL_Mi24V_D_MR","FRL_Mi24V_D_BMB","FRL_Mi24V_D_LRCAS","FRL_Mi24V_D_SEAD","FRL_Mi24V_CDF_CAP","FRL_Mi24V_CDF_CAS","FRL_Mi24V_CDF_HCAS","FRL_Mi24V_CDF_AGM","FRL_Mi24V_CDF_MR","FRL_Mi24V_CDF_BMB","FRL_Mi24V_CDF_LRCAS","FRL_Mi24V_CDF_SEAD","FRL_Mi24V_TK_CAP","FRL_Mi24V_TK_CAS","FRL_Mi24V_TK_HCAS","FRL_Mi24V_TK_AGM","FRL_Mi24V_TK_MR","FRL_Mi24V_TK_BMB","FRL_Mi24V_TK_LRCAS","FRL_Mi24V_TK_SEAD","FRL_Mi24P_CAP","FRL_Mi24P_CAS","FRL_Mi24P_HCAS","FRL_Mi24P_AGM","FRL_Mi24P_MR","FRL_Mi24P_BMB","FRL_Mi24P_LRCAS","FRL_Mi24P_SEAD","FRL_Mi24P_D_CAP","FRL_Mi24P_D_CAS","FRL_Mi24P_D_HCAS","FRL_Mi24P_D_AGM","FRL_Mi24P_D_MR","FRL_Mi24P_D_BMB","FRL_Mi24P_D_LRCAS","FRL_Mi24P_D_SEAD","FRL_Mi24P_CDF_CAP","FRL_Mi24P_CDF_CAS","FRL_Mi24P_CDF_HCAS","FRL_Mi24P_CDF_AGM","FRL_Mi24P_CDF_MR","FRL_Mi24P_CDF_BMB","FRL_Mi24P_CDF_LRCAS","FRL_Mi24P_CDF_SEAD","FRL_Mi24P_TK_CAP","FRL_Mi24P_TK_CAS","FRL_Mi24P_TK_HCAS","FRL_Mi24P_TK_AGM","FRL_Mi24P_TK_MR","FRL_Mi24P_TK_BMB","FRL_Mi24P_TK_LRCAS","FRL_Mi24P_TK_SEAD","FRL_Mi8_MB_RUS","FRL_Mi17_1VA_INS","FRL_Mi17_1VA_CDF","FRL_Mi17_1VA_CIV","FRL_Mi17_1VA_CIV_D","FRL_Mi17_1VA_TAK","FRL_Mi17_1VA_UN","FRL_Mi17_1VA_CZ","FRL_Mi17_1VA_GUE","FRL_Mi8_MT_RUS","FRL_Mi17_INS","FRL_Mi17_CDF","FRL_Mi17_CIV","FRL_Mi17_CIV_D","FRL_Mi17_TAK","FRL_Mi17_UN","FRL_Mi17_CZ","FRL_Mi17_GUE","FRL_Mi8_AMT_RUS","FRL_Mi17_1_INS","FRL_Mi17_1_CDF","FRL_Mi17_1_TAK","FRL_Mi17_1_UN","FRL_Mi17_1_CZ","FRL_Mi8_TBK_RUS","FRL_Mi8_TBK_RUS_AGM","FRL_Mi8_TBK_RUS_MR","FRL_Mi8_TBK_RUS_BMB","FRL_Mi17_TVK_TAK","FRL_Mi17_TVK_TAK_AGM","FRL_Mi17_TVK_TAK_MR","FRL_Mi17_TVK_TAK_BMB","FRL_Mi17_TVK_INS","FRL_Mi17_TVK_CDF","FRL_Mi17_TVK_GUE","FRL_Mi8_AMTSh_RUS","FRL_Mi8_AMTSh_RUS_HCAS","FRL_Mi8_AMTSh_AGM","FRL_Mi8_AMTSh_MR","FRL_Mi8_AMTSh_RUS_MR","FRL_Mi8_AMTSh_BMB","FRL_Mi17_1Sh_INS","FRL_Mi17_1Sh_CDF","FRL_Mi17_1Sh_CZ","FRL_Mi8_MTV3_RUS","FRL_Mi8_MTV3_RUS_HCAS","FRL_Mi8_MTV3_RUS_AGM","FRL_Mi8_MTV3_RUS_MR","FRL_Mi8_MTV3_RUS_BMB","FRL_Mi8_MTV3_RUS_D","FRL_Mi17_V3_CZ","FRL_Mi17_V3_PMC",	"FRL_Mi8_MTKO_RUS","FRL_Mi8_MTKO_RUS_HCAS","FRL_Mi8_MTKO_RUS_AGM","FRL_Mi8_MTKO_RUS_MR","FRL_Mi8_MTKO_RUS_BMB","FRL_Mi8_MTKO_RUS_D","FRL_Mi17_N_CZ","FRL_Mi17_N_PMC","FRL_Mi28_CAP","FRL_Mi28_CAS","FRL_Mi28_HCAS","FRL_Mi28_AGM","FRL_Mi28_MR","FRL_Mi28_BMB","FRL_Mi28_LRCAS","FRL_Mi28_SEAD","FRL_Mi28_INS_CAP","FRL_Mi28_INS_CAS","FRL_Mi28_INS_HCAS","FRL_Mi28_INS_AGM","FRL_Mi28_INS_MR","FRL_Mi28_INS_BMB","FRL_Mi28_INS_LRCAS","FRL_Mi28_INS_SEAD","FRL_Mi28D_TK_CAP","FRL_Mi28D_TK_CAS","FRL_Mi28D_TK_HCAS","FRL_Mi28D_TK_AGM","FRL_Mi28D_TK_MR","FRL_Mi28D_TK_BMB","FRL_Mi28D_TK_LRCAS","FRL_Mi28D_TK_SEAD","FRL_Mi28NE_CDF_CAP","FRL_Mi28NE_CDF_CAS","FRL_Mi28NE_CDF_HCAS","FRL_Mi28NE_CDF_AGM","FRL_Mi28NE_CDF_MR","FRL_Mi28NE_CDF_BMB","FRL_Mi28NE_CDF_LRCAS","FRL_Mi28NE_CDF_SEAD","pook_MV22_baf","pook_CV22","pook_MV22_M240","pook_MV22_idws_baf","pook_MV22_idws","pook_MV22"]]execVM"mando_hitch\mando_add_hitch.sqf";
};

//Arty and logistics
if ((helicopterhitch == 1) || (helicopterhitch == 2)) then
{
	execVM "R3F_ARTY_AND_LOG\init.sqf";
};

//////////////////////////////////
//GITS air combat scripts

//modded loadout planes and helis
EB_planes_west = ["pook_EF2000_BAF_MR","F4M_Des","yup_SH60B_penguin","pook_EF2000_BAF_D_MR","pook_EF2000_GER_MR","pook_EF2000_CDF_MR","pook_EF2000_CDF_IND_MR","pook_EF2000_GUE_MR","pook_EF2000_INS_MR","pook_EF2000_UNO_MR","pook_EF2000_TAK_MR","FRL_F16_MR","FRL_F16_D_MR","FRL_F111_MR","FRL_F111_D_MR","FRL_GR4_D_MR","FRL_GR4_MR","FRL_AV8B_MR","FRL_AV8B_BAFX_MR","FRL_A10_MR","FRL_A10_BAFX_MR","FRL_A10_D_MR","FRL_F35_MR","FRL_F35_BAFX_MR","FRL_F35B_MR","FRL_F35B_BAFX_MR","FRL_F15C_MR","FRL_F15C_D_MR","FRL_F15E_MR","FRL_F15E_D_MR","FRL_L159_MR","FRL_L39_MR","FRL_L59_MR","FRL_Su25_MR","FRL_Su25_CDF_MR","FRL_Su25_INS_MR","FRL_Su25_TK_MR","FRL_Su25_D_MR","FRL_Su34_MR","FRL_Su34_D_MR","FRL_Mig23B_RU_MR","FRL_Mig23B_CDF_MR","FRL_Mig23B_INS_MR","FRL_Mig23B_TK_MR","FRL_Mig23C_RU_MR","FRL_Mig23C_CDF_MR","FRL_Mig23C_INS_MR","FRL_Mig23C_TK_MR","FRL_Mig23K_RU_MR","FRL_Mig23K_CDF_MR","FRL_Mig23K_INS_MR","FRL_Mig23K_TK_MR","FRL_Mig27M_RU_MR","FRL_Mig27M_CDF_MR","FRL_Mig27M_INS_MR","FRL_Mig27M_TK_MR","FRL_Mig29_RU_MR","FRL_Mig29_RU_D_MR","FRL_Mig29_INS_MR","FRL_Mig29_CDF_MR","FRL_Mig29_CDF_IND_MR","FRL_Mig29_GUE_MR","FRL_Mig29_TAK_MR","FRL_Mig29_TK_INS_MR","FRL_Mig29_TK_GUE_MR","FRL_Mig35_RU_MR","FRL_Mig35_RU_D_MR","FRL_Mig35_INS_MR","FRL_Mig35_CDF_MR","FRL_Mig35_CDF_IND_MR","FRL_Mig35_GUE_MR","FRL_Mig35_TAK_MR","FRL_Mig35_TK_INS_MR","FRL_Mig35_TK_GUE_MR","FRL_Su27_RU_MR","FRL_Su27_RU_D_MR","FRL_Su27_INS_MR","FRL_Su27_CDF_MR","FRL_Su27_CDF_IND_MR","FRL_Su27_GUE_MR","FRL_Su27_TAK_MR","FRL_Su27_TK_INS_MR","FRL_Su27_TK_GUE_MR","FRL_Su30_RU_MR","FRL_Su30_RU_D_MR","FRL_Su30_INS_MR","FRL_Su30_CDF_MR","FRL_Su30_CDF_IND_MR","FRL_Su30_GUE_MR","FRL_Su30_TAK_MR","FRL_Su30_TK_INS_MR","FRL_Su30_TK_GUE_MR","FRL_Su30MKM_RU_MR","FRL_Su30MKM_RU_D_MR","FRL_Su30MKM_INS_MR","FRL_Su30MKM_CDF_MR","FRL_Su30MKM_CDF_IND_MR","FRL_Su30MKM_GUE_MR","FRL_Su30MKM_TAK_MR","FRL_Su30MKM_TK_INS_MR","FRL_Su30MKM_TK_GUE_MR","FRL_AH1Z_MR","FRL_AH1W_MR","FRL_AH64D_MR","FRL_AH6J_MR","FRL_AH6J_MR_D","FRL_AH6M_MR","FRL_AH6M_D_MR","FRL_Bo105pah_MR_DE","FRL_Bo105pah_MR_ACR","FRL_Bo105pah_MR_CDF","FRL_Bo105pah_MR_CDF_IND","FRL_Bo105pah_MR_GUE","FRL_Bo105pah_MR_INS","FRL_Bo105pah_MR_TAK","FRL_Bo105pah_MR_TK_GUE","FRL_Bo105pah_MR_TK_INS","FRL_Lynx_MR","FRL_UH60M_MR","FRL_MQ9_MR","FRL_MQ9_D_MR","FRL_Mi24D_MR","FRL_Mi24D_CDF_MR","FRL_Mi24D_TK_MR","FRL_Mi24D_D_MR","FRL_Mi24V_MR","FRL_Mi24V_CDF_MR","FRL_Mi24V_TK_MR","FRL_Mi24V_D_MR","FRL_Mi24P_MR","FRL_Mi24P_CDF_MR","FRL_Mi24P_TK_MR","FRL_Mi24P_D_MR","FRL_Ka52_MR","FRL_Ka52_MR_D","FRL_Mi28_MR","FRL_Mi28_INS_MR","FRL_Mi28D_TK_MR","FRL_Mi28NE_CDF_MR","FRL_Mi8_TBK_RUS_MR","FRL_Mi17_TVK_TAK_MR","FRL_Mi8_AMTSh_MR","FRL_Mi8_MTKO_RUS_MR","C130J","C130J_US_EP1","An2_2_TK_CIV_EP1","PRACS_RAH6	","PRACS_F16_PHSTRK","PRACS_A4_HBMB","PRACS_Mohawk","PRACS_AH1S","PRACS_AH1S_2","PRACS_Etendard_GBU","PRACS_Mirage3_BMB","PRACS_F15","PRACS_C130"];
EB_planes_CAP = EB_planes_west;
EB_planes_CAS = EB_planes_west;
EB_planes_AGM = EB_planes_west;
EB_planes_MR = EB_planes_west;
EB_planes_BMB = EB_planes_west;
EB_planes_LGB = EB_planes_west;
EB_planes_SEAD = EB_planes_west;

EGG_maxMissiles = 6;
VehiclePlaced = 1;

EB_PLbombs = ["EB_Mk81_Launcher","EB_Mk82_Launcher","EB_Mk83_Launcher","EB_Mk84_Launcher","EB_Mk77_Launcher","EB_Mk770_Launcher","EB_BombLauncher_fab250","EB_BombLauncher_fab500","EB_CBU78B_Launcher","EB_CBU87B_Launcher","RKTR27Launcher","EB_R77_Launcher","EB_CBU89B_Launcher","EB_CBU100_Launcher","EB_GBU12_Launcher","EB_GBU16_Launcher","EB_GBU10_Launcher","EB_BombLauncher_kab250","EB_BombLauncher_kab500"];
EB_PLmissiles = ["EB_AIM9M_Launcher","EB_AIM120_Launcher","EB_AIM9X_Launcher","EB_AIM7E_Launcher","EB_METEOR_Launcher","EB_AIM132_Launcher","EB_R60_Launcher","EB_R73_Launcher","EB_AT2_Launcher","EB_KH29D_Launcher","EB_KH29L_Launcher","EB_AGM65E_Launcher","EB_AGM114K_Launcher","EB_AGM88_Launcher"];
GLT_bombs = ["GLT_GBU24_Launcher","GLT_GBU53_Launcher","GLT_GBU39_Launcher","GLT_KAB1500_Launcher"];
GLT_missiles = ["GLT_AIM120_Launcher","GLT_AIM54_Launcher","GLT_R550_Launcher","GLT_AIM132_Launcher","GLT_METEOR_Launcher","GLT_AGM84_Launcher","GLT_AGM154A1_Launcher","GLT_AM39_Launcher","GLT_R3_Launcher","GLT_R27_Launcher","GLT_R77_Launcher","GLT_CH15S_Launcher","GLT_CH29T_Launcher","GLT_CH59_Launcher","GLT_CH31P_Launcher"];
rksl_missiles= ["RKSL_iristLauncher","RKSL_BrimstoneLauncher","RKSL_ALARM_Launcher","RKSL_stormshadow_Launcher","RKSL_agm119mk3_Launcher"];
extra_missiles = ["GLT_AM39_Launcher"];
EB_turrets = ["M197","EB_GAU8"];
extra_bombs = ["GLT_AGM154A_Launcher","GLT_AGM154A1_Launcher"];

EGG_missiles =[];// EB_PLmissiles +extra_missiles;
EGG_bombs =  EB_PLbombs + GLT_bombs+ extra_bombs;



//////////////////////////////////////////////
buyCarList = 
	[
	/*---Military cars---*/
	["PRACS_ATV",0],			// Hilux (Open)
	["LandRover_CZ_EP1",0],			// Hilux (Open)
	["LandRover_Special_CZ_EP1",2],				// Landrover (SF)
	["SUV_PMC",2],							// SUV
	["ArmoredSUV_PMC",8],						// SUV (GAT)
	["HMMWV_M1035_DES_EP1",5],								// HMMWV
	["HMMWV_M1151_M2_DES_EP1",10],							// HMMWV (HMG)
	["LandRover_Special_CZ_EP1",10],							// HMMWV (HMG)
	["BAF_Jackal2_L2A1_D",10],							// HMMWV (HMG)
	["HMMWV_M998_crows_MK19_DES_EP1",12],							// HMMWV (GMG)s
	["HMMWV_TOW_DES_EP1",15],							// HMMWV (AT)
	["HMMWV_Avenger_DES_EP1",25],						// HMMWV (AA)
	["MtvrRepair_DES_EP1",5],						// HMMWV (AA)
	["POOK_HEMTT_repair_us",8]						// HMMWV (AA)
	];

for [{_loop=0}, {_loop<count buyCarList}, {_loop=_loop+1}] do {
	buyCarList set [_loop,[(buyCarList select _loop) select 0, (buyCarList select _loop) select 1,0]];
};

	// _rand = 0 + round random (10);
	// systemChat str _rand;
	// if(_rand >= 8 ) then {
	// 	_carCount = 1;	
	// };

	buyTankList = 
	[
	/*---APCs---*/
	["Dingo_DST_ACR",12],						// Dingo (MMG)
	["Dingo_GL_DST_ACR",12],					// Dingo (GMG)
	["PRACS_M113_SA",15],					// Dingo (GMG)
	["PRACS_M113_SA_Mk19",17],					// Dingo (GMG)
	["PRACS_M113_FSV",17],							// BMP1
	["PRACS_LAV_IFV",15],					// Dingo (GMG)
	["PRACS_LAV_MGS",17],					// Dingo (GMG)
	["BVP1_TK_ACR",17],							// BMP1
	["AAV_D",18],									// AAVP
	["EB_LAV25_D2",22],								// LAV
	["PRACS_LAV25",22],								// LAV
	["PRACS_LAV_SAM",23],							// Pandur
	["Pandur2_ACR",25],							// Pandur
	["PRACS_BMP2",25],							// Pandur
	["PRACS_M901_ITV",25],							// Pandur
	["M1126_ICV_M2_EP1",15],					// Stryker (HMG)
	["M1126_ICV_mk19_EP1",16],					// Stryker (GMG)
	["M1128_MGS_EP1",25],						// Stryker (MGS)
	["PRACS_FV101",22],						// Stryker (MGS)
	["PRACS_FV107",25],						// Stryker (MGS)
	["M1135_ATGMV_EP1",30],						// Stryker (ATGM)
	/*---Tanks---*/
	["PRACS_M60A3",35],							// T72M
	["PRACS_M60A3_S2",40],							// T72M
	["PRACS_T72",40],							// T72M
	["PRACS_LEO1A5",40],							// T72M
	["M2A2_EP1",35],							// M2A2 (AT)
	["M6_EP1",40],								// M6 (AA)
	["M2A3_EP1",45],							// M2A3 (AT)
	["EB_M2A3_WH",50],
	["BAF_FV510_W",55],							// Warrior
	["PRACS_LEO2A4",52],							// T72M
	["M1A1_US_DES_EP1",55],								// M1A1
	["EB_M1A2_US_D",65],						// M1A2
	["M1A2_US_TUSK_MG_EP1",65],						// M1A2
	["EB_M1A3_TUSK_D",75],						// M1A2
	/*---AA---*/
	["PRACS_Sa6",30],						// M1A2
	["PRACS_m48_chapparal",30],						// M1A2
	["PRACS_351_SAM",38],	
	["POOK_NASAMS_US",38],	
	["POOK_MEADS_US",38],	
	["PRACS_M163",40],						// M1A2
	["PRACS_M429_CRAM",40],	
	["PRACS_M302_SAM",50],	
	["PRACS_M460_SAM",50],	
	/*---Artillery---*/
	["PRACS_M250_TEL",140],	
	["PRACS_M291_TEL",150],	
	["GRAD_TK_EP1",160],						// GRAD
	["RM70_ACR",170],							// RM70
	["PRACS_M245_TEL",170],								// MLRS
	["PRACS_MLRS",180]								// MLRS
	];

for [{_loop=0}, {_loop<count buyTankList}, {_loop=_loop+1}] do {
	buyTankList set [_loop,[(buyTankList select _loop) select 0, (buyTankList select _loop) select 1,0]];
};


	buyAirList = 
	[
		/*---Helicopters---*/
	["PRACS_puma330_MG",10],						// Mi-17
	["PRACS_MH6J",10],							// Littlebird
	["PRACS_AH6J",20],							// Littlebird (Armed)
	["UH60M_MEV_EP1",10],									// Blackhawk (MMG)
	["CH_47F_EP1",10],							// Chinook
	["BAF_Merlin_HC3_D",10],							// Chinook
	["UH60M_EP1",10],							// Blackhawk (GAT)
	["UH1Y",15],								// Viper
	["PRACS_AB212_CAS",30],									// Blackhawk (MMG)
	["ibr_as350_armed",30],								// Viper
	["Mi171Sh_rockets_CZ_EP1",80],				// Mi-17 (Rockets)
	["AW159_Lynx_BAF",80],						// Wildcat
	["PRACS_RAH6",100],							// Littlebird (Armed)
	["PRACS_AH1S",190],								// Cobra
	["AH1Z",190],								// Cobra
	["AH64D",200],								// Apache (AT)
	/*---Planes---*/
	["ibr_tucano_lin",60],	
	["SMAF_MF1_AGRESSOR_DESERT",100],								// F35					
	["PRACS_Etendard",130],								// F35
	["Pracs_Mohawk",130],								// F35 
	["PRACS_Mirage3",140],								// F35
	["F4M_Des",140],	
	["PRACS_A4",160],								// F35
	["PRACS_F16_PHSTRK",170],								// F35
	["JS_JC_FA18E_USMC",170],	
	["F35B",170],								// F35
	["PRACS_F15",170],								// F35
	["FRL_A10_MR",170],								// A10
	["FRL_AV8B_MR",180],								// AV8B
	["pook_EF2000_BAF_D_DEAD",185],								// AV8B
	["FRL_F111_D_MR",185]								// AV8B

	];
	for [{_loop=0}, {_loop<count buyAirList}, {_loop=_loop+1}] do {
	buyAirList set [_loop,[(buyAirList select _loop) select 0, (buyAirList select _loop) select 1,0]];
	};

	buyStatList = 
	[
	/*---Statics---*/
	["M2StaticMG_US_EP1",2],					// CUSTOM  ["PRACS_Type66_Gun","PRACS_M266AAgun","PRACS_Type74AAgun","PRACS_M101","PRACS_M1","PRACS_Regular_M2","PRACS_Regular_MK19","PRACS_Regular_TOW","PRACS_Regular_M252"];
	["M2HD_mini_TriPod_US_EP1",2],					// ap
	["MK19_TriPod_US_EP1",6],							// Ap
	["TOW_TriPod",10],							// AT
	["Stinger_Pod_US_EP1",10],						// AA
	["M252_US_EP1",10],								// AP
	["Rbs70_ACR",10],								// AA
	["PRACS_Type66_Gun",12],	
	["PRACS_M266AAgun",12],	
	["PRACS_Type74AAgun",12],		
	["PRACS_M101",12],	
	["PRACS_M1",12],						
	["M119_US_EP1",30]							// CUSTOM
	];

	for [{_loop=0}, {_loop<count buyStatList}, {_loop=_loop+1}] do 
	{
		buyStatList set [_loop,[(buyStatList select _loop) select 0, (buyStatList select _loop) select 1,0]];
	};

//Player unlocks
buySpecialList =[];

egg_evo_westAmb = ["EB_M1114_Armored_D"]; 
egg_evo_westMHQ = ["PRACS_m577_MHQ"];
EB_twoseaterplanes = ["FRL_Su34_D_CAP","FRL_Su34_D_CAS","FRL_Su34_D_HCAS","FRL_Su34_D_EHCAS","FRL_Su34_D_AGM","FRL_Su34_D_MR","FRL_Su34_D_LBMB","FRL_Su34_D_BMB","FRL_Su34_D_HBMB","FRL_Su34_D_LGB","FRL_Su34_D_SEAD","Su34","uns_F4_CAP","uns_F4Navy_CAP","uns_F4_CAS","uns_A6_Intruder_ECM","JS_FA18F","IkaR_F14_AIM_54","IkaR_F14_AGM_65","uns_f105F_WW"];

//mod management EGG_vecmods //## modify desc
//0,1,2,3,4,5,9 
//"Off", "GITS", "RKSL", "PRACS", "UNSUNG", "GLT", "Arma3"

//default stock weapons
//EGG_vecmods = 0;
//////////////////////////////////
//EDITOR use
//if playing in editor rem out the next line with a // and manually set param below instead
editor = 1; publicVariable "editor";

if (editor == 1) then
{
	onMapSingleClick "if (_alt) then {vehicle player setpos _pos;{vehicle _x setpos _pos} forEach _units}";
	player allowDamage false;
	spawntype = 2;
	helicopterhitch = 2;
	EVOhour = 9;
	grasslevel =1;
	if (grasslevel == 0) then {setTerrainGrid 50};
	if (grasslevel == 1) then {setTerrainGrid 25};
	if (grasslevel == 2) then {setTerrainGrid 12.5};
	if (grasslevel == 3) then {setTerrainGrid 6.25};
	if (grasslevel == 4) then {setTerrainGrid 3.125};
	viewparam =  2500;
	basebeam = 2;
	gitsnades = 1;
	EGG_EVO_allowpilots = 1;
	ranklock = 3;
	jailparam = 0;
	rankscore = 50;
	//adding	
	helpersparam =2;
	performanceparam = 2;
	perkparam = 1;
	EGG_EVO_Artycost =4;
	//Note from Tox1m: paramsArray select 15 used by Revive script
	enemynumdiv = 1;
	reinfdelay = 30;
	EGG_highCommand = 0;
	EX_EVO_vehPriceMultiplier = 1;
};
basebeam = 2;
//EGG_vecmods = paramsArray select 18;

//to use in Editor - include the line below for RKSL (load the RKSL mod on server/client in your game command line etc) as the editor does not run the parameters dialog in description.ext
//EGG_vecmods = 2;

//to enable PRACS in editor
//EGG_vecmods = 3;

//EB_Air (+duala, pracs and rksl!!)
//EGG_vecmods = 1;
//EGG_vecmods = paramsArray select 18;

//to use in Editor - include the line below for RKSL (load the RKSL mod on server/client in your game command line etc) as the editor does not run the parameters dialog in description.ext
//EGG_vecmods = 2;

//to enable PRACS in editor
//EGG_vecmods = 3;

//EB_Air (+duala, pracs and rksl!!)
//EGG_vecmods = 1;

//////////////////////////////////
//set spawnarrays for makebase
//heli unarmed
EGG_EVO_westveh1 = ["MH6J_EP1","UH60M_EP1","CH_47F_BAF","BAF_Merlin_HC3_D"];
//heli armed
EGG_EVO_westveh2 = ["AH64D","AH64D_EP1","AH64D_Sidewinders","BAF_Apache_AH1_D","AH1Z","AH1Z","AW159_Lynx_BAF","AH6J_EP1"];
//planes
EGG_EVO_westveh9 = ["AV8B","AV8B2","A10","A10_US_EP1","L159_ACR","F35B","L39_2_ACR","L39_ACR","An2_2_TK_CIV_EP1","C130J"];

EGG_EVO_westvehM2 = ["AH6J_EP1","AH6J_EP1","AW159_Lynx_BAF","AW159_Lynx_BAF"];

EGG_EVO_westvehM9 =["AV8B","AV8B","F35B","F35B","L159_ACR","L159_ACR"];

EGG_EVO_westlhdheli1 =["AH64D","AH1Z","AH1Z","AW159_Lynx_BAF","MH60S","UH1Y"];

EGG_EVO_westlhdplane1 = ["AV8B","F35B","F35B"];

EGG_EVO_HANGARS =["Land_SS_hangar","Land_Mil_hangar_EP1"];
//helipad types


EGG_EVO_HELIPAD =["HeliHEmpty","HeliH","HeliHRescue"];

EGG_EVO_westveh10 = ["Stinger_Pod_US_EP1","ZU23_TK_GUE_EP1","Rbs70_ACR","HMMWV_Avenger"];

// WIP

	perkList = 
	[
		//Perk 1
		[
			["Recon HQ level 1","Upgrade recon HQ to HUMVEE M2",FALSE],
			["Recon HQ level 2","Upgrade recon HQ to HUMVEE M2 CROWS",FALSE],
			["Recon HQ level 3","Upgrade recon HQ to Ridgeback MRAP",FALSE],
			["Recon HQ level 4","Upgrade recon HQ to LAV APC",FALSE],
			["Recon HQ Max","Maximum level reached",FALSE]
		],
		//Perk 2
		[
			["Pilot level 1","New armament and 3 extra missiles",FALSE],
			["Pilot level 2","New armament and 3 extra missiles",FALSE],
			["Pilot level 3","New armament and 3 extra missiles",FALSE],
			["Maximum","This the maximum perk level",FALSE]
		]
	];

//Server side score addition
if (isServer) then {
   ["jed_addscore", {(_this select 0) addScore (_this select 1)}] call CBA_fnc_addEventHandler;
};


//////////////////////////////////

//customised for #duala baf
if (EGG_vecmods == 1) then
{
//	execVM "addons\GITS.sqf";
//	execVM "addons\RKSL.sqf";
//	execVM "addons\PRACS.sqf";

	EGG_EVO_meflag = ["flag_mol"];
/*
	EGG_EVO_east1 = ["MOL_Soldier_Officer","MOL_Soldier_Medic","MOL_Soldier_Engineer","MOL_Soldier_Rifleman","MOL_Soldier_GL","MOL_Guard_Marksman","MOL_Soldier_Sniper","MOL_Soldier_Spotter","MOL_Guard_AR","MOL_Soldier_MG","MOL_Soldier_AT","MOL_Soldier_LAT","MOL_Soldier_HAT","MOL_Guard_AA","MOL_Soldier_Crew"];
	EGG_EVO_east2 = ["ibr_rebel11","ibr_rebel22","ibr_rebel33","ibr_rebel44","ibr_rebel55","ibr_rebel66","ibr_rebel77","ibr_rebel83","ibr_rebel95","ibr_rebel102","ibr_rebel111","ibr_rebel125","ibr_rebel132","ibr_rebel145","ibr_rebel173","ibr_rebel184"];
	EGG_EVO_east3= ["ibr_rebel173","ibr_rebel184"];
	EGG_EVO_east4= ["TK_Aziz_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1","TK_Special_Forces_TL_EP1","TK_Soldier_SniperH_EP1","TK_Soldier_Sniper_Night_EP1","TK_Soldier_Night_1_EP1","TK_Soldier_Night_2_EP1","TK_Soldier_TWS_EP1"]; 
	EGG_EVO_east5 = ["TK_INS_Soldier_AA_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Bonesetter_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_2_EP1","TK_INS_Soldier_EP1","TK_INS_Soldier_4_EP1","TK_INS_Soldier_3_EP1","TK_INS_Soldier_AAT_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_Sniper_EP1","TK_INS_Soldier_TL_EP1","TK_INS_Warlord_EP1"];

	EGG_EVO_mepilot = ["MOL_Soldier_Pilot"];
	EGG_EVO_meofficer = ["MOL_Soldier_Officer","Ins_Bardak"];
	EGG_EVO_mecrew = ["MOL_Soldier_Crew"];
	EGG_EVO_meguard = ["Ins_Commander","ibr_rebel11","ibr_rebel22","ibr_rebel33","ibr_rebel44","ibr_rebel55","ibr_rebel66","ibr_rebel77","ibr_rebel83"];

*/
EGG_EVO_east10 = ["RU_Soldier_TL","RU_Soldier_SL","RU_Soldier_Medic","RU_Soldier","RU_Soldier2","RU_Soldier_AR","RU_Soldier_MG","RU_Soldier_AA","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_HAT","RU_Soldier_GL","RU_Soldier_Sniper","RU_Soldier_SniperH","RU_Soldier_Spotter","RU_Soldier_Marksman"];
EGG_EVO_east11 = ["MVD_Soldier","MVD_Soldier_MG","MVD_Soldier_Marksman","MVD_Soldier_GL","MVD_Soldier_AT","MVD_Soldier_Sniper","MVD_Soldier_TL"];
EGG_EVO_east12 = ["RUS_Soldier_Sab","RUS_Soldier_GL","RUS_Soldier_Marksman","RUS_Commander","RUS_Soldier1","RUS_Soldier2","RUS_Soldier3","RUS_Soldier_TL"];
//EGG_EVO_east4 = ["Ins_Lopotev","Ins_Commander","Ins_Bardak","Ins_Soldier_1","Ins_Soldier_2","Ins_Soldier_AA","Ins_Soldier_AT","Ins_Soldier_AR","Ins_Soldier_GL","Ins_Soldier_MG","Ins_Soldier_Medic","Ins_Soldier_CO","Ins_Soldier_Sab","Ins_Soldier_Sapper","Ins_Soldier_Sniper"];
//EGG_EVO_east5 = ["Ins_Villager3","Ins_Woodlander3","Ins_Woodlander2","Ins_Worker2","Ins_Villager4","Ins_Woodlander1"];
EGG_EVO_east6 = ["mas_gru_spet_tl_gd","mas_gru_spet_min_gd","mas_gru_spet_dem_iz","mas_gru_spet_min_ge","mas_gru_spet_dem_ge","mas_gru_spet_med2_ge","mas_gru_spet_med_iz","mas_gru_spet_med2_gd","mas_gru_spet_snp_ghil_kb","mas_gru_spet_snp_ghil_gd","mas_gru_spet_snp_iz","mas_gru_spet_spt_ghil_iz","mas_gru_spet_op1_kb","mas_gru_spet_op1_gd","RU_Soldier_AA","Ins_Soldier_AA","mas_gru_spet_mg_kb","mas_gru_spet_rpk_gd","mas_gru_spet_op2_iz","mas_gru_spet_op2_ge"];
EGG_EVO_east7 = ["MOL_Soldier_Officer","MOL_Soldier_Medic","MOL_Soldier_Engineer","MOL_Soldier_Rifleman","MOL_Soldier_GL","MOL_Guard_Marksman","MOL_Soldier_Sniper","MOL_Soldier_Spotter","MOL_Guard_AR","MOL_Soldier_MG","MOL_Soldier_AT","MOL_Soldier_LAT","MOL_Soldier_HAT","MOL_Guard_AA","MOL_Soldier_Crew"];
EGG_EVO_east8 = ["ibr_rebel11","ibr_rebel22","ibr_rebel33","ibr_rebel44","ibr_rebel55","ibr_rebel66","ibr_rebel77","ibr_rebel83","ibr_rebel95","ibr_rebel102","ibr_rebel111","ibr_rebel125","ibr_rebel132","ibr_rebel145"];
EGG_EVO_east9 = ["MIS_ISIS_04_Rif","MIS_ISIS_04_MG","MIS_ISIS_04_Med","MIS_ISIS_04_SVD","MIS_ISIS_04_TWS","MIS_ISIS_04_AT","MIS_ISIS_04_AA"];
EGG_EVO_east1= ["TK_Soldier_AA_EP1","TK_Soldier_AAT_EP1","TK_Soldier_MG_EP1","TK_Soldier_HAT_EP1","TK_Soldier_AR_EP1","TK_Commander_EP1","TK_Soldier_Engineer_EP1","TK_Soldier_GL_EP1","TK_Soldier_AMG_EP1","TK_Soldier_Medic_EP1","TK_Soldier_Officer_EP1","TK_Soldier_EP1","TK_Soldier_B_EP1","TK_Soldier_LAT_EP1","TK_Soldier_AT_EP1","TK_Soldier_Sniper_EP1","TK_Soldier_Spotter_EP1","TK_Soldier_SL_EP1"];
EGG_EVO_east2= ["TK_Aziz_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1","TK_Special_Forces_TL_EP1","TK_Soldier_SniperH_EP1","TK_Soldier_Sniper_Night_EP1","TK_Soldier_Night_1_EP1","TK_Soldier_Night_2_EP1","TK_Soldier_TWS_EP1"]; 
EGG_EVO_east3 = ["TK_INS_Soldier_AA_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Bonesetter_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_2_EP1","TK_INS_Soldier_EP1","TK_INS_Soldier_4_EP1","TK_INS_Soldier_3_EP1","TK_INS_Soldier_AAT_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_Sniper_EP1","TK_INS_Soldier_TL_EP1","TK_INS_Warlord_EP1"];
EGG_EVO_east4 = ["TK_INS_Soldier_AA_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Bonesetter_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_2_EP1","TK_INS_Soldier_EP1","TK_INS_Soldier_4_EP1","TK_INS_Soldier_3_EP1","TK_INS_Soldier_AAT_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_Sniper_EP1","TK_INS_Soldier_TL_EP1","TK_INS_Warlord_EP1"];
EGG_EVO_east5 = ["TK_Aziz_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1","TK_Special_Forces_TL_EP1","TK_Soldier_SniperH_EP1","TK_Soldier_Sniper_Night_EP1","TK_Soldier_Night_1_EP1","TK_Soldier_Night_2_EP1","TK_Soldier_TWS_EP1"]; 


//heli unarmed

	EGG_EVO_westveh1 = ["FRL_MH6J_D","FRL_EH6E_D","CH_47F_BAF","BAF_Merlin_HC3_D"];

//heli armed

	EGG_EVO_westveh2 = ["FRL_AH1Z_AGM","FRL_AH1Z_CAS","FRL_AH64D_AGM","FRL_AH64D_AT","AW159_Lynx_BAF","AW159_Lynx_BAF","FRL_AH6M_TOW_D","FRL_AH6M_HCAS_D"];

	EGG_EVO_westvehM2 = ["FRL_AH6J_AGM_D","FRL_AH6J_SEAD_D","BAFX_Gazelle_D","BAFX_Gazelle_MG"];

	EGG_EVO_westlhdheli1 =["FRL_AH64D_CAS","FRL_AH64D_SEAD","FRL_AH1Z_AT","AW159_Lynx_BAF","BAFX_Gazelle_D","BAFX_Scout"];

//planes

	EGG_EVO_westveh9 = ["FRL_AV8B_BAFX_CAP","FRL_AV8B_BAFX_MR","FRL_F15C_D_CAP","FRL_F15E_D_MR","FRL_L159_CAP","FRL_L159_MR","FRL_F35_CAP","FRL_F35_MR","FRL_F35B_CAP","C130J"];

	EGG_EVO_westvehM9 =["FRL_Mig29_CDF_MR","FRL_Mig35_CDF_MR","FRL_Mig27M_CDF_MR","FRL_Su25_CDF_MR","FRL_Su27_CDF_MR","FRL_Su30MKM_CDF_MR"];

	EGG_EVO_westlhdplane1 = ["FRL_AV8B_BAFX_MR","FRL_F15C_CAP","FRL_F35B_MR"];

	EGG_EVO_HANGARS =["Land_Mil_hangar_EP1","Land_Mil_hangar_EP1"];

//helipad types
	EGG_EVO_HELIPAD =["HeliHEmpty","HeliH","HeliHRescue"];

	EGG_EVO_westveh10 = ["PRACS_M429_CRAM","PRACS_M302_SAM","PRACS_351_SAM","PRACS_M460_SAM","PRACS_LAV_SAM","pook_9K37_CDF","pook_9K37M2_CDF","pook_9K331_CDF","pook_9K332_CDF","pook_9K317_CDF","pook_9K317M2_CDF","pook_96K6_CDF","pook_NASAMS_US","pook_CRAM_US"];

//makehip
//choppers
EGG_EVO_eastheli1 = ["UH1H_TK_EP1","ibr_gazelle_armed","FRL_Mi17_1_TAK","FRL_Mi17_TAK","FRL_Mi17_TVK_TAK","FRL_Mi17_TVK_TAK_AGM","FRL_Mi17_TVK_TAK_MR","FRL_Mi17_TVK_TAK_BMB","FRL_Mi24D_TK_CAP","FRL_Mi24D_TK_CAS","FRL_Mi24D_TK_HCAS","FRL_Mi24D_TK_AGM","FRL_Mi24D_TK_MR","FRL_Mi24D_TK_BMB","FRL_Mi24D_TK_LRCAS","FRL_Mi24D_TK_SEAD"];//makehip

//makehindp
EGG_EVO_eastheli2 = ["FRL_Mi8_AMTSh_RUS","FRL_Mi8_AMTSh_RUS_HCAS","FRL_Mi8_AMTSh_AGM","FRL_Mi8_AMTSh_MR","FRL_Mi8_AMTSh_BMB","FRL_Mi8_MTV3_RUS","FRL_Mi8_MTV3_RUS_HCAS","FRL_Mi8_MTV3_RUS_AGM","FRL_Mi8_MTV3_RUS_MR","FRL_Mi8_MTV3_RUS_BMB","FRL_Mi24V_TK_CAP","FRL_Mi24V_TK_CAS","FRL_Mi24V_TK_HCAS","FRL_Mi24V_TK_AGM","FRL_Mi24V_TK_MR","FRL_Mi24V_TK_BMB","FRL_Mi24V_TK_LRCAS","FRL_Mi24V_TK_SEAD","FRL_Mi24P_TK_CAP","FRL_Mi24P_TK_CAS","FRL_Mi24P_TK_HCAS","FRL_Mi24P_TK_AGM","FRL_Mi24P_TK_MR","FRL_Mi24P_TK_BMB","FRL_Mi24P_TK_LRCAS","FRL_Mi24P_TK_SEAD"];
//makeka
EGG_EVO_eastheli3 = ["FRL_Mi8_MTKO_RUS","FRL_Mi8_MTKO_RUS_HCAS","FRL_Mi8_MTKO_RUS_AGM","FRL_Mi8_MTKO_RUS_MR","FRL_Mi8_MTKO_RUS_BMB","FRL_Mi28D_TK_CAP","FRL_Mi28D_TK_CAS","FRL_Mi28D_TK_HCAS","FRL_Mi28D_TK_AGM","FRL_Mi28D_TK_MR","FRL_Mi28D_TK_BMB","FRL_Mi28D_TK_LRCAS","FRL_Mi28D_TK_SEAD","FRL_Ka52_CAP_D","FRL_Ka52_CAS_D","FRL_Ka52_HCAS_D","FRL_Ka52_AGM_D","FRL_Ka52_MR_D","FRL_Ka52_BMB_D","FRL_Ka52_LRCAS_D","FRL_Ka52_SEAD_D"];

//hindv
EGG_EVO_mevaira = EGG_EVO_eastheli1+EGG_EVO_eastheli2+EGG_EVO_eastheli3;//hindv

//planes
//makesub
	EGG_EVO_mevairb = ["FRL_Su25_TK_CAS","PRACS_TK_Su22_STA","PRACS_TK_MiG21","PRACS_TK_MiG21_AG","FRL_Su27_TAK_MR","FRL_Mig23B_TK_MR","FRL_Mig23B_TK_SEAD","FRL_Mig27M_TK_CAP","FRL_Mig35_TK_LGB","FRL_Mig29_TK_CAP"];

//"RKTSU33B1","RKTSU33AG","RKTSU33AA","RKTSU33MR",
//makesu
	EGG_EVO_mevairc = ["FRL_Su34_D_HCAS","FRL_Su34_D_SEAD","PRACS_TK_Su24Fencer","PRACS_TK_Su24Fencer_STK","FRL_Su30_TK_CAP","FRL_Mig23C_TK_CAP","FRL_Mig23C_TK_HBMB","FRL_L39_CAS","FRL_L39_AGM"];
//"RKTTU22M3C","RKTTU22M3D","RKTTU22M3B",
	EGG_EVO_eastveh2 = EGG_EVO_mevairc+EGG_EVO_mevairb;

	EGG_EVO_eastveh5 = ["PRACS_TK_LandRover","PRACS_TK_MTLB_APC","PRACS_TK_MTLB","PRACS_TK_Type63","PRACS_TK_Ural","TT650_TK_EP1","BTR40_TK_INS_EP1","SUV_TK_EP1","UAZ_Unarmed_TK_EP1","V3S_TK_EP1","V3S_Open_TK_EP1","Old_bike_TK_INS_EP1","M113Ambul_TK_EP1","UralSupply_TK_EP1","UralSalvage_TK_EP1","UralReammo_TK_EP1","UralRefuel_TK_EP1","UralRepair_TK_EP1","UAZ_INS","UralOpen_INS","EB_GAZ_Vodnik_MedEvac_TK","AFR_Pinz","Ural_MOL"];
//light vec
	EGG_EVO_eastveh6 = EGG_EVO_eastveh6+ ["PRACS_TK_MTLB_APC","PRACS_TK_URAL_SAM","BMP2_MOL","ibr_datsun_mol","ibr_datsun_molblk","pook_BTR40_twinMG_TAK","pook_BTR40_twinMG_TK_INS","pook_BTR40_patrol_TAK","pook_BTR40_patrol_TK_INS","pook_BTR40_PK_TAK","pook_BTR40_PK_TK_INS","pook_BTR40_RR57_TAK","pook_BTR40_RR57_TK_INS","pook_BTR40_RR73_TAK","pook_BTR40_RR73_TK_INS","pook_BTR40_RR106_TAK","pook_BTR40_RR106_TK_INS","pook_BTR40_MORTAR_TAK","pook_BTR40_MORTAR_TK_INS","pook_BTR40_zu23_TAK","pook_BTR40_zu23_TK_INS","pook_BTR152_DSHK_TAK","pook_BTR152_DSHK_TK_INS","pook_BTR152_ZPU_TAK","pook_BTR152_ZPU_TK_INS","pook_Ural_ZU23_TK_INS","pook_Ural_S60_TAK","pook_Ural_S60_TK_INS","BTR40_MG_TK_INS_EP1","LandRover_MG_TK_EP1","LandRover_SPG9_TK_EP1","LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1","UAZ_AGS30_TK_EP1","UAZ_MG_TK_EP1","UAZ_SPG9_INS","GRAD_TK_EP1","Ural_ZU23_TK_EP1","BRDM2_TK_EP1","BRDM2_ATGM_TK_EP1","BTR60_TK_EP1","M113_TK_EP1","BMP2_HQ_TK_EP1","EB_GAZ_Vodnik_HMG_TK","EB_GAZ_Vodnik_TK","BTR90_HQ","pook_brdm2AGS_TKINS","pook_brdm2AA_TKINS","pook_brdm2RKT_TKINS","pook_brdm2PKM_TAK","pook_brdm2HQcomm_TAK","pook_brdm2HQ_TKINS","pook_brdm2DSHK_TAK","pook_brdm2AT5_TAK","pook_brdm2AT3c_TKINS","pook_brdm2AT3_TKINS","pook_brdm2AT2_TKINS","pook_brdm2M_TAK","pook_brdm2_TAK","pook_brdm2_sa9_TAK"];
//tanks
	EGG_EVO_eastveh7 = EGG_EVO_eastveh7 + ["PRACS_TK_T80B","PRACS_2s1_TK","PRACS_Sa6_TK","PRACS_TK_SA8","PRACS_TK_SA13","PRACS_TK_BMP1","pook_ZSU_TAK","pook_ZSU57_TAK","BMP2_MOL","T72_MOL","ibr_T55","T34_TK_EP1","pook_T3485_TK_INS","pook_OT3485_TAK","pook_OT3485_TK_INS","T55_TK_EP1","pook_T55_TK_INS","pook_T54_TAK","pook_T54_TK_INS","pook_TO55_TAK","pook_TO55_TK_INS"];
//AA defences
	EGG_EVO_eastveh11 = ["PRACS_Sa6_TK","PRACS_TK_SA8","PRACS_TK_URAL_SAM","PRACS_TK_SA13","EB_2S6M_Tunguska_D","pook_ZSU_TAK","pook_ZSU57_TAK","pook_brdm2_sa9_TAK","pook_9K331_TAK","pook_9K332_TAK","pook_9K37_TAK","pook_9K37M2_TAK","pook_9K317_TAK","pook_9K317M2_TAK","pook_96K6_TAK"];
//statics
	EGG_EVO_eastveh13 = ["PRACS_M266AAgun","PRACS_Type74AAgun","PRACS_Type66_Gun","PRACS_TK_SA2","PRACS_TK_D20","Igla_AA_pod_TK_EP1","AGS_TK_EP1","D30_TK_EP1","KORD_high_TK_EP1","Metis_TK_EP1","2b14_82mm_TK_EP1","DSHKM_TK_INS_EP1","DSHkM_Mini_TriPod_TK_INS_EP1","SPG9_TK_INS_EP1","INS_WarfareBMGNest_PK","pook_ZPU4_TAK","pook_s60_TK","ZU23_TK_INS_EP1"];

	EGG_EVO_eastveh14 = ["PRACS_TK_MTLB_APC","PRACS_TK_URAL_SAM","Offroad_DSHKM_INS","Pickup_PK_INS","BTR40_MG_TK_INS_EP1","LandRover_MG_TK_EP1","LandRover_SPG9_TK_EP1","LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1","UAZ_AGS30_TK_EP1","UAZ_MG_TK_EP1","UAZ_SPG9_INS","GRAD_TK_EP1","Ural_ZU23_TK_EP1","BRDM2_TK_EP1","BRDM2_ATGM_TK_EP1","BTR60_TK_EP1","M113_TK_EP1","BMP2_HQ_TK_EP1","EB_GAZ_Vodnik_HMG_TK","EB_GAZ_Vodnik_TK","BTR90_HQ","pook_brdm2AGS_TKINS","pook_brdm2AA_TKINS","pook_brdm2RKT_TKINS","pook_brdm2PKM_TAK","pook_brdm2HQcomm_TAK","pook_brdm2HQ_TKINS","pook_brdm2DSHK_TAK","pook_brdm2AT5_TAK","pook_brdm2AT3c_TKINS","pook_brdm2AT3_TKINS","pook_brdm2AT2_TKINS","pook_brdm2M_TAK","pook_brdm2_TAK","pook_brdm2_sa9_TAK","ibr_datsun_mol","ibr_datsun_molblk","pook_BTR40_twinMG_TAK","pook_BTR40_twinMG_TK_INS","pook_BTR40_patrol_TAK","pook_BTR40_patrol_TK_INS","pook_BTR40_PK_TAK","pook_BTR40_PK_TK_INS","pook_BTR40_RR57_TAK","pook_BTR40_RR57_TK_INS","pook_BTR40_RR73_TAK","pook_BTR40_RR73_TK_INS","pook_BTR40_RR106_TAK","pook_BTR40_RR106_TK_INS","pook_BTR40_MORTAR_TAK","pook_BTR40_MORTAR_TK_INS","pook_BTR40_zu23_TAK","pook_BTR40_zu23_TK_INS","pook_BTR152_DSHK_TAK","pook_BTR152_DSHK_TK_INS","pook_BTR152_ZPU_TAK","pook_BTR152_ZPU_TK_INS","pook_Ural_ZU23_TK_INS","pook_Ural_S60_TAK","pook_Ural_S60_TK_INS"];

	EGG_EVO_mevlight = ["UAZ_MG_INS","Offroad_DSHKM_INS","Pickup_PK_INS","BRDM2_INS","ibr_datsun_mol","ibr_datsun_molblk"];
EGG_EVO_mevlighta = ["BRDM2_ATGM_INS","UAZ_AGS30_INS","UAZ_AGS30_RU","UAZ_SPG9_INS","BMP2_HQ_INS","EB_GAZ_Vodnik_HMG_TK","EB_GAZ_Vodnik_TK","ibr_datsun_mol","ibr_datsun_molblk"];
	EGG_EVO_mevmed = ["Ural_ZU23_INS","GRAD_INS","BTR90_HQ","BVP1_TK_ACR","BMP2_MOL","T72_MOL"];
	EGG_EVO_mevmeda = ["BMP2_INS","BVP1_TK_ACR","BMP2_MOL"];
	EGG_EVO_mevheavya = ["T72_INS","BMP3","ZSU_INS","BMP2_MOL","T72_MOL","ibr_T55"];
	EGG_EVO_mevheavyb = ["2S6M_Tunguska","Mi24_P","FRL_Mi8_MTV3_RUS_AGM","BMP2_MOL","T72_MOL","ibr_T55"];
	EGG_EVO_mevconvoya = ["UralSupply_TK_EP1","UralSalvage_TK_EP1","UralReammo_TK_EP1","UralRefuel_TK_EP1","UralRepair_TK_EP1"];
	EGG_EVO_mevconvoyb = ["Ural_INS","V3S_TK_EP1","V3S_Open_TK_EP1"];

};

if (EGG_vecmods == 2) then
{
	execVM "addons\RKSL.sqf";

//heli unarmed

	EGG_EVO_westveh1 = ["ad_mh60k_black","UH60M_EP1","CH_47F_BAF","BAF_Merlin_HC3_D"];

//heli armed

	EGG_EVO_westveh2 = ["AH1Z","AH1Z","BAF_Apache_AH1_D","BAF_Apache_AH1_D","rksl_lynx_ah7se_gpmg","rksl_lynx_ah7se_gpmg","AW159_Lynx_BAF","AW159_Lynx_BAF"];

	EGG_EVO_westvehM2 = ["AH6J_EP1","AH6J_EP1","GazelleD","GazelleD"];

	EGG_EVO_westlhdheli1 =["BAF_Apache_AH1_D","BAF_Apache_AH1_D","AH1Z","AW159_Lynx_BAF","rksl_lynx_ah7se_gpmg","Gazelle1"];

//planes

	EGG_EVO_westveh9 = ["AV8B","AV8B2","STI_A10_DESERT","STI_A10_SHARK_GREEN","L159_ACR","L159_ACR","3lb_f22","3lb_f22","An2_2_TK_CIV_EP1","C130J_US_EP1"];

	EGG_EVO_westvehM9 =["JS_FA18E","JS_FA18E","JS_FA18F","JS_FA18F","rksl_efa_fgr4_1","rksl_efa_fgr4_1"];

	EGG_EVO_westlhdplane1 = ["AV8B","AV8B2","F35B"];

	EGG_EVO_HANGARS =["Land_Mil_hangar_EP1","Land_Mil_hangar_EP1"];

//helipad types
	EGG_EVO_HELIPAD =["HeliHEmpty","HeliH","HeliHRescue"];

	EGG_EVO_westveh10 = ["PRACS_Type66_Gun","PRACS_M266AAgun","PRACS_Type74AAgun","PRACS_HAWK","PRACS_M429_CRAM","PRACS_M302_SAM","PRACS_351_SAM","PRACS_M460_SAM","PRACS_LAV_SAM"];

};

if (EGG_vecmods == 3) then
{
	execVM "addons\PRACS.sqf";
	EGG_EVO_westveh9 = ["AV8B","AV8B2","A10","A10_US_EP1","F35B","PRACS_F15","PRACS_F16_PHSTRK","PRACS_F16_AT","PRACS_Mohawk","PRACS_C130"];
	EGG_EVO_westvehM9 =["PRACS_Etendard_ATK","PRACS_Etendard_GBU","PRACS_Mirage3_ATK","PRACS_Mirage3_BMB","PRACS_A4_ATK","PRACS_A4_HBMB"];

//heli unarmed
	EGG_EVO_westveh1 = ["PRACS_MH6J","PRACS_CH53","PRACS_CH46","PRACS_puma330_MG","PRACS_UH1H","PRACS_puma330_Marine","PRACS_puma330_MED"];

	EGG_EVO_westveh2 = ["AH64D","AH64D_EP1","PRACS_AB212_CAS_M","PRACS_AB212_CAS_MAT","AH1Z","AH1Z","AW159_Lynx_BAF","AH6J_EP1"];
	EGG_EVO_westvehM2 = ["PRACS_AH1S","PRACS_AH1S_2","PRACS_RAH6","PRACS_AB212_cas"];

	EB_PRACS_hydra = ["PRACS_F16_AT","PRACS_Mirage3_ATK","PRACS_Etendard_ATK","PRACS_A4_ATK","PRACS_AH6J","IkaR_F14_AGM_65"];

	EB_PRACS_nohydra = ["PRACS_F16_PHSTRK","PRACS_Mirage3_BMB","PRACS_Etendard_GBU","PRACS_A4_HBMB","PRACS_RAH6","IkaR_F14_AIM_54"];

EGG_EVO_westveh10 = ["PRACS_Type66_Gun","PRACS_M266AAgun","PRACS_Type74AAgun","PRACS_HAWK","PRACS_M429_CRAM","PRACS_M302_SAM","PRACS_351_SAM","PRACS_M460_SAM","PRACS_LAV_SAM"];

EGG_EVO_westlhdheli1 =["PRACS_AH1S","PRACS_AH1S_2","PRACS_RAH6","PRACS_AB212_cas","PRACS_AB212_CAS_M","PRACS_AB212_CAS_MAT"];

EGG_EVO_westlhdplane1 = ["PRACS_F16_PHSTRK","PRACS_F16_AT","PRACS_Mirage3_BMB"];

};

//unsung
if (EGG_vecmods == 4) then
{
	execVM "addons\unsung.sqf";

//heli unarmed x4
	EGG_EVO_westveh1 = ["uns_ch34army","uns_ch47","csj_ch46","uns_ch53"];
//heli armed x8
	EGG_EVO_westveh2 = ["CSJ_UH1supply","CSJ_UH1transport","CSJ_UH1med","CSJ_UH1Slick","CSJ_oh6","CSJ_oh6a","uns_oh58a","uns_oh58b"];
//mod heli x4
	EGG_EVO_westvehM2 = ["CSJ_UH1Slick","csj_uh1gun","csj_ghornet","CSJ_AH1g"];

//planes 4x2+2
	EGG_EVO_westveh9 = ["uns_A1J","uns_A1J","uns_A7_CAP","uns_A7_CAP","uns_f100b_CAP","uns_f100b_CAP","uns_F4_CAP","uns_F4_CAP","CSJ_O1","CSJ_C123"];
//mod planes 3x2
	EGG_EVO_westvehM9 =["A6_Intruder","uns_F4_CAS","uns_mig17_CAP","uns_mig17_CAS","uns_Mig21_CAP","uns_Mig21_CAS"];
//carrier planes x3
	EGG_EVO_westlhdplane1 = ["uns_A7N_CAP","uns_F4Navy_CAP","uns_F4Navy_CAP"];

//carrier  heli 4 attack and 2 trans
	EGG_EVO_westlhdheli1 =["CSJ_UH1Slick","csj_uh1gun","csj_ghornet","CSJ_AH1g","uns_ch53","uns_ch34"];

	EGG_EVO_westveh10 = ["CSJ_Quad50","uns_guntruckM55"];

	EB_unsung_hydra = ["uns_F4_CAS","uns_mig17_CAS","uns_Mig21_CAS"];

	EB_unsung_nohydra = ["uns_F4_CAP","uns_F4Navy_CAP","uns_mig17_CAP","uns_Mig21_CAP"];

};

if (EGG_vecmods == 5) then
{
	execVM "addons\GLT.sqf";
	EGG_EVO_westvehM9 =["GLT_Falcon_mk82","GLT_Falcon_CAP","GLT_Falcon_MR","GLT_Falcon_AGM","GLT_Falcon_GBU","GLT_Falcon_euro_mk82","GLT_Falcon_euro_cap","GLT_Falcon_euro","GLT_Falcon_euro_AGM","GLT_Falcon_euro_GBU"];
};

//adding for reinforcements script
//hybrid arrays - used in modded missions scripts: side missions, convoys, reinforcements, etc
EGG_EVO_westair = EGG_EVO_westveh1+EGG_EVO_westveh2;
EGG_EVO_westchopM = EGG_EVO_westveh1+EGG_EVO_westveh3;
EGG_EVO_westplaneM = EGG_EVO_westveh2+EGG_EVO_westveh4;
EGG_EVO_westairM = EGG_EVO_westchopM+EGG_EVO_westplaneM;

EGG_EVO_eastair = EGG_EVO_mevaira+EGG_EVO_eastveh2;
EGG_EVO_eastchopM = EGG_EVO_mevaira+EGG_EVO_eastveh3;
EGG_EVO_eastplaneM = EGG_EVO_eastveh2+EGG_EVO_eastveh4;
EGG_EVO_eastairM = EGG_EVO_eastchopM+EGG_EVO_eastplaneM;


//Reinforce vehicles
EGG_EVO_westarm = EGG_EVO_westveh6+EGG_EVO_westveh7;
EGG_EVO_westlightM = EGG_EVO_westveh6+EGG_EVO_westveh9;
EGG_EVO_westheavyM = EGG_EVO_westveh7+EGG_EVO_westveh10;
EGG_EVO_westarmM = EGG_EVO_westlightM+EGG_EVO_westheavyM;
EGG_EVO_westunarmM = EGG_EVO_westveh5+EGG_EVO_westveh8;
EGG_EVO_westaaM = EGG_EVO_westveh11+EGG_EVO_westveh12;


//Mechanized reinforcement vehicles
EGG_EVO_eastarm = EGG_EVO_eastveh6+EGG_EVO_eastveh7;

EGG_EVO_eastlightM = EGG_EVO_eastveh6+EGG_EVO_eastveh9;
EGG_EVO_eastheavyM = EGG_EVO_eastveh7+EGG_EVO_eastveh10;
EGG_EVO_eastarmM = EGG_EVO_eastlightM+EGG_EVO_eastheavyM;
EGG_EVO_eastunarmM = EGG_EVO_eastveh5+EGG_EVO_eastveh8;
EGG_EVO_eastaaM = EGG_EVO_eastveh11+EGG_EVO_eastveh12;


aicon1 = "<img image='img\support\air.paa' size='1.0' shadow='false' />";
EB_astring1 = format ["<t color='#f79b31'>" +"%1 CAP"+ "</t>",aicon1];
aicon2 = "<img image='img\support\mark.paa' size='1.0' shadow='false' />";
EB_astring2 = format ["<t color='#f79b31'>" +"%1 CAS"+ "</t>",aicon2];
aicon3 = "<img image='img\support\sup01.paa' size='1.0' shadow='false' />";
EB_astring3 = format ["<t color='#f79b31'>" +"%1 AGM"+ "</t>",aicon3];
aicon4 = "<img image='img\support\offensive.paa' size='1.0' shadow='false' />";
EB_astring4 = format ["<t color='#f79b31'>" +"%1 MR"+ "</t>",aicon4];
aicon5 = "<img image='img\support\strk.paa' size='1.0' shadow='false' />";
EB_astring5 = format ["<t color='#f79b31'>" +"%1 BMB"+ "</t>",aicon5];
aicon6 = "<img image='img\support\vecs.paa' size='1.0' shadow='false' />";
EB_astring6 = format ["<t color='#f79b31'>" +"%1 LGB"+ "</t>",aicon6];
aicon7 = "<img image='img\support\sead.paa' size='1.0' shadow='false' />";
EB_astring7 = format ["<t color='#f79b31'>" +"%1 SEAD"+ "</t>",aicon7];
aicon8 = "<img image='img\support\cbu.paa' size='1.0' shadow='false' />";
EB_astring8 = format ["<t color='#f79b31'>" +"%1 CBU"+ "</t>",aicon8];


//LurchiAc130
//Check for Addon
if (!(isClass(configFile>>"CfgPatches">>"LDL_ac130"))) then 
{
	//No Addon detected
	//Spawn LDL_init
	LDL_init = compile preprocessFileLineNumbers "LDL_ac130\LDL_init.sqf";
	[]spawn LDL_init;    
}
else
{
	//Addon detected.
	//LDL_init = compile preprocessFileLineNumbers "LDL_ac130\LDL_init.sqf";
	//[]spawn LDL_init;
};

//Wait for the init
waitUntil {!isNil "LDL_initDone"};
waitUntil {LDL_initDone};

//Adjustments affect AC130.
LDL_AC130_Adjustments = 
[
	/* 0. Radius*/ 		1000 	/*Explanation: Radius for the rotating AC130. Default: 1000*/,
	/* 1. Height*/ 		1000  /*Explanation: Height for the rotating AC130. Default: 1000*/,
	/* 2. Munition 25mm*/ 	2000  /*Explanation: 25mm Munition. Default: 1000*/,
	/* 3. Munition 40mm*/ 	100	/*Explanation: 40mm Munition. Default: 50*/,
	/* 4. Munition 105*/ 	20	/*Explanation: 105mm Munition. Default: 20*/,
	/* 5. 360� View*/ 	false /*Explanation: Activate 360� view. Default: false*/,
	/* 6. Zoom 25mm*/ 	9.5	/*Explanation: Maximum zoom level for the 25mm. Default: 9.5 (only numbers between 1 and 10)*/,
	/* 7. Zoom 40mm*/ 	9	/*Explanation: Maximum zoom level for the 40mm. Default: 9 (only numbers between 1 and 10)*/,
	/* 8. Zoom 105mm*/ 	8	/*Explanation: Maximum zoom level for the 105mm. Default: 8 (only numbers between 1 and 10)*/,
	/* 9. Time AI*/ 	180	/*Explanation: Time in seconds the AI controlled AC130 stays in the air. Default: 180*/,
	/*10. Mapclicks*/ 	3	/*Explanation: Available AC130 mapclicks per player. Default: 3*/,
	/*11. Optical Zoom*/ 	false /*Explanation: Enable Optical Zoom. Default: false !BETA only available for rotating AC130 BETA!*/,
	/*12. Delay*/ 		0 	/*Explanation: Delay for mapclick AC130 to arrive. Default: 120*/
];

//Adjustments affect both AC130 and UAV.
LDL_Adjustments =
[
	/* 0. Infantry Strobes*/  [true, true] 	/*Explanation: Enable Infantry Strobes / Show them at startup. Default: [true, true]*/,
	/* 1. Vehicle Detection*/ [false, false]/*Explanation: Enable Vehicle Detection / Show it at startup. Default: [false, false]*/,
	/* 2. Particles*/ 	  true 		/*Explanation: Show Particles. Default: true*/,
	/* 3. Monitor*/           true		/*Explanation: Show Monitor. Default: true*/,
	/* 4. Third-Person View*/ true		/*Explanation: Enable Third-Person View. Default: true*/,
	/* 5. Radio Traffic*/ 	  true		/*Explanation: Enable Radio Traffic at startup. Default: true*/,
	/* 6. Sequence*/ 	  true		/*Explanation: Show sequence at startup. Default: true*/,
	/* 7. Camera Effect*/ 	  1 			/*Explanation: Camera effect at startup: 1 (Nothing), 2 (FLIR white), 3 (FLIR black), 4 (NVG). Default: 1*/,
	/* 8. Script Stop*/ 	  -1			/*Explanation: Time in seconds until script stops. Default: -1 (infinite)*/,
	/* 9. Waypoints*/ 	  false 		/*Explanation: Show waypoints at startup. Default: false*/,
	/*10. Faction*/ 	  faction player 	/*Explanation: Faction belonging the AC130. Default: faction player*/,
	/*11. Side*/ 	  	  side player 	/*Explanation: Side belonging the AC130. Default: side player*/
];

//Adjustments affect UAV.
LDL_UAV_Adjustments = 
[
	/* 0. Radius*/ 				1000 	/*Explanation: Radius for the rotating UAV. Default: 1000*/,
	/* 1. Height*/ 				1000  /*Explanation: Height for the rotating UAV. Default: 1000*/,
	/* 2. Munition Mounted Hellfire*/ 	8  	/*Explanation: Available Hellfires. Default: 8*/,
	/* 3. Munition Hellfire Strike*/ 	3	/*Explanation: Available Hellfires Strikes. Default: 3*/,
	/* 4. Zoom Mounted Hellfire*/           9.5	/*Explanation: Maximum zoom level for the Mounted Hellfire. Default: 9.5 (only numbers between 1 and 10)*/,
	/* 5. Zoom Hellfire Strike*/ 		9.5	/*Explanation: Maximum zoom level for the Hellfire Strike. Default: 9.5 (only numbers between 1 and 10)*/,
	/* 6. Mapclicks*/ 			3	/*Explanation: Available UAV mapclicks per player. Default: 3*/,
	/* 7. Delay*/ 				0 	/*Explanation: Delay for mapclick UAV to arrive. Default: 120*/
];

//Available in game actions to start the AC130.
LDL_inGameActions =
[
	true, //0: AC130 Co-Pilot can activate camera view via "AC130 Camera"
	true, //1: AC130 Pilot can start rotate script via "AC130 Autopilot"
	true, //2: Player can command AI AC130 from the ground via "AC130 Cease/Open Fire", "AC130 Attack Position", "AC130 Return Home"
	true  //3: LDL-Systems: AC130 Pilot and AC130 Co-Pilot have the ability to start coop script (Multiplayer)
];
//############################################################
EGG_sinit =1; publicVariable "EGG_sinit";


if (isServer and not (local player)) exitWith {}; 

// Large marker seen over occupied cities
BIS_EVO_MainObjective = createMarkerLocal ["MainObj", getMarkerPos "mobj1"];
BIS_EVO_MainObjective setMarkerColorLocal "ColorBlack";
BIS_EVO_MainObjective setMarkerShapeLocal "ELLIPSE";
BIS_EVO_MainObjective setMarkerSizeLocal [500, 500];

// For jip, client waits for server to run update.sqf
waitUntil {BIS_EVO_allvar_packed != ""};

_temp = compile BIS_EVO_allvar_packed;
_vars = call _temp;
BIS_EVO_end = _vars select 0;
BIS_EVO_MissionProgress = _vars select 1;
BIS_EVO_lives = _vars select 2;
//adding
execVM "briefing.sqf";
//titleCut ["","black faded", 0];
player addEventHandler ["hit", {_this call compile preprocessFileLineNumbers "data\scripts\hit.sqf"}];
