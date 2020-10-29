// Determins the direction between two points
BIS_EVO_GetRelDir = 
{
	_posA = _this select 0;
	_posB = _this select 1;
	
	_xy=[((_posB select 0)-(_posA select 0)),((_posB select 1)-(_posA select 1))];// finding coords for atan player pos to civ car spawn pos
	_degrees= ((_xy select 0) atan2 (_xy select 1)); // angle from _posA to _posB
	if(_degrees < 0)then{_degrees=_degrees+360}; // keeping degrees positive
	_degrees
};