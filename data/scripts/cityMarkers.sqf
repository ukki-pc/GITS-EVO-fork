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
				_objInd =	BIS_EVO_MissionBigTowns  find (BIS_EVO_MissionTowns select _forEachIndex);
				_vec = BIS_EVO_unlocks select _objInd;
				_dispname = getText (configFile >> "cfgVehicles" >> _vec >> "displayName");
				_markerobj setMarkerType  "Depot";
				_markerobj setMarkerColor "ColorRed";
				_markerobj setMarkerText _dispname;
			};
			if(BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_MilitaryObjectives) then 
			{
				_objInd =	BIS_EVO_MilitaryObjectives  find (BIS_EVO_MissionTowns select _forEachIndex);
				_vec = BIS_EVO_unlocks select _objInd;
				_dispname = getText (configFile >> "cfgVehicles" >> _vec >> "displayName");
				_markerobj setMarkerType  "City";
				_markerobj setMarkerColor "ColorRed";
				_markerobj setMarkerText _dispname;
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
		_markerobj setMarkerType  "Strongpoint";
		_markerobj setMarkerColor "ColorGreen";

		if(BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_MissionBigTowns)
		then 
		{
			_objInd =	BIS_EVO_MissionBigTowns  find (BIS_EVO_MissionTowns select _forEachIndex);
			_vec = BIS_EVO_unlocks select _objInd;
			BIS_EVO_unlocks set [_objInd, ""];
			publicVariable "BIS_EVO_unlocks";
			_dispname = getText (configFile >> "cfgVehicles" >> _vec >> "displayName");
			_markerobj setMarkerText _dispname;
		};
		if(BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_MilitaryObjectives)
		then 
		{
			_objInd = BIS_EVO_MilitaryObjectives  find (BIS_EVO_MissionTowns select _forEachIndex);
			_objInd = _objInd + count BIS_EVO_MissionBigTowns;
			_vec = BIS_EVO_unlocks select _objInd;
			BIS_EVO_unlocks set [_objInd, ""];
			_dispname = getText (configFile >> "cfgVehicles" >> _vec >> "displayName");
			publicVariable "BIS_EVO_unlocks";
			_markerobj setMarkerText _dispname;
		};
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
				_objInd =	BIS_EVO_MissionBigTowns  find (BIS_EVO_MissionTowns select _forEachIndex);
				_vec = BIS_EVO_unlocks select _objInd;
				_dispname = getText (configFile >> "cfgVehicles" >> _vec >> "displayName");
				_markerobj setMarkerType  "Depot";
				_markerobj setMarkerColor "ColorRed";
				_markerobj setMarkerText _dispname;
			};
			if(BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_MilitaryObjectives) then 
			{
				_objInd =	BIS_EVO_MilitaryObjectives  find (BIS_EVO_MissionTowns select _forEachIndex);
				_vec = BIS_EVO_unlocks select _objInd;
				_dispname = getText (configFile >> "cfgVehicles" >> _vec >> "displayName");
				_markerobj setMarkerType  "City";
				_markerobj setMarkerColor "ColorRed";
				_markerobj setMarkerText _dispname;
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
		_markerobj setMarkerType  "Strongpoint";

		if(BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_MissionBigTowns)
		then 
		{
			_objInd =	BIS_EVO_MissionBigTowns  find (BIS_EVO_MissionTowns select _forEachIndex);
			_vec = BIS_EVO_unlocks select _objInd;
			BIS_EVO_unlocks set [_objInd, ""];
			publicVariable "BIS_EVO_unlocks";
			_dispname = getText (configFile >> "cfgVehicles" >> _vec >> "displayName");
			_markerobj setMarkerText _dispname;
		};
		if(BIS_EVO_MissionTowns select _forEachIndex in BIS_EVO_MilitaryObjectives)
		then 
		{
			_objInd = BIS_EVO_MilitaryObjectives  find (BIS_EVO_MissionTowns select _forEachIndex);
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