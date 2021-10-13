#include "rscbasicDefines.hpp"
class RscIGUIListBox : RscListBox 
{
	color[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 0.75};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0.95, 0.95, 0.95, 1};
	colorSelect2[] = {0.95, 0.95, 0.95, 1};
	colorSelectBackground[] = {0.6, 0.839, 0.47, 0.3};
	colorSelectBackground2[] = {0.6, 0.839, 0.47, 1};
	period = 0;
	colorBackground[] = {0, 0, 0, 1};
	sizeEx = 0.035;
	class ScrollBar 
	{
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\igui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\igui_arrow_top_ca.paa";
		border = "\ca\ui\data\igui_border_scroll_ca.paa";
	};
};
class RscShortcutButton 
	{
	type = 16;
	idc = -1;
	style = 0;
	default = 0;
	w = 0.183825;
	h = 0.104575;
	color[] = {0.95, 0.95, 0.95, 1};
	color2[] = {1, 1, 1, 0.4};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.4};
	colorDisabled[] = {1, 1, 1, 0.25};
	periodFocus = 1.2;
	periodOver = 0.8;
	
	class HitZone 
	{
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
	};
	
	class ShortcutPos 
	{
		left = 0.004;
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
	animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\ui_button_focus_ca.01.paa";
	animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
	textureNoShortcut = "";
	period = 0.4;
	font = "Zeppelin32";
	size = 0.03521;
	sizeEx = 0.03521;
	text = "";
	soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
	soundPush[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	soundClick[] = {"\ca\ui\data\sound\mouse3", 0.07, 1};
	soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.09, 1};
	action = "";
	
	class Attributes 
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	
	class AttributesImage 
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
	};
};
class RscIGUIShortcutButton : RscShortcutButton 
	{
	w = 0.183825;
	h = 0.0522876;
	style = 2;
	color[] = {1, 1, 1, 1};
	color2[] = {1, 1, 1, 0.85};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.85};
	colorDisabled[] = {1, 1, 1, 0.4};
	
	class HitZone 
	{
		left = 0.002;
		top = 0.003;
		right = 0.002;
		bottom = 0.016;
	};
	
	class ShortcutPos 
	{
		left = -0.006;
		top = -0.007;
		w = 0.0392157;
		h = 0.0522876;
	};
	
	class TextPos {
		left = 0.02;
		top = 0.0;
		right = 0.002;
		bottom = 0.016;
	};
	animTextureNormal = "\ca\ui\data\igui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\igui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\igui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\igui_button_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\igui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\igui_button_normal_ca.paa";
	animTextureNoShortcut = "\ca\ui\data\igui_button_normal_ca.paa";
	
	class Attributes 
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "center";
		shadow = "true";
	};
};

class evoUI
{
	idd = 100;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "initNakup = true;DlgClosed = false;[] execVM ""data\scripts\Core.sqf""";
	//onLoad = "uiNamespace setVariable [""initNakup"", true];"uiNamespace setVariable [""DlgClosed"", false];[] execVM ""data\scripts\Core.sqf""";
	__EXEC( _xSpacing = 0.0075;  _ySpacing = 0.01;)
	__EXEC( _xInit = 12 * _xSpacing; _yInit = 18 * _ySpacing;)
	__EXEC( _windowWidth = 101; _windowHeight = 64;)
	__EXEC( _windowBorder = 1;)

