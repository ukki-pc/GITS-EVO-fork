
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
EGG_EVO_statEnemyAA = ["Igla_AA_pod_TK_EP1","POOK_zpu4_tak","pracs_tk_sa2","ZU23_TK_EP1","EB_pook_Type74_TYR","POOK_ks12_tak","EB_DSHKx2_TK","pook_KS19_TAK","pook_s60_TK","POOK_zpu4_tak","pook_sa3_static_tak"]; //REMOVED D30_TK_EP1 2b14_82mm_TK_EP1

//Reinfocing infatry vehicles
EGG_EVO_mevconvoyb = ["NM_Tigr_des","V3S_TK_EP1","V3S_Open_TK_EP1","vilas_uaz451","pracs_TK_mtlb_apc","LIN_KamazOpen","ARL_Kamaz3","FgS_ZIL131_3","FgS_ZIL131_4","rhs_gaz66o_taki","rhs_gaz66_taki","s1","c1vrs","c2vrs"];

//Reinforce paradrop vehicles
EGG_EVO_mevair3 = ["An2_TK_EP1","Mi17_TK_EP1","Mi24_D_TK_EP1","UH1H_TK_EP1"]; //"ou_ch_46e","ou_ch_53d",

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
