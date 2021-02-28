
HighCommand_menu = [
	["High Command",false],
	["Remove Selected Groups from HC",[2],"",-5,[["expression","[hcSelected player, player] spawn V_RemoveGroupsFromHC"]],"1","1"],
	["Make Selected Units New HG",[3],"",-5,[["expression","(groupSelectedUnits player) spawn V_MakeSelectedUnitsNewHG"]],"1","1"],
	["Add Selected Groups Units to HG",[4],"",-5,[["expression","(hcSelected player) spawn V_AddSelectedGroupsUnitsToHG"]],"1","1"],
	["Command all Uncommanded of Side",[5],"",-5,[["expression","[true] spawn V_CommandAllOfSide"]],"1","1"],
	["Command all Uncommanded of Faction",[6],"",-5,[["expression","[false] spawn V_CommandAllOfSide"]],"1","1"],
	["Merge Selected HC-groups",[7],"",-5,[["expression","(hcSelected player) spawn V_MergeHG"]],"1","1"],
	["Split selected HC-groups in half",[8],"",-5,[["expression","[hcSelected player, player] spawn V_SplitHG"]],"1","1"],
	["Clear All Side HC",[9],"",-5,[["expression","[] spawn V_ClearAllSideHC"]],"1","1"],
	["Make Group HC and Switch to",[10],"",-5,[["expression","[hcSelected player, player] spawn V_MakeGroupHCAndSwitchTo"]],"1","1"],
	["Reallocate HC groups on bar",[11],"",-5,[["expression","[] spawn V_ReallocateHCgroups"]],"1","1"]
	];

TeamSwitch_menu = [
	["Team Switching",false],
	["Reset Side Team Switchable Moveable",[2],"",-5,[["expression","[] spawn V_ResetTeamSwitch"]],"1","1"],
	["Only Group Leaders Team Switchable",[3],"",-5,[["expression","[] spawn V_OnlyLeadersTeamSwitchable"]],"1","1"],
	["Make all Units Team Switchable",[4],"",-5,[["expression","[] spawn V_MakeUnitsTeamSwitchable"]],"1","1"],
	["Only High Commanders Team Switchable",[5],"",-5,[["expression","[] spawn V_OnlyHCteamSwitchable"]],"1","1"],
	["Switch to selected HC group Leader",[6],"",-5,[["expression","(hcSelected player) spawn V_SwitchToHCgroupLeader"]],"1","1"],
	["Switch to Selected Unit",[7],"",-5,[["expression","(groupSelectedUnits player) spawn V_SwitchToSelectUnit"]],"1","1"],
	["Switch to Squad Leader",[8],"",-5,[["expression","[] spawn V_SwitchToSquadLeader"]],"1","1"],
	["Switch to Units High Commander",[9],"",-5,[["expression","[] spawn V_SwitchToUnitHC"]],"1","1"],
	["Switch to Next Faction On Side",[10],"",-5,[["expression","[true] spawn V_SwitchToNextFaction"]],"1","1"]
	];


Squad_menu = [
	["Squad",false],
	["Make Player Group Leader",[2],"",-5,[["expression","[] spawn V_MakePlayerGroupLeader"]],"1","1"],
	["Selected -> Group Leader and Switch to",[3],"",-5,[["expression","(groupSelectedUnits player) spawn V_MakeSelectedUnitGroupLeaderAndSwitch"]],"1","1"],
	["Selected -> New Group",[4],"",-5,[["expression","(groupSelectedUnits player) spawn V_MakeSelectedUnitsNewGroup"]],"1","1"],
	["Selected -> New Group and Lead",[5],"",-5,[["expression","(groupSelectedUnits player) spawn V_MakeSelectedUnitsNewGroupLead"]],"1","1"],
	["Selected -> New Group, Switch to Leader",[6],"",-5,[["expression","(groupSelectedUnits player) spawn V_MakeSelectedUnitsNewGroupAndSwitchTo"]],"1","1"],
	["Reallocate units in Group",[7],"",-5,[["expression","[] spawn V_PlayerGroupReallocateExceptLeader"]],"1","1"],
	["Unassign all Squad to Vehicles",[8],"",-5,[["expression","[] spawn V_UnassignAllGroupFromVehicles"]],"1","1"],
	["Unassign Selected to Vehicles",[9],"",-5,[["expression","[groupSelectedUnits player] spawn V_UnassignSelectedUnitsFromVehicles"]],"1","1"],
	["Squad Units Stats",[10],"",-5,[["expression","(group player) spawn V_SquadUnitsStats"]],"1","1"]
	];

