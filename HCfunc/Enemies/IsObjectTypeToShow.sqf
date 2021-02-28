// Arma 2 function

private ["_TheObject","_TypesOfInterest","_DoShow"];

_TheObject = _this;

_TypesOfInterest = ["Man","LandVehicle","Air","Ship","ReammoBox"];
_DoShow = false;

if ( ([_TypesOfInterest, [_TheObject]] call F_CountObjectsOfTypes) >= 1 ) then {
	
	_DoShow = true;
	
	if ( ("Animal" countType [_TheObject]) <= 0 ) then {
		_DoShow = true;
	};
};

_DoShow;