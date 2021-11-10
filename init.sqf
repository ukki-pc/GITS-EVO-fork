enableEnvironment true;
//creating center east/ setting relations
//Macros
#include "data\scripts\macros.h"
//
//rug_dsai settings [EAST, WEST, GUER, CIV, sideEnemy]
RUG_DSAI_SIDES = ["RUG_DSAIArab","RUG_DSAIENG","RUG_DSAISPA","RUG_DSAIArab","RUG_DSAIArab"];

RUG_DSAI_TerminalDistance = 200;

EGG_sinit = 0;publicVariable "EGG_sinit";

//Air units respawn frequency for use with type of unit - multiplied by difficulty 60,30,10,5 (hardest)
BIS_EVO_airspawnfreqa = 60; //longest sleep = easier
BIS_EVO_airspawnfreqb = 45;
BIS_EVO_airspawnfreqa = 30;// shortest sleep = harder

//AIR,AA,AT,ARTY,TANK,INF,MECH,SEA
//strategicResponse = [0,0,0,0,0,0,0,0];
aggression = 0;
AIRaggr=100;
AAaggr=100;
ATaggr=100;
ARTYaggr=100;
TANKaggr=100;
INFaggr=100;
MECHaggr=100;

//Sets the deck height accordingly when setting player to specific carrier
deckHeight = LHDDECK;

totalIncome = 0;
spot=false;
weaponsNamespace = [];


bank = [];
capturedFlags = [];
enemyFlags = [];

spotId=250;
spottedIds = [];


/////////////////Dwarden fixing fire in the sky bug

BIS_Effects_EH_Killed=compile preprocessFileLineNumbers "new_effects\killed.sqf";
BIS_Effects_AirDestruction=compile preprocessFileLineNumbers "new_effects\AirDestruction.sqf";
BIS_Effects_AirDestructionStage2=compile preprocessFileLineNumbers "new_effects\AirDestructionStage2.sqf";

_hudMsg = [] execVM "data\scripts\kill_feed.sqf";
_functions = [] execVM "data\scripts\common_funcs.sqf";
_functionsC = [] execVM "data\scripts\client_funcs.sqf";
_functionsS = [] execVM "data\scripts\spawn_funcs.sqf";

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
"BIS_effects_gepv" addPublicVariableEventHandler {(_this select 1) call BIS_Effects_startEvent};

skillfactor = ((1 + random 2)/10);
Spymade = 0;
EGG_hidetotal = 6;

currentControl = 1;
activeControls = [];
control = 2000;

//editori
editor = 1; publicVariable "editor";

R3F_LOG_mutex_local_verrou = false;

if(isMultiplayer) then {
hardcore = param1;
LHDCarrier = paramsArray select 1;
EVOhour = paramsArray select 2;
grasslevel = paramsArray select 3;
if (grasslevel == 0) then {setTerrainGrid 50};
if (grasslevel == 1) then {setTerrainGrid 25};
if (grasslevel == 2) then {setTerrainGrid 12.5};
if (grasslevel == 3) then {setTerrainGrid 6.25};
if (grasslevel == 4) then {setTerrainGrid 3.125};
viewparam =  paramsArray select 4;
hasCarrier = paramsArray select 5;
gitsnades = paramsArray select 6;
BIS_EVO_vehRespawnCount = paramsArray select 7;
ranklock = paramsArray select 8;
deathScorePenalty = paramsArray select 9;
rankscore = paramsArray select 10;
//adding	
helpersparam = paramsArray select 11;
recruitPlaces = paramsArray select 12;
perkparam = paramsArray select 13;
EGG_EVO_Artycost = paramsArray select 14;
paratroopers = paramsArray select 15;
enemynumdiv = paramsArray select 16;
reinfdelay = paramsArray select 17;
EGG_vecmods = paramsArray select 18;
//temp
EGG_unitwest = paramsArray select 19;
EX_EVO_vehPriceMultiplier = paramsArray select 20;
EVO_incomeFrequency = paramsArray select 21;
EGG_EVO_FactionParam = paramsArray select 22;
EGG_EVO_LoadGame = paramsArray select 23;
};

hitMarker = true;
lastBase = "";

Carrier = false;

