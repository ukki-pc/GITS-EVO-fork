// Arma 2 function

private ["_KeyCode","_KeyDown"];

_KeyCode = _this select 0;
_KeyDown = _this select 1;

switch ( _KeyCode ) do { 

	case 42:	{ missionNamespace setvariable ["HCExtShiftHeld", _KeyDown]; };	// Left Shift
	case 54:	{ missionNamespace setvariable ["HCExtShiftHeld", _KeyDown]; };	// Right Shift
	case 29:	{ missionNamespace setvariable ["HCExtCtrlHeld", _KeyDown]; };	// Left Ctrl
	case 157:	{ missionNamespace setvariable ["HCExtCtrlHeld", _KeyDown]; };	// Right Ctrl
	case 56:	{ missionNamespace setvariable ["HCExtAltHeld", _KeyDown]; };	// Alt
	case 184:	{ missionNamespace setvariable ["HCExtAltHeld", _KeyDown]; };	// Alt Gr  
};

nil;