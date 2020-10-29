// mission map animator
_pos  = _this select 0;
_type = _this select 1;
disableSerialization;
_ctrl = (uiNamespace getVariable "displayVendor") displayctrl 895; //This line!
_ctrl ctrlmapanimadd [0,0.20,position player];
ctrlmapanimcommit _ctrl;
Waituntil {ctrlMapAnimDone _ctrl};
_ctrl ctrlmapanimadd [1,0.20,_pos];
ctrlmapanimcommit _ctrl;
Waituntil {ctrlMapAnimDone _ctrl};

/*old version
_pos  = _this select 0;
_type = _this select 1;

disableSerialization;
_ctrl = displayVendor displayctrl 895;
_ctrl ctrlmapanimadd [0,0.20,position player];
ctrlmapanimcommit _ctrl;
Waituntil {ctrlMapAnimDone _ctrl};
_ctrl ctrlmapanimadd [1,0.20,_pos];
ctrlmapanimcommit _ctrl;
Waituntil {ctrlMapAnimDone _ctrl};
*/