if (!isMultiplayer) then
{
	onMapSingleClick "if (_alt) then {vehicle player setpos _pos;{vehicle _x setpos _pos} forEach _units}";
	//player allowDamage false;
	Param1 = 0;
	hardcore = 0;
	LHDCarrier = 1;
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
	ranklock = 3;
	jailparam = 0;
	rankscore = 5000;
	//adding	
	helpersparam =2;
	deathScorePenalty = 0;
	//"Free & Bases","Bases & Towns Free","Bases free & Towns cost","Costs everywhere"
	recruitPlaces = 1;
	perkparam = 1;
	EGG_EVO_Artycost =4;

	// Limited,"Expensive","Normal","Free"
	paratroopers = 1;
	enemynumdiv = 1;
	reinfdelay = 120;
	EGG_highCommand = 0;
	EX_EVO_vehPriceMultiplier = 1;
	EVO_incomeFrequency = 120;
	EGG_EVO_FactionParam = 0;
	EGG_EVO_LoadGame = 0;
	BIS_EVO_vehRespawnCount = 2;
	player allowDamage false;
};

helicopterhitch = 0;
basebeam = 2;
BIS_EVO_rank1 = (rankscore * 1);
BIS_EVO_rank2 = (rankscore * 2);
BIS_EVO_rank3 = (rankscore * 3);
BIS_EVO_rank4 = (rankscore * 4);
BIS_EVO_rank5 = (rankscore * 5);
BIS_EVO_rank6 = (rankscore * 6);

//Respawn settings
respawnPoint = "Respawn_West";
publicVariable "hardcore";

//if(carrier) then {"Respawn_west" setMarkerPos [(getMarkerPos "FahneLKW" select 0),(getMarkerPos "FahneLKW" select 1),18];};

enableEnvironment true;

BIS_EVO_rengZones = [reng1,reng2,reng3,reng4];

//IF new game selected start the game without hesitation
if(EGG_EVO_LoadGame == 0) then {gameBegin = 1}
else{hint "Load game selected please paste the saved data into the console"};

EGG_EVO_PLAYERFACTION = nil;
EGG_EVO_ENEMYFACTION = nil;
EGG_EVO_strENEMYFACTION = nil;
EGG_EVO_strPLAYERFACTION = nil;

//Auto faction
switch (side player) do 
{
	case east:
	{
		EGG_EVO_FactionParam = 0;
		enemyFlag = "FlagCarrierBLUFOR_EP1";
		playerFlag = "FlagCarrierOPFOR_EP1";
		enemyColor = [0, 0, 0.62, 1];
		playercolor = [0.62, 0, 0, 1];
	};
	case west:
	{
		EGG_EVO_FactionParam = 1;
		playerFlag = "FlagCarrierBLUFOR_EP1";
		enemyFlag = "FlagCarrierOPFOR_EP1";
		playercolor = [0, 0, 0.62, 1];
		enemyColor = [0.62, 0, 0, 1];
	};
	case resistance:
	{
		EGG_EVO_FactionParam = 2;
		playerFlag = "FlagCarrierBLUFOR_EP1";
		enemyFlag = "FlagCarrierOPFOR_EP1";
	};
};

neutralcolor = [1,1,1,1];

switch (EGG_EVO_FactionParam) do 
{
	case 0:
	{
		fac = execVM "data\scripts\factionInitEAST.sqf";
	};
	case 1:
	{
		fac = execVM "data\scripts\factionInitWEST.sqf";
	};
	case 2:
	{
		fac = execVM "data\scripts\factionInitRESISTANCE.sqf";
	};
};

//Holds the flags objects
bunkers = [];

baseOwner = "US_ED";

upgs = execVM "data\scripts\vecUpgrades.sqf";

EGG_EVO_allAmbs = ["Land_A_tent","BAF_Offroad_D","EB_LR_Supply_D_BAFX","RE_landrover6x6_BAF"];
BIS_EVO_frameDelay = 0.016; // 60FPS equals ~16ms 
BIS_EVO_GlobalSleep = 0.1; // Global sleep is used after spawning a unit.
// Sub mission conditions
BIS_EVO_MissionProgress = -1; 
BIS_EVO_Onmission=false; 
BIS_EVO_sobj1=false;
reinforcements=false;
reinforceRange = 2600;

constructList = 
[
	"Land_ladder_half",
	"Land_ladder",
	"MK19_TriPod_US_EP1",
	"KORD_high_UN_EP1",
	"Stinger_Pod",
	"Igla_AA_pod_East",
	"ZU23_TK_INS_EP1",
	"TOW_TriPod_US_EP1",
	"M119_US_EP1",
	"SPG9_TK_GUE_EP1",
	"Metis_TK_EP1",
	"KORD_high_UN_EP1",
	"DSHkM_Mini_TriPod_TK_GUE_EP1",
	"Fort_Nest_M240",
	"M2HD_mini_TriPod_US_EP1",
	"M2StaticMG_US_EP1",
	"Land_CamoNetVar_NATO",
	"Barrels",
	"M252_US_EP1",
	"Land_fortified_nest_small",
	"Land_fort_bagfence_round",
	"Land_BagFenceRound",
	"Land_BagFenceLong"
];

Foxholeplaced = 1;

