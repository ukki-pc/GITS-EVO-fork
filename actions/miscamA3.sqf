disableSerialization;
// missile camera mode
_unit = _this select 0;
_type = _this select 1;

_projectile = nearestObject [_unit,_type];

		_mrktype = "plp_icon_mortarshell";
		_formattedName = format ["%1",_projectile];
		_markerobj5 = createMarkerLocal[_formattedName,[0,0,0]];
		_markerobj5 setMarkerColorLocal "plp_ColorRedLight";
		_markerobj5 setMarkerTypeLocal _mrktype;
		_markerobj5 setMarkerSizeLocal [0.5,0.5];
		_markerobj5 setMarkerDirLocal (getDir _projectile)+180;


while{alive _projectile}do
{
	if(visibleMap) then {
		_markerobj5	setMarkerPosLocal getPos _projectile;
		}
	else {sleep 0.5};
	sleep 0.033;
};

deleteMarker _markerobj5;