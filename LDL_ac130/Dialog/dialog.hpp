#include "classes\styles.hpp"
#include "classes\baseClasses.hpp"

class LDL_Monitor
{
	idd = 1000;
	movingEnable = true;
	controlsBackground[] = {};
	onLoad = "[0, 1000]execVM 'LDL_ac130\Dialog\dlg_event.sqf'";
	onUnload = "[1, 1000]execVM 'LDL_ac130\Dialog\dlg_event.sqf'";
	onChildDestroyed = "[1, 1000]execVM 'LDL_ac130\Dialog\dlg_event.sqf'";
	controls[] = 
	{
		/*Bottom*/ 
			/*Background*/
			LDL_background, 
			
			/*AC130 Display*/
			LDL_lO, LDL_rO, LDL_lU, LDL_rU, LDL_Cross, LDL_Range, LDL_Center, LDL_Center2, LDL_HorFrame, LDL_VerFrame, LDL_HorBar, LDL_VerBar, LDL_North, LDL_East, LDL_South, LDL_West, 
			TargetText, Target, Target1, Target2, Target3, Target4, Target5, Target6, Target7, Target8, Target9, Target10,

			/*UAV Display*/
			LDL_Circle, 			
				
		/*Middle*/ 
			
			/*Frame*/
			LDL_blackscreen, LDL_Display, LDL_mouseHandler, 

			/*AC130_COOP Overlay*/
			text_m,
		
		/*Top*/ 
		
			/*Buttons*/
			LDL_t1,LDL_t2,LDL_t3,LDL_t4,LDL_t5, LDL_b1,LDL_b2,LDL_b3,LDL_b4,LDL_b5, LDL_r1,LDL_r2,LDL_r3,LDL_r4,LDL_r5, LDL_l1,LDL_l2,LDL_l3,LDL_l4,LDL_l5,
                        
                        /*Map*/
			LDL_Map, 
                        
                        /*Popups*/
                            
                            /*Parameters*/
                            LDL_edit_back, LDL_edit_head, LDL_edit_radiusEdit, LDL_edit_cancel, LDL_edit_ok, LDL_edit_radiusText, LDL_edit_heightText, LDL_edit_heightEdit,
                            
                            /*Help*/
                            LDL_helpText
                        
			
	};

	#include "classes\main_1000_1003.hpp"	

	#include "classes\buttons_100_119.hpp"

	#include "classes\misc_200_217.hpp"
	
	#include "classes\targets_218_229.hpp"	
	
	#include "classes\map_300_308.hpp"

	#include "classes\uav_400_400.hpp"	

	#include "classes\gunner_500_500.hpp"
        
        #include "classes\help_600_600.hpp"
        
        
};

#include "classes\dialog_close.hpp"

