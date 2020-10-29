///////////////////////////////////////////////////////////////////////////
/// Base Classes
///////////////////////////////////////////////////////////////////////////
class LDL_RscText
{
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {0.8784,0.8471,0.651,1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 2;
	font = "Zeppelin32";
	SizeEx = 0.03921;
};
class LDL_RscStructuredText
{
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = {0.8784,0.8471,0.651,1};
	colorBackground[] = {0,0,0,0};
	class Attributes
	{
		font = "Zeppelin32";
		color = "#e0d8a6";
		align = "center";
		shadow = 1;
	};
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = 0.03921;
	shadow = 2;
};
class LDL_RscPicture
{
	access = 0;
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
};
class LDL_RscEdit
{
	access = 0;
	type = 2;
	x = 0;
	y = 0;
	h = 0.04;
	w = 0.2;
	colorBackground[] = {0,0,0,1};
	colorText[] = {0.95,0.95,0.95,1};
	colorSelection[] = {0.8784,0.8471,0.651,1};
	autocomplete = "";
	text = "";
	size = 0.2;
	style = "0x00 + 0x40";
	font = "Zeppelin32";
	shadow = 2;
	sizeEx = 0.03921;
};
class LDL_RscCombo
{
	access = 0;
	type = 4;
	style = 0;
	colorSelect[] = {0.023529,0,0.0313725,1};
	colorText[] = {0.023529,0,0.0313725,1};
	colorBackground[] = {0.95,0.95,0.95,1};
	colorScrollbar[] = {0.023529,0,0.0313725,1};
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelectBackground[] = {0.8784,0.8471,0.651,1};
	arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	color[] = {0,0,0,0.6};
	colorActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.3};
	font = "Zeppelin32";
	sizeEx = 0.03921;
};
class LDL_RscListBox
{
	access = 0;
	type = 5;
	w = 0.4;
	h = 0.4;
	rowHeight = 0;
	colorText[] = {0.8784,0.8471,0.651,1};
	colorScrollbar[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0.95,0.95,0.95,1};
	colorSelect2[] = {0.95,0.95,0.95,1};
	colorSelectBackground[] = {0,0,0,1};
	colorSelectBackground2[] = {0.8784,0.8471,0.651,1};
	colorBackground[] = {0,0,0,1};
	soundSelect[] = {"",0.1,1};
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
	style = 16;
	font = "Zeppelin32";
	shadow = 2;
	sizeEx = 0.03921;
	color[] = {1,1,1,1};
	period = 1.2;
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};
class LDL_RscButton
{
	access = 0;
	type = 1;
	text = "";
	colorText[] = {0.8784,0.8471,0.651,1};
	colorDisabled[] = {0.4,0.4,0.4,1};
	colorBackground[] = {1,0.537,0,0.5};
	colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
	colorBackgroundActive[] = {1,0.537,0,1};
	colorFocused[] = {1,0.537,0,1};
	colorShadow[] = {0.023529,0,0.0313725,1};
	colorBorder[] = {0.023529,0,0.0313725,1};
	soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};
	soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "Zeppelin32";
	sizeEx = 0.03921;
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};
class LDL_RscShortcutButton
{
	type = 16;
	x = 0.1;
	y = 0.1;
	class HitZone
	{
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
	};
	class ShortcutPos
	{
		left = 0.0145;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};
	class TextPos
	{
		left = 0.05;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};
	shortcuts[] = {};
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	color[] = {0.8784,0.8471,0.651,1};
	color2[] = {0.95,0.95,0.95,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {1,1,1,1};
	colorBackground2[] = {1,1,1,0.4};
	class Attributes
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	idc = -1;
	style = 0;
	default = 0;
	shadow = 2;
	w = 0.183825;
	h = 0.104575;
	periodFocus = 1.2;
	periodOver = 0.8;
	animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\ui_button_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
	period = 0.4;
	font = "Zeppelin32";
	size = 0.03921;
	sizeEx = 0.03921;
	text = "";
	soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};
	soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
	action = "";
	class AttributesImage
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
	};
};
class LDL_RscShortcutButtonMain
{
	idc = -1;
	style = 0;
	default = 0;
	w = 0.313726;
	h = 0.104575;
	color[] = {0.8784,0.8471,0.651,1};
	colorDisabled[] = {1,1,1,0.25};
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	class ShortcutPos
	{
		left = 0.0204;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};
	class TextPos
	{
		left = 0.08;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};
	animTextureNormal = "\ca\ui\data\ui_button_main_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\ui_button_main_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\ui_button_main_over_ca.paa";
	animTextureFocused = "\ca\ui\data\ui_button_main_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\ui_button_main_down_ca.paa";
	animTextureDefault = "\ca\ui\data\ui_button_main_normal_ca.paa";
	period = 0.5;
	font = "Zeppelin32";
	size = 0.03921;
	sizeEx = 0.03921;
	text = "";
	soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};
	soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
	action = "";
	class Attributes
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class AttributesImage
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "false";
	};
};
class LDL_RscFrame
{
	type = 0;
	idc = -1;
	style = 64;
	shadow = 2;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "Zeppelin32";
	sizeEx = 0.02;
	text = "";
};
class LDL_RscSlider
{
	access = 0;
	type = 3;
	style = 1024;
	w = 0.3;
	color[] = {1,1,1,0.8};
	colorActive[] = {1,1,1,1};
	shadow = 0;
	h = 0.025;
};