//adding strings for city names
//BIS_EVO_Townnames = ["CAINNA WIND","CAMARRA","KINSELLA","DJOLAN","KWAKO","DENDALA DISTRICT","BOLABONGO","ENGOR","CANTO","NUBAK","NUMBO"];// Each mission name used in eventsc, mainthreadc, sorew, briefing, used as _city = (BIS_EVO_Townnames select BIS_EVO_MissionProgress);

BIS_EVO_Townnames = ["OBEJCTIVE"];// Each mission name used in eventsc, mainthreadc, sorew, briefing, used as _city = (BIS_EVO_Townnames select BIS_EVO_MissionProgress);


// OLD SPAWN VALUES OBSOLETE SOON
BIS_EVO_Infantry = [[42,40],[50,48],[65,50],[68,52],[70,56],[75,60],[77,65],[80,68],[85,70],[88,73],[92,76]];//[Actual number of groups,Base number of groups]
BIS_EVO_Mechanized = [[8,8],[12,10],[16,14],[19,14],[19,14],[19,14],[19,14],[21,15],[21,17],[23,18],[23,20]];//[Actual number of groups,Base number of groups]

BIS_EVO_InfantrySpawn = 42;
BIS_EVO_InfantryTarget = 40;

BIS_EVO_MechanizedSpawn = 4;
BIS_EVO_MechanizedTarget = 8;

BIS_EVO_vdist=viewparam;                          // clients saved view distance
BIS_EVO_avdist=viewparam;    			   // clients saved air vehicle view distance
//adding variable to set terrain grid and store it for each player
BIS_EVO_grid=grasslevel;    			   // clients saved terrain option
BIS_EVO_gdate = [2007,13,8,EVOhour,59];        // Current date and time

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
inrepairzone=false;

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

defenceReady = false; //Avoid certain events during objective population

money = 2000;
playerRank = 0;
perkPoints = 2;
eResupplying = false;

//List of vehicles that are unlocked through objective capture
BIS_EVO_unlockables = [
	"PRACS_MLRS",
	"PRACS_M245_TEL",
	"RM70_ACR",
	"JS_JC_FA18E_USMC",
	"EB_M1A3_TUSK_D",
	"FRL_F15C_MR",
	"EB_M1A2_US_D",
	"PRACS_LEO2A4",
	"AH1Z",
	"AH64D",
	"FRL_F16_MR",
	"F35B",
	"FRL_F111_D_MR",
	"PRACS_A4",
	"FRL_AV8B_MR",
	"pook_EF2000_BAF_D_DEAD",
	"FRL_A10_MR"
];
							// AV8B


// Common function to lock vehicles.
BIS_EVO_Lock =
{
	_vec = _this select 0;
	if(Param1 == 7) then {_vec lock true} else {_vec lock false};
};


//HIGH COMMAND MODULE
EGG_highCommand = 0;
if (EGG_highCommand == 1) then {
//High command extensions stuff

enableTeamSwitch false;

// Config Options (these can also flipped with menu commands)

missionNamespace setVariable ["HCExtAllowRunTimeConfigChanges", true];

missionNamespace setVariable ["HCExtAllowAddAndDeleteWp", false];
missionNamespace setVariable ["HCExtMaxNumGroupsNewWaypoints", 6];

missionNamespace setVariable ["HCExtShowHCIconsOnlyInHCMode", true];
missionNamespace setVariable ["HCExtHideOtherSideIcons", true];
missionNamespace setVariable ["HCExtHideEnemySideIcons", true];
missionNamespace setVariable ["HCExtHideAccessToOtherSides", true];
missionNamespace setVariable ["HCExtHideAccessToEnemySides", true];
missionNamespace setVariable ["HCExtHideStatsOnOtherSides", true];
missionNamespace setVariable ["HCExtHideStatsOnEnemySides", false];

[] execVM "HCfunc\HCrep\InitHC.sqf";
};

allMagazines = ["pipebomb"];
magazineBanList = ["EB_2000Rnd_762x51_NATO_Ball","EB_3000Rnd_762x51_NATO_Ball","EB_4200Rnd_762x51_NATO_Ball"];



capturedAirportIn = false;
capturedFarp1 = true;
capturedFarp2 = false;
capturedFarp3 = false;
capturedFarp4 = false;
capturedDock1 = false;

RHQMarkers = [];
inFarp = false;
canRefuel = false;
canRepair = false;
canAmmo = false;
canFasttravel = false;
canRecruit = false;
showMoney = false;


BIS_EVO_MissionTowns = [];
BIS_EVO_MissionBigTowns = [];
BIS_EVO_MilitaryObjectives = [];
BIS_EVO_MissionVillages = [];
BIS_EVO_CoastalTowns = [];
BIS_EVO_MissionObjMarkers = [];
BIS_EVO_MissionTownNames = [];
airports = [objective_1,objective_42,objective_37,objective_43];
currentTown = objNull;

