_carArray = _this select 0;
_tankArray = _this select 1;
_airArray = _this select 2;
_statArray = _this select 3;
_playerValues = _this select 4;
BIS_EVO_conqueredTowns = _this select 5;
BIS_EVO_unlocks = _this select 6;
weaponsNamespace = _this select 7;

systemChat "asd";

sleep 0.3;
//Start adding vehicles into array
for [{_loop=0}, {_loop<count _carArray}, {_loop=_loop+1}] do 
{
	buyCarList set [_loop,[(buyCarList select _loop) select 0, (buyCarList select _loop) select 1,_carArray select _loop]];
};
publicVariable "buyCarList";
sleep 0.3;
//Start adding vehicles into array
for [{_loop=0}, {_loop<count _tankArray}, {_loop=_loop+1}] do 
{
	buyTankList set [_loop,[(buyTankList select _loop) select 0, (buyTankList select _loop) select 1,_tankArray select _loop]];
};
publicVariable "buyTankList";
sleep 0.3;
//Start adding vehicles into array
for [{_loop=0}, {_loop<count _airArray}, {_loop=_loop+1}] do
{
	buyAirList set [_loop,[(buyAirList select _loop) select 0, (buyAirList select _loop) select 1,_airArray select _loop]];
};
publicVariable "buyAirList";
sleep 0.3;
//Start adding vehicles into array
for [{_loop=0}, {_loop<count _statArray}, {_loop=_loop+1}] do 
{
	buyStatList set [_loop,[(buyStatList select _loop) select 0, (buyStatList select _loop) select 1,_statArray select _loop]];
};
publicVariable "buyStatList";
sleep 0.3;
//Start adding scores from array


//SET MISSION PROGRESS
//BIS_EVO_conqueredTowns = _capturedTowns;
publicVariable "BIS_EVO_conqueredTowns";

[] call updCityMarkers;
sleep 0.3;
hint "load success";
gameBegin = 1;
publicVariable "gameBegin";

_carArray = nil;
_tankArray = nil;
_airArray = nil;
_statArray = nil;
_playerValues = nil;
_missionProgress = nil;