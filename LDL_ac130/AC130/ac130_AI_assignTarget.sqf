/*	ac130_AI_assignTarget.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private["_objects"];

_objects = (nearestObjects [screenToWorld[0.5,0.5], ["LandVehicle","Air","Ship"], 10]);

if(count _objects > 0) then
{
	LDL_fixPos = (_objects select 0);
	LDL_ac130_plane sideChat format ["Engaging %1.", typeOf (_objects select 0)];
}
else
{
	LDL_fixPos = screenToWorld[0.5,0.5];
	LDL_ac130_plane sideChat format ["Engaging Grid %1.", screenToWorld[0.5,0.5]];
};

LDL_AI_targetAssigned = true;	