// Arma 2 function

private ["_DoDepth","_doallgroups","_side","_GroupsOveride","_icons","_groups","_IconColour",
         "_MyGroup","_NumGroups","_gi","_Group","_grpside","_SideIconY",
         "_units","_nunits","_totalunits","_leader","_subgrps","_csubgrps","_gdi",
         "_subunits","_totalunits","_maxsizesoldiers","_maxsizefireteam","_maxsizesquad","_maxsizeplatoon","_maxsizecompany",
         "_nvs","_maxvt","_ii","_vtc","_GroupIcons","_NumGroupIcons"];
         
_DoDepth = _this select 0;
_doallgroups = _this select 1;
if ((count _this) >= 3) then { _side = _this select 2; } else { _side = side player; };
if ((count _this) >= 4) then { _GroupsOveride = + (_this select 3); } else { _GroupsOveride = []; };         
         
#include "IconDefs.sqf"
         

_icons = [];
_groups = [];

if( _doallgroups ) then {

	_groups = allGroups;
} else {
	if ( (count _GroupsOveride) >= 1 ) then {
	
		_groups = _GroupsOveride;
	} else {
		_groups = hcAllGroups player;
		_MyGroup = group player;
		if ( ((count _groups) >= 1) && !(_MyGroup in _groups) ) then {
			_groups = _groups + [_MyGroup];
			_groups = _groups call F_GroupsAndSubGroupsHC;
		};
	};
};