	class controlsBackground
	{
		class Mainback : RscPicture 
		{
			idc = 1104;
			x = 0.042;
			y = 0.101;
			w = 1.2549;
			h = 0.836601;
			text = "\ca\ui\data\igui_background_debriefing_ca.paa";
		};	
		class DesTitleMain : RscPicture  
		{
			idc = 101;
			x = 0.39;
			y = 0.2;
			w = 0.725;
			h = 0.42;
		text = "\ca\ui\data\igui_background_debriefing_ca.paa";
		colorText[] = {0.3, 0.3, 0.3, 0.6};
		};
		class ListbackMain : DesTitleMain  
		{
			idc = 101;
			x = 0.0506555;
			y = 0.2;
			w = 0.41;
			h = 0.34;
			text = "\ca\ui\data\igui_background_debriefing_ca.paa";
		};
		class TitleTtl : RscText
		{
		   	idc = 0;
			x = 0.380722;
			y =  0.156;
			w = __EVAL(15 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_White;
			sizeEx = 0.03;
			text = "GPS";
		};
	};
	class controls
	{
		class SliderVis : RscSlider 
		{
			idc = 6057;
			x = 0.0606555;
			y = 0.57;
			w = 0.29;
			h = __EVAL(3 * _ySpacing);
		};
		class SliderAirVis : SliderVis 
		{
			idc = 6058;
//			y = 0.63;
			y = 0.61;
		};
//adding
		class SliderTerVis : SliderVis 
		{
			idc = 6059;
			y = 0.65;
		};
		class Available_items: RscIGUIListBox
		{
			idc = 2000;
			default = 1;
			x = 0.0506555;
			y = 0.22;
			w = 0.31;
			h = 0.3;
			//lineSpacing = 0;
			onLBSelChanged = "[] call BIS_EVO_ListSelect";
			onLBDblClick = "[] call BIS_EVO_ActButton";
			rowHeight = 0.04;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";		
		};
			class Available_items2: RscIGUIListBox
		{
			idc = 1995;
			default = 1;
			x = 0.39;
			y = 0.2;
			w = 0.41;
			h = 0.3;
			//lineSpacing = 0;
			onLBSelChanged = "[] call BIS_EVO_ListSelect";
			onLBDblClick = "[] call BIS_EVO_ActButton";
			rowHeight = 0.04;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";		
		};	
	      class BMulti: RscIGUIShortcutButton // GLOBAL ACTIONS
	      {
		 idc = 6056;
			x = 0.11;
			y = 0.60;
				//w = __EVAL(20 * _xSpacing);
				//h = __EVAL(4 * _ySpacing);
				//colorActive[] = CA_UI_green;
				text = "Action";
				onButtonClick = "[] call BIS_EVO_ActButton";
				
	      };
   		class BRecruit: RscIGUIShortcutButton
	      {
		 idc = 656;
		 		x = 0.11;
				y = 0.67;
				text = $STR_M04t96;
				//text = "Recruitment(L)";
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[true,false,false,false,false,false,0,false,false,false];[] call BIS_EVO_ListUpdate";
	      };
	      class BSupport: BRecruit
	      {
		 idc = 657;
				y = 0.715;
				text = $STR_M04t101;
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,true,false,false,false,false,0,false,false,false];[] call BIS_EVO_ListUpdate";
	      };
	      class BAssign: BRecruit
	      {
		 idc = 658;
				y = 0.76;
				text = "Actions";
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,true,false,false,false,0,false,false,false];[] call BIS_EVO_ListUpdate";
	      };
	      class BGroup: BRecruit
	      {
		 idc = 659;
				y = 0.805;
				text = $STR_M04xt11;
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,true,false,false,0,false,false,false];[] call BIS_EVO_ListUpdate";
	      };
		  
		 class BUpgrades: RscIGUIShortcutButton
	       {
		  idc = 669;
		 		x = 0.29;
				y = 0.863977;
		 		text = "Perks";
		 		onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,false,false,false,0,true,false,0,false];[] call BIS_EVO_ListUpdate";
	       };

		   	class BWeapons: RscIGUIShortcutButton
	       {
		  idc = 669;
		 		x = 0.29;
				y = 0.823977;
		 		text = "Weapons";
		 		onButtonClick = "closeDialog 1; createDialog 'WeaponshopUi';";
	       };
		  
	      class BOptions: RscIGUIShortcutButton
	      {
		 idc = 660;
				x = 0.47;
				y = 0.863977;
				text = $STR_M04t124;
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,false,true,false,0,false,false,0,false];[] call BIS_EVO_ListUpdate";
	      };	      
		class BVec: RscIGUIShortcutButton
	      {
		 idc = 670;
				x = 0.29;
				y = 0.863977;
				text = "Vehicle menu";
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,false,false,false,0,false,true,1,false];[] call BIS_EVO_ListUpdate";
	      };
		class BPurchase: RscIGUIShortcutButton
	      {
		 idc = 661;
				x = 0.11;
				y = 0.863977;
				text = "Vehicles";
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,false,false,true,1,false,false,0,false];[] call BIS_EVO_ListUpdate";
	      };
		  	class BPurchaseClose: RscIGUIShortcutButton
	      {
		 idc = 663;
				x = 0.11;
				y = 0.863977;
				text = "Back";
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[true,false,false,false,false,false,0,false,false,0,false];[] call BIS_EVO_ListUpdate";
	      };
	      class Close: RscIGUIShortcutButton // Close
	      {
		 idc = 662;
				//x = __EVAL(_xInit + (102 * _xSpacing));
				//y = __EVAL(_yInit + (54 * _ySpacing));
				x = 0.771248;
				y = 0.863977;
				//w = __EVAL(16 * _xSpacing);
				//h = __EVAL(4 * _ySpacing);
				//color[] = Color_Black;
				//colorActive[] = CA_UI_green;
				text = $STR_M04t136;
				onButtonClick = "GetoutClick = true; BtnClick = true";
	      };
	    class Bcar: RscIGUIShortcutButton
	      {
		 idc = 664;
		 		x = 0.11;
				y = 0.645;
				text = "Cars";
				//text = "Recruitment(L)";
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,false,false,true,1,false,false,0,false];[] call BIS_EVO_ListUpdate";
	      };
		 class BTurretM: RscIGUIShortcutButton
	       {
		  idc = 671;
		  		x = 0.11;
		 		y = 0.69;
				text = "Turret";
				//text = "Recruitment(L)";
		 		onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,false,false,false,0,false,true,2,false];[] call BIS_EVO_ListUpdate";
	       };
		 class BMissileM: RscIGUIShortcutButton
	       {
		 idc = 672;
		  	 	x = 0.11;
		 		y = 0.735;
		 		text = "Missiles";
		 		//text = "Recruitment(L)";
		 		onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,false,false,false,0,false,true,3,false];[] call BIS_EVO_ListUpdate";
	       };
		class BLoadouts: RscIGUIShortcutButton
	      {
		 idc = 673;
		 	 	x = 0.11;
				y = 0.645;
				text = "Loadouts";
				
				//text = "Recruitment(L)";
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,false,false,false,0,false,true,1,false];[] call BIS_EVO_ListUpdate";
	      };
	      class Btank: BRecruit
	      {
		 idc = 665;
				y = 0.69;
				text = "Tanks";
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,false,false,true,2,false,false,0,false];[] call BIS_EVO_ListUpdate";
	      };
	      class Bair: BRecruit
	      {
		 idc = 666;
				y = 0.735;
				text = "Air";
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,false,false,true,3,false,false,0,false];[] call BIS_EVO_ListUpdate";
	      };
	      class Bstat: BRecruit
	      {
		 idc = 667;
				y = 0.78;
				text = "Static";
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,false,false,true,4,false,false,0,false];[] call BIS_EVO_ListUpdate";
	      };
		class Bspec: BRecruit
	      {
		 idc = 668;
				y = 0.825;
				x = 0.11;
				text = "Special";
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,false,false,true,5,false,false,0,false];[] call BIS_EVO_ListUpdate";
	      };
		class Bstore: BRecruit
	      {
		 idc = 674;
				y = 0.825;
				x = 0.771248;
				text = "Store vehicle";
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,false,false,true,6,false,false,0,false];[] call BIS_EVO_ListUpdate";
	      };
		class saveLoadout: BRecruit
	      {
		 idc = 675;
				y = 0.825;
				x = 0.771248;
				text = "Save loadout";
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[true,false,false,false,false,false,7,false,false,0,false];[] call BIS_EVO_ListUpdate";
	      };
		class unflip: BRecruit
	      {
		 idc = 676;
				y = 0.825;
				x = 0.771248;
				text = "Unflip vehicle";
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,false,false,true,8,false,false,0,false];[] call BIS_EVO_ListUpdate";
	      };
		class hitMark: BRecruit
	      {
		 idc = 677;
				y = 0.825;
				x = 0.771248;
				text = "Hitmarker";
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,false,true,false,9,false,false,0,false];[] call BIS_EVO_ListUpdate";
	      };
		class vehUpg: BRecruit
	      {
		 idc = 678;
				y = 0.825;
				x = 0.47;
				text = "Upgrade";
	 			onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,false,false,false,0,false,true,4,false];[] call BIS_EVO_ListUpdate";
	      };
		class Construction: BRecruit
	      {
		 idc = 679;
				y = 0.825;
				x = 0.47;
				text = "Construction";
				onButtonClick = "lbSetCurSel[2000,0];Mpage =[false,false,false,false,false,false,0,false,false,0,true];[] call BIS_EVO_ListUpdate";
	      };
		class GPSgmap: RscMapControl
		  {
			idc = 895;
			colorBackground[] = {1, 1, 1, 0.6};
			x = 0.39;
			y = 0.22;
			w = 0.55;
			h = 0.38;
			colorOutside[] = {0, 0, 0, 1};
			maxSatelliteAlpha =0;
			alphaFadeStartScale=0;
			alphaFadeEndScale=0;
			class ActiveMarker 
			{
				color[] = {1, 1, 1, 0.8};
				size = 50;
			};
		  };
		class ATitle : RscText
		{
			idc = 2201;
			x = 0.0473857;
			y =  0.156;
			w = __EVAL(34 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_White;
			sizeEx = 0.03;
			text = "";
		};
		class MTitle : ATitle // Main Title
		{
			idc = 2202;
			x = 0.0473857;	
			y = 0.0913138;
			w = 0.89;
			h = 0.058824;
			colorText[] = Color_White;
			sizeEx = 0.03921;
			text = "";
		};
//
		class TTitle : ATitle // Main Title
		{
			idc = 2207;
			x = 0.0473857;	
			y = 0.655;
			w = 0.89;
			h = 0.058824;
			colorText[] = Color_White;
			sizeEx = 0.03921;
			text = "Terrain Detail";
		};
		class VActive : ATitle
		{
			idc = 2205;
			x = 0.0506555;
			y = 0.535;
			w = __EVAL((_windowWidth - 2 * _windowBorder) * _xSpacing);
			h = __EVAL(4 * _ySpacing);
			colorText[] = Color_White;
			sizeEx = 0.024;
			text = "10000";
		};
		class AVActive : VActive
		{
			idc = 2206;
			y = 0.595;
			text = "10000";
		};
//
		class TActive : VActive
		{
			idc = 2208;
			y = 0.655;
			text = "5";
		};
		
		class Score : RscText
		{
			idc = 2003;
			x = 0.0506555;
			y = 0.55;
			w = __EVAL(15 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_White;
			sizeEx = 0.03;
			text = ;
		};
		class Reward : Score
		{
			idc = 2002;
			x = 0.1506555;
			text = ;
		};
		class Cost : Score
		{
			idc = 2001;
			x = 0.2506555;
			text = ;
		};	
		
		class Preview : Vendor_Title
		{
			idc = 2004;
			x = 0.72;
			y = 0.625;
			w = 0.035;
			h = 0.035;
			text = ;
			colorText[] = {0.6, 0.839, 0.47, 0.55};
		};
		
		class PreviewMag : Preview
		{
			idc = 2005;
			x = 0.80;
			y = 0.68;
			w = 0.12;
			h = 0.15;
			text = ;
			colorText[] = {0.6, 0.839, 0.47, 0.75};
		};
		class DescriptionTitle: RscText
		{
			idc = 2010;
			style = ST_MULTI + ST_CENTER;
			x = 0.39;
			y = 0.62;
			w = 0.55;
			h = 0.04;
			sizeEx = 0.03921;
			colorText[] = Color_White;
			lineSpacing = 1;
			text = ;
		};
		class Description: DescriptionTitle
		{
			idc = 2011;
			style = ST_MULTI;
			w = 0.40;
			sizeEx = 0.03;
			y = 0.67;
			h = 0.15;
			text = ;
		};
		class Timer: DescriptionTitle
		{
			idc = 2012;
			style = ST_MULTI;
			w = 0.40;
			sizeEx = 0.03;
			y = 0.625;
			h = 0.18;
			text = ;
		};
	};
};

