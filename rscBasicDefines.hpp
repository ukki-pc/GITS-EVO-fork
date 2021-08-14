#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144
#define ST_WITH_RECT      160
#define ST_LINE           176

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

#define ReadAndWrite 0

#define ProcTextWhite "#(argb,8,8,3)color(1,1,1,1)"
#define ProcTextEmpty "#(argb,8,8,3)color(1,1,1,0)"
#define ProcTextBlack "#(argb,8,8,3)color(0,0,0,1)"
#define ProcTextGray "#(argb,8,8,3)color(0.3,0.3,0.3,1)"
#define ProcTextRed "#(argb,8,8,3)color(1,0,0,1)"
#define ProcTextGreen "#(argb,8,8,3)color(0,1,0,1)"
#define ProcTextBlue "#(argb,8,8,3)color(0,0,1,1)"

//Colors
#define Color_KackG 				{0.36, 0.4, 0.38, 1}
#define Color_KackY					{0.8, 0.7, 0.6, 1}
#define Color_KackB 				{0.51, 0.48, 0.46, 1}
#define Color_WhiteDark 			{1, 1, 1, 0.5}
#define Color_White					{1, 1, 1, 1}
#define Color_Black 				{0, 0, 0, 1}
#define Color_Gray 					{1, 1, 1, 0.5}
#define Color_GrayLight 			{0.6, 0.6, 0.6, 1}
#define Color_GrayDark 				{0.2, 0.2, 0.2, 1}
#define Color_DarkRed 				{0.5, 0.1, 0, 0.5}
#define Color_Green 				{0.8, 0.9, 0.4, 1}
#define Color_Orange 				{0.9, 0.45, 0.1, 1}
#define Color_Red 					{0.9, 0.2, 0.2, 1}
#define Color_Blue 					{0.2, 0.2, 0.9, 1}
#define Color_NoColor				{0, 0, 0, 0}

#define CA_UI_element_background 		{1, 1, 1, 0.7}
#define CA_UI_background 				{0.023529, 0, 0.0313725, 1}
#define CA_UI_help_background 			{0.2, 0.1, 0.1, 0.7}
#define CA_UI_title_background			{0.24, 0.47, 0.07, 1.0}
#define CA_UI_green						{0.84,1,0.55,1}

//Colors background
//#define CA_UI_background 			{0.6, 0.6, 0.6, 0.4}
#define CA_UI_background                        {0.023529, 0, 0.0313725, 1}
#define Color_MainBack 				{1, 1, 1, 0.9} //hlavni pozadi

//Font Size
#define TextSize_IGUI_normal 		0.023 // test //19/768
#define TextSize_small 				0.022 //16/768
#define TextSize_normal 			0.024 //19/768
#define TextSize_medium 			0.027 //23/768
#define TextSize_large  			0.057 //44/768

//Jambo defines
#define UIbackGroundX -0.25
#define UIbackGroundY 0
#define UIbackGroundW 2
#define UIbackGroundH 1

#define UIList1W 0.5
#define UIList1H 0.6

//Definice z Coru
//Standard static text.
class RscSlider {
	type = CT_SLIDER;
	style = 1024;
	w = 0.24;
	h = 0.03;
	color[] = Color_White;
	//colorActive[] = Color_White;
};
class RscText
{
	access = ReadAndWrite;
	idc = -1;
	type = CT_STATIC;style = ST_LEFT;
	w = 0.1; h = 0.05;
	font = Zeppelin32;
	sizeEx = TextSize_IGUI_normal;
	colorBackground[] = Color_NoColor;
	colorText[] = Color_Black;
	text = "";
};
//Small static text.
class RscTextSmall: RscText
{
	h = 0.03;
	sizeEx = TextSize_small;
};
//Standard static text title.
class RscTitle: RscText
{
	style = ST_CENTER;
	x = 0.15;y = 0.06;
	w = 0.7;
};
class RscPicture
{
	access = ReadAndWrite;
	idc = -1;
	type = CT_STATIC;style = ST_PICTURE;
	colorBackground[] = Color_NoColor;
	colorText[] = Color_White;
	font = Zeppelin32;
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
};
class RscActiveText
{
	access = ReadAndWrite;
	type = CT_ACTIVETEXT;
	style = ST_CENTER;
	h = 0.05;
	w = 0.15;
	font = Zeppelin32;
	sizeEx = TextSize_IGUI_normal;
	color[] = Color_Black;
	colorActive[] = CA_UI_green;
	soundEnter[] = {"", 0.1, 1};
	soundPush[] = {"", 0.1, 1};
	soundClick[] = {"", 0.1, 1};
	soundEscape[] = {"", 0.1, 1};
	text = "";
	default = 0;
};

