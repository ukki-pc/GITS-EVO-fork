
	{
	_unit = (BIS_EVO_MissionTowns2 select _forEachIndex) select 0;

	_rewardVeh = (BIS_EVO_MissionTowns2 select _forEachIndex) select 2;
	_rewardStr = nil;
	_unitm = format ["%1t", _unit];
	_markerobj = createMarker[_unitm,[getMarkerPos _unit select 0,getMarkerPos _unit select 1]];
	_markerobj setMarkerType  "Strongpoint";

	//TEST
	//BIS_EVO_conqueredTowns = ["mobj1","mobj3"];


	//ENEMY TOWN
	if !(BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_conqueredTowns) then
	{
		_markerobj setMarkerColor "ColorRedAlpha";
		if(!isNil "_rewardVeh") then
			{
		_rewardStr = getText (configFile >> "cfgVehicles" >> _rewardVeh >> "DisplayName");
		_markerobj setMarkerText format ["Enemy Town. Reward: %1",_rewardStr];
		}
		else{
			_markerobj setMarkerText "Enemy Town.";
		};
	}
	//FRIENDLY TOWN
	else 
	{
		_markerobj setMarkerColor "ColorGreen";

		if(!isNil "_rewardVeh") then
		{
			_rewardStr = getText (configFile >> "cfgVehicles" >> _rewardVeh >> "DisplayName");
			_markerobj setMarkerText format ["Unlocked:  %1",_rewardStr];
		}
		else{
			_markerobj setMarkerText "Friendly Town";
		};
	};

	}forEach BIS_EVO_MissionTowns2;

updCityMarkers =
{
	{
	_unit = (BIS_EVO_MissionTowns2 select _forEachIndex) select 0;

	_rewardVeh = (BIS_EVO_MissionTowns2 select _forEachIndex) select 2;
	_rewardStr = nil;
	_unitm = format ["%1t", _unit];

	_markerobj = _unitm;

	//TEST
	//BIS_EVO_conqueredTowns = ["mobj1","mobj3"];


	//ENEMY TOWN
	if !(BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_conqueredTowns) then
	{
		_markerobj setMarkerColor "ColorRedAlpha";
		if(!isNil "_rewardVeh") then
			{
		_rewardStr = getText (configFile >> "cfgVehicles" >> _rewardVeh >> "DisplayName");
		_markerobj setMarkerText format ["Enemy Town. Reward: %1",_rewardStr];
		}
		else{
			_markerobj setMarkerText "Enemy Town.";
		};
	}
	//FRIENDLY TOWN
	else 
	{
		_markerobj setMarkerColor "ColorGreen";

		if(!isNil "_rewardVeh") then
		{
			_rewardStr = getText (configFile >> "cfgVehicles" >> _rewardVeh >> "DisplayName");
			_markerobj setMarkerText format ["Unlocked:  %1",_rewardStr];
		}
		else{
			_markerobj setMarkerText "Friendly Town";
		};
	};

	}forEach BIS_EVO_MissionTowns2;
	
};