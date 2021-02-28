// Arma 2 function

private ["_MarkerNameString","_MarkerIndex","_WorldCoord","_NewMarkerName","_TestMarkerName"];

_MarkerNameString = _this select 0;
_MarkerIndex = _this select 1;
_WorldCoord = + (_this select 2);

_TestMarkerName = "";
_NewMarkerName = "1";

while { _NewMarkerName != _TestMarkerName } do {
	
	//hintSilent format ["_TestMarkerName = %1\n_NewMarkerName = %2", _TestMarkerName, _NewMarkerName];
	_MarkerIndex = _MarkerIndex + 1;
	_TestMarkerName = format ["%1%2", _MarkerNameString, _MarkerIndex];
	_NewMarkerName = createMarkerLocal [_TestMarkerName, _WorldCoord];
};

[_NewMarkerName, _MarkerIndex];