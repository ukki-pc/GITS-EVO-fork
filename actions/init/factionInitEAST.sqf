
#include "factionDefines.hpp"
EGG_EVO_PLAYERFACTION = east;
EGG_EVO_ENEMYFACTION = west;
EGG_EVO_strENEMYFACTION = "WEST";
EGG_EVO_strPLAYERFACTION = "EAST";
EGG_EVO_friendlyColor = "colorBlack";
_SideHQ = createCenter west;
EAST setFriend [WEST, 0]; 
EAST setFriend [RESISTANCE, 0]; 
WEST setFriend [EAST, 0];
WEST setFriend [RESISTANCE, 1];
RESISTANCE setFriend [WEST, 1];
RESISTANCE setFriend [EAST, 0];

egg_evo_Amb = "EB_BRDM2_HQ_TK";
egg_evo_MHQ = "pook_brdm2M2_TKINS";

reng1 setTriggerActivation ["EAST", "PRESENT", false];
reng2 setTriggerActivation ["EAST", "PRESENT", false];
reng3 setTriggerActivation ["EAST", "PRESENT", false];
reng4 setTriggerActivation ["EAST", "PRESENT", false];

BIS_EVO_pallammo = ["pipebomb","LWS_Laserbatteries","HandGrenade_West","HandGrenade_West","30Rnd_762x39_AK47","30Rnd_762x39_AK47","30Rnd_762x39_AK47","30Rnd_762x39_AK47","30Rnd_762x39_AK47"];
BIS_EVO_pweapons = ["RH_akms","Laserdesignator","EB_S10","EB_ItemSiphon"];

//Main men
EGG_EVO_enemy1= [ANA];
EGG_EVO_enemy2 = EGG_EVO_enemy1;
EGG_EVO_enemy3 = EGG_EVO_enemy1;
EGG_EVO_enemy4 = EGG_EVO_enemy1;
EGG_EVO_enemy5 = EGG_EVO_enemy1;
EGG_EVO_defenders = [ANA];
EGG_EVO_OfficerDefenders = [ANASF];
EGG_EVO_ENEMYSHIPS = [];

EGG_EVO_MechEasy = ["EB_M1114_Armored_D"];
EGG_EVO_MechMedium = ["ibr_VAB_Mephisto"];
EGG_EVO_MechHard = ["M1A2_US_TUSK_MG_EP1"];

EGG_EVO_enemySupply = [];

//THESE AA SPAWN ON TOWNS
EGG_EVO_spAAeasy = ["FAP_ZPU4","BofTruck"];
EGG_EVO_spAAmedium = EGG_EVO_spAAeasy;
EGG_EVO_spAAhard = [];

EGG_EVO_mepilot = ["US_Soldier_Pilot_EP1"];
EGG_EVO_meofficer = ["BAF_Soldier_Officer_MTP"];

//statics
EGG_EVO_statEnemy = [staticWest];
EGG_EVO_statEnemyAA = [staticAAWEST];

//Reinfocing infatry vehicles
EGG_EVO_mevconvoyb = ["MTVR_DES_EP1","PRACS_M250","SRA_Truck5tOpen","c1","s2"];

//Reinforce paradrop vehicles
EGG_EVO_mevair3 = ["CH_47F_EP1","UH60M_MEV_EP1","BAF_Merlin_HC3_D","UH60M_EP1","UH1Y","PRACS_puma330_MG","PRACS_CH53"]; //"ou_ch_46e","ou_ch_53d",

//makehip
EGG_EVO_eastheli1 = ["PRACS_puma330_MG","PRACS_AH6J","CH_47F_EP1","UH60M_EP1","PRACS_AB212_CAS","ibr_as350_armed","Mi171Sh_rockets_CZ_EP1","AW159_Lynx_BAF","PRACS_RAH6","PRACS_AH1S","AH1Z","AH64D"];//makehip

