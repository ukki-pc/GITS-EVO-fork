disableSerialization;
// missile camera mode
_unit = _this select 0;
_pos = [0,0,0];

//if !( (_unit in EGG_EVO_miscamwepsM) || (_unit in EGG_EVO_miscamwepsB) ) exitwith {};

_hud = false;
_hud = createDialog "RscMisCam";

_disp = findDisplay 50001;

_relPos = [0,-13,0.05];
_fov = 1;


_camera = "camera" camCreate (getPos _unit);
_camera cameraEffect ["INTERNAL","BACK"];
_disp displaySetEventHandler["KeyDown", "if(_this select 1 == 1) then {camdestroy _camera;closeDialog 0;player cameraEffect [""terminate"",""back""]; 'RadialBlur' ppEffectEnable false;}"];
showCinemaBorder false;

_oldSpeed = 0;
	_camera camSetTarget _unit;
while{sleep BIS_EVO_framedelay; alive _unit && alive _camera}do{

	_camera camSetRelPos _relPos;
	_camera camSetFOV _fov;

	_camera camCommit 0.05;
	// "RadialBlur" ppEffectAdjust [0.02,0.02,0.1,0.1];
	// "RadialBlur" ppEffectCommit 0.01;
	// "RadialBlur" ppEffectEnable true;
};

if(alive _camera)then{
	_camera camSetFocus [50,1];
	_camera camSetFOV (_fov * 1.6);
	_camera camCommit 1.5;
	"RadialBlur" ppEffectAdjust [0,0,1,1];
	"RadialBlur" ppEffectCommit 0.7;
	sleep 1.5;
};
closeDialog 0;
_camera cameraEffect ["TERMINATE","BACK"];
camDestroy _camera;
"RadialBlur" ppEffectEnable false;