startingTowns = [];

BIS_EVO_conqueredTowns = startingTowns; //Set starting town


if(isServer) then {

//NEW TOWN GENERATION
allObjs = nearestObjects [getpos cent, ["LocationLogic"], 12000];

{
	_townType =	_x getVariable "type";
	_isCoastal = (_x getVariable "coastal");
	_townName =	_x getVariable "name";
	_isCoastal = !(isNil "_isCoastal"); //Not maybe necessary

	switch (_townType)  do
	{
		case "city": 
		{
			BIS_EVO_MissionBigTowns set [_forEachIndex,_x];
			// BIS_EVO_MissionTownInfGarrisons set [_forEachIndex,250+round random(150)];
			// BIS_EVO_MissionTownVecGarrisons set [_forEachIndex,10+round random(13)];
		};
		case "military": 
		{
			BIS_EVO_MilitaryObjectives  set [_forEachIndex,_x];
			// BIS_EVO_MissionTownInfGarrisons set [_forEachIndex,100+round random(150)];
			// BIS_EVO_MissionTownVecGarrisons  set [_forEachIndex,20+round random(20)];
		};
		case "town": 
		{
			BIS_EVO_MissionVillages set [_forEachIndex,_x];
			// BIS_EVO_MissionTownInfGarrisons set [_forEachIndex,100+round random(100)];
			// BIS_EVO_MissionTownVecGarrisons set [_forEachIndex,6+round random(11)];
		};
	};

	if(_isCoastal) then {BIS_EVO_CoastalTowns set [_forEachIndex,_x]};

	BIS_EVO_MissionTowns set [_forEachIndex,_x];
	BIS_EVO_MissionTownNames set [_forEachIndex,_townName];
} forEach allObjs;

//High priority functions
//_rng = [] execVM "data\scripts\weightedRandom.sqf";
};

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

movingMarkers = [];
defendAlarm = false;
EGG_problemcraft =  ["PRACS_TK_Su22","PRACS_TK_Su22_BMB","PRACS_TK_Su22_MSL","PRACS_TK_Su22_IND","PRACS_T K_Su22_STA","PRACS_TK_Su24Fencer","PRACS_TK_Su24Fencer_GBU","PRACS_TK_Su24Fencer_STK","PRACS_TK_MiG21"];

//Planes with custom loadout
customPlanes = ["A4"];

EGG_EVO_repairtruck = ["MtvrRepair_DES_EP1","MtvrRepair","PRACS_M250_Repair","UralRepair_CDF","UralRepair_TK_EP1","UralRepair_INS","KamazRepair","T810Repair_ACR","t810_repair","pook_HEMTT_repair","pook_HEMTT_repair_US","pook_HEMTT_repair_CDF","pook_HEMTT_repair_CDF_IND","RE_landrover6x6_BAF"];
EGG_EVO_cargoTruck = ["V3S_TK_EP1"];
EGG_EVO_sniperhide = ["Land_sniper_hide_w_nato","Land_sniper_hide_d_nato","Land_sniper_hide_w_east","Land_sniper_hide_d_east"];

//all missiles, added missiles for hind at2 and havok missile and mig21 missile
EGG_EVO_miscamwepsM = ["M_Toophan_AT","EB_M_AT3_AT","EB_M_AT9_AT","EB_M_AT9F_AT","PRACS_TK_AA8","EB_M_AT2_AT","M_Sidewinder_AA","M_Sidewinder_AA_F35","M_Strela_AA","M_Igla_AA","M_Stinger_AA","M_AT2_AT","M_AT6_AT","M_AT9_AT","M_AT5_AT","M_AT10_AT","M_AT11_AT","M_AT13_AT","M_TOW_AT","M_TOW2_AT","M_Hellfire_AT","M_Maverick_AT","M_Vikhr_AT","M_Ch29_AT","M_R73_AA","M_9M311_AA","GLT_AIM9M_AA","GLT_AIM9X_AA","GLT_AIM120_AA","GLT_AIM7_AA","GLT_AIM54_AA","GLT_R3_AA","GLT_R27_AA","GLT_R73_AA","GLT_R77_AA","GLT_R550_AA","IkaR_F14_AIM9_ir","IkaR_F14_AIM54_ir","RKTF15_AIM9","RKTF15_AIM120","ffaa_Mistral_AA","GLT_Sidewinder_AA","GLT_SidewinderX_AA","GLT_AIM7E_AA","GLT_Maverick_AG","GLT_Harpoon_LGM","GLT_AGM65_AG","GLT_AGM84_AG","GLT_AGM88_AG","GLT_AGM114_AG","GLT_CH15_AG","GLT_CH29L_AG","GLT_CH29T_AG","GLT_CH59_AG","GLT_CH31_AG","GLT_AM39_AG","GLT_AS4_AG","IkaR_F14_AGM65_ir","ffaa_spike_AT","RKTF4HarmRaila","RKTF4SparrowRaila","RKT_Kitchen","RKT_Ch29_AT","RKT_R27_AA","RKT_R73_AA","RKSL_LYNX_TOW_AT","M_AT9_Mi28","RKSL_brimstone_rack","RKSL_harpoon","rksl_agm119mk3","rksl_aim9m","rksl_aim132","rksl_irist","rksl_aim120","rksl_meteor","RKSL_stormshadow","RKSL_ALARM"];
EGG_EVO_miscamwepM = EGG_EVO_miscamwepsM + ["GRAD","OFrP_155mm_Caesar","IRAN_NazeatLauncher","220mm_Launcher","ffaa_katiuska_launcher","PRACS_s213_BMS","M40A3","m107","M24","M4SPR","SVD","SVD_CAMO","ksvk","SMAW","Javelin","M1014","DMR","SidewinderLaucher_F35","BombLauncherF35"];

