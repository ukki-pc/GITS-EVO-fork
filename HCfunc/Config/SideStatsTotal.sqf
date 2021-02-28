// Arma 2 function

private ["_TestSide","_Total"];

_TestSide = _this;

if ( _TestSide call F_SideStatsAccessible ) then {
	
	_Total = 0;
} else {
	_Total = "Unknown";
};

_Total;