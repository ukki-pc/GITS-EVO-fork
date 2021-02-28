// Arma 2 function

private ["_Group","_VehiclesAndTypes","_ArtilleryPieces","_ArtilleryModule"];

_Group = _this;

//_VehiclesAndTypes = _Group call F_GetGroupArtilleryPieces;
//_ArtilleryPieces = _VehiclesAndTypes select 0;

_ArtilleryModule = _ArtilleryPieces call F_GetArtilleryPiecesArtilleryModule;
	
if ( ((count _ArtilleryPieces) >= 1) and (isNull _ArtilleryModule) ) then {
	
	_ArtilleryModule = [_Group, _ArtilleryPieces] call F_InitArtilleryBattery;
};

_ArtilleryModule;