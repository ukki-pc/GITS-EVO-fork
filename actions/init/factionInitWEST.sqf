
EGG_EVO_PLAYERFACTION = west;
EGG_EVO_ENEMYFACTION = east;
EGG_EVO_strENEMYFACTION = "EAST";
EGG_EVO_strPLAYERFACTION = "WEST";
EGG_EVO_friendlyColor = "colorBlue";
_SideHQ = createCenter east;
WEST setFriend [EAST, 0]; 
WEST setFriend [RESISTANCE, 1];
EAST setFriend [WEST, 0];
EAST setFriend [RESISTANCE, 0];
RESISTANCE setFriend [WEST, 1];
RESISTANCE setFriend [EAST, 0];

///WEST THINGS
reng1 setTriggerActivation ["WEST", "PRESENT", false];
reng2 setTriggerActivation ["WEST", "PRESENT", false];
reng3 setTriggerActivation ["WEST", "PRESENT", false];
reng4 setTriggerActivation ["WEST", "PRESENT", false];

BIS_EVO_pallammo = ["pipebomb","LWS_Laserbatteries","HandGrenade_West","HandGrenade_West","30Rnd_556x45_G36SD","30Rnd_556x45_G36SD"];
BIS_EVO_pweapons = ["DM_CAMO_M4_CCO_IR_FG","Laserdesignator","EB_S10","EB_ItemSiphon"];

//Main men
EGG_EVO_defenders= ["RU_Soldier_TL","RU_Soldier_SL","RU_Soldier_Medic","RU_Soldier","RU_Soldier2","RU_Soldier_AR","RU_Soldier_MG","RU_Soldier_AA","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_HAT","RU_Soldier_GL","RU_Soldier_Sniper","RU_Soldier_SniperH","RU_Soldier_Spotter","RU_Soldier_Marksman"];
EGG_EVO_enemy5 = ["RU_Soldier_TL","RU_Soldier_SL","RU_Soldier_Medic","RU_Soldier","RU_Soldier2","RU_Soldier_AR","RU_Soldier_MG","RU_Soldier_AA","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_HAT","RU_Soldier_GL","RU_Soldier_Sniper","RU_Soldier_SniperH","RU_Soldier_Spotter","RU_Soldier_Marksman"];
EGG_EVO_enemy4= ["TK_Aziz_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1","TK_Special_Forces_TL_EP1","TK_Soldier_SniperH_EP1","TK_Soldier_Sniper_Night_EP1","TK_Soldier_Night_1_EP1","TK_Soldier_Night_2_EP1","TK_Soldier_TWS_EP1"]; 
EGG_EVO_enemy3 = ["TK_Soldier_AA_EP1","TK_Soldier_AAT_EP1","TK_Soldier_MG_EP1","TK_Soldier_HAT_EP1","TK_Soldier_AR_EP1","TK_Commander_EP1","TK_Soldier_Engineer_EP1","TK_Soldier_GL_EP1","TK_Soldier_AMG_EP1","TK_Soldier_Medic_EP1","TK_Soldier_Officer_EP1","TK_Soldier_EP1","TK_Soldier_B_EP1","TK_Soldier_LAT_EP1","TK_Soldier_AT_EP1","TK_Soldier_Sniper_EP1","TK_Soldier_Spotter_EP1","TK_Soldier_SL_EP1"];
EGG_EVO_enemy2 = ["MOL_Soldier_Officer","MOL_Soldier_Medic","MOL_Soldier_Engineer","MOL_Soldier_Rifleman","MOL_Soldier_GL","MOL_Guard_Marksman","MOL_Soldier_Sniper","MOL_Soldier_Spotter","MOL_Guard_AR","MOL_Soldier_MG","MOL_Soldier_AT","MOL_Soldier_LAT","MOL_Soldier_HAT","MOL_Guard_AA","MOL_Soldier_Crew"];
EGG_EVO_enemy1 = ["TK_INS_Soldier_AA_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Bonesetter_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_2_EP1","TK_INS_Soldier_EP1","TK_INS_Soldier_4_EP1","TK_INS_Soldier_3_EP1","TK_INS_Soldier_AAT_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_Sniper_EP1","TK_INS_Soldier_TL_EP1","TK_INS_Warlord_EP1"];
EGG_EVO_OfficerDefenders = ["TK_INS_Soldier_AA_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Bonesetter_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_2_EP1","TK_INS_Soldier_EP1","TK_INS_Soldier_4_EP1","TK_INS_Soldier_3_EP1","TK_INS_Soldier_AAT_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_Sniper_EP1","TK_INS_Soldier_TL_EP1","TK_INS_Warlord_EP1"];
_BRDMS = ["BRDM2_TK_EP1","pook_brdm2AGS_TKINS","pook_brdm2AA_TKINS","pook_brdm2RKT_TKINS","pook_brdm2PKM_TAK","pook_brdm2HQcomm_TAK","pook_brdm2DSHK_TAK","pook_brdm2AT5_TAK","pook_brdm2AT3c_TKINS","pook_brdm2AT3_TKINS","pook_brdm2AT2_TKINS","pook_brdm2M_TAK","pook_brdm2_TAK","pook_brdm2_sa9_TAK"];
_TIGRS = ["NM_Tigr_kord_des","NM_Tigr_ags30_des"];
_UAZS = ["UAZ_AGS30_TK_EP1","UAZ_MG_TK_EP1"];
_LANDROVERS = ["LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1"];
_VODNIKS = ["EB_GAZ_Vodnik_TK","EB_GAZ_Vodnik_HMG_TK"];
#define rhsbmp1s "rhs_bmp1_msv","rhs_bmp1d_msv","rhs_bmp1k_msv","rhs_bmp1p_msv"
#define bmp1s "BVP1_TK_ACR","BVP1_TK_GUE_ACR"


EGG_EVO_ENEMYSHIPS = ["sc9_nanuchka","sc9_missileboat_opf","sc9_gunboat_opf","ibr_gunboat_arl","IRAN_MissileBoat","IRAN_PatrolBoat"]; //"GNTKrivak", sc9_ships1_frigate_opf

EGG_EVO_mevlight = ["BTR40_MG_TK_INS_EP1","pracs_TK_type63","pracs_TK_mtlb_apc","BTR40_TK_INS_EP1"];
EGG_EVO_MechEasy = [_BRDMS] + [_TIGRS] + [_UAZS] + [_LANDROVERS] + [_VODNIKS] + [EGG_EVO_mevlight];
EGG_EVO_MechMedium =["T72_TK_EP1","pook_btrMWS_tak","AP_BTR80_D_CAMO","AP_BTR82A_DES","eb_btr90_tk","vil_t62m","ch_t72_desert","ch_t72_2_desert","pook_btr2a42_tak","VIL_BMP1_TKS","EB_BMP3_TK","sa_bmd_1_iraq","BMP2_TK_EP1","pook_brdm2at2_tak","T55_TK_EP1","T34_TK_EP1","UAZ_AGS30_TK_EP1","BTR60_TK_EP1","Ural_ZU23_TK_EP1","M113_TK_EP1","BMP2_HQ_TK_EP1"];
EGG_EVO_MechHard = ["T90","pracs_tk_t80b"];

