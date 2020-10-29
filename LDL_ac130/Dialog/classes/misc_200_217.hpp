	class LDL_lO: LDL_RscStructuredText
	{
		idc = 200;
		text = "LO";
		style = ST_MULTI;
		class Attributes 
              	{ 
		  font = "Zeppelin32";
		  color = "#e0d8a6";
		  shadow = 1; 
                  align = "left"; 
                  valign = "top"; 
              	}; 
		x = 0.125 * safezoneW + safezoneX;
		y = 0.1 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.4 * safezoneH;
	};
	class LDL_rO: LDL_RscStructuredText
	{
		idc = 201;
		text = "RO";
		style = ST_MULTI;
		class Attributes 
              	{ 
		  font = "Zeppelin32";
		  color = "#e0d8a6";
		  shadow = 1; 
                  align = "right"; 
                  valign = "top"; 
              	}; 
		x = 0.75119 * safezoneW + safezoneX;
		y = 0.100952 * safezoneH + safezoneY;
		w = 0.123215 * safezoneW;
		h = 0.4 * safezoneH;
	};
	class LDL_lU: LDL_RscStructuredText
	{
		idc = 202;
		text = "LU";
		style = ST_DOWN;
		class Attributes 
              	{ 
		  font = "Zeppelin32";
		  color = "#e0d8a6";
		  shadow = 1; 
                  align = "left"; 
                  valign = "bottom"; 
              	}; 
		x = 0.126191 * safezoneW + safezoneX;
		y = 0.704762 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.2 * safezoneH;
	};
	class LDL_rU: LDL_RscStructuredText
	{
		idc = 203;
		text = "RU";
		style = ST_DOWN;
		class Attributes 
              	{ 
		  font = "Zeppelin32";
		  color = "#e0d8a6";
		  shadow = 1; 
                  align = "right"; 
                  valign = "bottom"; 
              	}; 
		x = 0.689286 * safezoneW + safezoneX;
		y = 0.705714 * safezoneH + safezoneY;
		w = 0.185714 * safezoneW;
		h = 0.191905 * safezoneH;
	};
	class LDL_Cross: LDL_RscPicture
	{
		idc = 204;
		text = "LDL_ac130\Pictures\Vis25mm.paa";
		x = 0.375 * safezoneW + safezoneX;
		y = 0.375 * safezoneH + safezoneY;
		w = 0.25 * safezoneW;
		h = 0.25 * safezoneH;
	};
	class LDL_Range: LDL_RscText
	{
		idc = 205;
		text = "Range: 0000";
		x = safezoneW/2 - 0.1*safezoneW + safezoneX;
		y = 0.647619 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.03 * safezoneH;
                SizeEx = 0.025;
                style = ST_CENTER;
	};
	class LDL_HorFrame: LDL_RscFrame
	{
		idc = 206;
		x = 0.375 * safezoneW + safezoneX;
		y = 0.8 * safezoneH + safezoneY;
		w = 0.25 * safezoneW;
		h = 0.025 * safezoneH;
	};
	class LDL_VerFrame: LDL_RscFrame
	{
		idc = 207;
		x = 0.8 * safezoneW + safezoneX;
		y = 0.375 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
		h = 0.25 * safezoneH;
	};
        class LDL_HorBar: LDL_RscText
	{
		idc = 216;
		x = 0.375 * safezoneW + safezoneX;
		y = 0.8 * safezoneH + safezoneY;
		h = 0.025 * safezoneH;
		w = 0.005 * safezoneW;
		colorBackground[] = {1,1,1,0.8};
	};
        class LDL_VerBar: LDL_RscText
	{
		idc = 217;
		x = 0.8 * safezoneW + safezoneX;
		y = 0.375 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
		h = 0.005 * safezoneH;
		colorBackground[] = {1,1,1,0.8};
	};
	class LDL_Center: LDL_RscPicture
	{
		idc = 210;
		text = "\CA\ui\data\map_player_ca.paa";
		x = 0.010119 * safezoneW + safezoneX;
		y = 0.959048 * safezoneH + safezoneY;
		w = 0.03125 * safezoneW;
		h = 0.03125 * safezoneH;
	};
	class LDL_North: LDL_RscText
	{
		idc = 211;
		style = ST_RIGHT;
		w = SafeZoneW/50;
		h = SafeZoneW/50;
		x = SafeZoneX + SafeZoneW/100;
		y = SafeZoneY + SafeZoneH/100;
		sizeEx=0.03;
		text = "N";
        };
        class LDL_East: LDL_North
	{
		idc = 212;
		text = "E";
        };
        class LDL_South: LDL_North
	{
		idc = 213;
		text = "S";
        };
        class LDL_West: LDL_North
	{
		idc = 214;
		text = "W";
        };
	class LDL_Center2: LDL_Center
  	{
   		idc = 215;
 		text = "\CA\ui\data\marker_goal_ca.paa";
  	};