class RscListBox {
	type = 5;
	style = 0 + 0x10;
	font = "Zeppelin32";
	sizeEx = 0.03921;
	color[] = {1, 1, 1, 1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0.023529, 0, 0.0313725, 1};
	colorSelect2[] = {0.023529, 0, 0.0313725, 1};
	colorSelectBackground[] = {0.58, 0.1147, 0.1108, 1};
	colorSelectBackground2[] = {0.58, 0.1147, 0.1108, 1};
	period = 1;
	colorBackground[] = {0, 0, 0, 1};
	maxHistoryDelay = 1.0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};

//Standard button.
class RscButton
{
	// common control items
	access = ReadAndWrite;
	type = CT_BUTTON;style = ST_LEFT;
	x = 0; y = 0;
	w = 0.3; h = 0.1;

	// text properties
	text = "";
	font = Zeppelin32;
	sizeEx = 0.024;
	colorText[] = {0.95, 0.95, 0.95, 1};
		colorDisabled[] = {0.4, 0.4, 0.4, 1};
		colorBackground[] = {1, 0.537, 0, 0.5};
		colorBackgroundActive[] = {1, 0.537, 0, 1};
		colorBackgroundDisabled[] = {0.58, 0.1147, 0.1108, 1};
		offsetX = 0.003;
		offsetY = 0.003;
		offsetPressedX = 0.002;
		offsetPressedY = 0.002;
		colorFocused[] = {1, 0.537, 0, 1};
		colorShadow[] = {0.023529, 0, 0.0313725, 1};
		colorBorder[] = {0.023529, 0, 0.0313725, 1};
	borderSize = 0.008; // when negative, the border is on the right side of background


	// sounds
	soundEnter[] = {"", 0.1, 1};
	soundPush[] = {"", 0.1, 1};
	soundClick[] = {"", 0.1, 1};
	soundEscape[] = {"", 0.1, 1};
};


//Standard structured text.
class RscStructuredText
{
	access = ReadAndWrite;
	type = CT_STRUCTURED_TEXT;
	idc = -1;
	style = 0;
	h = 0.05;
	text = "";
	size = TextSize_IGUI_normal;
	colorText[] = Color_Black;

	class Attributes
	{
		font = Zeppelin32;
		color = "#ffffff";
		align = "center";
		shadow = true;
	};
};

//Standard controls group.
class RscControlsGroup
{
  type = CT_CONTROLS_GROUP;
  idc = -1;
  style = 0;
  x = 0; y = 0;
  w = 1; h = 1;

  class VScrollbar
  {
    color[] = Color_Black;
    width = 0.021;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = false;	    
  };

  class HScrollbar
  {
    color[] = Color_Black;
    height = 0.028;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = false;	    
  };

  class Controls {};
};