EGG_EVO_enemySupply = ["UralReammo_TK_EP1","KamazReammo"]; //V3S_Reammo_TK_GUE_EP1 //NEED EAST V3S

//THESE AA SPAWN ON TOWNS
EGG_EVO_spAAeasy = ["ffaa_toyota_strela","pook_BTR152_ZPU_TAK","pook_BTR40_zu23_TAK","PRACS_TK_Ural_SAM","Ural_ZU23_TK_EP1","BofTruckVRS"];
EGG_EVO_spAAmedium = ["pook_zsu57_tak","pook_brdm2AA_TKINS","pook_brdm2_sa9_TAK","pracs_tk_sa13","FAP_ZPU4vrs","m55a4TruckVRS"];
EGG_EVO_spAAhard =  ["ZSU_TK_EP1","pracs_tk_sa8","pook_zsum4_tak","eb_2S6M_Tunguska_D","pook_5P85S_TAK","pracs_sa6_tk","pook_SA20_static_TAK"];

EGG_EVO_mepilot = ["TK_Soldier_Pilot_EP1"];
EGG_EVO_meofficer = ["TK_Aziz_EP1"];

//statics 
EGG_EVO_statEnemy = ["AGS_TK_EP1", "Metis_TK_EP1", "KORD_TK_EP1", "KORD_high_TK_EP1", "AGS_TK_INS_EP1", "D30_TK_INS_EP1", "DSHKM_TK_INS_EP1","DSHkM_Mini_TriPod_TK_INS_EP1", "2b14_82mm_TK_INS_EP1", "SPG9_TK_INS_EP1", "EB_pook_M40_TYR", "EB_PK_tripod_TYR", "pook_9m14_TYR"];
EGG_EVO_statEnemyAA = ["Igla_AA_pod_TK_EP1","POOK_zpu4_tak","pracs_tk_sa2","sfp_rbs97_op","ZU23_TK_EP1","EB_pook_Type74_TYR","POOK_ks12_tak","EB_DSHKx2_TK","pook_KS19_TAK","pook_s60_TK","POOK_zpu4_tak","pook_sa3_static_tak"]; //REMOVED D30_TK_EP1 2b14_82mm_TK_EP1

//Reinfocing infantry vehicles
EGG_EVO_mevconvoyb = ["V3S_TK_EP1","V3S_Open_TK_EP1","vilas_uaz451","pracs_TK_mtlb_apc","LIN_KamazOpen","ARL_Kamaz3","FgS_ZIL131_3","FgS_ZIL131_4","c1vrs","c2vrs"];

//Reinforce paradroppers
EGG_EVO_mevair3 = ["An2_TK_EP1","Mi17_TK_EP1","Mi24_D_TK_EP1","UH1H_TK_EP1"]; //"ou_ch_46e","ou_ch_53d",

//Rappeling vehicles, make sure to add compatibility in animateRope.sqf
EGG_EVO_rappelChoppers = ["FRL_Mi8_MT_RUS"];

//makehip light choppers
EGG_EVO_eastheli1 = ["ibr_gazelle_armed","FRL_Mi17_1_TAK","UH1H_TK_EP1"];//makehip

EGG_EVO_spetzHeli = ["UH60M_EP1"];

//makehindp
EGG_EVO_EnemyHeli2 = ["UH1H_TK_EP1","ibr_gazelle_armed","FRL_Mi17_1_TAK","FRL_Mi17_TAK","FRL_Mi17_TVK_TAK","FRL_Mi17_TVK_TAK_AGM","FRL_Mi17_TVK_TAK_MR","FRL_Mi17_TVK_TAK_BMB","FRL_Mi24D_TK_CAP","FRL_Mi24D_TK_CAS","FRL_Mi24D_TK_HCAS","FRL_Mi24D_TK_AGM","FRL_Mi24D_TK_MR","FRL_Mi24D_TK_BMB","FRL_Mi24D_TK_LRCAS","FRL_Mi24D_TK_SEAD"];//makehip
//makeka
EGG_EVO_EnemyHeli3 = ["FRL_Mi8_AMTSh_RUS","FRL_Mi8_AMTSh_RUS_HCAS","FRL_Mi8_AMTSh_AGM","FRL_Mi8_AMTSh_MR","FRL_Mi8_AMTSh_BMB","FRL_Mi8_MTV3_RUS","FRL_Mi8_MTV3_RUS_HCAS","FRL_Mi8_MTV3_RUS_AGM","FRL_Mi8_MTV3_RUS_MR","FRL_Mi8_MTV3_RUS_BMB","FRL_Mi24V_TK_CAP","FRL_Mi24V_TK_CAS","FRL_Mi24V_TK_HCAS","FRL_Mi24V_TK_AGM","FRL_Mi24V_TK_MR","FRL_Mi24V_TK_BMB","FRL_Mi24V_TK_LRCAS","FRL_Mi24V_TK_SEAD","FRL_Mi24P_TK_CAP","FRL_Mi24P_TK_CAS","FRL_Mi24P_TK_HCAS","FRL_Mi24P_TK_AGM","FRL_Mi24P_TK_MR","FRL_Mi24P_TK_BMB","FRL_Mi24P_TK_LRCAS","FRL_Mi24P_TK_SEAD"];

//hindv
EGG_EVO_mevaira = EGG_EVO_eastheli1+EGG_EVO_EnemyHeli2+EGG_EVO_EnemyHeli3;//hindv

//planes
//makesub
	EGG_EVO_mevairb = ["Su25_TK_EP1","ibrPRACS_MiG21_AGmol","ibrPRACS_MiG21mol","mig15bis_5_tak","SMAF_MF1_TK_CAS","mig15bis_5_tak"];//makesub

//"RKTSU33B1","RKTSU33AG","RKTSU33AA","RKTSU33MR",
//makesu
	EGG_EVO_mevairc =["FRL_Su34_D_CAP","FRL_Su34_D_CAS","FRL_Su34_D_HCAS","FRL_Su34_D_EHCAS","FRL_Su34_D_AGM","FRL_Su34_D_MR","FRL_Su34_D_LBMB","FRL_Su34_D_BMB","FRL_Su34_D_HBMB","FRL_Su34_D_LGB","FRL_Su34_D_SEAD","PRACS_TK_Su24Fencer","FRL_Mig23B_TK_MR","PRACS_TK_Su22","FRL_Mig29_TAK_MR","FRL_Su25_TK_CAS","FRL_Su27_TK_CAP"];//makesu
