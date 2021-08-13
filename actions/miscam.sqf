disableSerialization;
// missile camera mode
_unit = _this select 0;
_type = _this select 1;
_pos = [0,0,0];

//if !( (_type in EGG_EVO_miscamwepsM) || (_type in EGG_EVO_miscamwepsB) ) exitwith {};

_hud = false;
_hud = createDialog "RscMisCam";

_disp = findDisplay 50001;

_projectile = nearestObject [_unit,_type];
_type = getText (configFile >> "CfgAmmo" >> (_type) >> "simulation");
_relPos = [0,-13,0.05];
_fov = 0.05;
if(_type == "shotMissile" || _type == "shotRocket")then{_relPos = [0,-13,2.2]; _fov = 0.5};
if(true)then{
_camera = "camera" camCreate (getPos _projectile);
_camera cameraEffect ["INTERNAL","BACK"];
_disp displaySetEventHandler["KeyDown", "camdestroy _camera;closeDialog 0;player cameraEffect [""terminate"",""back""]; 'RadialBlur' ppEffectEnable false;"];
showCinemaBorder false;

_oldSpeed = 0;
	_camera camSetTarget _projectile;
while{alive _projectile && alive _camera}do{

	_camera camSetRelPos _relPos;
	_camera camSetFOV _fov;

	_camera camCommit 0.05;
	"RadialBlur" ppEffectAdjust [0.02,0.02,0.1,0.1];
	"RadialBlur" ppEffectCommit 0.01;
	"RadialBlur" ppEffectEnable true;
	sleep 0.016;
	_pjSpeed = round(speed _projectile);
	
	if(_pjSpeed != _oldSpeed) then 
	{
		systemChat format ["Speed: %1 km/h",_pjSpeed];
		_oldSpeed = _pjSpeed;
	};
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

};
