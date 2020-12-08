_carArray = _this select 0;
_tankArray = _this select 1;
_airArray = _this select 2;
_statArray = _this select 3;
_playerValues = _this select 4;
_missionProgress = _this select 5;

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
for [{_loop=0}, {_loop<count _playerValues}, {_loop=_loop+1}] do 
{
	((_playerValues select _loop)select 0) addscore ((_playerValues select _loop)select 1);
};


//SET MISSION PROGRESS
BIS_EVO_MissionProgress = _missionProgress;
publicVariable "BIS_EVO_MissionProgress";
hint "load success";
gameBegin = 1;
publicVariable "gameBegin";

_carArray = nil;
_tankArray = nil;
_airArray = nil;
_statArray = nil;
_playerValues = nil;
_missionProgress = nil;