//HQ Structure
EGG_EVO_mehq = ["LAV25_HQ_unfolded"];
EGG_EVO_meflag = ["FlagCarrierTK_EP1"];
EGG_EVO_mfhq = ["USMC_WarfareBFieldhHospital","CDF_WarfareBFieldhHospital","USMC_WarfareBAircraftFactory","LAV25_HQ_unfolded","CDF_WarfareBBarracks"];// meeds taki

egg_evo_Amb = "TK_WarfareBUAVterminal_Base_EP1"; 
egg_evo_MHQ = "PRACS_puma330_MG"; //PRACS_M113_AMB

BIS_EVO_recruitables = ["TK_INS_Soldier_AR_EP1"];


//////////////////////////////////////////////
//EGG_EVO_defenders = ["PRACS_SNG_AT","PRACS_SNG_DMS","PRACS_SNG_SPR","PRACS_SNG","PRACS_SNG_ARM","PRACS_SNG_GNR","PRACS_SNG_MG","PRACS_SNG_MED","PRACS_SNG_O","PRACS_SNG_RTO","PRACS_SNG_AA"];
//EGG_EVO_OfficerDefenders = ["PRACS_Marine_AT","PRACS_Marine","PRACS_Marine_MG","PRACS_Marine_AA","PRACS_Marine_GNR"];

BIS_EVO_EngModels = [
"LIN_Soldier_Engineer"
];

//Player characters
BIS_EVO_PlayerModels = [
"CIV_Contractor1_BAF",
"CIV_Contractor2_BAF",
"Soldier_Medic_PMC",
"Soldier_TL_PMC",
"Soldier_Bodyguard_AA12_PMC",
"BAF_crewman_MTP",
"BAF_Soldier_Officer_MTP",
"BAF_Soldier_SL_MTP",
"BAF_Pilot_MTP",
"BAF_Soldier_SniperH_MTP",
"GER_Soldier_EP1",
"GER_Soldier_TL_EP1",
"CZ_Soldier_SL_DES_EP1",
"CZ_Soldier_Office_DES_EP1",
"US_Soldier_Spotter_EP1",
"US_Soldier_Sniper_EP1",
"US_Soldier_Pilot_EP1",
"US_Soldier_SL_EP1",
"US_Soldier_Officer_EP1",
"US_Delta_Force_TL_EP1",
"UN_CDF_Soldier_SL_EP1",
"UN_CDF_Soldier_Pilot_EP1",
"UN_CDF_Soldier_Guard_EP1",
"bink_usmc_sl_des",
"AFR_Officer",
"LIN_Officer",
"BB_OA_BlackOp",
"BB_OA_Merc_base",
"CZ_Soldier_Spec1_Wdl_ACR",
"PRACS_MRegular_SPR",
"SMAF_MF1_RACS_FighterPilot",
"PRACS_F15_Pilot",
"PRACS_Fusilier_O",
"PRACS_QAB_O",
"PRACS_SNG",
"PRACS_RSAF_CSAR",
"PRACS_RSAF_G_AA",
"PRACS_Paratrooper_PF",
"PRACS_Sniper",
"PRACS_Marine",
"PRACS_Recon2",
"PRACS_RedBrigade",
"PRACS_RedBrigade_O_D"];

buyCarList = 
[
/*---Military cars---*/
["PRACS_ATV",0],			// Hilux (Open)
["SRA_Truck5tOpen",0],
["LandRover_CZ_EP1",0],			// Hilux (Open)
["LandRover_Special_CZ_EP1",200],				// Landrover (SF)
["SUV_PMC",200],							// SUV
["ArmoredSUV_PMC",800],						// SUV (GAT)
["HMMWV_M1035_DES_EP1",500],								// HMMWV
["HMMWV_M1151_M2_DES_EP1",1000],							// HMMWV (HMG)
["LandRover_Special_CZ_EP1",1000],							// HMMWV (HMG)
["BAF_Jackal2_L2A1_D",1000],							// HMMWV (HMG)
["HMMWV_M998_crows_MK19_DES_EP1",1200],							// HMMWV (GMG)s
["HMMWV_TOW_DES_EP1",1500],							// HMMWV (AT)
["HMMWV_Avenger_DES_EP1",2500],						// HMMWV (AA)
["SRA_Truck5tRepair",400],
["MtvrRepair_DES_EP1",500],						// HMMWV (AA)
["POOK_HEMTT_repair_us",800]						// HMMWV (AA)
];

for [{_loop=0}, {_loop<count buyCarList}, {_loop=_loop+1}] do {
buyCarList set [_loop,[(buyCarList select _loop) select 0, (buyCarList select _loop) select 1,0]];
};



buyTankList = 
[
/*---APCs---*/
["Dingo_DST_ACR",1200],						// Dingo (MMG)
["Dingo_GL_DST_ACR",1200],					// Dingo (GMG) 
["PRACS_M113_SA",1500],					// Dingo (GMG)
["PRACS_M113_SA_Mk19",1700],					// Dingo (GMG)
["FOX",1700],							// BMP1
["PRACS_M113_FSV",1700],							// BMP1
["PRACS_LAV_IFV",1500],					// Dingo (GMG)
["PRACS_LAV_MGS",1700],					// Dingo (GMG)
//["BVP1_TK_ACR",1700],							// BMP1
["FFAA_ET_VEC",1700],
["AAV_D",1800],									// AAVP
["EB_LAV25_D2",2200],								// LAV
["PRACS_LAV25",2200],								// LAV
["uns_Sheridan_de",2200],							// Pandur
["PRACS_LAV_SAM",2300],							// Pandur
["Pandur2_ACR",2500],							// Pandur
//["PRACS_BMP2",2500],							// Pandur
["PRACS_M901_ITV",2500],							// Pandur
["M1126_ICV_M2_EP1",1500],					// Stryker (HMG)
["M1126_ICV_mk19_EP1",1600],					// Stryker (GMG)
["M1128_MGS_EP1",2500],						// Stryker (MGS)
["PRACS_FV101",2200],						// Stryker (MGS)
["PRACS_FV107",2500],						// Stryker (MGS)
["M1135_ATGMV_EP1",3000],						// Stryker (ATGM)
/*---Tanks---*/
// ["PRACS_M60A3",3500],							// T72M
["PRACS_M60A3_S2",4000],							// T72M
["PRACS_T72",4000],							// T72M
["PRACS_LEO1A5",4000],							// T72M
["M2A2_EP1",3500],							// M2A2 (AT)
["M6_EP1",4000],								// M6 (AA)
["M2A3_EP1",4500],							// M2A3 (AT)
["EB_M2A3_WH",5000],
["BAF_FV510_W",5500],							// Warrior
["PRACS_LEO2A4",5200],							// T72M
//["M1A1_US_DES_EP1",55],								// M1A1
["ffaa_et_Leopard",6500],
["EB_M1A2_US_D",6500],						// M1A2
//["M1A2_US_TUSK_MG_EP1",65],						// M1A2
["EB_M1A3_TUSK_D",7500],						// M1A2
/*---AA---*/
["PRACS_Sa6",3000],						// M1A2
["PRACS_m48_chapparal",3000],						// M1A2
["PRACS_351_SAM",3800],	
["POOK_NASAMS_US",3800],	
["POOK_MEADS_US",3800],	
["PRACS_M163",4000],						// M1A2
["PRACS_M429_CRAM",4000],	
["PRACS_M302_SAM",5000],	
["PRACS_M460_SAM",5000],	
/*---Artillery---*/
["PRACS_M250_TEL",14000],	
["PRACS_M291_TEL",15000],	
//	["GRAD_TK_EP1",160],						// GRAD
["RM70_ACR",17000],							// RM70
["PRACS_M245_TEL",17000],								// MLRS
["PRACS_MLRS",18000]								// MLRS
];

