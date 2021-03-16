/* 
	Marks Recon HQ on the map
	
	Usage:
	Create marker in the editor, name it as "ambmarker", type "empty"
	_ambmarker = [] execVM "data\scripts\ambmarker.sqf";
*/


private ["_run"];
_player = _this select 0;
_amb = _this select 1;
_run = true;

_name = format ["%1amb",_player];

//Public ?
if !(_name in RHQMarkers) then {
RHQmarkers = RHQMarkers + [_name];
publicVariable "RHQmarkers";
};

_markerobj = createMarker[_name,[getPos _amb select 0,getPos _amb select 1]];
_markerobj setMarkerTypeLocal "plp_icon_binoculars";
_markerobj setMarkerColorLocal "ColorKhaki";
_markerobj setMarkerTextLocal "Recon HQ";

//Friends can teleport when enough level
if(perkOffLVL > 1) then {publicVariable "_markerobj";};

waitUntil {sleep 5;alive _amb};

while {_run} do
{
	sleep 0.001;
	if ((not alive _amb) or (IsNull _amb)) then 
	{
		_markerobj setMarkerType "Empty"; 
		_markerobj setMarkerColor "ColorBlack";
		waitUntil {sleep 5;alive _amb};
	};

	_markerobj setMarkerType "plp_icon_binoculars";
	_markerobj setMarkerColor "ColorBlue";

	waitUntil {sleep 5;alive _amb};
	_markerobj setMarkerPos [getpos _amb select 0,getpos _amb select 1];
	sleep 2.0;
};