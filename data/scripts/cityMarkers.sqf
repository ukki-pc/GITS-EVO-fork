
	{
	_unit = (BIS_EVO_MissionTowns select _forEachIndex);

	_unitm = format ["%1t", _unit];
	_markerobj = createMarker[_unitm,[getMarkerPos _unit select 0,getMarkerPos _unit select 1]];
	//TEST
	BIS_EVO_conqueredTowns = ["mobjC1","mobj11"];

	//ENEMY TOWN
	if !(BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_conqueredTowns) then
	{
		if(BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_MissionBigTowns or BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_MilitaryObjectives) then 
		{
			if(BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_MissionBigTowns) then 
			{
				_markerobj setMarkerType  "Depot";
				_markerobj setMarkerColor "ColorRed";
			//	_markerobj setMarkerText "Enemy Big City";
			};
			if(BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_MilitaryObjectives) then 
			{
				_markerobj setMarkerType  "City";
				_markerobj setMarkerColor "ColorRed";
			//	_markerobj setMarkerText "Enemy Big City";
			};
		}
		//BIS_EVO_MilitaryObjectives
		else
		{
			_markerobj setMarkerType  "Strongpoint";
			_markerobj setMarkerColor "ColorRed";
		//	_markerobj setMarkerText "Enemy Town";
		};
	}
	else 
	{
		_markerobj setMarkerType  "Flag1";
		_markerobj setMarkerColor "ColorGreen";
		_markerobj setMarkerText "Captured Objective";
	};
}forEach BIS_EVO_MissionTowns;

updCityMarkers =
{
	{
	_unit = (BIS_EVO_MissionTowns select _forEachIndex);

	_unitm = format ["%1t", _unit];
	_markerobj = _unitm;

	//ENEMY TOWN
	if !(BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_conqueredTowns) then
	{
		if(BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_MissionBigTowns or BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_MilitaryObjectives) then 
		{
			if(BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_MissionBigTowns) then 
			{
				_markerobj setMarkerType  "Depot";
				_markerobj setMarkerColor "ColorRed";
			//	_markerobj setMarkerText "Enemy Big City";
			};
			if(BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_MilitaryObjectives) then 
			{
				_markerobj setMarkerType  "City";
				_markerobj setMarkerColor "ColorRed";
			//	_markerobj setMarkerText "Enemy Big City";
			};
		}
		//BIS_EVO_MilitaryObjectives
		else
		{
			_markerobj setMarkerType  "Strongpoint";
			_markerobj setMarkerColor "ColorRed";
		//	_markerobj setMarkerText "Enemy Town";
		};
	}
	//FRIENDLY TOWN
	else 
	{
		_markerobj setMarkerColor "ColorGreen";
		_markerobj setMarkerText "Friendly Objective";
	};

	}forEach BIS_EVO_MissionTowns;
	
};