BIS_EVO_unlocks = [];
BIS_EVO_unlocked = [];


for [{_loop=0}, {_loop<count buyTankList}, {_loop=_loop+1}] do {
buyTankList set [_loop,[(buyTankList select _loop) select 0, (buyTankList select _loop) select 1,0]];
};


buyAirList = 
[
/*---Helicopters---*/
["PRACS_puma330_MG",1000],						// Mi-17
["ou_ch_46e",1000],						// Mi-17
["PRACS_MH6J",1000],							// Littlebird
["PRACS_AH6J",2000],							// Littlebird (Armed)
["UH60M_MEV_EP1",1000],									// Blackhawk (MMG)
["CH_47F_EP1",1000],							// Chinook
["BAF_Merlin_HC3_D",1000],							// Chinook
["UH60M_EP1",1000],							// Blackhawk (GAT)					
["OFrP_Puma_DE_Pirate",2500],		
["PRACS_AB212_CAS",3000],									// Blackhawk (MMG)
["ibr_as350_armed",3000],								// Viper
["UH1Y",5000],
["kiowa",6000],
["Mi171Sh_rockets_CZ_EP1",8000],				// Mi-17 (Rockets)
["AW159_Lynx_BAF",8000],						// Wildcat
["PRACS_RAH6",10000],							// Littlebird (Armed)	
["yup_SH60B",9000],
["FRL_UH60M_MR",12000],	
["PRACS_AH1S",19000],								// Cobra
["OFrP_Tiger_HAD_CE",19000],
["AH1Z",19000],								// Cobra                                                                                                                                                           
["AH64D",20000],								// Apache (AT)
/*---Planes---*/
["ibr_tucano_lin",6000],	
["SMAF_MF1_AGRESSOR_DESERT",10000],								// F35  
["PRACS_Etendard",13000],								// F35
["uns_A1J_LBMB",13000],		
["Pracs_Mohawk",13000],								// F35 
["F117A",14000],	
["DAF_F5E_AGM2",14000],
["PRACS_Mirage3",14000],								// F35
["F4M_Des",14000],	
["PRACS_A4",16000],								// F35
//["PRACS_F16_PHSTRK",17000],
["14US_IA",16000],								// F35
["FRL_F16_MR",17000],	
["JS_JC_FA18E_USMC",17000],	
["F35B",17000],								// F35
//["PRACS_F15",17000],								// F35
["FRL_F15C_MR",17000],	
["FRL_A10_MR",17000],								// A10 A7
//["A7",18000],								// AV8B
["FRL_AV8B_MR",18000],								// AV8B
//["3lb_f22_sdb",18000],								// AV8B
["pook_EF2000_BAF_D_DEAD",18500],								// AV8B
["FRL_F111_D_MR",18500]								// AV8B
//["b1b_MK82_desert",18500]
];
for [{_loop=0}, {_loop<count buyAirList}, {_loop=_loop+1}] do {
buyAirList set [_loop,[(buyAirList select _loop) select 0, (buyAirList select _loop) select 1,0]];
};

buyStatList = 
[
/*---Statics---*/
["M2StaticMG_US_EP1",200],					// CUSTOM  ["PRACS_Type66_Gun","PRACS_M266AAgun","PRACS_Type74AAgun","PRACS_M101","PRACS_M1","PRACS_Regular_M2","PRACS_Regular_MK19","PRACS_Regular_TOW","PRACS_Regular_M252"];
["M2HD_mini_TriPod_US_EP1",200],					// ap
["MK19_TriPod_US_EP1",600],							// Ap
["TOW_TriPod",1000],							// AT								
["Stinger_Pod_US_EP1",1000],						// AA
["M252_US_EP1",1000],								// AP
["Rbs70_ACR",1000],								// AA
["sfp_rbs97",1200],
["PRACS_Type66_Gun",1200],	
["PRACS_M266AAgun",1200],	
["PRACS_Type74AAgun",1200],		
["PRACS_M101",1200],	
["PRACS_M1",1200],						
["M119_US_EP1",3000]							// CUSTOM
];

for [{_loop=0}, {_loop<count buyStatList}, {_loop=_loop+1}] do 
{
buyStatList set [_loop,[(buyStatList select _loop) select 0, (buyStatList select _loop) select 1,0]];
};


enemyOfficers = [];
enemyAts = [];
enemyMgs = [];
enemyRiflemen = [];
enemyAamen = [];
enemyAll = [];
cheapMen = [];
enemySpecops = ["TK_Special_Forces_TL_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1"];

//Factions

emnemyFaction = "RUS_DE";

//ARL
if(emnemyFaction == "ARL") then 
{
	enemyOfficers = ["ibr_arl_officer"];
	enemyAts = ["ibr_arl_at"];
	enemyMgs = ["ibr_arl_mg"];
	enemyRiflemen = ["ibr_arl_rif","ibr_arl_rif2"];
	enemyAamen = ["ibr_arl_aa"];
	enemyAll = enemyOfficers + enemyAts + enemyMgs + enemyRiflemen + enemyAamen + ["ibr_arl_medic"];
	cheapMen = ["ibr_drg_man2","ibr_drg_man1","ibr_drg_man5","ibr_drg_man6","ibr_drg_man7","ibr_drg_man4"];
};

//AFRICAN Rebels
if(emnemyFaction == "AR") then 
{
	enemyOfficers = ["ibr_rebel22"];
	enemyAts = ["ibr_rebel83","ibr_rebel95"];
	enemyMgs = ["ibr_rebel125"];
	enemyRiflemen = ["ibr_rebel11","ibr_rebel44","ibr_rebel66"];
	enemyAamen = ["ibr_rebel111"];
	enemyAll = enemyOfficers + enemyAts + enemyMgs + enemyRiflemen + enemyAamen + ["ibr_rebel77"];
	cheapMen = ["ibr_rebel22","ibr_rebel33","ibr_rebel44","ibr_rebel66","ibr_rebel77","ibr_rebel95","ibr_rebel83","ibr_rebel125","ibr_rebel125","ibr_rebel55"];
};