#define wepButCatX 0.5
#define wepButCatY 0.15
#define wepButPadding 0.05

class WeaponShopUI 
{
	idd = 177;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "initNakup = true;DlgClosed = false;[] execVM ""data\scripts\CoreWeps.sqf""";
	//onLoad = "uiNamespace setVariable [""initNakup"", true];"uiNamespace setVariable [""DlgClosed"", false];[] execVM ""data\scripts\Core.sqf""";
	__EXEC( _xSpacing = 0.0075;  _ySpacing = 0.01;)
	__EXEC( _xInit = 12 * _xSpacing; _yInit = 18 * _ySpacing;)
	__EXEC( _windowWidth = 101; _windowHeight = 64;)
	__EXEC( _windowBorder = 1;)

	class controls

	{
		class Mainback : RscPicture 
		{
			idc = 1104;
			x = 0.042;
			y = 0.101;
			w = 1.2549;
			h = 0.836601;
			text = "\ca\ui\data\igui_background_debriefing_ca.paa";
		};	

		class ListbackWeapon   : RscPicture 
		{
			idc = 101;
			x = 0.0506555;
			y = 0.15;
			w = 0.55;
			h = 0.74;
			text = "\ca\ui\data\igui_background_debriefing_ca.paa";
			colorText[] = {0.5, 0.5, 0.5, 0.7};
		};
		class available_weapons: RscIGUIListBox
		{
			idc = 4000;
			default = 1;
			x = 0.0506555;
			y = 0.185;
			w = 0.438;
			h = 0.64;
			//lineSpacing = 0;
			onLBSelChanged = "[] call BIS_EVO_ListSelect";
			onLBDblClick = "[] call BIS_EVO_ActButton";
			rowHeight = 0.04;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";		
			columns[] = {0.3, 0.6, 0.7}; 
		};