class LDL_RscMonitorButton: LDL_RscButton
{
	sizeEx = 0.03;
	colorText[] = {0.8784,0.8471,0.651,1};
	colorDisabled[] = {0,0,0,0};
	colorBackground[] = {1,1,1,0.1};
	colorBackgroundDisabled[] = {0,0,0,0};
	colorBackgroundActive[] = {1,1,1,0.15};
	colorFocused[] = {1,1,1,0.15};
	colorShadow[] = {0.023529,0,0.0313725,1};
	colorBorder[] = {0.023529,0,0.0313725,1};
};

class LDL_RscMapControl  
{
	access = 0;
	type = 101;
	idc = -1;
	style = 48;
  	x = SafeZoneX;
  	y = SafeZoneY;
  	w = SafeZoneW;
  	h = SafeZoneH;
	colorBackground[] = {0.7,1,0.7,1};
	colorOutside[] = {0,0,0,1};
	colorText[] = {0,0,0,1 };
	font = "TahomaB";
	sizeEx = 0.040000;
	colorSea[] = {0.560000,0.800000,0.980000,0.500000 };
	colorForest[] = {0.600000,0.800000,0.200000,0.500000 };
	colorRocks[] = {0.500000,0.500000,0.500000,0.500000 };
	colorCountlines[] = {0.650000,0.450000,0.270000,0.500000 };
	colorMainCountlines[] = {0.650000,0.450000,0.270000,1 };
	colorCountlinesWater[] = {0,0.530000,1,0.500000 };
	colorMainCountlinesWater[] = {0,0.530000,1,1 };
	colorForestBorder[] = {0.400000,0.800000,0,1 };
	colorRocksBorder[] = {0.500000,0.500000,0.500000,1 };
	colorPowerLines[] = {0,0,0,1 };
	colorRailWay[] = {0.800000,0.200000,0.300000,1 };
	colorNames[] = {0,0,0,1 };
	colorInactive[] = {1,1,1,0.500000 };
	colorLevels[] = {0,0,0,1 };
	fontLabel = "TahomaB";
	sizeExLabel = 0.040000;
	fontGrid = "TahomaB";
	sizeExGrid = 0.040000;
	fontUnits = "TahomaB";
	sizeExUnits = 0.040000;
	fontNames = "TahomaB";
	sizeExNames = 0.040000;
	fontInfo = "TahomaB";
	sizeExInfo = 0.040000;
	fontLevel = "TahomaB";
	sizeExLevel = 0.040000;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	stickX[] = {0.200000,{"Gamma",1,1.500000 } };
	stickY[] = {0.200000,{"Gamma",1,1.500000 } };
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
	maxSatelliteAlpha = 0.660000;
	alphaFadeStartScale = 0.050000;
	alphaFadeEndScale = 0.150000;

	class Legend  {
		x = 0.700000;
		y = 0.850000;
		w = 0.250000;
		h = 0.100000;
		font = "TahomaB";
		sizeEx = 0.040000;
		colorBackground[] = {1,1,1,0.5 };
		color[] = {0,0,0,1 };
	};

	class ActiveMarker  {
		color[] = {0.300000,0.100000,0.900000,1 };
		size = 50;
	};

	class Command  {
		icon = "#(argb,8,8,3)color(1,1,1,1)";
		color[] = {0,0,0,0 };
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};

	class Task  {
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
	};

	class CustomMark  {
		icon = "#(argb,8,8,3)color(1,0.5,0,1)";
		color[] = {1,1,1,1 };
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};

	class Tree  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0 };
		size = 16;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class SmallTree  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0 };
		size = 16;
		importance = "0.6 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Bush  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0 };
		size = 16;
		importance = "0.2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Church  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0 };
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Chapel  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0 };
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Cross  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0 };
		size = 16;
		importance = "0.7 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Rock  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0 };
		size = 16;
		importance = "1.5 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Bunker  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0 };
		size = 16;
		importance = "1.5 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Fortress  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0 };
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Fountain  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,1,1 };
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class ViewTower  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0 };
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Lighthouse  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0 };
		size = 16;
		importance = "3 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Quay  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0 };
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Fuelstation  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0 };
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Hospital  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {1,0,0,1 };
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class BusStop  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,1,1 };
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Transmitter  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,1,1 };
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Stack  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,1,1 };
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Ruin  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,1,1 };
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Tourism  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,1,1 };
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Watertower  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,1,1 };
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Waypoint  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0 };
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};

	class WaypointCompleted  {
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0 };
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
};
class LDL_RscMouseHandler
{
	type = 15;
	idc = -1;
	style = 0;	
	
	class Scrollbar 
	{
		color[] = {1, 1, 1, 1};
		height = 0.028;
	};
	
	class VScrollbar 
	{
		color[] = {1, 1, 1, 1};
		width = 0.021;
		autoScrollRewind = true;
		autoScrollDelay = -2;
		autoScrollSpeed = -2;		
	};

	class HScrollbar 
	{
		color[] = {1, 1, 1, 1};
		height = 0.028;
	};
			
	//onMouseHolding = "";
	//onMouseEnter = "";	
	onMouseMoving = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseZChanged = "";
	x = SafeZoneX; 
	y = SafeZoneY;
	w = SafeZoneW; 
	h = SafeZoneH;			
	colorBackground[] = {0.0, 0.0, 0.0, 0.0};
};