//ISIS
if(emnemyFaction == "ISIS") then 
{
	enemyOfficers = ["MIS_ISIS_04_TWS"];
	enemyAts = ["MIS_ISIS_04_AT"];
	enemyMgs = ["MIS_ISIS_04_MG"];
	enemyRiflemen = ["MIS_ISIS_04_Rif","ibr_rebel44","ibr_rebel66"];
	enemyAamen = ["MIS_ISIS_04_AA"];
	enemyAll = enemyOfficers + enemyAts + enemyMgs + enemyRiflemen + enemyAamen + ["MIS_ISIS_04_Med","MIS_ISIS_04_SVD","MIS_ISIS_03_Engineer"];
	cheapMen = enemyAll;
};

//Russia desert
if(emnemyFaction == "RUS_DE") then 
{
	//rug_dsai settings [EAST, WEST, GUER, CIV, sideEnemy]
	RUG_DSAI_SIDES = ["RUG_DSAIRUS","RUG_DSAIENG","RUG_DSAIgen","RUG_DSAIArab","RUG_DSAIRUS"];
	enemyOfficers = ["RUS_Desert_Soldier_SL"];
	enemyAts = ["RUS_Desert_Soldier_HAT","RUS_Desert_Soldier_LAT"];
	enemyMgs = ["RUS_Desert_Soldier_MG"];
	enemyRiflemen = ["RUS_Desert_Soldier"];
	enemyAamen = ["RU_Soldier_AA"];
	enemyAll = enemyOfficers + enemyAts + enemyMgs + enemyRiflemen + enemyAamen + ["RUS_Desert_Soldier_GL","RUS_Desert_Soldier_Marksman","RUS_Desert_Soldier_MD","RUS_Desert_Soldier_AU"];
	cheapMen = enemyAll;
	enemySpecops = ["RUS_Desert_Spec1","RUS_Desert_Spec2","RUS_Desert_Spec3","RUS_Desert_Spec_TL","RUS_Desert_Spec_GL","RUS_Desert_Spec_Marksman","RUS_Desert_Spec_COM"];
};

//Molatia
if(emnemyFaction == "MOL") then 
{
	enemyOfficers = ["MOL_Officer"];
	enemyAts = ["MOL_Soldier_AT"];
	enemyMgs = ["MOL_Soldier_MG"];
	enemyRiflemen = ["MOL_Soldier_Rifleman"];
	enemyAamen = ["MOL_Soldier_AA"];
	enemyAll = enemyOfficers + enemyAts + enemyMgs + enemyRiflemen + enemyAamen + ["MOL_Medic"];
	cheapMen = enemyAll;
	enemySpecops = ["MOL_Soldier_Commando"];
};

//Takistani militia
if(emnemyFaction == "TAKINS") then 
{
	enemyOfficers = ["TK_INS_Soldier_TL_EP1"];
	enemyAts = ["TK_INS_Soldier_AT_EP1",["TK_INS_Soldier_pook_MRO_A","TK_INS_Soldier_pook_RPG_chem"]];
	enemyMgs = ["TK_INS_Soldier_MG_EP1","TK_INS_Soldier_AR_EP1"];
	enemyRiflemen = ["TK_INS_Soldier_2_EP1","TK_INS_Soldier_EP1","TK_INS_Soldier_3_EP1","TK_INS_Soldier_4_EP1"];
	enemyAamen = ["TK_INS_Soldier_AA_EP1"];
	enemyAll = enemyOfficers + enemyAts + enemyMgs + enemyRiflemen + enemyAamen + ["TK_INS_Soldier_Sniper_EP1",["TK_INS_Soldier_pook_M79","TK_INS_Soldier_pook_GM94","TK_INS_Soldier_pook_GP25","TK_INS_Soldier_pook_RG6"]];
	cheapMen = ["TK_INS_Soldier_3_EP1"];
};

//Takistani Army
if(emnemyFaction == "TAK") then 
{
	enemyOfficers = ["TK_Soldier_SL_EP1"];
	enemyAts = ["TK_Soldier_AT_EP1","TK_Soldier_LAT_EP1","TK_Soldier_AAT_EP1",["TK_Soldier_pook_RG6","TK_Soldier_pook_RPO_A","TK_Soldier_pook_RPG_chem","TK_Soldier_pook_MRO_A","TK_Soldier_pook_RPG_chem"]];
	enemyMgs = ["TK_Soldier_MG_EP1","TK_Soldier_AMG_EP1"];
	enemyRiflemen = ["TK_Soldier_EP1"];
	enemyAamen = ["TK_Soldier_AA_EP1"];
	enemyAll = enemyOfficers + enemyAts + enemyMgs + enemyRiflemen + enemyAamen + ["TK_Soldier_SniperH_EP1","TK_Soldier_Spotter_EP1","TK_Soldier_GL_EP1"];
	cheapMen = ["TK_INS_Soldier_3_EP1"];
	enemySpecops = ["TK_Special_Forces_TL_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1"];
};

//Chernarus Insurgents
if(emnemyFaction == "INS") then 
{
	enemyOfficers = ["Ins_Soldier_CO"];
	enemyAts = ["Ins_Soldier_AT"];
	enemyMgs = ["Ins_Soldier_AR"];
	enemyRiflemen = ["Ins_Soldier_1","Ins_Soldier_2"];
	enemyAamen = ["Ins_Soldier_AA"];
	enemyAll = enemyOfficers + enemyAts + enemyMgs + enemyRiflemen + enemyAamen + ["Ins_Soldier_GL"];
	cheapMen = ["Ins_Worker2","Ins_Woodlander3","Ins_Villager3","Ins_Woodlander2","Ins_Woodlander1","Ins_Villager4"];
	enemySpecops = ["TK_Special_Forces_TL_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1"];
};

//Russia
if(emnemyFaction == "RUS") then 
{
	enemyOfficers = ["RU_Soldier_SL"];
	enemyAts = ["RU_Soldier_AT","RU_Soldier_LAT"];
	enemyMgs = ["RU_Soldier_MG","RU_Soldier_AR"];
	enemyRiflemen = ["RU_Soldier"];
	enemyAamen = ["RU_Soldier_AA"];
	enemyAll = enemyOfficers + enemyAts + enemyMgs + enemyRiflemen + enemyAamen + ["RU_Soldier_GL","RU_Soldier_Marksman","RU_Soldier_Sniper","RU_Soldier_Spotter"];
	cheapMen = enemyAll;
	enemySpecops = ["RUS_Soldier_TL","RUS_Soldier_GL","RUS_Soldier_Marksman","RUS_Soldier3","RUS_Soldier1","RUS_Soldier2","MVD_Soldier_TL","MVD_Soldier_MG","MVD_Soldier_AT","MVD_Soldier_GL","MVD_Soldier_Sniper","MVD_Soldier_Marksman","MVD_Soldier_GL"];
};

