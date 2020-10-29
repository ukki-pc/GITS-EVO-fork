class RscLDL_Text
{
	type = CT_STATIC;
	idc = -1;
	style = ST_LEFT;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "Zeppelin32";
	sizeEx = 0.02;
	text = "";
	x = -1; 
	y = -1; 
	w = 0; 
	h = 0; 
};

class RscLDL_Line: RscLDL_Text
{
    	type = 0;
    	style = 176;
};

class RscLDL_Rec: RscLDL_Text
{
	style = ST_FRAME;
};

class RscLDL_Picture
{
	idc = -1;
        type = 0;
        colorText[] = {1, 1, 1, 1};
        font = "Bitstream";
	colorBackground[] = {0, 0, 0, 0};
	text = ;
        style = 48;
	sizeEx = 0.015;
	x = -1;
	y = -1;
	w = 0;
	h = 0;
};

#define LDL_basic_rec_w 0.4 
#define LDL_basic_rec_h 0.02 
#define LDL_basic_x_left SafeZoneX+SafeZoneW/2-LDL_basic_rec_w/2
#define LDL_basic_y_top SafeZoneY+SafeZoneH/6
#define LDL_basic_y_bottom SafeZoneY+SafeZoneH-0.02
#define LDL_basic_hudcolor {0.2,1,0.2,1}

class LDL_rsc_pilot
{
  idd = 100;
  movingEnable =  1;
  duration     =  1000;
  fadein       =  0;
  fadeout      =  0;
  name = "LDL_rsc_pilot";
  onLoad = "with uiNameSpace do {LDL_rsc_pilot = (_this select 0);}";

  class controls 
  {
	//TOP INFO
	class LDL_RecInfoTop : RscLDL_Rec
	{
		colorText[] = LDL_basic_hudcolor;
		colorBackground[] = {0, 0, 0, 0.3};
	    	x = LDL_basic_x_left;
	     	y = LDL_basic_y_top;
	     	w = LDL_basic_rec_w;
	     	h = LDL_basic_rec_h;
	};
	class LDL_TextInfoTop: RscLDL_Text
	{
		colorText[] = LDL_basic_hudcolor;
		colorBackground[] = {0, 0, 0, 0.3};
	    	x = LDL_basic_x_left;
	     	y = LDL_basic_y_top;
	     	w = LDL_basic_rec_w;
	     	h = LDL_basic_rec_h;
		text = "PILOT HUD online";
	};
	
	//Crew
	class LDL_RecCrew: RscLDL_Rec
	{
		colorText[] = LDL_basic_hudcolor;
		colorBackground[] = {0, 0, 0, 0.3};
	    	x = LDL_basic_x_left;
	     	y = LDL_basic_y_top+LDL_basic_rec_h;
	     	w = LDL_basic_rec_w;
	     	h = LDL_basic_rec_h;
	};
	class LDL_TextCrew: RscLDL_Text
	{
		idc = 101;
		colorText[] = LDL_basic_hudcolor;
		colorBackground[] = {0, 0, 0, 0.3};
	    	x = LDL_basic_x_left;
	     	y = LDL_basic_y_top+LDL_basic_rec_h;
	     	w = LDL_basic_rec_w;
	     	h = LDL_basic_rec_h;
		text = "Crew: Gunner ()";
	};

	//Parameter
	class LDL_RecParam01: RscLDL_Rec
	{
		colorText[] = LDL_basic_hudcolor;
		colorBackground[] = {0, 0, 0, 0.3};
	    	x = LDL_basic_x_left+(LDL_basic_rec_w/4)*0;
	     	y = LDL_basic_y_top+LDL_basic_rec_h*2;
	     	w = LDL_basic_rec_w/4;
	     	h = LDL_basic_rec_h;
	};
	class LDL_RecParam02: LDL_RecParam01
	{
	    	x = LDL_basic_x_left+(LDL_basic_rec_w/4)*1;
	};
	class LDL_RecParam03: LDL_RecParam01
	{
	    	x = LDL_basic_x_left+(LDL_basic_rec_w/4)*2;
	};
	class LDL_RecParam04: LDL_RecParam01
	{
	    	x = LDL_basic_x_left+(LDL_basic_rec_w/4)*3;
	};
	class LDL_TextParam01: RscLDL_Text
	{
		idc = 102;
		colorText[] = LDL_basic_hudcolor;
		colorBackground[] = {0, 0, 0, 0.3};
	    	x = LDL_basic_x_left+(LDL_basic_rec_w/4)*0;
	     	y = LDL_basic_y_top+LDL_basic_rec_h*2;
	     	w = LDL_basic_rec_w/4;
	     	h = LDL_basic_rec_h;
		text = "Roll: ";
	};
	class LDL_TextParam02: LDL_TextParam01
	{
		idc = 103;
	    	x = LDL_basic_x_left+(LDL_basic_rec_w/4)*1;
		text = "Yaw: ";
	};
	class LDL_TextParam03: LDL_TextParam01
	{
		idc = 104;
	    	x = LDL_basic_x_left+(LDL_basic_rec_w/4)*2;
		text = "Dis: ";
	};
	class LDL_TextParam04: LDL_TextParam01
	{
		idc = 107;
	    	x = LDL_basic_x_left+(LDL_basic_rec_w/4)*3;
		text = "Alt: ";
	};

	//CENTER
        class Center: RscLDL_Picture
  	{
   		idc = 105;
   		colorText[] = LDL_basic_hudcolor;
 		text = "\CA\ui\data\map_player_ca.paa";
		w = 0.05;
		h = 0.05;
		x = -1;
		y = -1; 
  	};
        class CenterText: RscLDL_Text
  	{
		idc = 106;
		colorText[] = LDL_basic_hudcolor;
		colorBackground[] = {0, 0, 0, 0};
	     	w = LDL_basic_rec_w/3;
	     	h = LDL_basic_rec_h;
		x = -1;
		y = -1; 
		text = "Target Area";
  	};

	//BOTTOM INFO
	class LDL_RecInfoBottom : RscLDL_Rec
	{
		colorText[] = LDL_basic_hudcolor;
		colorBackground[] = {0, 0, 0, 0.3};
	    	x = LDL_basic_x_left;
	     	y = LDL_basic_y_bottom;
	     	w = LDL_basic_rec_w;
	     	h = LDL_basic_rec_h;
	};
	class LDL_TextInfoBottom: RscLDL_Text
	{
		colorText[] = LDL_basic_hudcolor;
		colorBackground[] = {0, 0, 0, 0.3};
	    	x = LDL_basic_x_left;
	     	y = LDL_basic_y_bottom;
	     	w = LDL_basic_rec_w;
	     	h = LDL_basic_rec_h;
		idc = 108;
		text = "(i)";
	};

  };

};