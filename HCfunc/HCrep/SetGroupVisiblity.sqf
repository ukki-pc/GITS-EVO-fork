// Arma 2 function

private ["_Group","_IconVisible","_WaypointVisible","_GroupIconParams"];
         
_Group = _this select 0;
_IconVisible = _this select 1;
_WaypointVisible = _this select 2;

_GroupIconParams = getGroupIconParams _Group;
_GroupIconParams set [3, _IconVisible];
_GroupIconParams set [4, _WaypointVisible];
_Group setGroupIconParams _GroupIconParams;

nil;