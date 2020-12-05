//Nur Client         ArmA         [GNC]Lord-MDB 13.01.2007
//
// versetztung des LKWMarkers und Anbindung des Marker an einen neuen LKW
//
//
//
// 
//
//Aufruf �ber Trigger :temp =[[TruckW1,TruckW2,TruckW3,TruckW4,TruckW5],"markerlkwwest",nullwest] execVM "LKWmarker.sqf"

private ["_i","_a","_Farzeugliste","_anzahl","_marker","_Basispos"];

_Farzeugliste=_this select 0;
_marker=_this select 1;
_Basispos=_this select 2;

sleep 1;

_i=1;
_a=0;
_anzahl=count _Farzeugliste;

while {_i < 20000} do
		   {
		    if ((playerSide == West) ) then
					     {
					     _marker setMarkerPosLocal [4803,344,10249];
		 			     };
		    if ((playerSide == east)) then
					     {
					     _marker setMarkerPosLocal [4803,344,10249];
		 			     };
		    if (_anzahl > _a) then
					 {
					     _marker setMarkerPosLocal getpos (_Farzeugliste select _a );
		                       if (not Alive (_Farzeugliste select _a )) then
					         {
					            _a=_a+1;
					  	   };
					 }
		  else
	  	      		 {
					    _marker setMarkerPosLocal getpos _Basispos;
					 };
sleep 1;
_i=_i+1;
};
       
 
