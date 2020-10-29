
rscripts=rscripts+1;
// Markers
_markerobja = createMarker["date",[0,0]];
_gmess = format ["gdate = %1", gdate];
_markerobja setMarkerColor "ColorBlack";
_markerobja setMarkerSize [0,0];
_markerobja setMarkerType  "Dot";

_markerobjb = createMarker["scores",[0,100]];
_smess = format ["scores = %1", scores];
_markerobjb setMarkerColor "ColorBlack";
_markerobjb setMarkerSize [0,0];
_markerobjb setMarkerType  "Dot";

_markerobjc = createMarker["misi",[0,200]];
_smmess = format ["scores = %1", scores];
_markerobjc setMarkerColor "ColorBlack";
_markerobjc setMarkerSize [0,0];
_markerobjc setMarkerType  "Dot";

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 1.0;
	_gmess = format ["gdate = %1 ds3 = %2 Rscripts = %3 Vscripts = %4 player=%5, dunit=%6", gdate,(date select 3),rscripts,vscripts,local player,dunit];
	_markerobja setMarkerText _gmess;
	_smess = format ["scores = %1", scores];
	_markerobjb setMarkerText _smess;
	_smmess = format ["egroups = %1: parinf = %2 players = %3", egroups,parinf,Playercount];
	_markerobjc setMarkerText _smmess;	
};