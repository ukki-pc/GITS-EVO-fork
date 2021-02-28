// Arma 2 function
// Compile the file.

private ["_Func","_FileName","_RoutineGobalVariableName"];

_FileName = _this select 0;
_RoutineGobalVariableName = _this select 1;

_Func = compile preprocessFile _FileName; 
missionNamespace setVariable [_RoutineGobalVariableName, _Func];

nil;
