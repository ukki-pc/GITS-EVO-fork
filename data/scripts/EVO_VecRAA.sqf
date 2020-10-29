//creates red markers over city for each AA unit called in EVO_Erec.sqf
//fixed by Eggbeast

_vcl = _this select 0;
_time = 1+(random 1);
sleep _time;
_vcl = _this select 0;
_unitm = format ["%1", _vcl];
_markerobj = createMarker [_unitm, position _vcl];
_markerobj setMarkerShape "ELLIPSE";
_markerobj setMarkerColor "ColorRedAlpha";
_markerobj setMarkerType "Tank";//added
_markerobj setMarkerBrush "Cross";
_markerobj setMarkerSize [1200, 1200];
for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 1;
	if(not alive _vcl) then 
	{	
		deleteMarker _markerobj;
		_loop =  1;
	};
};
