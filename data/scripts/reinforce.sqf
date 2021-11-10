#include "macros.h"

	_tag = "";

	_curtownInf = round(((BIS_EVO_InfantrySpawn)/enemynumdiv));
	_basetownInf = round(((BIS_EVO_InfantryTarget))/enemynumdiv);
	_curtownMec = round(((BIS_EVO_MechanizedSpawn))/enemynumdiv);
	_basetownMec = round(((BIS_EVO_MechanizedTarget))/enemynumdiv);

if ( (_curtownInf <= _basetownInf) and (reinforcements) ) then 
{
	_tag = "INF";	
	[] spawn BIS_EVO_mKamazOpen;
	//if !(eResupplying) then {[] spawn BIS_EVO_mKamazResupply;};
	//No choppy choppies in villages
	if !(currentTown in BIS_EVO_MissionVillages) then 
	{
		if([70]call chance) then 
		{
			[] spawn BIS_EVO_rappelSupport;
		}
		else
		{
			[] spawn BIS_EVO_MI17support;
		};
//		(BIS_EVO_Infantry select BIS_EVO_MissionProgress) set [0, (_curtownInf*enemynumdiv)+6];
	};



//	(BIS_EVO_Infantry select BIS_EVO_MissionProgress) set [0, (_curtownInf*enemynumdiv)+6];
	sleep 1;
};
//	(BIS_EVO_Mechanized select BIS_EVO_MissionProgress) set [0,0];
sleep 15;

if( (_curtownMec <= _basetownMec) and (reinforcements) ) then 
{
//	systemChat "reinforcing mechanized";
	[] spawn EGG_EVO_mecreinf;
//	(BIS_EVO_Mechanized select BIS_EVO_MissionProgress) set [0, (_curtownMec*enemynumdiv)+1];
	sleep 1;

	if(([15] call chance and _curTown in BIS_EVO_CoastalTowns)) then {[] spawn BIS_EVO_SHIPSUPPORT};
};
sleep 1;
