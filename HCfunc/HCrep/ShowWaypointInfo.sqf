// Arma 2 function

private ["_Waypoint","_Group","_WpIndex","_str","_CompletionRadius","_FireMode","_CombatMode",
         "_Formation","_Position","_Speed","_Speed","_Timeout","_WpType","_Visible",
         "_Description","_Statements"];

_Waypoint = + _this;

_Group = _Waypoint select 0;
_WpIndex = _Waypoint select 1;

_WpType = waypointType _Waypoint;
_CompletionRadius = waypointCompletionRadius _Waypoint;
_FireMode = waypointCombatMode _Waypoint;
_CombatMode = waypointBehaviour _Waypoint;
_Formation = waypointFormation _Waypoint;
_Position = waypointPosition  _Waypoint;
_Speed = waypointSpeed  _Waypoint;
_Timeout = waypointTimeout _Waypoint;
_Visible = waypointVisible _Waypoint;
_Description = waypointDescription _Waypoint;
_Statements = waypointStatements _Waypoint;

_str = format ["Type: %1\nCompletion Radius: %2\nFire Mode: %3\nCombat Mode: %4\nFormation: %5", 
               _WpType, _CompletionRadius, _FireMode, _CombatMode, _Formation];

_str = _str + format ["\nPosition: %1\nSpeed: %2\nTimeout: %3\nVisible: %4\nGroup: %5\nIndex: %6", 
                      _Position, _Speed, _Timeout, _Visible, _Group, _WpIndex];

_str = _str + format ["\nDescription: %1\nStatements: %2", 
                      _Description, _Statements];

hintSilent _str;
copyToClipboard _str;


nil;