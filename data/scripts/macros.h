//Shorteners
#define dm call debugMessage

//Values
#define rhqTeleportDistance 15
#define mhqTeleportDistance 15
#define townTeleportDistance 300

//Delaytime for hud messages
#define delayTime 0.8

//Enemy generation tresholds
#define easyTreshold 90
#define	hardTreshold 150

//Common
#define everyPlayer call BIS_FNC_listPlayers

//Max dist for sceen marker
#define screenCtrlMaxDist 1600
#define flagLayerStart 11

//unused value for weapon skill
#define skillAddition 1
#define flyHeight 600

//Colors
#define enemyMarkerColor "ColorBrown"
#define colorUnlocked [0, 1, 0, 1]
#define colorGreen [0.4, 0.67, 0.28, 1]
#define colorLocked [0.5, 0.5, 0.5, 1]

//Controls
#define weaponListBox 4000
#define magListBox 4002
#define weaponPicture 4003
#define ammoListBox 4004
#define colorUnlocked [0.4, 0.67, 0.28, 1]
#define colorLocked [0.5, 0.5, 0.5, 1]
#define colorDisabled [0.5, 0.5, 0.5, 1]
#define weaponDesc 2019

//Flag stuff
#define _bunkerSpread  100
#define maxTickets 30
#define captureRadius 30
#define minTickets -30
#define minHeight -7
#define maxCaptureTick 240
#define tickRewawrd 20
#define neuterReward 100
#define captureReward 400
#define rewardingInterval 5
#define calculationInterval 1

//Function macros
#define fnc_hitMark 0
#define fnc_handleKIll 1
#define fnc_msg 2
#define fnc_changeMoney 3
#define fnc_changeScreenCtrl 4
#define fnc_deleteScreenCtrl 5
#define fnc_hudmessage 6
#define fnc_playSound 7
#define fnc_say3d 8
#define fnc_saveMoney 9
#define fnc_broadcastFlags 10
#define fnc_cleanFlags 11
#define fnc_doSpot 12
#define fnc_moveMarker 13

//AIR COMBAT MACROS
	#define maxZdiffDegrees 25
	#define maxdirDegrees 30

//Sound macros
#define alarmSoundTimes 6

//Quirks
#define quote "


//Positions
#define LHDDECK 15.8
#define NIMITZDECK 17.6

//VEHICLES
#define hips ["FRL_Mi17_1_TAK","FRL_Mi17_TAK","FRL_Mi17_TVK_TAK","FRL_Mi17_TVK_TAK_AGM","FRL_Mi17_TVK_TAK_MR","FRL_Mi17_TVK_TAK_BMB","FRL_Mi8_AMTSh_RUS","FRL_Mi8_AMTSh_RUS_HCAS","FRL_Mi8_AMTSh_AGM","FRL_Mi8_AMTSh_MR","FRL_Mi8_AMTSh_BMB","FRL_Mi8_MTV3_RUS","FRL_Mi8_MTV3_RUS_HCAS","FRL_Mi8_MTV3_RUS_AGM","FRL_Mi8_MTV3_RUS_MR","FRL_Mi8_MTV3_RUS_BMB"]
#define hinds ["FRL_Mi24D_TK_CAP","FRL_Mi24D_TK_CAS","FRL_Mi24D_TK_HCAS","FRL_Mi24D_TK_AGM","FRL_Mi24D_TK_MR","FRL_Mi24D_TK_BMB","FRL_Mi24D_TK_LRCAS","FRL_Mi24D_TK_SEAD","FRL_Mi24V_TK_CAP","FRL_Mi24V_TK_CAS","FRL_Mi24V_TK_HCAS","FRL_Mi24V_TK_AGM","FRL_Mi24V_TK_MR","FRL_Mi24V_TK_BMB","FRL_Mi24V_TK_LRCAS","FRL_Mi24V_TK_SEAD","FRL_Mi24P_TK_CAP","FRL_Mi24P_TK_CAS","FRL_Mi24P_TK_HCAS","FRL_Mi24P_TK_AGM","FRL_Mi24P_TK_MR","FRL_Mi24P_TK_BMB","FRL_Mi24P_TK_LRCAS","FRL_Mi24P_TK_SEAD"]
#define EparadropPlanes ["RKTCoalerS","RKTCoalerD","ibr_maule_M7","An2_TK_EP1"]

//WEAPONS
#define rucheaps ["KPFS_Mosin_Nagant","KPFS_KarS", "LeeEnfield","KPFS_Mosin_Nagant_PU","EB_DP28"]
#define rusassaultRifles ["AKS_74_U","AK_47_M","AK_47_S","Sa58P_EP1","Sa58V_CCO_EP1","Sa58V_EP1","AKS_74_GOSHAWK","AKS_74_NSPU","RH_asvalsp","AKS_74_pso","AK_107_pso","Sa58V_RCO_EP1","AK_74","AKS_74_kobra","RH_Rk95aim","AK_107_kobra","RH_akms","RH_ak103","RH_ak104k","RH_ak105sp","RH_AK107_1p29","RH_SCARAKBAIM","RH_SCARAKACOG","AK_74_GL","AK_107_GL_pso","AK_107_GL_kobra","AK_74_GL_kobra","RH_an94gl","RH_aks74upt","RH_aks74uptsp","RH_aks74uptk","RH_ak74mkgl","RH_aks74mglsp","RH_ak104gl","RH_ak105kgl"]
#define russmgs ["Sa61_EP1","RH_vz61","UZI_EP1","bizon","RH_bizon","RH_bizonsdk","RH_gr1sp","Saiga12K"]
#define rusrifles rucheaps + ["EB_svd","RH_asval","RH_SVU","RH_asvalk","RH_oc14sp","ksvk","EB_OSV96","SVD","SVD_CAMO","VSS_vintorez","SVD_des_EP1","SVD_NSPU_EP1"]
#define rusmgs ["PK","RPK_74","pecheneg","RH_rpk74m1p29"]
#define ruslaunchers ["RPG18","RPG7V","Igla","Strela","MetisLauncher"]