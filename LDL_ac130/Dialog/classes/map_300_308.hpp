	class LDL_Map: LDL_RscMapControl
	{
		idc = 300;
		x = safezoneX+safezoneW/8;
		y = safezoneY+safezoneH/8;
		w = safezoneW-safezoneW/4;
		h = safezoneH-safezoneH/4;
	};
        
        class LDL_edit_back: LDL_RscText
        {
                idc = 301;
                x = 0.370238 * safezoneW + safezoneX;
                y = 0.302381 * safezoneH + safezoneY;
                w = 0.283929 * safezoneW;
                h = 0.258095 * safezoneH;
                colorBackground[] = {0,0,0,0.5};
        };
        class LDL_edit_head: LDL_RscText
        {
                style = ST_CENTER;

                idc = 302;
                text = "Change Parameters";
                x = 0.370238 * safezoneW + safezoneX;
                y = 0.303333 * safezoneH + safezoneY;
                w = 0.283929 * safezoneW;
                h = 0.0509524 * safezoneH;
                colorBackground[] = {0,0,0,0.5};
        };
        class LDL_edit_radiusEdit: LDL_RscEdit
        {
                idc = 303;

                x = 0.42991 * safezoneW + safezoneX;
                y = 0.382143 * safezoneH + safezoneY;
                w = 0.060417 * safezoneW;
                h = 0.0252381 * safezoneH;
        };
        class LDL_edit_heightEdit: LDL_RscEdit
        {
                idc = 304;

                x = 0.431548 * safezoneW + safezoneX;
                y = 0.44 * safezoneH + safezoneY;
                w = 0.060417 * safezoneW;
                h = 0.0252381 * safezoneH;
        };
        class LDL_edit_cancel: LDL_RscShortcutButton
        {
                onButtonClick = "[false, 301, 308]call LDL_dlg_show;";

                idc = 305;
                text = "Cancel";
                x = 0.373511 * safezoneW + safezoneX;
                y = 0.476905 * safezoneH + safezoneY;
                w = 0.135267 * safezoneW;
                h = 0.0790478 * safezoneH;
        };
        class LDL_edit_ok: LDL_RscShortcutButton
        {
                onButtonClick = "[]call LDL_changeParameters;";
                
                idc = 306;
                text = "Ok";
                x = 0.516071 * safezoneW + safezoneX;
                y = 0.477144 * safezoneH + safezoneY;
                w = 0.134672 * safezoneW;
                h = 0.077143 * safezoneH;
        };
        class LDL_edit_radiusText: LDL_RscText
        {
                idc = 307;
                text = "Radius:";
                x = 0.373214 * safezoneW + safezoneX;
                y = 0.359047 * safezoneH + safezoneY;
                w = 0.0583333 * safezoneW;
                h = 0.07 * safezoneH;
        };
        class LDL_edit_heightText: LDL_RscText
        {
                idc = 308;
                text = "Height:";
                x = 0.37381 * safezoneW + safezoneX;
                y = 0.41619 * safezoneH + safezoneY;
                w = 0.0583333 * safezoneW;
                h = 0.07 * safezoneH;
        };
