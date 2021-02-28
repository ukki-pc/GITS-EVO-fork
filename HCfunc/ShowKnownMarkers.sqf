// Arma 2 function

private ["_Known","_KnownTargets","_TargetsKnownValues","_NumKnown","_EnemyMarkers","_ki",
         "_KnownTarget","_KnownValue","_WorldCoord","_Side","_Icons","_IconColour",
         "_UnitIcons","_NumIcons","_ui","_TargetUnit","_TargetType","_ii",
         "_mi","_NewMarkerData","_UnitMarkerName","_str"];

_Known = + _this;

#include "IconDefs.sqf"


_KnownTargets = _Known select 0;
_TargetsKnownValues = _Known select 1;

_NumKnown = count _KnownTargets;

call F_ClearHCShownEnemyIcons;

_EnemyMarkers = [];
_ii = 0;
_mi = 0;

for [{ _ki = 0 }, { _ki < _NumKnown }, { _ki = _ki + 1 }] do {

	_KnownTarget = _KnownTargets select _ki;
	_KnownValue = _TargetsKnownValues select _ki;
	_WorldCoord = [(_KnownTarget select 0) select 0, (_KnownTarget select 0) select 1];
		
	if ( (_mi < 1000) and ((_KnownTarget select 4) call F_IsObjectTypeToShow) ) then {

		_Side = _KnownTarget select 2;
		_Icons = _greenicons;
		_IconColour = "ColorOrange";
			
		if ( _KnownValue >= 1.5 ) then {
			if (_Side == West) then {
				_Icons = _blueicons;
				_IconColour = "ColorBlue";
			} else {
				if (_Side == East) then {
					_Icons = _redicons;
					_IconColour = "ColorRed";
				} else {
					if (_Side == resistance ) then {
						_Icons = _greenicons;
						_IconColour = "ColorGreen";
					} else {
						if (_Side == civilian) then {
							_Icons = _greenicons;
							_IconColour = "ColorYellow";
						};
					};
				};
			};
		};
		
		_UnitIcons = [_cEmpty];
		_NumIcons = count _UnitIcons;
			
		for [{ _ui = 0 }, { _ui < _NumIcons }, { _ui = _ui + 1 }] do {
	 
 			if ( _KnownValue >= 0.3 ) then {
				
				_TargetUnit = [_KnownTarget select 4];
				_TargetType = typeOf (_KnownTarget select 4);

				if ( ("Man" countType _TargetUnit) >= 1 ) then {
					_UnitIcons = [_cInf];
				};
				
				if ( ("Tank" countType _TargetUnit) >= 1 ) then {
					_UnitIcons = [_cTank];
					
					if ( _KnownValue >= 1.5 ) then {
					
						if ( ([_TrackedAPCs, _TargetUnit] call F_CountObjectsOfTypes) >= 1 ) then {
							_UnitIcons = [_cMechInf];
						};
						if ( ("ZSU_Base" countType _TargetUnit) >= 1 ) then {
							_UnitIcons = [_cSPAA];
						};
						if ( ("2S6M_Tunguska" countType _TargetUnit) >= 1 ) then {
							_UnitIcons = [_cSPAA,_cAAMissile];
						};
					};
				};

				if ( ("Car" countType _TargetUnit) >= 1 ) then {
					_UnitIcons = [_cMotInf];
					
					if ( _KnownValue >= 1.5 ) then {
					
						if ( ("Wheeled_APC" countType _TargetUnit) >= 1 ) then {
							_UnitIcons = [_cWhArmInf];
						};
						if ( ([_Transports, _TargetUnit] call F_CountObjectsOfTypes) >= 1 ) then {
							_UnitIcons = [_cTransport];
						};
						if ( ([_MechReconTypes, _TargetUnit] call F_CountObjectsOfTypes) >= 1 ) then {
							if ( ("BTR60_TK_EP1" countType _TargetUnit) == 0 ) then {
								_UnitIcons = [_cMechRecon];
							};
						};
						if ( ("HMMWV_Avenger" countType _TargetUnit) >= 1 ) then {
							_UnitIcons = [_cAAMissile,_cMotorRecon];
						};
						if ( ("MAZ_543_SCUD_Base_EP1" countType _TargetUnit) >= 1 ) then {
							_UnitIcons = [_cMissile,_cMotorRecon];
						};
						if ( ([_cATRocketMotorRecon, _TargetUnit] call F_CountObjectsOfTypes) >= 1 ) then {
							_UnitIcons = [_cATRocket,_cMotorRecon];
						};
						if ( ("M1129_MC_EP1" countType _TargetUnit) >= 1 ) then {
							_UnitIcons = [_cMechRecon,_cMortar];
						};
						if ( ("M1135_ATGMV_EP1" countType _TargetUnit) >= 1 ) then {
							_UnitIcons = [_cMechRecon,_cATRocket];
						};
						if ( ("M1128_MGS_EP1" countType _TargetUnit) >= 1 ) then {
							_UnitIcons = [_cMechRecon,_cATCannon];
						};
					};				
				};

				if ( ("Helicopter" countType _TargetUnit) >= 1 ) then {
					_UnitIcons = [_cHeli];
				};
				if ( ("Plane" countType _TargetUnit) >= 1 ) then {
					_UnitIcons = [_cPlane];
				};
				
				if ( (getNumber (configFile >> "CfgVehicles" >> _TargetType >> "hasdriver")) == 0 ) then {
					
					_UnitIcons = [_cInf];
					if ( _KnownValue >= 1.5 ) then {
					
						if ( ([_StaticMortarTypes, _TargetUnit] call F_CountObjectsOfTypes) >= 1 ) then {
							_UnitIcons = [_cMortar];
						};
						if ( ("_StaticArtTypes" countType _TargetUnit) >= 1 ) then {
							_UnitIcons = [_cArt];
						};
						if ( ("StaticAAWeapon" countType _TargetUnit) >= 1 ) then {
							_UnitIcons = [_cAAMissile];
						};
						if ( ([_AAGunType, _TargetUnit] call F_CountObjectsOfTypes) >= 1 ) then {
							_UnitIcons = [_cAACannon];
						};
						if ( ("StaticGrenadeLauncher" countType _TargetUnit) >= 1 ) then {
							_UnitIcons = [_cGrenadeLauncher];
						};
						if ( ("StaticMGWeapon" countType _TargetUnit) >= 1 ) then {
							_UnitIcons = [_cMachineGun];
						};
					};				
				};
				
				if ( _KnownValue >= 1.5 ) then {
				
					if ( ([_SPArtTypes, _TargetUnit] call F_CountObjectsOfTypes) >= 1 ) then {
						_UnitIcons = [_cSPArt];
					};
					if ( ([_RocketArtTypes, _TargetUnit] call F_CountObjectsOfTypes) >= 1 ) then {
						_UnitIcons = [_cRocketArt];
					};
					if ( ("UAV" countType _TargetUnit) >= 1 ) then {
						_UnitIcons = [_cUAV];
					};
					if ( ([_AmbulanceTypes, _TargetUnit] call F_CountObjectsOfTypes) >= 1 ) then {
						_UnitIcons = [_cMed];
					};
					if ( ([_RepairTypes, _TargetUnit] call F_CountObjectsOfTypes) >= 1 ) then {
						_UnitIcons = [_cMaint];
					};
					if ( ([_RefuelTypes, _TargetUnit] call F_CountObjectsOfTypes) >= 1 ) then {
						_UnitIcons = [_cFuel];
					};
					if ( ([_ReammoTypes, _TargetUnit] call F_CountObjectsOfTypes) >= 1 ) then {
						_UnitIcons = [_cAmmo];
					};
				};				
			};
					
			_UnitMarkerName = format ["HCExtEnemyMarker%1", _mi];
					
			//_UnitMarkerName setMarkerShapeLocal "ICON";
			_UnitMarkerName setMarkerPosLocal _WorldCoord;
			_UnitMarkerName setMarkerColorLocal _IconColour;
			_UnitMarkerName setMarkerTypeLocal (_Icons select (_UnitIcons select _ui));
			_UnitMarkerName setMarkerAlphaLocal 1;
							   
			_mi = _mi + 1;
			_ii = _ii + 1;
		};
	};
};

//hintSilent format ["Markers Created = %1", _mi];

nil;