//Preddefinovano pro viceropouziti v dialogu
class Vendor_Mainback: RscPicture
{
	idc = -1;
	//type = 0;
	//style = CT_EDIT;
	//style = ST_PICTURE;
	x = 0.35; y = 0.8;
	w = 0.3; h = 0.2;
	text ="\ca\ui\data\ui_gradient_start_gs.paa";
	colorText[] = {1, 1, 1, 0.9};
	//text = "\ca\ui\data\ui_gradient_end_gs.paa";
	colorbackground[] = CA_UI_background;
};
class Vendor_Title: Vendor_Mainback
{
	x = 0.29; y = 0.38;
	w = 0.56; h = 0.57;
	text ="\ca\ui\data\ui_gradient_title_gs.paa";
};
class Vendor_TRev: Vendor_Mainback
{
	x = 0.29; y = 0.38;
	w = 0.56; h = 0.57;
};
class Vendor_Mainback_2: Vendor_Mainback
{
	x = 0.35; y = 0.8;
	w = 0.3; h = 0.2;
	text = "\ca\ui\data\ui_gradient_middle_gs.paa";
};
class Vendor_Mainback_3: Vendor_Mainback
{
	x = 0.35; y = 0.8;
	w = 0.3; h = 0.2;
	text = "\ca\ui\data\ui_gradient_end_gs.paa";
};
class RscMapControl 
{
	access = ReadAndWrite;
	type = 101;
	idc = 51;
	style = 48;
	colorBackground[] = {1, 1, 1, 1};
	colorText[] = {0, 0, 0, 1};
	font = "TahomaB";
	sizeEx = 0.04;
	colorSea[] = {0.56, 0.8, 0.98, 0.5};
	colorForest[] = {0.6, 0.8, 0.2, 0.5};
	colorRocks[] = {0.5, 0.5, 0.5, 0.5};
	colorCountlines[] = {0.65, 0.45, 0.27, 0.5};
	colorMainCountlines[] = {0.65, 0.45, 0.27, 1};
	colorCountlinesWater[] = {0, 0.53, 1, 0.5};
	colorMainCountlinesWater[] = {0, 0.53, 1, 1};
	colorForestBorder[] = {0.4, 0.8, 0, 1};
	colorRocksBorder[] = {0.5, 0.5, 0.5, 1};
	colorPowerLines[] = {0, 0, 0, 1};
	colorRailWay[] = {0.8, 0.2, 0.3, 1};
	colorNames[] = {0, 0, 0, 1};
	colorInactive[] = {1, 1, 1, 0.5};
	colorLevels[] = {0, 0, 0, 1};
	fontLabel = "TahomaB";
	sizeExLabel = 0.04;
	fontGrid = "TahomaB";
	sizeExGrid = 0.04;
	fontUnits = "TahomaB";
	sizeExUnits = 0.04;
	fontNames = "TahomaB";
	sizeExNames = 0.04;
	fontInfo = "TahomaB";
	sizeExInfo = 0.04;
	fontLevel = "TahomaB";
	sizeExLevel = 0.04;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	stickX[] = {0.2, {"Gamma", 1, 1.5}};
	stickY[] = {0.2, {"Gamma", 1, 1.5}};
	ptsPerSquareSea = 6;
	ptsPerSquareTxt = 8;
	ptsPerSquareCLn = 8;
	ptsPerSquareExp = 8;
	ptsPerSquareCost = 8;
	ptsPerSquareFor = "4.0f";
	ptsPerSquareForEdge = "10.0f";
	ptsPerSquareRoad = 2;
	ptsPerSquareObj = 10;
	showCountourInterval = "true";
	
		class Task 
		{
		  icon = "#(argb,8,8,3)color(0,1,0,1)";
		  iconCreated = "#(argb,8,8,3)color(1,1,1,1)";
		  iconCanceled = "#(argb,8,8,3)color(0,0,1,1)";
		  iconDone = "#(argb,8,8,3)color(0,0,0,1)";
		  iconFailed = "#(argb,8,8,3)color(1,0,0,1)";
		  colorCreated[] = {1,1,1,1};
		  colorCanceled[] = {1,1,1,1};
		  colorDone[] = {1,1,1,1};
		  colorFailed[] = {1,1,1,1};
		  color[] = {1,1,1,1};
		  size = 18;
		  importance = 1;
		  coefMin = 1;
		  coefMax = 1;
/*

			icon = "#(argb,8,8,3)color(0,1,0,1)";
			color[] = {1, 1, 1, 1};
			size = 18;
			importance = 1;
			coefMin = 1;
			coefMax = 1;
*/
		};	
		class CustomMark {
			icon = "\ca\ui\data\map_waypoint_ca.paa";
			color[] = {1, 1, 1, 1};
			size = 18;
			importance = 1;
			coefMin = 1;
			coefMax = 1;
		};
					
			
		class Legend {
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			font = "Zeppelin32";
			sizeEx = 0.0151;
			colorBackground[] = {1, 1, 1, 0.3};
			color[] = {0, 0, 0, 1};
		};
		
