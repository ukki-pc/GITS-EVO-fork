// Arma 2 function

private ["_Groups","_SubsetCategory","_NumArgs","_Param1","_Param2","_CallArgs",
         "_NumGroups","_TotalReselected","_SubsetGroups"];

_Groups = + (_this select 0);
_SubsetCategory = _this select 1;
_CallArgs = [_Groups, _SubsetCategory];
_NumArgs = count _this;
if ( _NumArgs >= 3) then { _Param1 = _this select 2; _CallArgs = _CallArgs + [_Param1]; };
if ( _NumArgs >= 4) then { _Param2 = _this select 3; _CallArgs = _CallArgs + [_Param2]; };

sleep 0.2;
[hcAllGroups player, false] call F_SelectHCGroups;

_NumGroups = count _Groups;
_SubsetGroups = _CallArgs call F_SubsetOfGroups;
_TotalReselected = count _SubsetGroups;

[_SubsetGroups, true] call F_SelectHCGroups;
hintSilent format ["%1 of %2 Reselected", _TotalReselected, _NumGroups];

nil;