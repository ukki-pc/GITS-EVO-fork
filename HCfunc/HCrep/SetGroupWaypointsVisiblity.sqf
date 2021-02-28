// Arma 2 function

private ["_Group","_Visible","_GroupIconParams"];
         
_Group = _this select 0;
_Visible = _this select 1;

_GroupIconParams = getGroupIconParams _Group;

_groupiconparams set [4,_Visible];

_Group setGroupIconParams _GroupIconParams;

nil;