Medical_menu = [
	["Medical",false],
	["Return cannot Walk to HC Squad",[2],"",-5,[["expression","[hcSelected player, player, 100.0, true] spawn V_ReturnDamagedToHG"]],"1","1"],
	["Return Damage >= 0.2 to HC Squad",[3],"",-5,[["expression","[hcSelected player, player, 0.2, false] spawn V_ReturnDamagedToHG"]],"1","1"],
	["Return cannot Walk and Damage >= 0.2 to HC Squad",[4],"",-5,[["expression","[hcSelected player, player, 0.2, true] spawn V_ReturnDamagedToHG"]],"1","1"],
	["Switch to Damaged >= 0.1",[5],"",-5,[["expression","[0.1] spawn V_SwitchToOneDamagedUnit"]],"1","1"],
	["Get Player Damage",[6],"",-5,[["expression","[] spawn V_GetPlayerDamaged"]],"1","1"],
	["Return Selected not in Vehicles to HG",[7],"",-5,[["expression","[hcSelected player, player] spawn V_ReturnNotInVehiclesToHG"]],"1","1"]
	];

SwitchSide_menu = [
	["Switch to Side",false],
	["Switch to West",[2],"",-5,[["expression","[West] spawn V_SwitchToSide"]],"1","1"],
	["Switch to East",[3],"",-5,[["expression","[East] spawn V_SwitchToSide"]],"1","1"],
	["Switch to Civilian",[4],"",-5,[["expression","[Civilian] spawn V_SwitchToSide"]],"1","1"],
	["Switch to Resistance",[5],"",-5,[["expression","[Resistance] spawn V_SwitchToSide"]],"1","1"],
	["Switch to Friendly",[6],"",-5,[["expression","[Friendly] spawn V_SwitchToSide"]],"0","0"],
	["Switch to Enemy",[7],"",-5,[["expression","[Enemy] spawn V_SwitchToSide"]],"0","0"],
	["Switch to Unknown",[8],"",-5,[["expression","[Unknown] spawn V_SwitchToSide"]],"0","0"],
	["Switch to sideLogic",[9],"",-5,[["expression","[sideLogic] spawn V_SwitchToSide"]],"1","1"],
	["Show HC Bar",[10],"",-5,[["expression","hcShowBar true"]],"0","0"],
	["Hide HC Bar",[11],"",-5,[["expression","hcShowBar false"]],"0","0"]
	];
		
			