EGG_EVO_spetzHeli = ["UH60M_EP1"];

//makehindp
EGG_EVO_EnemyHeli2 = ["PRACS_RAH6","PRACS_AB212_cas","FRL_AH6M_TOW_D","FRL_Lynx_MR","PRACS_AH1S","AH1Z","AH64D"];
//makeka
EGG_EVO_EnemyHeli3 = ["FRL_UH60M_SPIKE","FRL_AH64D_HCAS","FRL_AH1W_AT","AH1Z"];

//hindv
EGG_EVO_mevaira = EGG_EVO_EnemyHeli2+EGG_EVO_EnemyHeli3;//hindv

//planes
//makesub
	EGG_EVO_mevairb = ["SMAF_MF1_AGRESSOR_DESERT","PRACS_Etendard","Pracs_Mohawk","PRACS_Mirage3","F4M_Des","PRACS_A4","PRACS_F16_PHSTRK","JS_JC_FA18E_USMC","PRACS_F15","FRL_A10_MR"];

//"RKTSU33B1","RKTSU33AG","RKTSU33AA","RKTSU33MR",
//makesu
EGG_EVO_mevairc = ["F35B","FRL_AV8B_MR","FRL_GR4_D_CAP","pook_EF2000_BAF_D_MR"];
//HQ Structure
EGG_EVO_mehq = ["BMP2_HQ_TK_unfolded_EP1"];
EGG_EVO_meflag = ["FlagCarrierTK_EP1"];
EGG_EVO_mfhq =["USMC_WarfareBFieldhHospital","CDF_WarfareBFieldhHospital","USMC_WarfareBAircraftFactory","LAV25_HQ_unfolded","CDF_WarfareBBarracks"];// meeds taki

BIS_EVO_recruitables = ["TK_INS_Soldier_AR_EP1"];

buyCarList = 
[
/*---Military cars---*/
["ffaa_Nissan_carga",0],
["PRACS_TK_URAL_OPEN",0],
["FFAA_nissan_pk",3],
["FFAA_toyota_dshk",5],
["FFAA_toyota_spg9",12],
["FFAA_toyota_strela",12],
["FFAA_toyota_katiuska",15],
["LandRover_MG_TK_EP1",8],	
["UAZ_AGS30_TK_EP1",10],
["EB_LR_SPG9_PK_TK",12],
["eb_gaz_vodnik_tk",13],
["eb_gaz_vodnik_hmg_tk",15],
["pook_btr40_twinMG_tak",10],
["pook_btr152_zpu_tak",15],
["pook_btr40_zu23_tak",18],
["pook_BTR40_RR106_TAK",20],
["pook_btr40_mortar_tak",22],
["pracs_tk_ural_sam",10],
["Ural_ZU23_TK_EP1",14],
["pook_ural_s60_tak",16],
["UralRepair_TK_EP1",5],
["V3S_TK_EP1",5]
];

for [{_loop=0}, {_loop<count buyCarList}, {_loop=_loop+1}] do {
buyCarList set [_loop,[(buyCarList select _loop) select 0, (buyCarList select _loop) select 1,0]];
};

