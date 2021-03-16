	_enemyColor = "ColorBrown";
	_friendlyColor = "ColorGreen";

	{
	_currentTown = BIS_EVO_MissionTowns select _forEachIndex;
	_unit = (_currentTown);
	_airports = ["mobjC1","mobjC3","mobjC5","mobjC6"];
	_unitm = format ["%1t", _unit];
	_markerobj = createMarker[_unitm,[getMarkerPos _unit select 0,getMarkerPos _unit select 1]];
	//TEST
	BIS_EVO_conqueredTowns = ["mobjC2","mobj11"];


	//ENEMY TOWN
	if !(_currentTown in BIS_EVO_conqueredTowns) then
	{
		if(_currentTown in BIS_EVO_MissionBigTowns or _currentTown in BIS_EVO_MilitaryObjectives) then 
		{
			if(_currentTown in BIS_EVO_MissionBigTowns) then 
			{
				_objInd =	BIS_EVO_MissionBigTowns  find (_currentTown);
				_vec = BIS_EVO_unlocks select _objInd;
				_dispname = getText (configFile >> "cfgVehicles" >> _vec >> "displayName");
				_markerobj setMarkerType  "plp_icon_building";
				_markerobj setMarkerColor _enemyColor;
				_markerobj setMarkerText _dispname;
			};
			if(_currentTown in BIS_EVO_MilitaryObjectives) then 
			{
				_objInd =	BIS_EVO_MilitaryObjectives  find (_currentTown);
				_vec = BIS_EVO_unlocks select _objInd;
				_dispname = getText (configFile >> "cfgVehicles" >> _vec >> "displayName");
				_markerobj setMarkerType  "plp_icon_storage1";
				_markerobj setMarkerColor _enemyColor;
				_markerobj setMarkerText _dispname;
				if((_currentTown) in _airports) then {_markerobj setMarkerType "plp_icon_hangarB";};
			};
		}
		//BIS_EVO_MilitaryObjectives
		else
		{
			_markerobj setMarkerType  "plp_icon_house";
			_markerobj setMarkerColor _enemyColor;
			_markerobj setMarkerSize [0.8,0.8];
		//	_markerobj setMarkerText "Enemy Town";
		};
	}
	else 
	{
		_markerobj setMarkerType  "plp_icon_house";
		_markerobj setMarkerColor _friendlyColor;
		_markerobj setMarkerSize [0.8,0.8];

		if(_currentTown in BIS_EVO_MissionBigTowns)
		then 
		{
			_objInd =	BIS_EVO_MissionBigTowns  find (_currentTown);
			_vec = BIS_EVO_unlocks select _objInd;
			BIS_EVO_unlocks set [_objInd, ""];
			publicVariable "BIS_EVO_unlocks";
			_dispname = getText (configFile >> "cfgVehicles" >> _vec >> "displayName");
			_markerobj setMarkerType  "plp_icon_building";
			_markerobj setMarkerText _dispname;
			_markerobj setMarkerSize [1,1];
		};
		if(_currentTown in BIS_EVO_MilitaryObjectives)
		then 
		{
			_objInd = BIS_EVO_MilitaryObjectives  find (_currentTown);
			_objInd = _objInd + count BIS_EVO_MissionBigTowns;
			_vec = BIS_EVO_unlocks select _objInd;
			BIS_EVO_unlocks set [_objInd, ""];
			_dispname = getText (configFile >> "cfgVehicles" >> _vec >> "displayName");
			publicVariable "BIS_EVO_unlocks";
			_markerobj setMarkerType  "plp_icon_storage1";
			_markerobj setMarkerText _dispname;
			_markerobj setMarkerSize [1,1];
		};
	};
}forEach BIS_EVO_MissionTowns;

updCityMarkers =
{
	{
	_currentTown = BIS_EVO_MissionTowns select _forEachIndex;
	_unit = (_currentTown);

	_unitm = format ["%1t", _unit];
	_markerobj = _unitm;

	//ENEMY TOWN
	if !(_currentTown in BIS_EVO_conqueredTowns) then
	{
		if(_currentTown in BIS_EVO_MissionBigTowns or _currentTown in BIS_EVO_MilitaryObjectives) then 
		{
			if(_currentTown in BIS_EVO_MissionBigTowns) then 
			{
				_objInd =	BIS_EVO_MissionBigTowns  find (_currentTown);
				_vec = BIS_EVO_unlocks select _objInd;
				_dispname = getText (configFile >> "cfgVehicles" >> _vec >> "displayName");
				_markerobj setMarkerType  "Depot";
				_markerobj setMarkerColor _enemyColor;
				_markerobj setMarkerText _dispname;
			};
			if(_currentTown in BIS_EVO_MilitaryObjectives) then 
			{
				_objInd =	BIS_EVO_MilitaryObjectives  find (_currentTown);
				_vec = BIS_EVO_unlocks select _objInd;
				_dispname = getText (configFile >> "cfgVehicles" >> _vec >> "displayName");
				_markerobj setMarkerType  "City";
				_markerobj setMarkerColor _enemyColor;
				_markerobj setMarkerText _dispname;
			};
		}
		//BIS_EVO_MilitaryObjectives
		else
		{
			_markerobj setMarkerType  "Strongpoint";
			_markerobj setMarkerColor _enemyColor;
		//	_markerobj setMarkerText "Enemy Town";
		};
	}
	//FRIENDLY TOWN
	else 
	{
		_markerobj setMarkerColor _friendlyColor;
		_markerobj setMarkerType  "Strongpoint";

		if(_currentTown in BIS_EVO_MissionBigTowns)
		then 
		{
			_objInd =	BIS_EVO_MissionBigTowns  find (_currentTown);
			_vec = BIS_EVO_unlocks select _objInd;
			BIS_EVO_unlocks set [_objInd, ""];
			publicVariable "BIS_EVO_unlocks";
			_dispname = getText (configFile >> "cfgVehicles" >> _vec >> "displayName");
			_markerobj setMarkerText _dispname;
		};
		if(_currentTown in BIS_EVO_MilitaryObjectives)
		then 
		{
			_objInd = BIS_EVO_MilitaryObjectives  find (_currentTown);
			_objInd = _objInd + count BIS_EVO_MissionBigTowns;
			_vec = BIS_EVO_unlocks select _objInd;
			BIS_EVO_unlocks set [_objInd, ""];
			_dispname = getText (configFile >> "cfgVehicles" >> _vec >> "displayName");
			publicVariable "BIS_EVO_unlocks";
			_markerobj setMarkerText _dispname;
		};
	};

	}forEach BIS_EVO_MissionTowns;
	
};