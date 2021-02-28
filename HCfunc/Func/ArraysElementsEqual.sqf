// Arma 2 function

private ["_ArrayA","_ArrayB","_AreEqual"];

_ArrayA = + (_this select 0);
_ArrayB = + (_this select 1);

_AreEqual = ( (count (_ArrayA - _ArrayB)) == 0 ) && ( (count (_ArrayB - _ArrayA)) == 0 );

_AreEqual;