BIS_EVO_camVehicles = ["69B","PRACS_M250_TEL","PRACS_M291_TEL","RM70_ACR","PRACS_M245_TEL","PRACS_MLRS"];
//all airborne bombs
EGG_EVO_miscamwepsB = ["EB_Bo_GBU12","EB_Bo_FAB250","Bo_GBU12_LGB","Bo_GBU12_LGB_F35","Bo_FAB_250","RKTF4BLUBomb","RKTF4BombRaila","Bo_kb500_LGB","Bo_fb250_FFB","RKSL_PAVE2_500","RKSL_PAVE4_500","RKSL_PAVE2_1000","RKSL_GP_500","RKSL_GP_500RET","RKSL_GP_1000","RKSL_GP_1000RET","GLT_FAB250_Bo","GLT_FAB500_Bo","GLT_MK81_Bo","GLT_MK82_Bo","GLT_MK82_Bo","GLT_MK84_Bo","GLT_AGM154_LGB","GLT_GBU12_LGB","GLT_GBU53_LGB","GLT_KAB250_LGB","GLT_KAB500_LGB","GLT_KAB1500_LGB","IkaR_F14_GBU12_ir","RKTF15E_GBU10Bomb","RKTF15E_mk82Bomb","RKTF15E_cbuBomb","RKTF15E_mk84Bomb"];

//all laser guided weapons
//EGG_EVO_LaserLauncher = ["EB_AT2_Launcher","BombLauncher","BombLauncherF35","BombLauncherA10","HellfireLauncher","GLT_GBU12_Launcher","GLT_AGM154_Launcher","GLT_GBU53_Launcher","GLT_FFARLauncher_laser","GLT_Ch29LauncherLaser"];

BIS_EVO_spottingWeapons = ["EB_TIscanner","LRTV_ACR","Laserdesignator","Binocular_Vector","Binocular"];

//BIS_EVO_pallammo = ["pipebomb","Laserbatteries","HandGrenade_West","HandGrenade_West","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","7rnd_45ACP_1911","7rnd_45ACP_1911","7rnd_45ACP_1911","7rnd_45ACP_1911"];
// The players default load out
//BIS_EVO_pweapons = ["BAF_L85A2_RIS_SUSAT","Colt1911","Laserdesignator","NVGoggles"]; 
// The players default load out


Detections = []; //Radar detections
radars = [];
Enemyplanes = [];


//Tasks
"-1" objstatus "Active";
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
	_plyIncome = [] execVM "data\scripts\plyIncome.sqf";

	radio1 addEventHandler ["hit", {if((_this select 1) != BIS_EVO_latk) then {(_this select 0) setdamage 0}}];
//blazes
	onplayerconnected "
	plays = [_name] execVM ""data\scripts\selectplayer.sqf"";
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
};


//////////////////////////////////
//GITS air combat scripts

