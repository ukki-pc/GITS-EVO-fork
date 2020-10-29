/*	indicator.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//Indicator Hor
_difh = [(LDL_cam_dirh - LDL_cam_rotating_angle)]call LDL_normalizeAngle;
_x = 0.375 * safezoneW + safezoneX;
_y = 0.8 * safezoneH + safezoneY;
_w = 0.25* safeZoneW - 0.005 * safezoneW;
if(LDL_plane_type == "AC130_ATTACH") then
{
	_x = _x + _w/2 +sin(_difh-90)*_w/2;
}
else
{
	_x = _x + _w/2 +sin(_difh)*_w/2;
};
(_display displayCtrl 216) ctrlSetPosition [_x,_y];
(_display displayCtrl 216) ctrlCommit 0;

//Indicator Ver
_difv = [LDL_cam_dirv - 180]call LDL_normalizeAngle;
_x = 0.8 * safezoneW + safezoneX;
_y = 0.375 * safezoneH + safezoneY;
_h = SafeZoneH*0.25 - 0.005 * safezoneH;
_y = _y + _h/2 +sin(_difv)*_h/2;
(_display displayCtrl 217) ctrlSetPosition [_x,_y];
(_display displayCtrl 217) ctrlCommit 0;