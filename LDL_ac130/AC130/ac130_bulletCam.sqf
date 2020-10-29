/*	ac130_bulletCam.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

private["_bullet"];

_bullet = _this select 0;

LDL_ac130_cam_bullet camSetTarget (screenToWorld [0.5, 0.5]);
LDL_ac130_cam cameraeffect ["terminate", "back"];
LDL_ac130_cam_bullet cameraeffect ["internal", "back"];

setAccTime 0.2;

while{alive _bullet} do
{
	sleep 0.0005;
	if(!isNull _bullet) then
	{
		LDL_ac130_cam_bullet camSetPos (getPos _bullet);
		LDL_ac130_cam_bullet camCommit 0;
	};
};

setAccTime 1;

sleep 1;

LDL_ac130_cam_bullet cameraeffect ["terminate", "back"];
LDL_ac130_cam cameraeffect ["internal", "back"];
LDL_ac130_cam camCommit 0;