buyTankList = 
[
/*---APCs---*/
["pracs_TK_type63",12],
["pracs_TK_mtlb_apc",14],
["brdm2_tk_ep1",12],
["pook_brdm2ags_tak",14],
["pook_brdm2rkt_tkins",18],
["pook_brdm2at2_tak",20],
["pook_brdm2at5_tak",24],
["pook_brdm2aa_tkins",25],
["pook_brdm2_Sa9_tak",28], //AA PERK 1
["btr60_tk_ep1",20],
["pook_btr2a42_tak",22],
["pook_btrMWS_tak",24],
["eb_btr90_tk",25],
/*Tanks*/
["sa_bmd_1_iraq",20],
["VIL_BMP1_TKS",20],						
["BMP2_TK_EP1",24],						
["EB_BMP3_TK",25],						
["T34_tk_ep1",30],	
["pook_t54_tak",50],
["t55_tk_EP1",38],
["vil_t62m",40],	
["ch_t72_desert",42],
["ch_t72_2_desert",50],
["pook_to55_tak",50],
["pracs_tk_t80b",60],
/*AA*/
["pook_zsu57_tak",25],
["zsu_tk_ep1",30],
["pook_zsum4_tak",30],
["pracs_tk_sa13",32], // AA PERK 1
["pracs_sa6_tk",32], // AA PERK 2
["pracs_tk_sa8",35],
["pook_9k317_tak",36],
["pook_9k317m3_tak",38],
["pook_9k331_tak",40],
["pook_9k37_tak",42],
["pook_96k6_tak",45],
["eb_2S6M_Tunguska_D",50],
["pook_5P85S_TAK",50],
/*ARTY*/
["pracs_2s1_tk",120],
["grad_tk_ep1",160]
];

for [{_loop=0}, {_loop<count buyTankList}, {_loop=_loop+1}] do {
buyTankList set [_loop,[(buyTankList select _loop) select 0, (buyTankList select _loop) select 1,0]];
};

hikiAirList = ["FRL_Mig23B_TK_MR","FRL_L59_MR","FRL_Su25_TK_CAS","FRL_Su27_TK_CAP","FRL_Su30MKM_TAK_MR","FRL_Su34_D_LGB","FRL_Mig35_TAK_MR","FRL_Mig29_TAK_MR","pook_MIG25_TAK_SEAD","FRL_Mig27M_TK_HBMB","ibr_maule_M7","ibr_tucano_lin","mig15bis_5_tak","PRACS_TK_MiG21","PRACS_TK_MiG21_AG","SMAF_MF1_TK_CAS","PRACS_TK_Su22","PRACS_TK_Su24Fencer","FRL_L39_CBU"];

buyAirList = 
[
	/*---Helicopters---*/
["ibr_gazelle",10],						// Mi-17
["UH1H_TK_EP1",10],						// Mi-17
["FRL_Mi17_TAK",10],						// Mi-17
["ibr_as350_armed",30],						// Mi-17
["FRL_Bo105pah_MR_TK_GUE",50],						// Mi-17
["ibr_gazelle_armed",70],						// Mi-17
["OWP_MI26cg",10],		
["FRL_Mi17_TVK_TAK",80],						// Mi-17
["FRL_Mi17_TVK_TAK_MR",90],						// Mi-17
["FRL_Mi24V_TK_MR",130],						// Mi-17
["FRL_Mi24D_TK_MR",140],						// Mi-17
["FRL_Mi28_MR",160],						// Mi-17
["FRL_Ka52_MR_D",175],						// Mi-17

/*---Planes---*/
["ibr_maule_M7",10],	
["ibr_tucano_lin",40],								// F35					
["RKTCoalerD",10],								// F35
["mig15bis_5_tak",50],								// F35 
["PRACS_TK_MiG21_AG",110],	
["SMAF_MF1_TK_CAS",130],								// F35
["PRACS_TK_Su22",150],								// F35
["PRACS_TK_MiG21",150],								// F35
["PRACS_TK_Su24Fencer",170],	
["FRL_L39_CBU",170],								// F35
["FRL_L59_MR",170],								// F35
["FRL_Su25_TK_CAS",170],								// A10
["FRL_Su27_TK_CAP",180],								// AV8B
["FRL_Su30MKM_TAK_MR",185],								// AV8B
["FRL_Su34_D_LGB",185],								// AV8B
["FRL_Mig35_TAK_MR",150],	
["FRL_Mig29_TAK_MR",120],								// F35					
["pook_MIG25_TAK_SEAD",130],								// F35
["FRL_Mig27M_TK_HBMB",130],								// F35 
["FRL_Mig23B_TK_MR",140]								// F35
];
for [{_loop=0}, {_loop<count buyAirList}, {_loop=_loop+1}] do {
buyAirList set [_loop,[(buyAirList select _loop) select 0, (buyAirList select _loop) select 1,0]];
};