		  class BMulti: RscIGUIShortcutButton 
	      {
			 idc = 8056;
			x = wepButCatX;
			y = wepButCatY;
				text = "Assault Rifles";
				onButtonClick = "lbSetCurSel[4000,0]; Wpage = 0;[] call BIS_EVO_ListUpdate";	
	      };

		class BMulti2: BMulti
	      {
			x = wepButCatX;
			y = wepButCatY+(wepButPadding*1);
				text = "CQB";
				onButtonClick = "lbSetCurSel[4000,0];Wpage = 1;[] call BIS_EVO_ListUpdate";	
	      };
		class BMulti4: BMulti
	      {
			x = wepButCatX;
			y = wepButCatY+(wepButPadding*2);
			text = "Pistols";
			onButtonClick = "lbSetCurSel[4000,0]; Wpage = 2;[] call BIS_EVO_ListUpdate";		
	      };
		  		class BMulti5: BMulti
	      {
			x = wepButCatX;
			y = wepButCatY+(wepButPadding*3);
			text = "Rifles";
			onButtonClick = "lbSetCurSel[4000,0]; Wpage = 3;[] call BIS_EVO_ListUpdate";	
	      };
		  		  		class BMulti6: BMulti
	      {
			x = wepButCatX;
			y = wepButCatY+(wepButPadding*4);
			text = "Launchers";
			onButtonClick = "lbSetCurSel[4000,0]; Wpage = 4;[] call BIS_EVO_ListUpdate";	
	      };
		class BMulti7: BMulti
	      {
			x = wepButCatX;
			y = wepButCatY+(wepButPadding*5);
			text = "Machine Guns";
			onButtonClick = "lbSetCurSel[4000,0];Wpage = 5;[] call BIS_EVO_ListUpdate";		
	      };
		  	class BMulti8: BMulti
	      {
			x = wepButCatX;
			y = wepButCatY+(wepButPadding*6);
			text = "Misc";
			onButtonClick = "lbSetCurSel[4000,0]; Wpage = 6;[] call BIS_EVO_ListUpdate";		
	      };
		class weaponPreview : Vendor_Title
		{
			idc = 4003;
			x = 0.72;
			y = 0.625;
			w = 0.035;
			h = 0.035;
			text = ;
			colorText[] = {0.6, 0.839, 0.47, 0.55};
		};
		class wepMoney : RscText
		{
			idc = 2003;
			x = 0.0506555;
			y = 0.1;
			w = 1;
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_White;
			sizeEx = 0.03;
			text = "Your money: 2000";
		};
		class WPClose: RscIGUIShortcutButton // Close
	      {
		 idc = 662;
				//x = __EVAL(_xInit + (102 * _xSpacing));
				//y = __EVAL(_yInit + (54 * _ySpacing));
				x = 0.771248;
				y = 0.863977;
				//w = __EVAL(16 * _xSpacing);
				//h = __EVAL(4 * _ySpacing);
				//color[] = Color_Black;
				//colorActive[] = CA_UI_green;
				text = $STR_M04t136;
				onButtonClick = "GetoutClick = true; BtnClick = true";
	      };
	};
};


class kfeed: RscTextSmall
{
	idc = 4001;
};
