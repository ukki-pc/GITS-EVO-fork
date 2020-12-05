/* 
	Marks Recon HQ on the map
	
	Usage:
	Create marker in the editor, name it as "ambmarker", type "empty"
	_ambmarker = [] execVM "data\scripts\ambmarker.sqf";
*/


private ["_run"];

_run = true;

"ambmarker" setMarkerTypeLocal "hd_destroy";
"ambmarker" setMarkerColorLocal "ColorRed";
"ambmarker" setMarkerTextLocal "Recon HQ";

waitUntil {sleep 5;alive amb};

hint "amb live";

while {_run} do
{
	sleep 0.001;
	if ((not alive amb) or (IsNull amb)) then 
	{
		"ambmarker" setMarkerTypeLocal "Empty"; 
		"ambmarker" setMarkerColorLocal "ColorBlack";
		waitUntil {sleep 5;alive amb};
	};

	"ambmarker" setMarkerTypeLocal "hd_destroy";
	"ambmarker" setMarkerColorLocal "ColorBlue";

	waitUntil {sleep 5;alive amb};
	"ambmarker" setMarkerPosLocal [getpos amb select 0,getpos amb select 1];
	sleep 1.0;
};