buyStatList = 
[
/*---Statics---*/
["EB_DSHKM_TK",3],
["EB_DSHKM_mini_tripod_TK",3],
["KORD_TK_EP1",3],
["KORD_HIGH",3],
["AGS_TK_Ep1",5],
["pook_m40_tk",8],
["pook_9m11_tk",8],
["metis_tk_ep1",10],
/*AA*/
["EB_DSHKx2_TK",6],		
["igla_aa_pod_tk_ep1",10],			
["POOK_zpu4_tak",8],					
["POOK_s60_tk",10],		
["pook_type74_tk",12],				
["POOK_ks12_tak",12],			
["POOK_ks19_tak",12],
["pracs_tk_sa2",10],
["pook_sa3_static_tak",15],
["pook_sa20_static_tak",20],
/*ARTY*/
["2b14_82mm_tk_ep1",10],
["69B",20],		
["EB_D20_TK",50],		
["D30_TK_EP1",60]
];

for [{_loop=0}, {_loop<count buyStatList}, {_loop=_loop+1}] do 
{
	buyStatList set [_loop,[(buyStatList select _loop) select 0, (buyStatList select _loop) select 1,0]];
};

//All the weapons
assaultRifles = ["AKS_74_U","AK_47_M","AK_47_S","Sa58P_EP1","Sa58V_CCO_EP1","Sa58V_EP1","AKS_74_GOSHAWK","AKS_74_NSPU","RH_asvalsp","AKS_74_pso","AK_107_pso","Sa58V_RCO_EP1","AK_74","AKS_74_kobra","RH_Rk95aim","AK_107_kobra","RH_akms","RH_ak103","RH_ak104k","RH_ak105sp","RH_AK107_1p29","RH_SCARAKBAIM","RH_SCARAKACOG","AK_74_GL","AK_107_GL_pso","AK_107_GL_kobra","AK_74_GL_kobra","RH_an94gl","RH_aks74upt","RH_aks74uptsp","RH_aks74uptk","RH_ak74mkgl","RH_aks74mglsp","RH_ak104gl","RH_ak105kgl","EB_DP28"];
smgs = ["Sa61_EP1","RH_vz61","UZI_EP1","bizon","RH_bizon","RH_bizonsdk","RH_gr1sp","Saiga12K"];
pistols = ["RH_tt33","RH_pm","RH_aps"];
rifles = ["KPFS_Mosin_Nagant","KPFS_KarS","huntingrifle", "LeeEnfield","EB_svd","KPFS_Mosin_Nagant_PU","RH_asval","RH_SVU","RH_asvalk","RH_oc14sp","ksvk","EB_OSV96","SVD","SVD_CAMO","VSS_vintorez","SVD_des_EP1","SVD_NSPU_EP1"];
mgs = ["PK","RPK_74","pecheneg","RH_rpk74m1p29"];
launchers = ["RPG18","RPG7V","Igla","Strela","MetisLauncher"];
miscs = ["PipeBomb","MineE","EB_v40gren","HandGrenade_West","IRStrobe","IR_Strobe_Marker","EB_TIGoggles","EB_TIscanner","EB_mk3a2gren","EB_m67gren","EB_m61gren","EB_m34gren","EB_m14gren","EB_m308gren","EB_mk40gren","EB_TIscanner","EB_TIGoggles","EB_MX991_r","Binocular","EB_S10","eb_ItemFuelcan","EB_MX991_g","EB_mkvFlarePistol","Laserdesignator","EB_m79p","EB_MX991_w"];

assaultRifleCount = count assaultRifles;
smgsCount = count smgs;
riflesCount = count rifles;
mgsCount = count mgs;
launcherCount = count launchers;