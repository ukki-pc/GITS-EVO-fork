_nuke = getpos Groundzero;

if(player distance _nuke < 2500) then
{
	0 fadeSound 0;
	0 fadeRadio 0;
	titleCut ["","WHITE OUT", 0];
	sleep 2.0;
	titleCut ["","WHITE IN", 0];
	5 fadeSound 0.5;
	5 fadeRadio 0.5;
};

"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [1];
"dynamicBlur" ppEffectCommit 1;


//*******************************************************************
//*******************************************************************

_Cone = "#particlesource" createVehicleLocal getpos Groundzero;
_Cone setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], "", "Billboard", 1, 10, [0, 0, 0],
				[0, 0, 0], 0, 1.275, 1, 0, [40,80], [[0.25, 0.25, 0.25, 0], [0.25, 0.25, 0.25, 0.5], 
				[0.25, 0.25, 0.25, 0.5], [0.25, 0.25, 0.25, 0.05], [0.25, 0.25, 0.25, 0]], [0.25], 0.1, 1, "", "", Groundzero];
_Cone setParticleRandom [2, [1, 1, 30], [1, 1, 30], 0, 0, [0, 0, 0, 0.1], 0, 0];
_Cone setParticleCircle [10, [-10, -10, 20]];
_Cone setDropInterval 0.005;

_top = "#particlesource" createVehicleLocal getpos Groundzero;
_top setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 3, 48, 0], "", "Billboard", 1, 20, [0, 0, 0],
				[0, 0, 80], 0, 1.7, 1, 0, [180,150,180], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", Groundzero];
_top setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_top setDropInterval 0.001;

_top2 = "#particlesource" createVehicleLocal getpos Groundzero;
_top2 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 3, 112, 0], "", "Billboard", 1, 20, [0, 0, 0],
				[0, 0, 20], 0, 1.7, 1, 0, [80,80,100], [[1, 1, 1, 0.5],[1, 1, 1, 0]], [0.07], 1, 1, "", "", Groundzero];
_top2 setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_top2 setDropInterval 0.002;

_smoke = "#particlesource" createVehicleLocal getpos Groundzero;
_smoke setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0],
				[0, 0, 80], 0, 1.7, 1, 0, [40,50,60], 
				[[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]]
				, [0.5, 0.1], 1, 1, "", "", Groundzero];
_smoke setParticleRandom [0, [10, 10, 15], [15, 15, 7], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_smoke setDropInterval 0.002;

_Wave = "#particlesource" createVehicleLocal getpos Groundzero;
_Wave setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], "", "Billboard", 1, 20, [0, 0, 0],
				[0, 0, 0], 0, 1.5, 1, 0, [50, 100], [[0.1, 0.1, 0.1, 0.5], 
				[0.5, 0.5, 0.5, 0.5], [1, 1, 1, 0.3], [1, 1, 1, 0]], [1,0.5], 0.1, 1, "", "", Groundzero];
_Wave setParticleRandom [2, [20, 20, 20], [5, 5, 0], 0, 0, [0, 0, 0, 0.1], 0, 0];
_Wave setParticleCircle [50, [-80, -80, 2.5]];
_Wave setDropInterval 0.0002;


_light = "#lightpoint" createVehicleLocal [((getpos Groundzero select 0)),(getpos Groundzero select 1),((getpos Groundzero select 2)+500)];
_light setLightAmbient[1500, 1200, 1000];
_light setLightColor[1500, 1200, 1000];
_light setLightBrightness 100000.0;

//*******************************************************************
//*******************************************************************


[] exec "nuke\damage.sqs";

"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [0.8, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.0, 0.6, 2],[0.3, 0.3, 0.3, 0.1]];"colorCorrections" ppEffectCommit 0.4;
 
"dynamicBlur" ppEffectAdjust [0.5];
"dynamicBlur" ppEffectCommit 3;

0 setOvercast 0;
sleep 0.1;

_xHandle = []spawn
{
	Sleep 4;
	"colorCorrections" ppEffectAdjust [1.0, 0.5, 0, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 0.8, 0.4],[0.3, 0.3, 0.3, 0.1]];
	"colorCorrections" ppEffectCommit 7;
};

"dynamicBlur" ppEffectAdjust [2];
"dynamicBlur" ppEffectCommit 1;

"dynamicBlur" ppEffectAdjust [0.5];
"dynamicBlur" ppEffectCommit 4;
_light setLightBrightness 100000.0;


sleep 1.5;
//if (Groundzero distance player < 2500) then {player say "Explo_Large"};
if (Groundzero distance player < 2500) then {player say "Explo_Nuke"};
sleep 2;
if (Groundzero distance player < 2500) then {player say "nsound"};

_Wave setDropInterval 0.001;
deletevehicle _top;
deletevehicle _top2;
sleep 7;
_top3 = "#particlesource" createVehicleLocal getpos Groundzero;
_top3 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 3, 48, 0], "", "Billboard", 1, 20, [0, 0, 500],
				[0, 0, 65], 0, 1.7, 1, 0, [200,200,200], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", Groundzero];
_top3 setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_top3 setDropInterval 0.001;

sleep 0.6;
deletevehicle _top3;

sleep 3;

"colorCorrections" ppEffectAdjust [1, 1, 0, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 0.8, 0.4],[0.3, 0.3, 0.3, 0.1]];"colorCorrections" ppEffectCommit 1; "colorCorrections" ppEffectEnable TRUE;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 1;


_top4 = "#particlesource" createVehicleLocal getpos Groundzero;
_top4 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 3, 48, 0], "", "Billboard", 1, 20, [0, 0, 800],
				[0, 0, 55], 0, 1.7, 1, 0, [200,200,200], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", Groundzero];
_top4 setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_top4 setDropInterval 0.001;

sleep 0.6;
deleteVehicle _light;
deletevehicle _top4;
sleep 4;

_top5 = "#particlesource" createVehicleLocal getpos Groundzero;
_top5 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 3, 48, 0], "", "Billboard", 1, 20, [0, 0, 1000],
				[0, 0, 20], 0, 1.7, 1, 0, [250,280,250], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", Groundzero];
_top5 setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_top5 setDropInterval 0.001;

_Cone setDropInterval 0.01;
_Wave setDropInterval 0.001;

_smoke setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0],
				[0, 0, 80], 0, 1.7, 1, 0, [150,150,150], 
				[[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]]
				, [0.5, 0.1], 1, 1, "", "", Groundzero];
_smoke setDropInterval 0.01;

_smoke2 = "#particlesource" createVehicleLocal getpos Groundzero;
_smoke2 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 900],
				[0, 0, 25], 0, 1.7, 1, 0, [160,180,170], 
				[[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]]
				, [0.5, 0.1], 1, 1, "", "", Groundzero];
_smoke2 setParticleRandom [0, [10, 10, 15], [15, 15, 7], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_smoke2 setDropInterval 0.01;


sleep 5;
deletevehicle _top5;
_Cone setDropInterval 0.02;
_Wave setDropInterval 0.01;


sleep 5;
deletevehicle _smoke2;
sleep 10;
deleteVehicle _Wave;
deleteVehicle _cone;
deletevehicle _smoke;
sleep 20;
"colorCorrections" ppEffectEnable false;

