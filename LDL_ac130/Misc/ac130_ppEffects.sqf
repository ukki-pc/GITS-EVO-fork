/*	ac130_ppEffects.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

switch(_mode) do
{
	case 0:
	{
		//Nothing

	};

	case 1:
	{
	  	//Blue
	  	LDL_ppccor = ppEffectCreate ["ColorCorrections", 1];
		LDL_ppccor ppEffectEnable true;
		LDL_ppccor ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 1, 0.75], [1, 0.75, 1, 1]];
		LDL_ppccor ppEffectCommit 0;
		      
		LDL_ppfilm = ppEffectCreate ["filmGrain", 3];
		LDL_ppfilm ppEffectEnable true;
		LDL_ppfilm ppEffectAdjust [0.05, 1, 0.2, 0.2, 1, false];
		LDL_ppfilm ppEffectCommit 0;

		LDL_ppdyblur = ppEffectCreate ["dynamicBlur", 0];
		LDL_ppdyblur ppEffectEnable true;  
		LDL_ppdyblur ppEffectAdjust [0.2];
		LDL_ppdyblur ppEffectCommit 0;
	};  

	case 2:
	{
	  	//FLIR white
	  	//Operation Arrowhead
	 	if ((isClass(configFile>>"CfgMods">>"Expansion"))) then 
	 	{
			[true, 0]call LDL_OAH_setCamUseTi;
		}
		else
		{
			LDL_ppccor = ppEffectCreate ["ColorCorrections", 1];
			LDL_ppccor ppEffectEnable true;
			LDL_ppccor ppEffectAdjust [1, 1, -0.002, [1, 1, 1, 0.1], [1, 1, 1, 0], [1, 1, 1, 0]];
			LDL_ppccor ppEffectCommit 0;

			LDL_ppcinv = ppEffectCreate ["colorInversion", 2];
			LDL_ppcinv ppEffectEnable true;
			LDL_ppcinv ppEffectAdjust [LDL_inversion,LDL_inversion,LDL_inversion]; //[0.1,0.1,0.1]
			LDL_ppcinv ppEffectCommit 0;
			      
			LDL_ppfilm = ppEffectCreate ["filmGrain", 3];
			LDL_ppfilm ppEffectEnable true;
			LDL_ppfilm ppEffectAdjust [0.1, 1, 1, 0.1, 1, false];
			LDL_ppfilm ppEffectCommit 0;

			LDL_ppdyblur = ppEffectCreate ["dynamicBlur", 0];
			LDL_ppdyblur ppEffectEnable true;  
			LDL_ppdyblur ppEffectAdjust [0.4];
			LDL_ppdyblur ppEffectCommit 0;
		};
	};  

	case 3:
	{
	  	//FLIR black
	  	//Operation Arrowhead
	 	if ((isClass(configFile>>"CfgMods">>"Expansion"))) then 
	 	{
			[true, 1]call LDL_OAH_setCamUseTi;
		};
	};

	case 4:
	{
	  	//NVG Green
	  	camUseNVG true;
	};    
};