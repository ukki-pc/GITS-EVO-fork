
fnc_mapScale =
{
	#define minScale 0.01
	#define maxScale 0.9
	#define scaleMultip 0.04
	allMarkers = BIS_EVO_MissionObjMarkers;
	_mapCtrl = (findDisplay 12) displayCtrl 51;

	while {visibleMap} do 
		{
		_scale = ctrlMapScale _mapCtrl;
		//Scale  markers
			if (_scale != OT_lastMapDrawScale) then 
			{
				{
					if (_scale > minScale) then { _x setMarkerSizeLocal [(0.01/(_scale*scaleMultip) max 0 min 1),	(0.01/(_scale*scaleMultip) max 0 min 1)];};
					if (_scale > maxScale) then { _x setMarkerSizeLocal[0,0]; };
				} forEach allMarkers;
			};
			OT_lastMapDrawScale = _scale;
			sleep BIS_EVO_frameDelay;
		};
};

while {true} do 
{
	waitUntil{sleep BIS_EVO_GlobalSleep; visibleMap};
	[] call fnc_mapScale;
	waitUntil{sleep BIS_EVO_GlobalSleep; !visibleMap};
};