// Nur Server       ArmA         [GNC]Lord-MDB 13.01.2007
//
// Versetztung des Neuen Sani zum Startpunkt in der Basis
//
//
//
// 
//
//Aufruf in der Init.sqs:, temp =[[TruckW1,TruckW2,TruckW3,TruckW4,TruckW5],LKWWEST] execVM "LKWcheck.sqf"

private ["_i","_a","_Farzeugliste","_anzahl","_Basispos"];

_Farzeugliste=_this select 0;
_Basispos=_this select 1;

sleep 1;

_i=1;
_a=0;
_anzahl=count _Farzeugliste;

while {true} do
		   {
		    if (not Alive (_Farzeugliste select _a )) then
					 {
					  _a=_a+1;
					  if (_anzahl > _a) then
					     {
					     (_Farzeugliste select _a ) setpos getpos _Basispos;
					     (_Farzeugliste select _a ) setdir getdir _Basispos;
		 			     };
					 };

sleep 1;
_i=_i+1;
};




