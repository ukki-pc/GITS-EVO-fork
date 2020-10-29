class LDL_DialogClose
{
	idd = 2000;
	movingEnable = true;
	controlsBackground[] = {};
	onLoad = "LDL_close_button_state = -1";
	onUnload = "[1, 2000]execVM 'LDL_ac130\Dialog\dlg_event.sqf'";
	onChildDestroyed = "[1, 2000]execVM 'LDL_ac130\Dialog\dlg_event.sqf'";
	controls[] = 
	{
		LDL_close_Background, LDL_close_Frame, LDL_close_Text, LDL_close_button_close, LDL_close_button_continue
	};
	
	class LDL_close_button_continue: LDL_RscShortcutButton
	{
		idc = 2000;
		text = "Continue";
		x = 0.388095 * safezoneW + safezoneX;
		y = 0.42 * safezoneH + safezoneY;
		w = 0.0952388 * safezoneW;
		h = 0.0776187 * safezoneH;
		action = "LDL_close_button_state = 1; closeDialog 2000;";
	};
	class LDL_close_button_close: LDL_RscShortcutButton
	{
		idc = 2001;
		text = "Close";
		x = 0.49881 * safezoneW + safezoneX;
		y = 0.42 * safezoneH + safezoneY;
		w = 0.0952388 * safezoneW;
		h = 0.0776187 * safezoneH;
		action = "LDL_close_button_state = 0; closeDialog 2000;";
	};
	class LDL_close_Frame: LDL_RscFrame
	{
		idc = 2002;
		x = 0.357737 * safezoneW + safezoneX;
		y = 0.364763 * safezoneH + safezoneY;
		w = 0.266072 * safezoneW;
		h = 0.131905 * safezoneH;
	};
	class LDL_close_Text: LDL_RscText
	{
		idc = 2003;
		text = "Close dialog or continue?";
		x = 0.408333 * safezoneW + safezoneX;
		y = 0.400952 * safezoneH + safezoneY;
		w = 0.16488 * safezoneW;
		h = 0.0242858 * safezoneH;
	};
	class LDL_close_Background: LDL_RscText
	{
		idc = 2004;
		text = "";
		colorBackground[] = {0.1,0.1,0.1,0.8};
		x = 0.357737 * safezoneW + safezoneX;
		y = 0.364763 * safezoneH + safezoneY;
		w = 0.266072 * safezoneW;
		h = 0.131905 * safezoneH;
	};
    
};