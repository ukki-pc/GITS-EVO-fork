// Arma 2 function

private ["_Group","_Colour","_ColourBrightness","_GroupIconParams"];
         
_Group = _this select 0;
_Colour= + (_this select 1);

_GroupIconParams = getGroupIconParams _Group;

_GroupIconParams set [0, _Colour];
_GroupIconParams set [1, ""];
_GroupIconParams set [2, 1.0];		// Scale in 3D view
//_GroupIconParams set [3, true];	// Icon Visible
_GroupIconParams set [4, true];		// Waypoints visible

_ColourBrightness = (_GroupIconParams select 5) select 3;
_Colour set [3, _ColourBrightness];
_GroupIconParams set [5, _Colour];	// Waypoints colour

_Group setGroupIconParams _GroupIconParams;

nil;
