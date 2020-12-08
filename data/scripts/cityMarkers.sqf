
{
_unit = BIS_EVO_radios select _forEachIndex;
_rewardVeh = BIS_EVO_rewardArray select _forEachIndex;
_rewardStr = nil;
if(!isNil "_rewardVeh") then{
	_rewardStr = getText (configFile >> "cfgVehicles" >> _rewardVeh >> "DisplayName");
};

_unitm = format ["%1", _unit];
_markerobj = createMarker[_unitm,[getpos _unit select 0,getpos _unit select 1]];
_markerobj setMarkerType  "Dot";
_markerobj setMarkerColor "ColorRedAlpha";
if(!isNil "_rewardVeh") then
{
	_markerobj setMarkerText format ["Enemy Town. Reward: %1",_rewardStr];
}
else{
	_markerobj setMarkerText "Enemy Town.";
};
}forEach BIS_EVO_radios;