//modded loadout planes and helis
//EB_planes_west = ["pook_EF2000_BAF_MR","F4M_Des","yup_SH60B_penguin","pook_EF2000_BAF_D_MR","pook_EF2000_GER_MR","pook_EF2000_CDF_MR","pook_EF2000_CDF_IND_MR","pook_EF2000_GUE_MR","pook_EF2000_INS_MR","pook_EF2000_UNO_MR","pook_EF2000_TAK_MR","FRL_F16_MR","FRL_F16_D_MR","FRL_F111_MR","FRL_F111_D_MR","FRL_GR4_D_MR","FRL_GR4_MR","FRL_AV8B_MR","FRL_AV8B_BAFX_MR","FRL_A10_MR","FRL_A10_BAFX_MR","FRL_A10_D_MR","FRL_F35_MR","FRL_F35_BAFX_MR","FRL_F35B_MR","FRL_F35B_BAFX_MR","FRL_F15C_MR","FRL_F15C_D_MR","FRL_F15E_MR","FRL_F15E_D_MR","FRL_L159_MR","FRL_L39_MR","FRL_L59_MR","FRL_Su25_MR","FRL_Su25_CDF_MR","FRL_Su25_INS_MR","FRL_Su25_TK_MR","FRL_Su25_D_MR","FRL_Su34_MR","FRL_Su34_D_MR","FRL_Mig23B_RU_MR","FRL_Mig23B_CDF_MR","FRL_Mig23B_INS_MR","FRL_Mig23B_TK_MR","FRL_Mig23C_RU_MR","FRL_Mig23C_CDF_MR","FRL_Mig23C_INS_MR","FRL_Mig23C_TK_MR","FRL_Mig23K_RU_MR","FRL_Mig23K_CDF_MR","FRL_Mig23K_INS_MR","FRL_Mig23K_TK_MR","FRL_Mig27M_RU_MR","FRL_Mig27M_CDF_MR","FRL_Mig27M_INS_MR","FRL_Mig27M_TK_MR","FRL_Mig29_RU_MR","FRL_Mig29_RU_D_MR","FRL_Mig29_INS_MR","FRL_Mig29_CDF_MR","FRL_Mig29_CDF_IND_MR","FRL_Mig29_GUE_MR","FRL_Mig29_TAK_MR","FRL_Mig29_TK_INS_MR","FRL_Mig29_TK_GUE_MR","FRL_Mig35_RU_MR","FRL_Mig35_RU_D_MR","FRL_Mig35_INS_MR","FRL_Mig35_CDF_MR","FRL_Mig35_CDF_IND_MR","FRL_Mig35_GUE_MR","FRL_Mig35_TAK_MR","FRL_Mig35_TK_INS_MR","FRL_Mig35_TK_GUE_MR","FRL_Su27_RU_MR","FRL_Su27_RU_D_MR","FRL_Su27_INS_MR","FRL_Su27_CDF_MR","FRL_Su27_CDF_IND_MR","FRL_Su27_GUE_MR","FRL_Su27_TAK_MR","FRL_Su27_TK_INS_MR","FRL_Su27_TK_GUE_MR","FRL_Su30_RU_MR","FRL_Su30_RU_D_MR","FRL_Su30_INS_MR","FRL_Su30_CDF_MR","FRL_Su30_CDF_IND_MR","FRL_Su30_GUE_MR","FRL_Su30_TAK_MR","FRL_Su30_TK_INS_MR","FRL_Su30_TK_GUE_MR","FRL_Su30MKM_RU_MR","FRL_Su30MKM_RU_D_MR","FRL_Su30MKM_INS_MR","FRL_Su30MKM_CDF_MR","FRL_Su30MKM_CDF_IND_MR","FRL_Su30MKM_GUE_MR","FRL_Su30MKM_TAK_MR","FRL_Su30MKM_TK_INS_MR","FRL_Su30MKM_TK_GUE_MR","FRL_AH1Z_MR","FRL_AH1W_MR","FRL_AH64D_MR","FRL_AH6J_MR","FRL_AH6J_MR_D","FRL_AH6M_MR","FRL_AH6M_D_MR","FRL_Bo105pah_MR_DE","FRL_Bo105pah_MR_ACR","FRL_Bo105pah_MR_CDF","FRL_Bo105pah_MR_CDF_IND","FRL_Bo105pah_MR_GUE","FRL_Bo105pah_MR_INS","FRL_Bo105pah_MR_TAK","FRL_Bo105pah_MR_TK_GUE","FRL_Bo105pah_MR_TK_INS","FRL_Lynx_MR","FRL_UH60M_MR","FRL_MQ9_MR","FRL_MQ9_D_MR","FRL_Mi24D_MR","FRL_Mi24D_CDF_MR","FRL_Mi24D_TK_MR","FRL_Mi24D_D_MR","FRL_Mi24V_MR","FRL_Mi24V_CDF_MR","FRL_Mi24V_TK_MR","FRL_Mi24V_D_MR","FRL_Mi24P_MR","FRL_Mi24P_CDF_MR","FRL_Mi24P_TK_MR","FRL_Mi24P_D_MR","FRL_Ka52_MR","FRL_Ka52_MR_D","FRL_Mi28_MR","FRL_Mi28_INS_MR","FRL_Mi28D_TK_MR","FRL_Mi28NE_CDF_MR","FRL_Mi8_TBK_RUS_MR","FRL_Mi17_TVK_TAK_MR","FRL_Mi8_AMTSh_MR","FRL_Mi8_MTKO_RUS_MR","C130J","C130J_US_EP1","An2_2_TK_CIV_EP1","PRACS_RAH6	","PRACS_F16_PHSTRK","PRACS_A4_HBMB","PRACS_Mohawk","PRACS_AH1S","PRACS_AH1S_2","PRACS_Etendard_GBU","PRACS_Mirage3_BMB","PRACS_F15","PRACS_C130"];

