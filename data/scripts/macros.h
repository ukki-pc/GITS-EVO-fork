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