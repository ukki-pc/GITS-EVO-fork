// Arma 2 function

private ["_Is3D","_Group","_WpID","_Button","_PosX","_PosY","_Shift","_Ctrl","_Alt",
         "_str"];
         
//_str = "Called DoOnGroupIconOverEnterHC";

if (hcshownbar) then {

	_Is3D = _this select 0;
	_Group = _this select 1;
	_WpID = _this select 2;
	_PosX = _this select 3;
	_PosY = _this select 4;
	_Shift = _this select 5;
	_Ctrl = _this select 6;
	_Alt = _this select 7;

	//_str = _str +
	//	format ["_Is3D = %1\n_Group = %2\n_WpID = %3\n_PosX = %4\n_PosY = %5\n_Shift = %6\n_Ctrl = %7\n_Alt = %8\n_this = %9", 
	//            _Is3D, _Group, _WpID, _PosX, _PosY, _Shift, _Ctrl, _Alt, _this];
};

//hintSilent _str;

nil;
