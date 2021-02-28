// Arma 2 function
// This is only a simple check at the moment.

private ["_ArtilleryPieces","_ArtilleryModule","_NumArtilleryPieces","_api",
         "_ArtilleryPiece","_SyncObjects","_ArtilleryModules"];

_ArtilleryPieces = + _this;

_ArtilleryModule = objNull;
_NumArtilleryPieces = count _ArtilleryPieces;

for [{ _api = 0 }, { _api < _NumArtilleryPieces }, { _api = _api + 1 }] do {

	_ArtilleryPiece = _ArtilleryPieces select _api;
	_SyncObjects = synchronizedObjects _ArtilleryPiece;
	
	_ArtilleryModules = [_SyncObjects, ["BIS_ARTY_Logic"]] call FilterObjectsOfTypes;
	
	if ( (count _ArtilleryModules) >= 1 ) exitWith { _ArtilleryModule = _ArtilleryModules select 0; };
};

_ArtilleryModule;