///////////////////////////////////////////////////////////////////////////
/// User Interface Editor
///////////////////////////////////////////////////////////////////////////
/*
$[
	1.03,
	[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 32","safezoneH / 20"],
	[1600,"t1",[1,"t1",["0.262812 * safezoneW + safezoneX","0.00523439 * safezoneH + safezoneY","0.05 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1601,"t2",[1,"t2",["0.367857 * safezoneW + safezoneX","0.00571433 * safezoneH + safezoneY","0.05 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1602,"t3",[1,"t3",["0.47381 * safezoneW + safezoneX","0.00571429 * safezoneH + safezoneY","0.05 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1603,"t4",[1,"t4",["0.579762 * safezoneW + safezoneX","0.00476193 * safezoneH + safezoneY","0.05 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1604,"t5",[1,"t5",["0.686905 * safezoneW + safezoneX","0.00476192 * safezoneH + safezoneY","0.05 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1605,"l1",[1,"l1",["0.00892893 * safezoneW + safezoneX","0.252381 * safezoneH + safezoneY","0.0434523 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1606,"l2",[1,"l2",["0.00833325 * safezoneW + safezoneX","0.359048 * safezoneH + safezoneY","0.0434523 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1607,"l3",[1,"l3",["0.00833328 * safezoneW + safezoneX","0.464761 * safezoneH + safezoneY","0.0434523 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1608,"l4",[1,"l4",["0.00833328 * safezoneW + safezoneX","0.571429 * safezoneH + safezoneY","0.0434523 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1609,"l5",[1,"l5",["0.00833326 * safezoneW + safezoneX","0.675239 * safezoneH + safezoneY","0.0434523 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1610,"r1",[1,"r1",["0.948214 * safezoneW + safezoneX","0.252381 * safezoneH + safezoneY","0.0434523 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1611,"r2",[1,"r2",["0.948215 * safezoneW + safezoneX","0.359047 * safezoneH + safezoneY","0.0434523 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1612,"r3",[1,"r3",["0.94881 * safezoneW + safezoneX","0.46381 * safezoneH + safezoneY","0.0434523 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1613,"r4",[1,"r4",["0.949404 * safezoneW + safezoneX","0.571428 * safezoneH + safezoneY","0.0434523 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1614,"r5",[1,"r5",["0.949405 * safezoneW + safezoneX","0.675238 * safezoneH + safezoneY","0.0434523 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1615,"b1",[1,"b1",["0.263095 * safezoneW + safezoneX","0.944762 * safezoneH + safezoneY","0.05 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1616,"b2",[1,"b2",["0.367857 * safezoneW + safezoneX","0.945714 * safezoneH + safezoneY","0.05 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1617,"b3",[1,"b3",["0.47381 * safezoneW + safezoneX","0.945714 * safezoneH + safezoneY","0.05 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1618,"b4",[1,"b4",["0.579167 * safezoneW + safezoneX","0.944762 * safezoneH + safezoneY","0.05 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1619,"b5",[1,"b5",["0.686905 * safezoneW + safezoneX","0.944761 * safezoneH + safezoneY","0.05 * safezoneW","0.044375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1100,"LO",[1,"LO",["0.125 * safezoneW + safezoneX","0.1 * safezoneH + safezoneY","0.156548 * safezoneW","0.400476 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1101,"RO",[1,"RO",["0.75119 * safezoneW + safezoneX","0.100952 * safezoneH + safezoneY","0.123215 * safezoneW","0.399524 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1102,"LU",[1,"LU",["0.126191 * safezoneW + safezoneX","0.704762 * safezoneH + safezoneY","0.185714 * safezoneW","0.191905 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1103,"RU",[1,"RU",["0.689286 * safezoneW + safezoneX","0.705714 * safezoneH + safezoneY","0.185714 * safezoneW","0.191905 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1200,"Cross",[1,"LDL_ac130\Pictures\Vis25mm.paa",["0.375 * safezoneW + safezoneX","0.375 * safezoneH + safezoneY","0.25 * safezoneW","0.25 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1000,"Range",[1,"Range: 0000",["0.458928 * safezoneW + safezoneX","0.647619 * safezoneH + safezoneY","0.0839286 * safezoneW","0.03 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1800,"HorFrame",[1,"",["0.375595 * safezoneW + safezoneX","0.720001 * safezoneH + safezoneY","0.25 * safezoneW","0.0261905 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1801,"VerFrame",[1,"",["0.679762 * safezoneW + safezoneX","0.378095 * safezoneH + safezoneY","0.0184523 * safezoneW","0.25 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1001,"HorText",[1,"000",["0.375595 * safezoneW + safezoneX","0.75619 * safezoneH + safezoneY","0.0321428 * safezoneW","0.0185715 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1002,"VerText",[1,"000",["0.705357 * safezoneW + safezoneX","0.380953 * safezoneH + safezoneY","0.0321428 * safezoneW","0.0185715 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],
	[1201,"Center",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.010119 * safezoneW + safezoneX","0.959048 * safezoneH + safezoneY","0.03125 * safezoneW","0.03125 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]]
]
*/