//FFAA Terrorista
if(emnemyFaction == "FFAA_TER") then 
{
	enemyOfficers = ["ffaa_terrorista_agf_Clerigo"];
	enemyAts = ["ffaa_terrorista_agf_RPG","ffaa_terrorista_ham_RPG"];
	enemyMgs = ["ffaa_terrorista_agf_PK","ffaa_terrorista_ham_PK"];
	enemyRiflemen = ["ffaa_terrorista_agf_AK","ffaa_terrorista_ham_AK","ffaa_terrorista_ham_suicida"];
	enemyAamen = ["ffaa_terrorista_agf_AA","ffaa_terrorista_ham_AA"];
	enemyAll = enemyOfficers + enemyAts + enemyMgs + enemyRiflemen + enemyAamen + ["ffaa_terrorista_agf_SVD","ffaa_terrorista_ham_SVD"];
	cheapMen = enemyAll;
};

//Middle Eastern Army
if(emnemyFaction == "MEA") then 
{
	enemyOfficers = ["BB_OPFOR_Soldier_Officer","BB_OPFOR_Soldier_SL"];
	enemyAts = ["BB_OPFOR_Soldier_AAT","BB_OPFOR_Soldier_HAT","BB_OPFOR_Soldier_LAT","BB_OPFOR_Soldier_AT"];
	enemyMgs = ["BB_OPFOR_Soldier_AMG","BB_OPFOR_Soldier_AR","BB_OPFOR_Soldier_MG"];
	enemyRiflemen = ["BB_OPFOR_Soldier","BB_OPFOR_Soldier_B","BB_OPFOR_Soldier_Night_1","BB_OPFOR_Soldier_Night_2","BB_OPFOR_Soldier_TWS"];
	enemyAamen = ["BB_OPFOR_Soldier_AA"];
	enemyAll = enemyOfficers + enemyAts + enemyMgs + enemyRiflemen + enemyAamen + ["BB_OPFOR_Soldier_Engineer","BB_OPFOR_Soldier_GL","BB_OPFOR_Soldier_Medic","BB_OPFOR_Soldier_SniperH","BB_OPFOR_Soldier_Sniper"];
	cheapMen = enemyAll;
};

assaultRifles = 
[
	["KPFS_PPSh",0],
	["m8_compact",1],
	["RH_M4CMK",2],
	["RH_M4CMKAIM",3],
	["RH_M4CMKEOTECH",4],
	["RH_M4CMKACOG",5],
	["RH_ar10",6],
	["RH_ar10s",7],
	["RH_M16a3cs",8],
	["RH_M4a1r",9],
	["RH_M4a1eotech",10],
	["RH_M4sdeotech",11],
	["RH_M4acog",12],
	["RH_M4",13],
	["RH_M4sd",14],
	["RH_M4macog",15],
	["RH_M4sdaim_wdl",16],
	["RH_M4sbraim",17],
	["RH_M4CTSD_F",18],
	["RH_Mk18",19],
	["RH_Mk18aim",20],
	["RH_Mk18eot",21],
	["RH_Mk18acog",22],
	["RH_Mk18sd",23],
	["RH_Mk18sdaim",24],
	["RH_Mk18sdeot",25],
	["RH_Mk18sdacog",26],
	["RH_Mk18gl",27],
	["RH_Mk18glaim",28],
	["RH_Mk18gleot",29],
	["RH_Mk18glacog",30],
	["RH_SCARL_AIM",31],
	["RH_SCARL_MK4",32],
	["RH_SCARL_SD_DOC",33],
	["RH_SCARLB_SD_EOTECH",34],
	["RH_SCARH_MK4",35],
	["RH_SCARH_SPECTERDR",36],
	["RH_SCARH_SD_ACOG",37],
	["RH_M16a2gl",38],
	["RH_M16a3sgl",39],
	["RH_M16A4glacog",40],
	["RH_M16A4gleotech",41],
	["RH_M4gl",42],
	["RH_M4sdgleotech_wdl",43],
	["RH_M4sdglaim",44],
	["RH_M4sdglacog",45],
	["RH_M4CTSDGLACOG_F",46],
	["RH_M4CTSDGL_F",47],
	["RH_XM8DGL",48],
	["RH_SCARH_GL_EOTECH",49],
	["RH_SCARH_GL_SPECTERDR",50],
	["RH_SCARLB_SD_GL_AIM",51],
	["RH_SCARL_GL_EOTECH",52],
	["RH_SCARLB_GL_ACOG",53],
	["RH_XM8DSAW",54],
	["G36A_camo",55],
	["G36_C_SD_eotech",56],
	["m8_compact",57],
	["G36C_camo",58],
	["G36_C_SD_camo",59],
	["FN_FAL",60],
	["M16A2",61],
	["M4a1",62],
	["M4A1_AIM_SD_camo",63],
	["M4A1_Aim_camo",64],
	["G36c",65],
	["G36K",66],
	["m8_carbine",67],
	["m8_holo_sd",68],
	["m8_compact_pmc",69],
	["G36A_camo",70],
	["G36K_camo",71],
	["M4A3_CCO_EP1",72],
	["SCAR_H_CQC_CCO",73],
	["SCAR_H_CQC_CCO_SD",74],
	["SCAR_L_CQC",75],
	["SCAR_L_CQC_CCO_SD",76],
	["SCAR_L_CQC_Holo",77],
	["SCAR_L_STD_HOLO",78],
	["SCAR_L_STD_Mk4CQT",79],
	["SCAR_H_STD_TWS_SD",80],
	["BAF_L85A2_RIS_Holo",81],
	["M16A2GL",82],
	["M16A4_GL",83],
	["M16A4_ACG_GL",84],
	["M4A1_RCO_GL",85],
	["M4A1_HWS_GL_camo",86],
	["M4A1_HWS_GL_SD_Camo",87],
	["m8_carbineGL",88],
	["M4A3_RCO_GL_EP1",89],
	["SCAR_H_STD_EGLM_Spect",90],
	["SCAR_L_CQC_EGLM_Holo",91],
	["SCAR_L_STD_EGLM_RCO",92],
	["SCAR_L_STD_EGLM_TWS",93],
	["BAF_L85A2_UGL_ACOG",94],
	["BAF_L85A2_UGL_Holo",95],
	["BAF_L85A2_UGL_SUSAT",96],
	["M32_EP1",97],
	["M79_EP1",98],
	["Mk13_EP1",99],
	["BAF_L85A2_RIS_ACOG",100],
	["BAF_L85A2_RIS_CWS",101],
	["BAF_L85A2_RIS_SUSAT",102],
	["SCAR_H_LNG_Sniper",103],
	["SCAR_H_LNG_Sniper_SD",104],
	["FN_FAL_ANPVS4",105],
	["m16a4_acg",106],
	["m8_tws",107],
	["m8_tws_sd",108],
	["PRACS_FAL_I",109],
	["PRACS_GalilAR",110],
	["PRACS_Galil_SAR",111],
	["PRACS_Galil_SUIT",112],
	["PRACS_Galil_M203",113],
	["PRACS_Galil_M203_SUIT",114],
	["PRACS_CETME",115],
	["PRACS_g3a4sp",116],
	["PRACS_g3a4_M68",117],
	["PRACS_g3a4SM1",118],
	["PRACS_g3a4SM2",119],
	["PRACS_g3a4t40",119],
	["PRACS_g3a4k",120],
	["PRACS_SG1",121],
	["PRACS_SG1_SD",122],
	["PRACS_SG1_NVS",123],
	["PRACS_SG1_SD_NVS",124],
	["PRACS_g3a3",125],
	["PRACS_g3a3t40",126],
	["PRACS_g3a4F1",127],
	["PRACS_HK53A3",128],
	["PRACS_HK33A4_EO",129],
	["PRACS_HK33A4",130],
	["PRACS_FNC",131],
	["PRACS_M16A1",132],
	["PRACS_M16A1_NVS",133],
	["PRACS_HK53A3_EO",134]
];

