
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

EGG_EVO_ENEMYSHIPS = ["sc9_nanuchka","sc9_missileboat_opf","sc9_ships1_frigate_opf","sc9_gunboat_opf","ibr_gunboat_arl","GNTKrivak","IRAN_MissileBoat","IRAN_PatrolBoat"];

EGG_EVO_mevlight = ["BTR40_MG_TK_INS_EP1","pracs_TK_type63","pracs_TK_mtlb_apc","BTR40_TK_INS_EP1"];
EGG_EVO_MechEasy = [_BRDMS] + [_TIGRS] + [_UAZS] + [_LANDROVERS] + [_VODNIKS] + [EGG_EVO_mevlight];
EGG_EVO_MechMedium =["uns_pt76","T72_TK_EP1","pook_btrMWS_tak","AP_BTR80_D_CAMO","AP_BTR82A_DES","eb_btr90_tk","vil_t62m","ch_t72_desert","ch_t72_2_desert","pook_btr2a42_tak","VIL_BMP1_TKS","EB_BMP3_TK","sa_bmd_1_iraq","BMP2_TK_EP1","pook_brdm2at2_tak","T55_TK_EP1","T34_TK_EP1","UAZ_AGS30_TK_EP1","BTR60_TK_EP1","Ural_ZU23_TK_EP1","M113_TK_EP1","BMP2_HQ_TK_EP1"];
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

//Reinfocing infatry vehicles
EGG_EVO_mevconvoyb = ["NM_Tigr_des","V3S_TK_EP1","V3S_Open_TK_EP1","vilas_uaz451","pracs_TK_mtlb_apc","LIN_KamazOpen","ARL_Kamaz3","FgS_ZIL131_3","FgS_ZIL131_4","rhs_gaz66o_taki","rhs_gaz66_taki","s1","c1vrs","c2vrs"];

//Reinforce paradrop vehicles
EGG_EVO_mevair3 = ["An2_TK_EP1","Mi17_TK_EP1","Mi24_D_TK_EP1","UH1H_TK_EP1"]; //"ou_ch_46e","ou_ch_53d",

//Rappeling vehicles, make sure to add compatibility in animateRope.sqf
EGG_EVO_rappelChoppers = ["FRL_Mi8_MT_RUS"];

//makehip light choppers
EGG_EVO_eastheli1 = ["ibr_gazelle_armed","FRL_Mi17_1_TAK","UH1H_TK_EP1"];//makehip

EGG_EVO_spetzHeli = ["UH60M_EP1"];

//makehindp
EGG_EVO_EnemyHeli2 = ["UH1H_TK_EP1","ibr_gazelle_armed","FRL_Mi17_1_TAK","FRL_Mi17_TAK","FRL_Mi17_TVK_TAK","FRL_Mi17_TVK_TAK_AGM","FRL_Mi17_TVK_TAK_MR","FRL_Mi17_TVK_TAK_BMB","FRL_Mi24D_TK_CAP","FRL_Mi24D_TK_CAS","FRL_Mi24D_TK_HCAS","FRL_Mi24D_TK_AGM","FRL_Mi24D_TK_MR","FRL_Mi24D_TK_BMB","FRL_Mi24D_TK_LRCAS","FRL_Mi24D_TK_SEAD"];//makehip
//makeka
EGG_EVO_EnemyHeli3 =["FRL_Mi8_AMTSh_RUS","FRL_Mi8_AMTSh_RUS_HCAS","FRL_Mi8_AMTSh_AGM","FRL_Mi8_AMTSh_MR","FRL_Mi8_AMTSh_BMB","FRL_Mi8_MTV3_RUS","FRL_Mi8_MTV3_RUS_HCAS","FRL_Mi8_MTV3_RUS_AGM","FRL_Mi8_MTV3_RUS_MR","FRL_Mi8_MTV3_RUS_BMB","FRL_Mi24V_TK_CAP","FRL_Mi24V_TK_CAS","FRL_Mi24V_TK_HCAS","FRL_Mi24V_TK_AGM","FRL_Mi24V_TK_MR","FRL_Mi24V_TK_BMB","FRL_Mi24V_TK_LRCAS","FRL_Mi24V_TK_SEAD","FRL_Mi24P_TK_CAP","FRL_Mi24P_TK_CAS","FRL_Mi24P_TK_HCAS","FRL_Mi24P_TK_AGM","FRL_Mi24P_TK_MR","FRL_Mi24P_TK_BMB","FRL_Mi24P_TK_LRCAS","FRL_Mi24P_TK_SEAD"];

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
EGG_EVO_mfhq =["USMC_WarfareBFieldhHospital","CDF_WarfareBFieldhHospital","USMC_WarfareBAircraftFactory","LAV25_HQ_unfolded","CDF_WarfareBBarracks"];// meeds taki

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
["PRACS_M60A3",3500],							// T72M
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

