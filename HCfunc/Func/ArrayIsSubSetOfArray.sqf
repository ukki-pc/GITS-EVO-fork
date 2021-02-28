// Arma 2 function

private ["_TestIsSubsetArray","_Array","_IsSubset"];

_TestIsSubsetArray = + (_this select 0);
_Array = + (_this select 1);

_IsSubset = ( (count (_TestIsSubsetArray - _Array)) == 0 );

_IsSubset;