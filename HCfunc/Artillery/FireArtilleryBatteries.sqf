// Arma 2 function

private ["_Groups","_WorldLocation","_AimPositionASL","_Dispersion","_RoundType","_NumRounds",
         "_EachGunFireDelaySec","_NumGroups","_gi","_Group","_GroupArtilleryModule",
         "_LogicCenter","_ModuleGroup","_Unit","_Gun"];

_Groups = _this select 0;
_WorldLocation = + (_this select 1);

_AimPositionASL = + _WorldLocation;
_AimPositionASL set [2, getTerrainHeightASL _WorldLocation];

_Dispersion = 1000;
_RoundType = "HE";
_EachGunFireDelaySec = 0;
_NumRounds = 20;

_NumGroups = count _Groups;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {
	
	_Group = _Groups select _gi;
	
	if ( _Group call F_GroupIsBattery ) then {
		
		//_GroupArtilleryModule = _Group call F_GetGroupArtillaryModule;
		
		_GroupArtilleryModule = [_Group, "BIS_ARTY_Logic"] call F_GetGroupSynchronizedObject;
		//_GroupArtilleryModule = (synchronizedObjects (leader _Group)) select 0;
		
		hintSilent format ["_GroupArtilleryModule = %1\nisNull _GroupArtilleryModule = %2\nsync leader = %3",
		                   _GroupArtilleryModule, isNull _GroupArtilleryModule, synchronizedObjects (leader _Group)];
		
		if ( isNull _GroupArtilleryModule ) then {
			
			_Unit = leader _Group;
			_Gun = vehicle _Unit;
			
			//[_Gun] call BIS_ARTY_F_initVehicle;
			
			_LogicCenter = createCenter sideLogic;
			_ModuleGroup = createGroup _LogicCenter;
			_GroupArtilleryModule = _ModuleGroup createUnit ["BIS_ARTY_Logic", getpos _Unit, [], 0, "NONE"];
			
			hintSilent "Wait Start";
			//waitUntil { (_GroupArtilleryModule getVariable "BIS_ARTY_LOADED") == true };
			hintSilent "Wait End";
			
			_GroupArtilleryModule synchronizeObjectsAdd [_Gun];
			//_Unit synchronizeObjectsAdd [_GroupArtilleryModule];
			//_Gun synchronizeObjectsAdd [_GroupArtilleryModule];
			
			[_Gun] call BIS_ARTY_F_initVehicle;
						
			hintSilent format ["_GroupArtilleryModule2 = %1\nisNull _GroupArtilleryModule = %2\ntypeOf = %3\n_Unit = %4\nsync = %5\nsync = %6\n_Gun = %7",
		                       _GroupArtilleryModule, isNull _GroupArtilleryModule, typeOf _GroupArtilleryModule, _Unit, 
		                       synchronizedObjects _Gun, synchronizedObjects _Unit, _Gun];
			
			
			
			/*
			private ["_LogicCenter", "_moduleGroup", "_ARTYMODULE","_veh"];
			_veh = vehicle (leader _Group);
			// create Module
			_LogicCenter = createCenter sideLogic;
			_moduleGroup = createGroup _LogicCenter;
			_ARTYMODULE = _moduleGroup createUnit  ["BIS_ARTY_Logic", [0,0,0], [], 0, "NONE"]; 
			_ARTYMODULE synchronizeObjectsAdd [_veh];

			hintSilent format ["_ARTYMODULE = %1\nisNull _ARTYMODULE = %2\ntypeOf = %3\n_veh = %4\nsync = %5",
							   _ARTYMODULE, isNull _ARTYMODULE, typeOf _ARTYMODULE, _veh, synchronizedObjects _veh];
			*/
		};
		
		//_GroupArtilleryModule = [_Group, "BIS_ARTY_Logic"] call F_GetGroupSynchronizedObject;

		//hintSilent format ["_ArtilleryModule2 = %1\nisNull _GroupArtilleryModule = %2\ntypeOf = %3",
		//                   _GroupArtilleryModule, isNull _GroupArtilleryModule, typeOf _GroupArtilleryModule];

		if ( ! (isNull _GroupArtilleryModule) ) then {
		
			[_GroupArtilleryModule, _Dispersion, _AimPositionASL,
			 _RoundType, _EachGunFireDelaySec, _NumRounds] call F_FireGroupArtillery;
		};
	};
};

nil;