EngagementMode_Menu = [
	["Set Groups Engagement Mode",false],
	["Open Fire/Engage at will (RED)",[2],"",-5,[["expression","['OPENFIRE_ENGAGE', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Open Fire (YELLOW)",[3],"",-5,[["expression","['OPENFIRE', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Hold Fire/Engage at will (WHITE)",[4],"",-5,[["expression","['HOLDFIRE_ENGAGE', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Only Defensive Fire (GREEN)",[5],"",-5,[["expression","['ONLY_DEFEND', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Never Fire (BLUE)",[6],"",-5,[["expression","['HOLDFIRE', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Enable Attack",[7],"",-5,[["expression","[(hcSelected player),true] spawn F_SetEnableGroupsAttack"]],"1","1"],
	["Disable Attack",[8],"",-5,[["expression","[(hcSelected player),false] spawn F_SetEnableGroupsAttack"]],"1","1"]
	];
	
Speed_Menu = [
	["Set Groups Speed",false],
	["Limited",[2],"",-5,[["expression","['SPEED_LIMITED', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Normal",[3],"",-5,[["expression","['SPEED_NORMAL', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Full",[4],"",-5,[["expression","['SPEED_FULL', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"]
	];

CombatMode_Menu = [
	["Set Groups CombatMode",false],
	["Stealth",[2],"",-5,[["expression","['COMBAT_STEALTH', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Danger",[3],"",-5,[["expression","['COMBAT_DANGER', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Aware",[4],"",-5,[["expression","['COMBAT_AWARE', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Safe",[4],"",-5,[["expression","['COMBAT_SAFE', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Careless",[5],"",-5,[["expression","['COMBAT_CARELESS', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"]
	];

Formation_Menu = [
	["Set Groups Formation",false],
	["Column",[2],"",-5,[["expression","['COLUMN', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Staggered Column",[3],"",-5,[["expression","['STAG COLUMN', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Wedge",[4],"",-5,[["expression","['WEDGE', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Echelon Left",[5],"",-5,[["expression","['ECH LEFT', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Echelon Right",[6],"",-5,[["expression","['ECH RIGHT', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Vee",[7],"",-5,[["expression","['VEE', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Line",[8],"",-5,[["expression","['LINE', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Column (compact)",[9],"",-5,[["expression","['FILE', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"],
	["Delta",[10],"",-5,[["expression","['DIAMOND', (hcSelected player)] spawn F_StandardMenuHandler"]],"1","1"]
	];

GroupsStates_menu = [ 
	["Groups States",false],
	["Set Engagement Mode",[2],"#USER:EngagementMode_Menu",-5,[["expression",""]],"1","1"],
	["Set Speed",[3],"#USER:Speed_Menu",-5,[["expression",""]],"1","1"],
	["Set Combat Mode",[4],"#USER:CombatMode_Menu",-5,[["expression",""]],"1","1"],
	["Set Formation",[5],"#USER:Formation_Menu",-5,[["expression",""]],"1","1"],
	["Get Selected Groups Stances",[6],"",-5,[["expression","[hcSelected player, true] spawn F_GetGroupsStances"]],"1","1"]
	];	

	
HighCommand2_menu = [
	["High Command 2",false],
	["Make Selected Groups New Sub Command",[2],"",-5,[["expression","[hcSelected player, player] spawn V_MakeSelectedGroupsNewSubCommand"]],"1","1"],
	["Groups to senior HC Commander",[3],"",-5,[["expression","[hcSelected player, player] spawn V_GroupsToSeniorHG"]],"1","1"],
	["Flatten Selected HC Groups",[4],"",-5,[["expression","[hcSelected player, player] spawn V_FlattenSelectedHCGroups"]],"1","1"],
	["Reallocate units in Groups",[5],"",-5,[["expression","[] spawn V_ReallocateAllGroupsExceptLeader"]],"1","1"],
	["Refresh Player HC Icons Sub",[6],"",-5,[["expression","[true,false] spawn V_ChangeHCbarIcons"]],"1","1"],
	["Refresh Player HC Icons",[7],"",-5,[["expression","[false,false] spawn V_ChangeHCbarIcons"]],"1","1"],
	["Refresh all Side HC Icons Sub",[8],"",-5,[["expression","[true,true] spawn V_ChangeHCbarIcons"]],"1","1"],
	["Refresh all Side HC Icons",[9],"",-5,[["expression","[false,true] spawn V_ChangeHCbarIcons"]],"1","1"],
	["Invert HC Bar Selection",[10],"",-5,[["expression","(hcSelected player) spawn V_InvertHCSelection"]],"1","1"],
	["Group States",[11],"#USER:GroupsStates_menu",-5,[["expression",""]],"1","1"]
	];
	
	
Waypoints_menu = [
	["Waypoints",false],
	["Add Waypoint Selected Driver Groups",[2],"",-5,[["expression","[(hcSelected player),'GroupDrivesAllItsVehicles'] spawn F_AddNewWaypointsToSubsetSelected"]],"1","1"],
	["Delete All Last Waypoints",[3],"",-5,[["expression","(hcAllGroups player) spawn F_DeleteGroupsLastWaypoints"]],"1","1"],
	["Delete Selected Groups Last Waypoints",[4],"",-5,[["expression","(hcSelected player) spawn F_DeleteGroupsLastWaypoints"]],"1","1"],
	["Delete Selected Groups Waypoints & Halt",[5],"",-5,[["expression","[hcSelected player, true] spawn F_DeleteGroupsWaypoints"]],"1","1"],
	["Delete Selected Groups Waypoints",[6],"",-5,[["expression","[hcSelected player, false] spawn F_DeleteGroupsWaypoints"]],"1","1"],
	["Add Halt Waypoints to Selected Groups",[7],"",-5,[["expression","(hcSelected player) spawn F_InsertGroupsNeverTimeoutWaypoint"]],"1","1"],
	["Remove Groups First Halt Waypoints",[8],"",-5,[["expression","(hcSelected player) spawn F_RemoveGroupsNeverTimeoutWaypoint"]],"1","1"],
	["Groups Waypoint Stats",[9],"",-5,[["expression","(hcSelected player) spawn F_GroupsWayPointStats"]],"1","1"]
	];


TransportLand_menu = [
	["Land Helicopters",false],
	["Land Helicopters on Ground",[2],"",-5,[["expression","[(hcSelected player),'LAND'] spawn V_LandHelicopterGroups"]],"1","1"],
	["Land Helicopters to Get In",[3],"",-5,[["expression","[(hcSelected player),'GET IN'] spawn V_LandHelicopterGroups"]],"1","1"],
	["Land Helicopters to Get Out",[4],"",-5,[["expression","[(hcSelected player),'GET OUT'] spawn V_LandHelicopterGroups"]],"1","1"],
	["Cancel Helicopters Landing",[5],"",-5,[["expression","[(hcSelected player),'NONE'] spawn V_LandHelicopterGroups"]],"1","1"],
	["Get Helicopter Altitudes",[6],"",-5,[["expression","[hcSelected player, 'Helicopter'] spawn V_GetAirAltitudes"]],"1","1"]
	];

ReorganiseGroups_menu = [
	["Reorganise Groups",false],
	["Get Out Selected Non Crew Groups",[2],"",-5,[["expression","['NonCrews',(hcSelected player)] spawn V_GetOutGroups"]],"1","1"],
	["Get Out Selected In Cargo Groups",[3],"",-5,[["expression","['InCargo',(hcSelected player)] spawn V_GetOutGroups"]],"1","1"],
	["Split on Foot to New Groups",[4],"",-5,[["expression","['OnFoot',(hcSelected player)] spawn F_SplitNonCrewToNewGroups"]],"1","1"],
	["Split on Non Crew to New Groups",[5],"",-5,[["expression","['NonCrews',(hcSelected player)] spawn F_SplitNonCrewToNewGroups"]],"1","1"],
	["Split per Vehicle Crews",[6],"",-5,[["expression","(hcSelected player) spawn F_SplitPerVehicleCrewsGroups"]],"1","1"],
	["Get Out Selected Crew Groups",[7],"",-5,[["expression","['Crews',(hcSelected player)] spawn V_GetOutGroups"]],"1","1"],
	["Get Out Selected Groups",[8],"",-5,[["expression","['All',(hcSelected player)] spawn V_GetOutGroups"]],"1","1"],
	["Unassign Selected Groups on Foot",[9],"",-5,[["expression","(hcSelected player) spawn F_UnassignVehiclesGroupsOnFoot"]],"1","1"]
	];

GetInNearestAsCargo_menu = [
	["Get in Nearest as Cargo",false],
	["Get in Nearest Wheeled as Cargo",[2],"",-5,[["expression","[['Car'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCargo"]],"1","1"],
	["Get in Nearest Tracked as Cargo",[3],"",-5,[["expression","[['Tank'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCargo"]],"1","1"],
	["Get in Nearest Helicopter as Cargo",[4],"",-5,[["expression","[['Helicopter'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCargo"]],"1","1"],
	["Get in Nearest Plane as Cargo",[5],"",-5,[["expression","[['Plane'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCargo"]],"1","1"],
	["Get in Nearest Ship as Cargo",[6],"",-5,[["expression","[['Ship'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCargo"]],"1","1"],
	["Get in Nearest Motorcycle as Cargo",[7],"",-5,[["expression","[['Motorcycle'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCargo"]],"1","1"],
	["Get in Nearest Land Vehicles as Cargo",[8],"",-5,[["expression","[['Car','Tank','Motorcycle'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCargo"]],"1","1"],
	["Get in Nearest Wheeled/Tracked as Cargo",[9],"",-5,[["expression","[['Car','Tank'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCargo"]],"1","1"]
	];
 
GetInNearestAsCrew_menu = [
	["Get in Nearest as Crew",false],
	["Get in Nearest Wheeled as Crew",[2],"",-5,[["expression","[['Car'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCrew"]],"1","1"],
	["Get in Nearest Tracked as Crew",[3],"",-5,[["expression","[['Tank'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCrew"]],"1","1"],
	["Get in Nearest Helicopter as Crew",[4],"",-5,[["expression","[['Helicopter'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCrew"]],"1","1"],
	["Get in Nearest Plane as Crew",[5],"",-5,[["expression","[['Plane'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCrew"]],"1","1"],
	["Get in Nearest Ship as Crew",[6],"",-5,[["expression","[['Ship'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCrew"]],"1","1"],
	["Get in Nearest Motorcycle as Crew",[7],"",-5,[["expression","[['Motorcycle'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCrew"]],"1","1"],
	["Get in Nearest Land Vehicles as Crew",[8],"",-5,[["expression","[['Car','Tank','Motorcycle'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCrew"]],"1","1"],
	["Get in Nearest Wheeled/Tracked as Crew",[9],"",-5,[["expression","[['Car','Tank'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCrew"]],"1","1"],
	["Get in Nearest Static Weapon as Gunner",[10],"",-5,[["expression","[['LandVehicle'],(hcSelected player)] spawn V_GetinNearestStaticAsCrew"]],"1","1"]
	];
	
	
GetInNearestAsCrewAndCargo_menu = [
	["Get in Nearest as Crew & Cargo",false],
	["Get in Nearest Wheeled",[2],"",-5,[["expression","[['Car'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCrewAndCargo"]],"1","1"],
	["Get in Nearest Tracked",[3],"",-5,[["expression","[['Tank'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCrewAndCargo"]],"1","1"],
	["Get in Nearest Helicopter",[4],"",-5,[["expression","[['Helicopter'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCrewAndCargo"]],"1","1"],
	["Get in Nearest Plane",[5],"",-5,[["expression","[['Plane'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCrewAndCargo"]],"1","1"],
	["Get in Nearest Ship",[6],"",-5,[["expression","[['Ship'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCrewAndCargo"]],"1","1"],
	["Get in Nearest Motorcycle",[7],"",-5,[["expression","[['Motorcycle'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCrewAndCargo"]],"1","1"],
	["Get in Nearest Land Vehicles",[8],"",-5,[["expression","[['Car','Tank','Motorcycle'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCrewAndCargo"]],"1","1"],
	["Get in Nearest Wheeled/Tracked",[9],"",-5,[["expression","[['Car','Tank'],(hcSelected player)] spawn V_GetinNearestVehicleOfTypeAsCrewAndCargo"]],"1","1"]
	];
	

SelectHCSubsets_menu = [
	["Select HC Subsets",false],
	["Select Subset on Foot",[2],"",-5,[["expression","[(hcSelected player),'OnFoot'] spawn V_SelectHCSubset"]],"1","1"],
	["Select Subset all in Vehicles",[3],"",-5,[["expression","[(hcSelected player),'AllInVehicles'] spawn V_SelectHCSubset"]],"1","1"],
	["Select Subset in Cargo",[4],"",-5,[["expression","[(hcSelected player),'InCargo'] spawn V_SelectHCSubset"]],"1","1"],
	["Select Subset mounted Crews",[5],"",-5,[["expression","[(hcSelected player),'Crews'] spawn V_SelectHCSubset"]],"1","1"],
	["Select Subset Flying Air Crews",[6],"",-5,[["expression","[(hcSelected player),'FlyingAirCrews'] spawn V_SelectHCSubset"]],"1","1"],
	["Select Subset with Halt Waypoints",[7],"",-5,[["expression","[(hcSelected player),'WaitingAtHaltWaypoint'] spawn V_SelectHCSubset"]],"1","1"],
	["Select Subset in Combat",[8],"",-5,[["expression","[(hcSelected player),'InCombat'] spawn V_SelectHCSubset"]],"1","1"],
	["Select Subset no set no Attack",[9],"",-5,[["expression","[(hcSelected player),'SetToDoNotAttack'] spawn V_SelectHCSubset"]],"1","1"],
	["Select Subset Drives All Its Vehicles",[10],"",-5,[["expression","[(hcSelected player),'GroupDrivesAllItsVehicles'] spawn V_SelectHCSubset"]],"1","1"]
	];

SplitN_menu = [
	["Split on Foot into groups of N",false],
	["Split on Foot into groups of 1",[2],"",-5,[["expression","[hcSelected player, player, 1, true] spawn V_SplitSelectedHCGroupsToGroupsOfN"]],"1","1"],
	["Split on Foot into groups of 2",[3],"",-5,[["expression","[hcSelected player, player, 2, true] spawn V_SplitSelectedHCGroupsToGroupsOfN"]],"1","1"],
	["Split on Foot into groups of 3",[4],"",-5,[["expression","[hcSelected player, player, 3, true] spawn V_SplitSelectedHCGroupsToGroupsOfN"]],"1","1"],
	["Split on Foot into groups of 4",[5],"",-5,[["expression","[hcSelected player, player, 4, true] spawn V_SplitSelectedHCGroupsToGroupsOfN"]],"1","1"],
	["Split on Foot into groups of 5",[6],"",-5,[["expression","[hcSelected player, player, 5, true] spawn V_SplitSelectedHCGroupsToGroupsOfN"]],"1","1"],
	["Split on Foot into groups of 6",[7],"",-5,[["expression","[hcSelected player, player, 6, true] spawn V_SplitSelectedHCGroupsToGroupsOfN"]],"1","1"],
	["Split on Foot into groups of 7",[7],"",-5,[["expression","[hcSelected player, player, 7, true] spawn V_SplitSelectedHCGroupsToGroupsOfN"]],"1","1"],
	["Split on Foot into groups of 8",[7],"",-5,[["expression","[hcSelected player, player, 8, true] spawn V_SplitSelectedHCGroupsToGroupsOfN"]],"1","1"],
	["Split on Foot into groups of 9",[7],"",-5,[["expression","[hcSelected player, player, 9, true] spawn V_SplitSelectedHCGroupsToGroupsOfN"]],"1","1"],
	["Split on Foot into groups of 10",[7],"",-5,[["expression","[hcSelected player, player, 10, true] spawn V_SplitSelectedHCGroupsToGroupsOfN"]],"1","1"]
	];


SetMyUnitRank_menu = [
	["Set My Unit Rank",false],
	["Set My Unit Rank Private",[2],"",-5,[["expression","['PRIVATE'] spawn V_SetMyRank"]],"1","1"],
	["Set My Unit Rank Corporal",[3],"",-5,[["expression","['CORPORAL'] spawn V_SetMyRank"]],"1","1"],
	["Set My Unit Rank Sergeant",[4],"",-5,[["expression","['SERGEANT'] spawn V_SetMyRank"]],"1","1"],
	["Set My Unit Rank Lieutenant",[5],"",-5,[["expression","['LIEUTENANT'] spawn V_SetMyRank"]],"1","1"],
	["Set My Unit Rank Captain",[6],"",-5,[["expression","['CAPTAIN'] spawn V_SetMyRank"]],"1","1"],
	["Set My Unit Rank Major",[7],"",-5,[["expression","['MAJOR'] spawn V_SetMyRank"]],"1","1"],
	["Set My Unit Rank Colonel",[8],"",-5,[["expression","['COLONEL'] spawn V_SetMyRank"]],"1","1"]
	];


FlipConfigSetting_menu = [
	["Flip Config Settings",false],
	["Allow Add & Delete Waypoint with mouse",[2],"",-5,[["expression","'HCExtAllowAddAndDeleteWp' spawn F_FlipConfigSetting"]],"1","1"],
	["Show HC Icons only in HC Mode",[3],"",-5,[["expression","'HCExtShowHCIconsOnlyInHCMode' spawn F_FlipConfigSetting"]],"1","1"],
	["Hide other Side Icons",[4],"",-5,[["expression","'HCExtHideOtherSideIcons' spawn F_FlipConfigSetting"]],"1","1"],
	["Hide Enemy Side Icons",[5],"",-5,[["expression","'HCExtHideEnemySideIcons' spawn F_FlipConfigSetting"]],"1","1"],
	["Stop Access to other Sides",[6],"",-5,[["expression","'HCExtHideAccessToOtherSides' spawn F_FlipConfigSetting"]],"1","1"],
	["Stop Access To enemy Sides",[7],"",-5,[["expression","'HCExtHideAccessToEnemySides' spawn F_FlipConfigSetting"]],"1","1"],
	["Stop Access to other Sides Stats",[8],"",-5,[["expression","'HCExtHideStatsOnOtherSides' spawn F_FlipConfigSetting"]],"1","1"],
	["Stop Access To enemy Sides Stats",[9],"",-5,[["expression","'HCExtHideStatsOnEnemySides' spawn F_FlipConfigSetting"]],"1","1"]
	];


Miscellaneous_menu = [
	["Miscellaneous",false],
	["Delete Empty Groups",[2],"",-5,[["expression","[] spawn V_DeleteEmptyGroups"]],"1","1"],
	["BIS_fnc_help",[3],"",-5,[["expression","[] call BIS_fnc_help"]],"1","1"],
	["Unit Vehicle Roles",[4],"",-5,[["expression","(hcSelected player) spawn V_UnitVehicleRoles"]],"1","1"],
	["Vehicle Turrets",[5],"",-5,[["expression","(hcSelected player) spawn V_VehicleTurrets"]],"1","1"],
	["Reset Vehicle Crew Ranks",[6],"",-5,[["expression","[] spawn V_ResetVehicleCrewRanks"]],"1","1"],
	["Set My Unit Rank",[7],"#USER:SetMyUnitRank_menu",-5,[["expression",""]],"1","1"],
	["Recompile Scripts",[8],"",-5,[["expression","[] spawn V_ReComplieScriptsVM"]],"1","1"],
	["Flip Config Setting",[9],"#USER:FlipConfigSetting_menu",-5,[["expression",""]],"1","1"],
	["ReInit HC Ext EventHandlers",[10],"",-5,[["expression","0 spawn F_ReInitHCExtEventHandlers"]],"1","1"],
	["Show HC Extension State",[11],"",-5,[["expression","[] spawn F_ShowHCExtState"]],"0","0"]
	];
	
VehicleStates_menu = [
	["Vehicle States",false],
	["Selected Groups Engines On",[2],"",-5,[["expression","[(hcSelected player),true,true] spawn F_VehicleEnginesOnOff"]],"1","1"],
	["Selected Groups Engines Off",[3],"",-5,[["expression","[(hcSelected player),false,true] spawn F_VehicleEnginesOnOff"]],"1","1"],
	["Unlock all Vehicles",[4],"",-5,[["expression","'UNLOCKED' spawn F_LockAllVehicles"]],"1","1"]
	];
	
Supply_menu = [
	["Supply",false],
	["Supply Fuel within 100m",[2],"",-5,[["expression","[(hcSelected player),'FuelTruckGroups', 100, 0.0, 0.8, true] spawn F_Resupply"]],"1","1"],
	["Supply Fuel within 300m",[3],"",-5,[["expression","[(hcSelected player),'FuelTruckGroups', 300, 0.0, 0.8, true] spawn F_Resupply"]],"1","1"],
	["Supply Fuel within 500m",[4],"",-5,[["expression","[(hcSelected player),'FuelTruckGroups', 500, 0.0, 0.8, true] spawn F_Resupply"]],"1","1"],
	["Supply Fuel within 1000m",[5],"",-5,[["expression","[(hcSelected player),'FuelTruckGroups', 1000, 0.0, 0.8, true] spawn F_Resupply"]],"1","1"],
	["Select Subset Fuel Truck",[6],"",-5,[["expression","[(hcSelected player),'FuelTruckGroups',1,10000] spawn V_SelectHCSubset"]],"1","1"],
	["Select Subset Ammo Truck",[7],"",-5,[["expression","[(hcSelected player),'AmmoTruckGroups',1,10000] spawn V_SelectHCSubset"]],"1","1"],
	["Select Subset Repair Truck",[8],"",-5,[["expression","[(hcSelected player),'RepairTruckGroups',1,10000] spawn V_SelectHCSubset"]],"1","1"],
	["Select Subset Needs Fuel (0 to 0.8)",[9],"",-5,[["expression","[(hcSelected player),'VehiclesLowOnFuel', 0, 0.8] spawn V_SelectHCSubset"]],"1","1"],
	["Vehicle Fuel Details",[10],"",-5,[["expression","[hcSelected player, 'FuelDetails'] spawn V_VehicleStats"]],"1","1"]
	];
	
transport_menu = [
	["Transport",false],
	["Air Landing",[2],"#USER:TransportLand_menu",-5,[["expression",""]],"1","1"],
	["Reorganise Groups",[3],"#USER:ReorganiseGroups_menu",-5,[["expression",""]],"1","1"],
	["Get In Nearest as Cargo",[4],"#USER:GetInNearestAsCargo_menu",-5,[["expression",""]],"1","1"],
	["Get In Nearest as Crew",[5],"#USER:GetInNearestAsCrew_menu",-5,[["expression",""]],"1","1"],
	["Select HC Subsets",[6],"#USER:SelectHCSubsets_menu",-5,[["expression",""]],"1","1"],
	["Split on Foot into groups of N",[7],"#USER:SplitN_menu",-5,[["expression",""]],"1","1"],
	["Miscellaneous",[8],"#USER:Miscellaneous_menu",-5,[["expression",""]],"1","1"],
	["Vehicle States",[9],"#USER:VehicleStates_menu",-5,[["expression",""]],"1","1"],
	["Supply",[10],"#USER:Supply_menu",-5,[["expression",""]],"1","1"],
	["Get In Nearest as Crew & Cargo",[11],"#USER:GetInNearestAsCrewAndCargo_menu",-5,[["expression",""]],"1","1"]
	];


UnitStatistics_menu = [
	["Unit Statistics",false],
	["Selected HC Unit Types",[2],"",-5,[["expression","(hcSelected player) spawn V_SelectedHCUnitTypes"]],"1","1"],
	["Selected HC Unit Magazine Types",[3],"",-5,[["expression","(hcSelected player) spawn V_SelectedHCUnitsMagazines"]],"1","1"],
	["Selected HC Unit Weapons Types",[4],"",-5,[["expression","(hcSelected player) spawn V_SelectedHCUnitsWeapons"]],"1","1"]
	];

VehicleStatistics_menu = [
	["Vehicle Statistics",false],
	["Vehicle Capacity",[2],"",-5,[["expression","(hcSelected player) spawn F_VehicleTroopCapacity"]],"1","1"],
	["All Vehicles",[3],"",-5,[["expression","[hcSelected player, 1,2,0,[]] spawn V_VehicleTotals"]],"1","1"],
	["All Empty Vehicles",[4],"",-5,[["expression","[hcSelected player, 1,1,0,[]] spawn V_VehicleTotals"]],"1","1"],
	["Nearby Used & Empty Vehicles (200m)",[5],"",-5,[["expression","[hcSelected player, 3,2,0,[]] spawn V_VehicleTotals"]],"1","1"],
	["Nearby Empty Vehicles (200m)",[6],"",-5,[["expression","[hcSelected player, 3,1,0,[]] spawn V_VehicleTotals"]],"1","1"],
	["Nearby Used Vehicles (200m)",[7],"",-5,[["expression","[hcSelected player, 3,3,0,[]] spawn V_VehicleTotals"]],"1","1"],
	["Vehicle Cargo Ammo",[8],"",-5,[["expression","[hcSelected player, 2,2,1,[true,false]] spawn V_VehicleTotals"]],"1","1"],
	["Vehicle Cargo Weapons",[9],"",-5,[["expression","[hcSelected player, 2,2,2,[true,false]] spawn V_VehicleTotals"]],"1","1"],
	["Vehicle Turrets Ammo",[10],"",-5,[["expression","[hcSelected player, 2,2,1,[false,true]] spawn V_VehicleTotals"]],"1","1"],
	["Vehicle Turrets Weapons",[11],"",-5,[["expression","[hcSelected player, 2,2,2,[false,true]] spawn V_VehicleTotals"]],"1","1"]
	];
	
OtherStatistics_menu = [
	["Other Statistics",false],
	["Nearby Ammo Boxes (1000m)",[2],"",-5,[["expression","(hcSelected player) spawn F_VehicleTroopCapacity"]],"1","1"],
	["Nearby Fuel Sources (5000m)",[3],"",-5,[["expression","(hcSelected player) spawn F_VehicleTroopCapacity"]],"1","1"],
	["Show Enemy Units Known About",[4],"",-5,[["expression","[hcSelected player, 100000, playerSide, true, 0.3] spawn F_ShowKnownEnemies"]],"1","1"],
	["Enemy Units Known About 100000m",[5],"",-5,[["expression","[hcSelected player, 100000, playerSide, false, 0.3] spawn F_KnownEnemiesStats"]],"1","1"],
	["Enemy Units Known About 100000m LO",[6],"",-5,[["expression","[hcSelected player, 100000, playerSide, true, 0.3] spawn F_KnownEnemiesStats"]],"1","1"],
	["Enemy Units Known About 100000m LOP",[7],"",-5,[["expression","[[group player], 100000, playerSide, true, 0.3] spawn F_KnownEnemiesStats"]],"1","1"],
	["Start Show Enemy Units Process",[8],"",-5,[["expression","[100000, true, 0.3] spawn F_StartShowEnemiesProcess"]],"1","1"],
	["Stop Show Enemy Units Process",[9],"",-5,[["expression","[] spawn F_StopShowEnemiesProcess"]],"1","1"]
	];

Statistics_menu = [
	["Statistics",false],
	["Selected HC groups Statistics",[2],"",-5,[["expression","(hcSelected player) spawn V_GroupsStatsHC"]],"1","1"],
	["Selected HC groups/sub Statistics",[3],"",-5,[["expression","(hcSelected player) spawn V_GroupsAndSubGroupsStatsHC"]],"1","1"],
	["Vehicle Totals",[4],"",-5,[["expression","[hcSelected player, 2,2,0,[]] spawn V_VehicleTotals"]],"1","1"],
	["Vehicle Damage",[5],"",-5,[["expression","[hcSelected player, 'Damage'] spawn V_VehicleStats"]],"1","1"],
	["Vehicle Fuel",[6],"",-5,[["expression","[hcSelected player, 'Fuel'] spawn V_VehicleStats"]],"1","1"],
	["Unit Statistics of Selected Groups",[7],"#USER:UnitStatistics_menu",-5,[["expression",""]],"1","1"],
	["Vehicle Statistics of Selected Groups",[8],"#USER:VehicleStatistics_menu",-5,[["expression",""]],"1","1"],
	["Other Statistics",[9],"#USER:OtherStatistics_menu",-5,[["expression",""]],"0","0"],
	["Total Units on all Sides",[10],"",-5,[["expression","[] spawn V_TotalUnitsOnAllSides"]],"1","1"],
	["Dead Units",[11],"",-5,[["expression","[] spawn V_TotalUnitsDead"]],"1","1"]
	];
	
	
Artillery_menu = [
	["Artillery",false],
	["Set Artillery Mode",[2],"",-5,[["expression","'Artillery' spawn F_SetModeHC"]],"1","1"],
	["Set Standard HC Mode",[3],"",-5,[["expression","'Standard' spawn F_SetModeHC"]],"1","1"],
	["Set Dispersion",[4],"",-5,[["expression","[] spawn V_GroupsAndSubGroupsStatsHC"]],"1","1"],
	["Set Rounds to Fire",[5],"",-5,[["expression","[hcSelected player, 2,2,0,[]] spawn V_VehicleTotals"]],"1","1"],
	["Cancel Fire",[6],"",-5,[["expression","[hcSelected player, 'Damage'] spawn V_VehicleStats"]],"1","1"],
	["Reload Ammo Type",[7],"",-5,[["expression","[hcSelected player, 'Fuel'] spawn V_VehicleStats"]],"1","1"],
	["Show Min, Max Ranges",[8],"#USER:UnitStatistics_menu",-5,[["expression",""]],"1","1"]
	];
	

	
// Main Coms Menu
	
	
missionNamespace setVariable ["HCExtCommunication_menu", 
	[[localize "STR_SOM_COMMUNICATIONS", false],
		["High Command",[2],"#USER:HighCommand_menu",-5,[["expression",""]],"1","1"],
		["Team Switching",[3],"#USER:TeamSwitch_menu",-5,[["expression",""]],"1","1"],
		["Squad",[4],"#USER:Squad_menu",-5,[["expression",""]],"1","1"],
		["Medical",[5],"#USER:Medical_menu",-5,[["expression",""]],"1","1"],
		["Switch to Side",[6],"#USER:SwitchSide_menu",-5,[["expression",""]],"1","1"],
		["High Command 2",[7],"#USER:HighCommand2_menu",-5,[["expression",""]],"1","1"],
		["Waypoints",[8],"#USER:Waypoints_menu",-5,[["expression",""]],"1","1"],
		["Transport",[9],"#USER:transport_menu",-5,[["expression",""]],"1","1"],
		["Statistics",[10],"#USER:Statistics_menu",-5,[["expression",""]],"1","1"],
		["Set Comms Menu to Another Menu",[11],"",-5,[["expression","'HCExtExampleOther_menu' spawn F_SetCommsMenu"]],"1","1"]
	]];

nil;