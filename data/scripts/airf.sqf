if("MobjC1" in BIS_EVO_conqueredTowns) then 
{	
	_dir = random 359;
	player SetPos [(getMarkerPos "LHD1Marker" select 0)-15*sin(_dir),(getMarkerPos "LHD1Marker" select 1)-15*cos(_dir)];
}
else 
{
		hint "You do not have access to that point yet";
};