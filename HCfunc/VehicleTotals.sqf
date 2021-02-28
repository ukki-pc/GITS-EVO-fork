// Arma 2 function

private ["_SelectedGroups","_VehicleSubset","_VehicleFilter","_InfoType",
         "_InfoTypeOption","_str","_SelGpgsTopLevel",
         "_selgpgs","_Vehicles","_ObjTotals","_vehicletypes","_ObjectTypesAndNumOf",
         "_vehicletypetotals","_tvi","_nvehicletypes","_TotalAllVehicles","_TotalOfType"];

_SelectedGroups = + (_this select 0);
_VehicleSubset = _this select 1;
_VehicleFilter = _this select 2;
_InfoType = _this select 3;
_InfoTypeOption = + (_this select 4);

_str = "";
         
switch (_VehicleSubset) do {

	case 1: { 
		_str = _str + " All"; 
		_Vehicles = vehicles;
	};
	case 2: {
		_str = _str + " HC Selected"; 
		_SelGpgsTopLevel = _SelectedGroups;
		_selgpgs = _SelGpgsTopLevel call F_GroupsAndSubGroupsHC;
		_Vehicles = _selgpgs call F_GetGroupsVehiclesIn;
	};
	case 3: {
		_str = _str + " HC Selected Near"; 
		_SelGpgsTopLevel = _SelectedGroups;
		_selgpgs = _SelGpgsTopLevel call F_GroupsAndSubGroupsHC;
		_Vehicles = [["Air","Ship","LandVehicle"],_selgpgs,200] call F_GetObjectsNearGroups;
	};
};

_Vehicles = _Vehicles call F_FilterArrayBySidesConfig;

//hintSilent format ["\ncount _Vehicles: %1;", count _Vehicles];
         
switch (_VehicleFilter) do {

	//case 1: { _Vehicles = _Vehicles call F_FilterEmptyVehicles; };
	case 1: { 
		_str = _str + " Empty"; 
		_Vehicles = [_Vehicles, F_VehicleIsUsed, false] call F_FilterArray;
		//_Vehicles = _Vehicles call F_FilterEmptyVehicles;
	};
	case 2: { 
		_str = _str + " Used & Empty";
	};   // All vehicles
	case 3: { 
		_str = _str + " Used";
		_Vehicles = [_Vehicles, F_VehicleIsUsed, true] call F_FilterArray; 
	};
};

switch (_InfoType) do {

	//case 1: { _Vehicles = _Vehicles call F_FilterEmptyVehicles; };
	case 0: { 
		_str = "Vehicle Totals:";
		_ObjTotals = _Vehicles call F_CalcObjectTypeTotals;
		_vehicletypes = _ObjTotals select 0;
		_vehicletypetotals = _ObjTotals select 1;

		_nvehicletypes = count _vehicletypes;
		_TotalAllVehicles = 0;

		for [{ _tvi = 0 }, { _tvi < _nvehicletypes }, { _tvi = _tvi + 1 }] do {

			_TotalOfType = _vehicletypetotals select _tvi;
			_str = _str + (format ["\n%1: %2;", _vehicletypes select _tvi, _TotalOfType]);
			
			//_str = _str + format ["%1", (inheritsFrom (configFile >> "CfgVehicles" >> (_vehicletypes select _tvi)))];			
			
			_TotalAllVehicles = _TotalAllVehicles + _TotalOfType;
		};

		_str = _str + (format ["\nTotal Vehicles: %1;", _TotalAllVehicles]);		
	};
	case 1: { 
		_ObjectTypesAndNumOf = [[],[]];
		
		if ( (_InfoTypeOption select 0) ) then {
		
			_ObjectTypesAndNumOf = [_Vehicles,1,_ObjectTypesAndNumOf] call F_AccumulateVehiclesWeaponsOrMagazines;
		};
		
		if ( (_InfoTypeOption select 1) ) then {
		
			_ObjectTypesAndNumOf = [_Vehicles,2,_ObjectTypesAndNumOf] call F_AccumulateVehiclesWeaponsOrMagazines;
		};
		
		_str = "Selected HC Vehicles " + ([_ObjectTypesAndNumOf, "Magazines"] call F_ObjectTypesTotalToString);	
	};
	case 2: { 
		_ObjectTypesAndNumOf = [[],[]];
		
		if ( (_InfoTypeOption select 0) ) then {
		
			_ObjectTypesAndNumOf = [_Vehicles,3,_ObjectTypesAndNumOf] call F_AccumulateVehiclesWeaponsOrMagazines;
		};
		
		if ( (_InfoTypeOption select 1) ) then {
		
			_ObjectTypesAndNumOf = [_Vehicles,4,_ObjectTypesAndNumOf] call F_AccumulateVehiclesWeaponsOrMagazines;
		};
	
		_str = "Selected HC Vehicles " + ([_ObjectTypesAndNumOf, "Weapons"] call F_ObjectTypesTotalToString);	
	};
};

hintSilent _str;
copyToClipboard _str;

nil;
