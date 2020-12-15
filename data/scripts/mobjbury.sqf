// Deletes dead Enemy
private ["_unit","_tag","_curtownInf","_curtownMec"]; 
_unit = _this select 0;
_tag = _this select 1;

switch (_tag) do //who died where?
{
	case "INF":
	{
		_curtownInf = (BIS_EVO_Infantry select BIS_EVO_MissionProgress) select 0;
		(BIS_EVO_Infantry select BIS_EVO_MissionProgress) set [0, _curtownInf-1];
	};	
	 case "MEC":
	{
		_curtownMec = (BIS_EVO_Mechanized select BIS_EVO_MissionProgress) select 0;
		(BIS_EVO_Mechanized select BIS_EVO_MissionProgress) set [0, _curtownMec-1];
	};
	 default
	{
	};	
};
if (not (_unit isKindOf "Man")) then
{
	{_x setpos position _unit} forEach crew _unit;
	sleep 300.0;
	deletevehicle _unit;
};
if (_unit isKindOf "Man") then
{
	if(not ((vehicle _unit) isKindOf "Man")) then {_unit setpos (position vehicle _unit)} ;
		//systemChat format ["you killed a man"];
	sleep 310.0;
	hideBody _unit;
};
