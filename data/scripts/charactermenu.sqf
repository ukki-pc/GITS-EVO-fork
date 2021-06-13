
/*
_camera = "camera" camCreate getPosASL Backpacks;
_camera camPrepareTarget player;
_camera cameraEffect ["internal", "Front"];
 
// _camera camPreparePos (player getRelPos [5, 0]);
// _camera camCommitPrepared 1; 
*/
/*
_ogObj = player;
_playerObjectName = format ["engw%1",owner player];
systemChat str _playerObjectName;
_grp = createGroup EGG_EVO_PLAYERFACTION;
_playerObjectName = "US_Soldier_Pilot_EP1" createUnit [position player,_grp];
sleep 0.2;
selectPlayer (leader _grp); {_x doFollow leader _grp}foreach units _grp; selectPlayer player;
deleteVehicle _ogObj;
*/

//create new unit with correct name for evo
_model = _this select 0;
_unit = player;
_plyName = name player;
_oldGroup = group player;
_grpUnits = units _oldGroup;
_grpUnits = _grpUnits - [player];
_isLeader = (leader _oldGroup == _unit);
_group = grpNull;
_nname = format ["engw%1",(owner player)+1];
_nunit = objNull;


_group = createGroup EGG_EVO_PLAYERFACTION;
_nunit = _group createUnit [_model,position player,[],0,"NONE"];



//switch into new unit
addSwitchableUnit _nunit;
setPlayable _nunit;
selectPlayer _nunit;

_nunit setVehicleInit format ["%1 = this; this setVehicleVarName ""%1""",_nname];
processInitCommands;

//delete old unit
sleep 0.1;
removeSwitchableUnit _unit;
deleteVehicle _unit;

if(_isLeader) then {
units _oldGroup join _group;
}
else
{
_nunit join _oldGroup;
};

//move unit back to spawn location and initialise them
_nunit = _this select 0;

//markme = [_nunit] execVM "data\scripts\update.sqf";
sleep 0.1;
plays = [_nunit] execVM "data\scripts\update.sqf";
plays = [_nunit] execVM "data\scripts\spawn.sqf";
sleep 0.1;
