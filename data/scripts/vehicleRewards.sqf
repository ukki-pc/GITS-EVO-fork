//Rewards players with spawned vehicles when certain criteria is met
_tier1Vehs = ["FRL_UH60M","FRL_UH60MT","OH58g","FRL_MH6J_Black","MH60S","CH_47F_EP1","CH_47F_BAF","BAF_Merlin_HC3_D","yup_sh60f","ou_ch_46e","ou_ch_53d","PRACS_CH53","PRACS_puma330_MG","PRACS_AB212"];
waitUntil{sleep 10; count BIS_EVO_conqueredTowns > 0};
_vec1 = createVehicle ["FRL_UH60MT",  [getMarkerPos "bonusveh1" select 0,getMarkerPos "bonusveh1" select 1,18], [], 0, "NONE"];
_vec1 setDir markerDir "bonusveh1";
_vec1 setPos [getMarkerPos "bonusveh1" select 0,getMarkerPos "bonusveh1" select 1,18];