assaultRifles =["m8_compact", "RH_M4CMK", "RH_M4CMKAIM", "RH_M4CMKEOTECH", "RH_M4CMKACOG", "RH_ar10", "RH_ar10s", "RH_m16a3cs", "RH_m4a1r", "RH_m4a1eotech", "RH_m4sdeotech", "RH_m4acog", "RH_m4", "RH_m4sd", "RH_m4macog", "RH_M4sdaim_wdl", "RH_m4sbraim", "RH_M4CTSD_F", "RH_mk18", "RH_Mk18aim", "RH_mk18eot", "RH_Mk18acog", "RH_mk18sd", "RH_Mk18sdaim", "RH_Mk18sdeot", "RH_Mk18sdacog", "RH_Mk18gl", "RH_Mk18glaim", "RH_Mk18gleot", "RH_mk18glacog", "RH_SCARL_AIM", "RH_SCARL_MK4", "RH_SCARL_SD_DOC", "RH_SCARLB_SD_EOTECH", "RH_SCARH_MK4", "RH_SCARH_SPECTERDR", "RH_SCARH_SD_ACOG", "RH_m16a2gl", "RH_m16a3sgl", "RH_m16a4glacog", "RH_m16a4gleotech", "RH_m4gl", "RH_M4sdgleotech_wdl", "RH_m4sdglaim", "RH_m4sdglacog", "RH_M4CTSDGLACOG_F", "RH_M4CTSDGL_F", "RH_XM8DGL", "RH_SCARH_GL_EOTECH", "RH_SCARH_GL_SPECTERDR", "RH_SCARLB_SD_GL_AIM", "RH_SCARL_GL_EOTECH", "RH_SCARLB_GL_ACOG", "RH_XM8DSAW", "G36A_camo", "G36_C_SD_eotech", "m8_compact", "G36C_camo", "G36_C_SD_camo", "FN_FAL", "M16A2", "M4A1", "M4A1_AIM_SD_camo", "M4A1_Aim_camo", "G36C", "G36K", "m8_carbine", "m8_holo_sd", "m8_compact_pmc", "G36A_camo", "G36K_camo", "M4A3_CCO_EP1", "Scar_H_CQC_CCO", "Scar_H_CQC_CCO_SD", "Scar_L_CQC", "Scar_L_CQC_CCO_SD", "Scar_L_CQC_Holo", "Scar_L_STD_Holo", "Scar_L_STD_Mk4CQT", "SCAR_H_STD_TWS_SD", "BAF_L85A2_RIS_Holo", "M16A2GL", "M16A4_GL", "M16A4_ACG_GL", "M4A1_RCO_GL", "M4A1_HWS_GL_camo", "M4A1_HWS_GL_SD_Camo", "m8_carbineGL", "M4A3_RCO_GL_EP1", "SCAR_H_STD_EGLM_Spect", "SCAR_L_CQC_EGLM_Holo", "SCAR_L_STD_EGLM_RCO", "SCAR_L_STD_EGLM_TWS", "BAF_L85A2_UGL_ACOG", "BAF_L85A2_UGL_Holo", "BAF_L85A2_UGL_SUSAT", "M32_EP1", "M79_EP1", "Mk13_EP1", "BAF_L85A2_RIS_ACOG", "BAF_L85A2_RIS_CWS", "BAF_L85A2_RIS_SUSAT", "SCAR_H_LNG_Sniper", "SCAR_H_LNG_Sniper_SD", "FN_FAL_ANPVS4", "m16a4_acg", "m8_tws", "m8_tws_sd"];
smgs = ["MP5SD","RH_fmg9", "RH_pp2000p", "RH_pdreot", "RH_PDW_AIM",  "RH_mac10p", "RH_tec9", "RH_muzi", "RH_mp5kp", "RH_mp7p", "RH_HK53aim", "RH_mp5a4rfx", "RH_mp5a5eot", "RH_mp5a5ris", "RH_mp5a5eodRFX", "RH_mp5sd6eot", "RH_mp5kpdw", "RH_P90i", "RH_P90isd", "RH_p90aim", "RH_p90sdaim", "RH_umpeot", "RH_ump", "RH_umpsd", "RH_umpaim", "RH_umpsdaim", "RH_krissRFX", "RH_kriss", "RH_krisssd", "RH_krisseot", "RH_krisssdeot", "RH_uzi", "RH_uzisd", "RH_tmp", "RH_tmpsd", "RH_tmpaim", "RH_tmpsdaim", "RH_pp2000eot", "RH_mp7eot", "RH_mp7sdeot", "RH_mp7aim", "RH_mp7sdaim", "UZI_EP1", "UZI_SD_EP1", "MP5A5", "MP5SD"];
shotguns = ["M1014","AA_PMC"];
pistols = ["RH_m93r", "RH_p226", "RH_g17", "RH_g18", "RH_g19t", "RH_mk2", "M9SD", "RH_mk22v", "RH_mk22vsd", "RH_usp", "RH_uspsd", "RH_m9", "RH_m9sd", "RH_m1911", "RH_m1911sd", "RH_anac", "RH_bull", "RH_python","EB_m1911SD", "RH_deagle", "M9", "Colt1911", "glock17_EP1", "revolver_EP1"];
rifles = ["huntingrifle", "LeeEnfield","EB_BAF_LRR_scoped_O", "M14_EP1", "RH_m14", "RH_m14aim", "RH_mk14teot", "RH_mk14t", "RH_mk14tsd", "RH_MK14AIM", "RH_MK14SDAIM", "RH_MK14", "RH_MK14SD", "RH_MK14EOTECH", "RH_MK14SDEOTECH", "RH_sc2", "RH_sc2aim", "RH_sc2shd", "RH_m1s", "RH_m1saim", "RH_m1ssp", "RH_m1steot", "RH_M14EBRSP", "RH_M14EBRSP_SD", "RH_mk14ebrsp", "RH_mk14ebr_sd", "RH_mk14ebrsp_sd", "RH_m39emr", "RH_mkmod1", "RH_mksd", "RH_m21", "RH_MK21A5SD", "RH_m27", "RH_m27aim", "RH_m27cacog", "RH_m27ceotech", "M4SPR", "m8_sharpshooter", "DMR", "M24", "M24_des_EP1", "M40A3", "EB_M24A2", "EB_M24A2_D", "EB_M24A3", "EB_M24A3_D", "BAF_LRR_scoped", "BAF_LRR_scoped_W", "M107", "M107_TWS_EP1", "M110_NVG_EP1", "M110_TWS_EP1", "BAF_AS50_scoped", "BAF_AS50_TWS", "BAF_L86A2_ACOG"];
mgs = ["Mk_48", "Mk_48_DES_EP1","BAF_L7A2_GPMG","RH_M249", "RH_M249acog", "ukf_L86A2LSW_susat","RH_M249elcan", "RH_M249p", "RH_M249pacog", "RH_M249pelcan", "RH_Mk48mod1", "RH_Mk48mod1acog", "RH_Mk48mod1elcan", "RH_M60E4_EOTECH", "RH_MK43_ACOG", "RH_MK43_ELCAN", "MG36", "MG36_camo", "M249", "M249_m145_EP1", "M249_TWS_EP1", "M240", "m240_scoped_EP1", "M60A4_EP1", "BAF_L110A1_Aim", "Mk_48", "Mk_48_DES_EP1"];
launchers = ["M136", "SMAW", "Stinger","ukf_gpmg","MAAWS", "BAF_NLAW_Launcher","FFAA_Armas_C90","FFAA_Armas_C100","ukf_law80launcher","JAVELIN"];
miscs = ["pipebomb","mine"
,"EB_v40gren","HandGrenade_West","IRStrobe","IR_Strobe_Marker","EB_mk3a2gren","EB_m67gren","EB_m61gren","EB_m34gren","EB_m14gren","EB_m308gren","EB_mk40gren","EB_TIscanner","EB_TIGoggles","EB_MX991_r","Binocular","EB_S10","eb_ItemFuelcan","EB_MX991_g","EB_mkvFlarePistol","Laserdesignator","EB_m79p","EB_MX991_w"];