smgs = 
[
	["MP5SD",0],
	["RH_fmg9",1],
	["RH_pp2000p",2],
	["RH_pdreot",3],
	["RH_PDW_AIM",4],
	["PRACS_UMP45",5],
	["RH_mac10p",6],
	["RH_tec9",7],
	["RH_muzi",8],
	["RH_mp5kp",9],
	["RH_mp7p",10],
	["RH_HK53aim",11],
	["RH_mp5a4RFX",12],
	["RH_mp5a5eot",13],
	["RH_mp5a5ris",14],
	["RH_mp5a5eodRFX",15],
	["RH_mp5sd6eot",16],
	["RH_mp5kpdw",17],
	["RH_P90i",18],
	["RH_p90isd",19],
	["RH_P90aim",20],
	["RH_p90sdaim",21],
	["RH_umpeot",22],
	["RH_UMP",23],
	["RH_umpsd",24],
	["RH_umpaim",25],
	["RH_umpsdaim",26],
	["RH_krissRFX",27],
	["RH_kriss",28],
	["RH_krisssd",29],
	["RH_krisseot",30],
	["RH_krisssdeot",31],
	["RH_uzi",32],
	["RH_uzisd",33],
	["RH_tmp",34],
	["RH_tmpsd",35],
	["RH_tmpaim",36],
	["RH_tmpsdaim",37],
	["RH_pp2000eot",38],
	["RH_mp7eot",39],
	["RH_mp7sdeot",40],
	["RH_mp7aim",41],
	["RH_mp7sdaim",42],
	["UZI_EP1",43],
	["UZI_SD_EP1",44],
	["MP5A5",45],
	["MP5SD",46]
];
rifles = 
[
	["KPFS_Mosin_Nagant",0],
	["KPFS_KarS",1],
	["huntingrifle",2],
	["LeeEnfield",3],
	["KPFS_Mosin_Nagant_PU",4],
	["KPFS_M1_Garand_M84",5],
	["M14_EP1",6],
	["RH_m14",7],
	["RH_m14aim",8],
	["RH_mk14teot",9],
	["RH_mk14t",10],
	["RH_mk14tsd",11],
	["RH_MK14AIM",12],
	["RH_MK14SDAIM",13],
	["RH_MK14",14],
	["RH_MK14SD",15],
	["RH_MK14SDEOTECH",16],
	["RH_sc2",17],
	["RH_sc2aim",18],
	["RH_sc2shd",19],
	["RH_m1s",20],
	["RH_m1saim",21],
	["RH_m1ssp",22],
	["RH_m1steot",23],
	["RH_M14EBRSP",24],
	["RH_M14EBRSP_SD",25],
	["RH_mk14ebrsp",26],
	["RH_mk14ebr_sd",27],
	["RH_mk14ebrsp_sd",28],
	["RH_m39emr",29],
	["RH_m21",30],
	["RH_MK21A5SD",31],
	["m8_sharpshooter",32],
	["DMR",33],
	["M24",34],
	["M24_des_EP1",35],
	["M40A3",36],
	["EB_M24A2",37],
	["EB_M24A2_D",38],
	["EB_M24A3",39],
	["EB_M24A3_D",40],
	["BAF_LRR_scoped",41],
	["BAF_LRR_scoped_W",42],
	["m107",43],
	["m107_TWS_EP1",44],
	["M110_NVG_EP1",45],
	["M110_TWS_EP1",46],
	["BAF_AS50_scoped",47],
	["BAF_AS50_TWS",48],
	["BAF_L86A2_ACOG",49]
];

mgs = 
[
	["KPFS_BAR",0],
	["PRACS_M60",1],
	["KPFS_MG42",0],
	["PRACS_MAG58",3],
	["Mk_48",4],
	["PRACS_Mk48",5],
	["PRACS_Mk48_SP",6],
	["PRACS_Mk48_SD",7],
	["Mk_48_DES_EP1",8],
	["BAF_L7A2_GPMG",9],
	["RH_M249",10],
	["RH_M249acog",11],
	//["ukf_L86A2LSW_susat",12],
	["RH_M249elcan",13],
	["RH_M249p",14],
	["RH_M249pacog",15],
	["RH_M249pelcan",16],
	["RH_Mk48mod1",17],
	["RH_Mk48mod1acog",18],
	["RH_Mk48mod1elcan",19],
	["RH_M60E4_EOTECH",20],
	["RH_MK43_ACOG",21],
	["RH_MK43_ELCAN",22],
	["MG36",23],
	["MG36_camo",24],
	["M249",25],
	["M249_m145_EP1",26],
	["M249_TWS_EP1",27],
	["M240",28],
	["m240_scoped_EP1",29],
	["M60A4_EP1",30],
	["BAF_L110A1_Aim",31],
	["Mk_48",32],
	["Mk_48_DES_EP1",33]
];

