// Deletes dead Enemy
private ["_unit","_tag","_curtownInf","_curtownMec","_lastHit"]; 
_unit = _this select 0;
_tag = _this select 1;
_killer = _this select 2;
_dispname = getText (configFile >> "cfgVehicles" >> typeof _unit >> "displayName");	// different displayname for different languages
_msg = "";

switch (_tag) do //who died where?
{
	case "INF":
	{
		_curtownInf = (BIS_EVO_Infantry select BIS_EVO_MissionProgress) select 0;
		(BIS_EVO_Infantry select BIS_EVO_MissionProgress) set [0, _curtownInf-1];
		//systemChat format ["%1: Was killed by %2 ", name _unit,_mobjbury];
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
	if(isPlayer _killer) then 
	{
		_msg = format ["%1 destroyed: %2",name _killer, _dispname];
		//systemChat format ["You killed: %1", _dispname];
		
		 clientMessageBuffer = clientMessageBuffer + [_msg];
		 (owner _killer) publicVariableClient "clientMessageBuffer";
	};
	{_x setpos position _unit} forEach crew _unit;
	sleep 300.0;
	deletevehicle _unit;
};
if (_unit isKindOf "Man") then
{
	if(isPlayer _killer) then 
	{
		_msg = format ["%1 killed: %2",name _killer, _dispname];

		 clientMessageBuffer = clientMessageBuffer + [_msg];
		 (owner _killer) publicVariableClient "clientMessageBuffer";
	};


	if(not ((vehicle _unit) isKindOf "Man")) then {_unit setpos (position vehicle _unit)} ;
	sleep 310.0;
	hideBody _unit;
};
