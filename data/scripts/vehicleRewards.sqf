#define tier1unlock 0
#define tier2unlock 2
#define tier3unlock 4
#define tier4unlock 6

//Rewards players with spawned vehicles when certain criteria is met
fnc_rndRewardVeh = 
{
private ["_tier","_vec1","_vec2","_vec3","_vec4","_vecObj","_rnd","_vehicle"];
_tier = _this select 0;
_vehicle = "";
_vecObj = objNull;
_vec1 = objnull;
_vec2 = objnull;
_vec3 = objnull;
_vec4 = objnull;
_rnd = 0;

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
	"PRACS_CH53",
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

		switch (_tier) do
		{
			case 1:
			{
				_rnd = round(random((count _tier1Vehs)-1));
				_vehicle = _tier1Vehs select _rnd;
				_vec1 = createVehicle [_vehicle,  [getMarkerPos "bonusveh1" select 0,getMarkerPos "bonusveh1" select 1,18], [], 0, "NONE"];
				_vec1 setDir markerDir "bonusveh1";
				_vec1 setPos [getMarkerPos "bonusveh1" select 0,getMarkerPos "bonusveh1" select 1,18];
				_vec1 addEventHandler ["killed", {_handle = [_this select 0, 300, 1] execVM "data\scripts\rewardVehHandle.sqf"}];
				_vecobj = _vec1;
			};
			case 2:
			{
				_rnd = round(random((count _tier2Vehs)-1));
				_vehicle = _tier2Vehs select _rnd;
				_vec2 = createVehicle [_vehicle,  [getMarkerPos "bonusveh2" select 0,getMarkerPos "bonusveh2" select 1,18], [], 0, "NONE"];
				_vec2 setDir markerDir "bonusveh2";
				_vec2 setPos [getMarkerPos "bonusveh2" select 0,getMarkerPos "bonusveh2" select 1,18];
				_vec2 addEventHandler ["killed", {_handle = [_this select 0, 300, 2] execVM "data\scripts\rewardVehHandle.sqf"}];
				_vecobj = _vec2;
			};
			case 3:
			{
				_rnd = round(random((count _tier3Vehs)-1));
				_vehicle = _tier3Vehs select _rnd;
				_vec3 = createVehicle [_vehicle,  [getMarkerPos "bonusveh3" select 0,getMarkerPos "bonusveh3" select 1,18], [], 0, "NONE"];
				_vec3 setDir markerDir "bonusveh3";
				_vec3 setPos [getMarkerPos "bonusveh3" select 0,getMarkerPos "bonusveh3" select 1,18];
				_vec3 addEventHandler ["killed", {_handle = [_this select 0,300, 3] execVM "data\scripts\rewardVehHandle.sqf"}];
				_vecobj = _vec3;
			};
			case 4:
			{
				_rnd = round(random((count _tier4Vehs)-1));
				_vehicle = _tier4Vehs select _rnd;
				_vec4 = createVehicle [_vehicle,  [getMarkerPos "bonusveh4" select 0,getMarkerPos "bonusveh4" select 1,18], [], 0, "NONE"];
				_vec4 setDir markerDir "bonusveh4";
				_vec4 setPos [getMarkerPos "bonusveh4" select 0,getMarkerPos "bonusveh4" select 1,18];
				_vec4 addEventHandler ["killed", {_handle = [_this select 0,300, 4] execVM "data\scripts\rewardVehHandle.sqf"}];
				_vecobj = _vec4;
			};
		};
	_vecObj;
};


_vec1 = objnull;
_vec2 = objnull;
_vec3 = objnull;
_vec4 = objnull;


waitUntil{sleep 2; count BIS_EVO_conqueredTowns > tier1unlock};

_vec1 = [1] spawn fnc_rndRewardVeh;

waitUntil{sleep 10; count BIS_EVO_conqueredTowns > tier2unlock};

_vec2 = [2] spawn fnc_rndRewardVeh;


waitUntil{sleep 10; count BIS_EVO_conqueredTowns > tier3unlock};

_vec3 = [3] spawn fnc_rndRewardVeh;


waitUntil{sleep 10; count BIS_EVO_conqueredTowns > tier4unlock};

_vec4 = [4] spawn fnc_rndRewardVeh;