EGG_maxMissiles = 6;
VehiclePlaced = 1;
repaircooldown = 0;

//hitRegister = [];



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


	EB_twoseaterplanes = ["FRL_Su34_D_CAP","FRL_Su34_D_CAS","FRL_Su34_D_HCAS","FRL_Su34_D_EHCAS","FRL_Su34_D_AGM","FRL_Su34_D_MR","FRL_Su34_D_LBMB","FRL_Su34_D_BMB","FRL_Su34_D_HBMB","FRL_Su34_D_LGB","FRL_Su34_D_SEAD","Su34","uns_F4_CAP","uns_F4Navy_CAP","uns_F4_CAS","uns_A6_Intruder_ECM","JS_FA18F","IkaR_F14_AIM_54","IkaR_F14_AGM_65","uns_f105F_WW"];

// Perks
perkSupLVL = 0;
perkAssaultLVL = 0;
perkSniperLVL = 0;
perkEngLVL = 0;

//Skillevels
supSkill = 0;
assaultSkill = 0;
sniperSkill = 0;
engSkill = 0;

//////////////////////////////////

//	execVM "addons\GITS.sqf";
//	execVM "addons\RKSL.sqf";
//	execVM "addons\PRACS.sqf";

_events = [] execVM "data\scripts\CityMarkers.sqf";

EGG_EVO_meflag = ["flag_mol"];

//Player unlocks
buySpecialList =[];
allowRHQ = false;
allowFarp = false;

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

rucksack = "";
//LurchiAc130
//Check for Addon
if (!(isClass(configFile>>"CfgPatches">>"LDL_ac130"))) then 
{
	//No Addon detected
	//Spawn LDL_init
	LDL_init = compile preprocessFileLineNumbers "LDL_ac130\LDL_init.sqf";
	LDL_plane_type = "";
	LDL_ac130_plane = objNull;
	[]spawn LDL_init;    

}
else
{
	//Addon detected.
	LDL_init = compile preprocessFileLineNumbers "LDL_ac130\LDL_init.sqf";
	[]spawn LDL_init;
	//Wait for the init

};

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
luatikko = "LENL119box" createVehicleLocal [0,0,0];
luatikko addAction ["Weapon menu", "actions\wepshop.sqf"];


