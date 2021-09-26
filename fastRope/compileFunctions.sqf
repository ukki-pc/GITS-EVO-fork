// compileFunctions.sqf
// � JANUARY 2012 - norrin
private ["_fnc","_array","_function","_unit"];
_fnc	= "";
_array	= [];
_unit	= objNull;
////////////////////////////////// Add Public Variable Event Handler Norrn_FR - Sept 2011 //////////////////////////////////////////
"Nor_FR_PV" addPublicVariableEventHandler {
	_array = (_this select 1); 
	_function = _array select 0;
	switch (_function) do {
		case 0 : {_unit = _array select 1; _fnc = _array select 2; [_unit] spawn _fnc};  //Draw ropes, Pre-eject, Anim, Dust
	};	
};
// functions
NORRN_FR_DR  	= Compile PreprocessFile "fastRope\functions\FR_DR.sqf"; // draw ropes
NORRN_FR_DSR	= Compile PreprocessFile "fastRope\functions\drawRope.sqf"; // draw single rope
NORRN_FR_AR  	= Compile PreprocessFile "fastRope\functions\animateRope.sqf"; // animate ropes
NORRN_FR_PE  	= Compile PreprocessFile "fastRope\functions\Pre_eject_unit.sqf"; // pre-eject unit 
NORRN_FR_PES  	= Compile PreprocessFile "fastRope\functions\Pre_eject_unit_SR.sqf"; // pre-eject unit  single rope
NORRN_FR_EU     = Compile PreprocessFile "fastRope\functions\eject_unit.sqf"; // eject unit
NORRN_FR_EUS	= Compile PreprocessFile "fastRope\functions\eject_unit_SR.sqf"; // eject unit single rope
NORRN_FR_Anim1	= Compile PreprocessFile "fastRope\functions\Anim1.sqf"; // fast rope animation 1
NORRN_FR_Anim2  = Compile PreprocessFile "fastRope\functions\Anim2.sqf"; // fast rope animation 2
NORRN_FR_Dust   = Compile PreprocessFile "fastRope\functions\dust.sqf"; // create dust cloud
NORRN_FR_DropR  = Compile PreprocessFile "fastRope\functions\dropRope.sqf"; // drop and delete ropes
NORRN_FR_t      = Compile PreprocessFile "fastRope\functions\FR_t.sqf"; //Timer for players who have option to FR
NORRN_FR_actZ   = Compile PreprocessFile "fastRope\functions\FR_actZ.sqf"; //Calculate the height at which the _unit ejects from the rope
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////