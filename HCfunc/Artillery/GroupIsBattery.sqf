// Arma 2 function
// This is only a simple check at the moment.

private ["_Group","_VehiclesAndTypes","_Vehicles","_VehicleTypes",
         "_TotalArtOfEachType","_TotalArtilleryPieces","_IsBattery"];

_Group = _this;

_VehiclesAndTypes = _Group call F_GetGroupArtilleryPieces;
_Vehicles = _VehiclesAndTypes select 0;
_VehicleTypes = _VehiclesAndTypes select 1;

_TotalArtOfEachType = [_VehicleTypes, _Vehicles] call F_CountObjectsOfEachType;
_TotalArtilleryPieces = _TotalArtOfEachType call F_SumOfArray;

_IsBattery = _TotalArtilleryPieces >= 1;

if (_IsBattery) then {
	hintSilent format ["_VehiclesAndTypes = %1\n_TotalArtOfEachType = %2", 
	                   _VehiclesAndTypes, _TotalArtOfEachType];
};

_IsBattery;


