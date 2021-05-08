#define tier1unlock 0
#define tier2unlock 0
#define tier3unlock 0
#define tier4unlock 0

//Rewards players with spawned vehicles when certain criteria is met

_tier1Vehs = 
[
	"FRL_UH60M",
	"FRL_UH60MT",
	"OH58g",
	"FRL_MH6J_Black",
	"MH60S",
	"CH_47F_EP1",
	"CH_47F_BAF",
	"BAF_Merlin_HC3_D",
	"yup_sh60f",
	"ou_ch_46e",
	"ou_ch_53d",
	"PRACS_CH53",
	"PRACS_puma330_MG",
	"PRACS_AB212"
];

_tier2Vehs = 
[
    "BAF_Merlin_HC3_D"
];

_tier3Vehs = 
[
    "yup_SH60B_penguin"
];

_tier4Vehs = 
[
    "SH2b"
];

_rnd = 0;
_vec1 = objnull;
_vec2 = objnull;
_vec3 = objnull;
_vec4 = objnull;


waitUntil{sleep 2; gamebegin == 1};

while {gamebegin == 1} do
{
	//Tier 1
	if(!alive _vec1 && count BIS_EVO_conqueredTowns > tier1unlock) then 
	{
		_rnd = round(random(count _tier1Vehs))-1;
		_vehicle = _tier1Vehs select _rnd;
		_vec1 = createVehicle [_vehicle,  [getMarkerPos "bonusveh1" select 0,getMarkerPos "bonusveh1" select 1,18], [], 0, "NONE"];
		_vec1 setDir markerDir "bonusveh1";
		_vec1 setPos [getMarkerPos "bonusveh1" select 0,getMarkerPos "bonusveh1" select 1,18];
	};
	
	sleep BIS_EVO_GlobalSleep*2;	
	//Tier 2
	if(!alive _vec2 && count BIS_EVO_conqueredTowns > tier2unlock) then 
	{
		_rnd = round(random(count _tier2Vehs))-1;
		_vehicle = _tier2Vehs select _rnd;
		_vec2 = createVehicle [_vehicle,  [getMarkerPos "bonusveh2" select 0,getMarkerPos "bonusveh2" select 1,18], [], 0, "NONE"];
		_vec2 setDir markerDir "bonusveh2";
		_vec2 setPos [getMarkerPos "bonusveh2" select 0,getMarkerPos "bonusveh2" select 1,18];
	};

	 sleep BIS_EVO_GlobalSleep*2;	

	//Tier 3
	if(!alive _vec3 && count BIS_EVO_conqueredTowns > tier3unlock) then 
	{
		_rnd = round(random(count _tier3Vehs))-1;
		_vehicle = _tier3Vehs select _rnd;
		_vec3 = createVehicle [_vehicle,  [getMarkerPos "bonusveh3" select 0,getMarkerPos "bonusveh3" select 1,18], [], 0, "NONE"];
		_vec3 setDir markerDir "bonusveh3";
		_vec3 setPos [getMarkerPos "bonusveh3" select 0,getMarkerPos "bonusveh3" select 1,18];
	};

	sleep BIS_EVO_GlobalSleep*2;
	//Tier 4
	if(!alive _vec4 && count BIS_EVO_conqueredTowns > tier4unlock) then 
	{
		_rnd = round(random(count _tier4Vehs))-1;
		_vehicle = _tier4Vehs select _rnd;
		_vec4 = createVehicle [_vehicle,  [getMarkerPos "bonusveh4" select 0,getMarkerPos "bonusveh4" select 1,18], [], 0, "NONE"];
		_vec4 setDir markerDir "bonusveh4";
		_vec4 setPos [getMarkerPos "bonusveh4" select 0,getMarkerPos "bonusveh4" select 1,18];
	};

	sleep 60;
};