launchers = 
[
	["M136",0],
	["KPFS_M20A1B1_BW",1],
	["SMAW",2],
	["Stinger",3],
	["ukf_gpmg",4],
	["MAAWS",5],
	["BAF_NLAW_Launcher",6],
	["FFAA_Armas_C90",7],
	["FFAA_Armas_C100",8],
	["ukf_law80launcher",9],
	["Javelin",10],
	["PRACS_CG",11]
];
//All the weapons
pistols = ["RH_m93r", "RH_p226", "RH_g17", "RH_g18", "RH_g19t", "RH_mk2", "M9sd", "RH_mk22v", "RH_mk22vsd", "RH_usp", "RH_uspsd", "RH_m9", "RH_m9sd", "RH_m1911", "RH_m1911sd", "RH_anac", "RH_bull", "RH_python","EB_m1911SD", "RH_deagle", "M9", "Colt1911", "glock17_EP1", "revolver_EP1"];
miscs = ["PipeBomb","Mine","EB_v40gren","HandGrenade_West","IRStrobe","IR_Strobe_Marker","EB_mk3a2gren","EB_m67gren","EB_m61gren","EB_m34gren","EB_m14gren","EB_m308gren","EB_mk40gren","EB_TIscanner","EB_TIGoggles","EB_MX991_r","Binocular","EB_S10","eb_ItemFuelcan","EB_MX991_g","EB_mkvFlarePistol","Laserdesignator","EB_m79p","EB_MX991_w"];

#define rusassaultRifles ["AKS_74_U","AK_47_M","AK_47_S","Sa58P_EP1","Sa58V_CCO_EP1","Sa58V_EP1","AKS_74_GOSHAWK","AKS_74_NSPU","RH_asvalsp","AKS_74_pso","AK_107_pso","Sa58V_RCO_EP1","AK_74","AKS_74_kobra","RH_Rk95aim","AK_107_kobra","RH_akms","RH_ak103","RH_ak104k","RH_ak105sp","RH_AK107_1p29","RH_SCARAKBAIM","RH_SCARAKACOG","AK_74_GL","AK_107_GL_pso","AK_107_GL_kobra","AK_74_GL_kobra","RH_an94gl","RH_aks74upt","RH_aks74uptsp","RH_aks74uptk","RH_ak74mkgl","RH_aks74mglsp","RH_ak104gl","RH_ak105kgl","EB_DP28"]
#define russmgs ["Sa61_EP1","RH_vz61","UZI_EP1","bizon","RH_bizon","RH_bizonsdk","RH_gr1sp","Saiga12K"]
#define rusrifles ["KPFS_Mosin_Nagant","KPFS_KarS","huntingrifle", "LeeEnfield","EB_svd","KPFS_Mosin_Nagant_PU","RH_asval","RH_SVU","RH_asvalk","RH_oc14sp","ksvk","EB_OSV96","SVD","SVD_CAMO","VSS_vintorez","SVD_des_EP1","SVD_NSPU_EP1"]
#define rusmgs ["PK","RPK_74","pecheneg","RH_rpk74m1p29"]
#define ruslaunchers ["RPG18","RPG7V","Igla","Strela","MetisLauncher"]

// hups = [];
// {hups = hups + [[_x,_forEachIndex]]}forEach launchers;

// copyToClipboard str hups;

allAssaultrifles = rusassaultRifles;
{allRifles = allRifles + [_x select 0]}forEach assaultRifles;

allSmgs = russmgs;
{allSmgs = allSmgs + [_x select 0]}forEach smgs;

allRifles = rusrifles;
{allRifles = allRifles + [_x select 0]}forEach rifles;

allmgs = rusmgs;
{allmgs = allmgs + [_x select 0]}forEach mgs;

allLaunchers = ruslaunchers;
{allLaunchers = allLaunchers + [_x select 0]}forEach launchers;

//RHS STUFF
if(isClass(configFile>>"CfgPatches">>"rhs_main")) then 
{
	EGG_EVO_mevconvoyb = EGG_EVO_mevconvoyb + ["rhs_gaz66o_taki","rhs_gaz66_taki"];
};

//P85 Stuff
if(isClass(configFile>>"CfgPatches">>"P85_config")) then 
{
	EGG_EVO_mevlight = EGG_EVO_mevlight + ["p85_fug_mg","p85_pszh","p85_topas_ap","p85_brdm1_mg"];
	EGG_EVO_mevconvoyb = EGG_EVO_mevconvoyb + ["p85_IFAtruck_nva","p85_Robur_nva","p85_kraz","p85_star266_e","p85_star660_e","p85_zil_sla"];
	EGG_EVO_ENEMYSHIPS = EGG_EVO_ENEMYSHIPS + ["P85_HRL2MG_mw"];
	EGG_EVO_MechMedium = EGG_EVO_MechMedium + ["p85_PT76","p85_brdm1_at","p85_bvpm80a_sla"];

	buyTankList = [buyTankList,[["p85_m48tank_base",1800,0]],22] call fnc_spliceToArray;
	// buyTankList = [buyTankList,[["p85_m60tank_base",1800,0]],23] call fnc_spliceToArray;
	buyTankList = [buyTankList,[["LoBo_US1991_M728",1800,0]],23] call fnc_spliceToArray;
	buyTankList = [buyTankList,[["LoBo_US1991_M60A2",1800,0]],24] call fnc_spliceToArray;
	buyTankList = [buyTankList,[["LoBo_US1991_M60A2ERA",1800,0]],25] call fnc_spliceToArray;

};


EGG_EVO_MechEasy = [_BRDMS] + [_TIGRS] + [_UAZS] + [_LANDROVERS] + [_VODNIKS] + [EGG_EVO_mevlight];
EGG_EVO_MechMedium =["T72_TK_EP1","pook_btrMWS_tak","AP_BTR80_D_CAMO","AP_BTR82A_DES","eb_btr90_tk","vil_t62m","ch_t72_desert","ch_t72_2_desert","pook_btr2a42_tak","VIL_BMP1_TKS","EB_BMP3_TK","sa_bmd_1_iraq","BMP2_TK_EP1","pook_brdm2at2_tak","T55_TK_EP1","T34_TK_EP1","UAZ_AGS30_TK_EP1","BTR60_TK_EP1","Ural_ZU23_TK_EP1","M113_TK_EP1","BMP2_HQ_TK_EP1"];
EGG_EVO_MechHard = ["T90","pracs_tk_t80b"];
EGG_EVO_spAAeasy = ["ffaa_toyota_strela","pook_BTR152_ZPU_TAK","pook_BTR40_zu23_TAK","PRACS_TK_Ural_SAM","Ural_ZU23_TK_EP1","BofTruckVRS"];
EGG_EVO_spAAmedium = ["pook_zsu57_tak","pook_brdm2AA_TKINS","pook_brdm2_sa9_TAK","pracs_tk_sa13","FAP_ZPU4vrs","m55a4TruckVRS"];
EGG_EVO_spAAhard =  ["ZSU_TK_EP1","pracs_tk_sa8","pook_zsum4_tak","eb_2S6M_Tunguska_D","pook_5P85S_TAK","pracs_sa6_tk","pook_SA20_static_TAK"];