if(EGG_EVO_LoadGame == 0) then 
{
    _allPlayers = call BIS_fnc_listPlayers;
    {["jed_addscore", [_x, 10]] call CBA_fnc_globalEvent}forEach _allPlayers;


	//Carrier spawn
	if (hardcore == 1) then 
	{
		Carrier = true;
		spawnLocSet = false;
		hint 'Pick a spawning location';
		openMap true;
		onMapSingleClick
			"
			if(!surfaceIswater _pos) then {spawnLocSet = false; hint 'Cannot set spawn at land'}
			else
			{
				'HMS-GITS' setMarkerPos _pos;
				//'FahneLKW' setMarkerPos _pos;
				spawnLocSet = true;
				hint 'Spawnpoint set';
			};
			";
		waitUntil{if( !visibleMap and !spawnLocSet) then {sleep 1; openMap true};(spawnLocSet and !visiblemap)};
		_baseDir = (markerDir 'HMS-GITS');

		_carrierType = "nimitz";

		switch (_carrierType) do
		{
			case "nimitz":
			{
				deckHeight = NIMITZDECK;
				_handle = ["nimitz",getMarkerPos 'HMS-GITS',_baseDir+90] call fnc_createCarrier;

				sleep 0.2;
				onMapSingleClick "";
				'Respawn_West' setMarkerPos getMarkerPos 'HMS-GITS';
				_basePos = getMarkerPos 'Respawn_West';

				'Respawn_West' setMarkerPos ([getMarkerPos 'HMS-GITS',markerDir 'HMS-GITS',44,-23,0,deckHeight] call fnc_relativePosition);
				
				//if you want to find carrier position use this command
				// _pos = getmarkerPos 'HMS-GITS';
				// _xDiff = ((_pos select 0)-((getpos player) select 0));
				// _yDiff = ((_pos select 1)-((getpos player) select 1));
				// copytoClipBoard str ([_xDiff,_yDiff]);

				//LKWWEST setVehiclePosition [_finalPos,[],0,""];
				LHDin setPos _basePos;
				LHDin setDir _baseDir;
				// 'ammob1' setMarkerPos _basePos;
				LKWWEST setPosAsl ([getMarkerPos 'HMS-GITS',markerDir 'HMS-GITS',134,25,0,deckHeight] call fnc_relativePosition);
				LKWWEST setDir (markerDir 'HMS-GITS')+90;
				"ammob1" setMarkerPos ([getMarkerPos 'HMS-GITS',markerDir 'HMS-GITS',44,9,0] call fnc_relativePosition);
				luatikko setPosASL ([getMarkerPos 'HMS-GITS',markerDir 'HMS-GITS',64,32,0,deckHeight] call fnc_relativePosition);
			// "campMark" setMarkerPos _basePos;
			};
		};

			{	
		_x setPosASL ([getMarkerPos 'HMS-GITS',markerDir 'HMS-GITS',70,30,0,deckHeight] call fnc_relativePosition);
	} forEach everyPlayer;			
	}
	else 
	{
		spawnLocSet = false;
		hint 'Pick a spawning location';
		openMap true;
		onMapSingleClick
			"
				if(surfaceIswater _pos) then {spawnLocSet = false; hint 'Cannot set spawn at water'}
				else
				{
					'Respawn_West' setMarkerPos _pos;
					'FahneLKW' setMarkerPos _pos;
					spawnLocSet = true;
					hint 'Spawnpoint set';
				};
			";
		
		waitUntil{sleep 1; if(!visibleMap and !spawnLocSet) then {openMap true};(spawnLocSet and !visiblemap)};
		onMapSingleClick "";
		_basePos = getMarkerPos 'Respawn_West';
		{_x setPos _basePos} forEach _allPlayers;
		farp1 setPos _basePos;
		'ammob1' setMarkerPos _basePos;
		LKWWEST setVehiclePosition [_basePos,[],5,""];
		luatikko setPos getMarkerpos 'ammob1';
		"campMark" setMarkerPos _basePos;
	};
};


clearMagazineCargo luatikko; clearWeaponCargo luatikko; luatikko allowDamage false;
weaponBoxes = [luatikko];
{_handle = [_x] execVM "actions\refreshweps.sqf"}forEach weaponBoxes;


sleep 1;
waitUntil{gameBegin == 1};
publicVariable "gameBegin";

EGG_sinit =1; publicVariable "EGG_sinit";


if !(isServer) exitWith {}; 
publicVariable "BIS_EVO_MissionTowns";
publicVariable "BIS_EVO_MissionBigTowns";
publicVariable "BIS_EVO_MilitaryObjectives";
publicVariable "BIS_EVO_MissionVillages";
publicVariable "BIS_EVO_CoastalTowns";
publicVariable "BIS_EVO_MissionObjMarkers";
publicVariable "BIS_EVO_MissionTownNames";

publicVariable "BIS_EVO_conqueredTowns";
// Large marker seen over occupied cities
//MHQ SPAWNER

//MHQ = createVehicle [egg_evo_MHQ,  getposASL LKWWEST, [], 0, "NONE"];
MHQ = objnull;
MHQ setDir getDir LKWWEST;
// MHQ setVehicleInit "veh = [this, 10, 0, 0, FALSE, FALSE] execVM ""vehicle.sqf""";
_veh = [MHQ] execVM "data\scripts\vehicleMHQ.sqf";
MHQ setposASL  [getposASL LKWWEST select 0, getposASL LKWWEST select 1,deckHeight];
MHQ setDir getDir LKWWEST;
MHQ enableSimulation false;
sleep 0.2;
MHQ enableSimulation true;
MHQ setPosASL getPosASL MHQ;
publicVariable "MHQ";

// For jip, client waits for server to run update.sqf
waitUntil {BIS_EVO_allvar_packed != ""};

// _temp = compile BIS_EVO_allvar_packed;
// _vars = call _temp;
// BIS_EVO_end = _vars select 0;
// BIS_EVO_MissionProgress = _vars select 1;
// BIS_EVO_lives = _vars select 2;
//adding
execVM "briefing.sqf";
//titleCut ["","black faded", 0];

_enemyTowns = BIS_EVO_MissionTowns - BIS_EVO_conqueredTowns;

 _nearestEnemyTown = [_enemyTowns, position player] call BIS_fnc_nearestPosition;

sleep 10;
if(EGG_EVO_LoadGame == 0) then 
{
_firstCity = _nearestEnemyTown;
_cityNum=BIS_EVO_MissionTowns find _firstCity;
[_cityNum] spawn fnc_missionManager;
};

[] call fnc_playerBases;
