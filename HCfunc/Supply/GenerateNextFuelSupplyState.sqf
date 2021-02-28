// Arma 2 function

private ["_Group","_SupplyVehicle","_Action","_Radius","_SupplyCenterLocation",
         "_MinFuelLevel","_MaxFuelLevel","_DoMinFirst","_SidesToDo","_ThinkTime","_VehicleToSupply",
         "_WpCondition","_WpStatements","_WpLocation"];

_Group = _this select 0;
_SupplyVehicle = _this select 1;
_Action = _this select 2;
_Radius = _this select 3;
_SupplyCenterLocation = + (_this select 4);
_MinFuelLevel = _this select 5;
_MaxFuelLevel = _this select 6;
_DoMinFirst = _this select 7;
_SidesToDo = + (_this select 8);
_ThinkTime = _this select 9;
_VehicleToSupply = _this select 10;

// Cannot pas objects as literal arguments.
_Group setVariable ["_SupplyVehicle", _SupplyVehicle];
_Group setVariable ["_VehicleToSupply", _VehicleToSupply];

_WpCondition = "true";
_WpStatements = "[(group this), " + (format ["'%1', %2, %3, %4, %5, %6, %7, %8", 
                               _Action, _Radius, _SupplyCenterLocation, 
                               _MinFuelLevel, _MaxFuelLevel, _DoMinFirst, _SidesToDo, _ThinkTime])
                 + "] call F_PerformSupplyFuelToVehicles;";

[_Group, false] call F_DeleteGroupWaypoints;

if ( _Action == "Search" ) then { _WpLocation = position (leader _Group); _TimeOut = 10; };
if ( _Action == "Supply" ) then { _WpLocation = position _VehicleToSupply; _TimeOut = 1; };
if ( _Action == "MoreTransfer" ) then { _WpLocation = position (leader _Group); _TimeOut = 1; };
 
//hintSilent format ["_SupplyVehicle = %1\n_VehicleToSupply = %2\n_SidesToDo = %3\n_Action = %4\n_WpLocation = %5\n_Radius = %6",
//                   _SupplyVehicle, _VehicleToSupply, _SidesToDo, _Action, _WpLocation, _Radius];

[_Group, position (leader _Group), _TimeOut, "true", "", 0] call F_GenerateActionWaypoint;
[_Group, _WpLocation, 0, _WpCondition, _WpStatements, 0] call F_GenerateActionWaypoint;

nil;