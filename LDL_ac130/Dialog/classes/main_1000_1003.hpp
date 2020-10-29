	class LDL_Display: LDL_RscPicture
	{
		idc = 1000;
		text = "LDL_ac130\Pictures\Display.paa";
		x = safezoneX;
		y = safezoneY;
		w = safezoneW;
		h = safezoneH;
	};
	class LDL_blackscreen: LDL_RscText
	{
		idc = 1001;
		colorBackground[] = {0,0,0,1};
		colorText[] = {0,0,0,0};
		x = safezoneX;
		y = safezoneY;
		w = safezoneW;
		h = safezoneH;
	};
	class LDL_background: LDL_blackscreen
	{
		idc = 1002;
	};
	class LDL_mouseHandler: LDL_RscMouseHandler
	{
		idc = 1003;
		onMouseMoving = "[""MouseMoving"",_this] call LDL_MouseEvents";
		onMouseButtonDown = "[""MouseButtonDown"",_this] call LDL_MouseEvents";
		onMouseButtonUp = "[""MouseButtonUp"",_this] call LDL_MouseEvents";
		onMouseZChanged = "[""MouseZChanged"",_this] call LDL_MouseEvents";
		x = safezoneX;
		y = safezoneY;
		w = safezoneW;
		h = safezoneH;
	};