		class Bunker {
			icon = "\ca\ui\data\map_bunker_ca.paa";
			color[] = {1, 1, 1, 1};
			size = 14;
			importance = 1.5 * 14 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Bush {
			icon = "\ca\ui\data\map_bush_ca.paa";
			color[] = {0, 0.3, 0, 1};
			size = 14;
			importance = 0.2 * 14 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class BusStop {
			icon = "\ca\ui\data\map_busstop_ca.paa";
			color[] = {1, 1, 1, 1};
			size = 10;
			importance = 1 * 10 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Command {
			icon = "\ca\ui\data\map_waypoint_ca.paa";
			color[] = {1, 1, 1, 1};
			size = 18;
			importance = 1;
			coefMin = 1;
			coefMax = 1;
		};
		
		class Cross {
			icon = "\ca\ui\data\map_cross_ca.paa";
			color[] = {1, 1, 1, 1};
			size = 16;
			importance = 0.7 * 16 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Fortress {
			icon = "\ca\ui\data\map_bunker_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 2 * 16 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Fuelstation {
			icon = "\ca\ui\data\map_fuelstation_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 2 * 16 * 0.05;
			coefMin = 0.75;
			coefMax = 4;
		};
		
		class Fountain {
			icon = "\ca\ui\data\map_fountain_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 12;
			importance = 1 * 12 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Hospital {
			icon = "\ca\ui\data\map_hospital_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 2 * 16 * 0.05;
			coefMin = 0.5;
			coefMax = 4;
		};
		
		class Chapel {
			icon = "\ca\ui\data\map_chapel_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 1 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class Church {
			icon = "\ca\ui\data\map_church_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class Lighthouse {
			icon = "\ca\ui\data\map_lighthouse_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 20;
			importance = 3 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class Quay {
			icon = "\ca\ui\data\map_quay_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 2 * 16 * 0.05;
			coefMin = 0.5;
			coefMax = 4;
		};
		
		class Rock {
			icon = "\ca\ui\data\map_rock_ca.paa";
			color[] = {0.78, 0, 0.05, 1};
			size = 12;
			importance = 0.5 * 12 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Ruin {
			icon = "\ca\ui\data\map_ruin_ca.paa";
			color[] = {0.78, 0, 0.05, 1};
			size = 16;
			importance = 1.2 * 16 * 0.05;
			coefMin = 1;
			coefMax = 4;
		};
		
		class SmallTree {
			icon = "\ca\ui\data\map_smalltree_ca.paa";
			color[] = {0.55, 0.64, 0.43, 1};
			size = 12;
			importance = 0.6 * 12 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Stack {
			icon = "\ca\ui\data\map_stack_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 20;
			importance = 2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class Tree {
			icon = "\ca\ui\data\map_tree_ca.paa";
			color[] = {0.55, 0.64, 0.43, 1};
			size = 12;
			importance = 0.9 * 16 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Tourism {
			icon = "\ca\ui\data\map_tourism_ca.paa";
			color[] = {0.78, 0, 0.05, 1};
			size = 16;
			importance = 1 * 16 * 0.05;
			coefMin = 0.7;
			coefMax = 4;
		};
		
		class Transmitter {
			icon = "\ca\ui\data\map_transmitter_ca.paa";
			color[] = {0.78, 0, 0.05, 1};
			size = 20;
			importance = 2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class ViewTower {
			icon = "\ca\ui\data\map_viewtower_ca.paa";
			color[] = {0.78, 0, 0.05, 1};
			size = 16;
			importance = 2.5 * 16 * 0.05;
			coefMin = 0.5;
			coefMax = 4;
		};
		
		class Watertower {
			icon = "\ca\ui\data\map_watertower_ca.paa";
			color[] = {0, 0.35, 0.7, 1};
			size = 32;
			importance = 1.2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class Waypoint {
			icon = "\ca\ui\data\map_waypoint_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 32;
			importance = 1.2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;			
		};
		
		class WaypointCompleted {
			icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 32;
			importance = 1.2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;			
	};
};