_NumGroups = count _groups;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	_Group = _groups select _gi;
	_grpside = side _Group;
	_SideIconY = 0.2;

	if ( _grpside == _side ) then {

		clearGroupIcons _Group;
		_units = units _Group;
		_nunits = count (_units);
		_totalunits = _nunits;
 
		if(_DoDepth) then {
			_leader = leader _Group;
			_subgrps = [_leader , 144] call F_HCgroups;
			_csubgrps = count _subgrps;
			_gdi = 0;
			while {_gdi < _csubgrps} do {
				_subunits = units (_subgrps select _gdi); 
				_totalunits = _totalunits + (count (_subunits));
				_gdi = _gdi + 1;
			};
		};

		_maxsizesoldiers = 2;
		_maxsizefireteam = 6;
		_maxsizesquad = 17;
		_maxsizeplatoon = 59;
		_maxsizecompany = 270;
		_maxsizebattalion = 1000;
		_MaxSizeRegiment = 2000;
		_maxsizebrigade = 5500;

		_icons = _greenicons;
		_IconColour = _UnknownIconColour;

		if (_grpside == West) then {
			_SideIconY = 0.0;
			_icons = _blueicons;
			_IconColour = _BlueIconColour;
		} else {

			if (_grpside == East) then {
				_SideIconY = 0.2;
				_icons = _redicons;
				_IconColour = _RedIconColour;
			} else {
				_SideIconY = 0.1;
				_icons = _greenicons;
				if (_grpside == resistance ) then {
					_IconColour = _GreenIconColour;
				}
			};
		};

		//hintSilent format ["_SideIconY = %1; _grpside = %2", _SideIconY, _grpside];

		_vs = [_Group] call F_GetGroupsVehiclesCrewing;
		_nvs = count _vs;

		_GroupIcons = [_cInf];
		_NumSupport = 0;
		_maxvt = 0;
		
		if (_nvs >= 1) then {  

			_vtc = ("Car" countType _vs);
				if ( _vtc > 0 ) then {
				_GroupIcons = [_cMotInf];
			};

			_vtc = "Tank" countType _vs;
			if ( _vtc > 0 ) then {
				_GroupIcons = [_cTank];
			};
			
			_vtc = [_TrackedAPCs, _vs] call F_CountObjectsOfTypes;
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cMechInf];
				_maxvt = _vtc;
			};

			_vtc = [_Transports, _vs] call F_CountObjectsOfTypes;
			if ( (_vtc > 0) && (_vtc >= _maxvt) && _nunits == _vtc ) then {
				_GroupIcons = [_cTransport];
				_maxvt = _vtc;
			};
			
			_vtc = ("Wheeled_APC" countType _vs);
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cWhArmInf];
				_maxvt = _vtc;
			};

			_vtc = [_StaticArtTypes, _vs] call F_CountObjectsOfTypes;
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cArt];
				_maxvt = _vtc;
			};
			
			if _EmjwMarkers then {
			    // Extended Static Weapons
			    
				_vtc = ("StaticAAWeapon" countType _vs);
				if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
					_GroupIcons = [_cAAMissile];
					_maxvt = _vtc;
				};
				
				_vtc = [_AAGunType, _vs] call F_CountObjectsOfTypes;
				if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
					_GroupIcons = [_cAACannon];
					_maxvt = _vtc;
				};
				
				_vtc = ("StaticGrenadeLauncher" countType _vs);
				if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
					_GroupIcons = [_cGrenadeLauncher];
					_maxvt = _vtc;
				};
				
				_vtc = ("StaticMGWeapon" countType _vs);
				if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
					_GroupIcons = [_cMachineGun];
					_maxvt = _vtc;
				};	

				_vtc = ("MAZ_543_SCUD_Base_EP1" countType _vs);
				if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
					_GroupIcons = [_cMissile,_cMotorRecon];
					_maxvt = _vtc;
				};
			};
			
			_vtc = [_SPArtTypes, _vs] call F_CountObjectsOfTypes;
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cSPArt];
				_maxvt = _vtc;
			};
			
			_vtc = [_RocketArtTypes, _vs] call F_CountObjectsOfTypes;
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cRocketArt];
				_maxvt = _vtc;
			};
			
			_vtc = "Helicopter" countType _vs;
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cHeli];
				_maxvt = _vtc;
			};

			_vtc = "Plane" countType _vs;
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cPlane];
				_maxvt = _vtc;
			};
			
			//UAZ_AGS30_Base UAZ_MG_Base UAZ_SPG9_Base HMMWV_Armored HMMWV_M2 HMMWV_MK19 HMMWV_TOW
			 
			_vtc = [_MechReconTypes, _vs] call F_CountObjectsOfTypes;
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
			
			    if ( (("BTR60_TK_EP1" countType _vs) * 2) < _vtc ) then {
					_GroupIcons = [_cMechRecon];
					_maxvt = _vtc;
				};
			};
			
			_vtc = ("ZSU_Base" countType _vs);
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cSPAA];
				_maxvt = _vtc;
			};

			_vtc = ("2S6M_Tunguska" countType _vs) + ("M6_EP1" countType _vs);
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cSPAA,_cAAMissile];
				_maxvt = _vtc;
			};
			
			//hintSilent format ["HMMWV_Avenger = %1", inheritsFrom (configFile >> "CfgVehicles" >> "HMMWV_Avenger")];
			
			_vtc = ("HMMWV_Avenger" countType _vs);
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cAAMissile,_cMotorRecon];   //,_cMotInf
				_maxvt = _vtc;
			};
			
			_vtc = [_cATRocketMotorRecon, _vs] call F_CountObjectsOfTypes;
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cATRocket,_cMotorRecon]; 
				_maxvt = _vtc;
			};
			
			_vtc = ("Ural_ZU23_Base" countType _vs);
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cMotorAA];
				_maxvt = _vtc;
			};
			
			_vtc = ("M1129_MC_EP1" countType _vs);
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cMechRecon,_cMortar];
				_maxvt = _vtc;
			};
			
			_vtc = ("M1135_ATGMV_EP1" countType _vs);
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cMechRecon,_cATRocket];
				_maxvt = _vtc;
			};

			_vtc = ("M1128_MGS_EP1" countType _vs);
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cMechRecon,_cATCannon];
				_maxvt = _vtc;
			};
					
			_vtc = [_StaticMortarTypes, _vs] call F_CountObjectsOfTypes;
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cMortar];
				_maxvt = _vtc;
			};

			_vtc = "UAV" countType _vs;
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cUAV];
				_maxvt = _vtc;
			};
			
			_vtc = [_AmbulanceTypes, _vs] call F_CountObjectsOfTypes;
			_NumAmbulances = _vtc;
			_NumSupport = _NumSupport + _vtc;
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cMed];
				_maxvt = _vtc;
			};
			
			_vtc = [_RepairTypes, _vs] call F_CountObjectsOfTypes;
			_NumRepair = _vtc;
			_NumSupport = _NumSupport + _vtc;
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cMaint];
				_maxvt = _vtc;
			};

			_vtc = [_RefuelTypes, _vs] call F_CountObjectsOfTypes;
			_NumRefuel = _vtc;
			_NumSupport = _NumSupport + _vtc;
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cFuel];
				_maxvt = _vtc;
			};
			
			_vtc = [_ReammoTypes, _vs] call F_CountObjectsOfTypes;
			_NumReammo = _vtc;
			_NumSupport = _NumSupport + _vtc;
			if ( (_vtc > 0) && (_vtc >= _maxvt) ) then {
				_GroupIcons = [_cAmmo];
				_maxvt = _vtc;
			};
			
			if ( ((_NumSupport * 2) > _vtc) 
			       and (_NumSupport > _NumAmbulances) 
			       and (_NumSupport > _NumRepair) 
			       and (_NumSupport > _NumRefuel) 
			       and (_NumSupport > _NumReammo) ) then {
			       
				_GroupIcons = [_cSupport];
				_maxvt = _vtc;
			};
		}; 

		if ( _totalunits == 0 ) then {
			_IconColour = _NoUnitsIconColour;
		};
		
        _NumGroupIcons = count _GroupIcons;

		for [{ _ii = 0 }, { _ii < _NumGroupIcons }, { _ii = _ii + 1 }] do {

			_icon = _icons select (_GroupIcons select _ii);
			_Group addGroupIcon [_icon,[0,0]];
			[_Group,_IconColour] call F_InitGroupIconAppearance;
		};

		if ((0 < _totalunits) && (_totalunits <= _maxsizesoldiers)) then {
			_Group addGroupIcon ["group_0",[0,_SideIconY]];
		};
		if ((_maxsizesoldiers < _totalunits) && (_totalunits <= _maxsizefireteam)) then {
			_Group addGroupIcon ["group_1",[0,_SideIconY]];
		};
		if ((_maxsizefireteam < _totalunits) && (_totalunits <= _maxsizesquad)) then {
			_Group addGroupIcon ["group_2",[0,_SideIconY]];
		};
		if ((_maxsizesquad < _totalunits) && (_totalunits <= _maxsizeplatoon)) then {
			_Group addGroupIcon ["group_3",[0,_SideIconY]];
		};
		if ((_maxsizeplatoon < _totalunits) && (_totalunits <= _maxsizecompany)) then {
			_Group addGroupIcon ["group_4",[0,_SideIconY]];
		};
		if ((_maxsizecompany < _totalunits) && (_totalunits <= _maxsizebattalion)) then {
			_Group addGroupIcon ["group_5",[0,_SideIconY]];
		};
		if ((_maxsizebattalion < _totalunits) && (_totalunits <= _MaxSizeRegiment)) then {
			_Group addGroupIcon ["group_6",[0,_SideIconY]];
		};
		if ((_MaxSizeRegiment < _totalunits) && (_totalunits <= _maxsizebrigade)) then {
			_Group addGroupIcon ["group_7",[0,_SideIconY]];
		};


		if ((count (hcAllGroups (leader _Group))) >= 1) then {
			_icon = _icons select _cHQ;
			_Group addGroupIcon [_icon,[0,0]];
			[_Group,_IconColour] call F_InitGroupIconAppearance;
		};
	};
};

//StaticWeapon
//StaticCannon
//Car
//Wheeled_APC
//Tank
//Tracked_APC
//Helicopter
//Plane
//Ship 
//CAManBase

nil;