// Arma 2 function

private ["_Func","_VM"];

_Func = compile preprocessFile "HCfunc\Func\ReCompileFile.sqf"; missionNamespace setVariable ["F_ReCompileFile", _Func];

// Functions

// HC System


["HCfunc\HCrep\NoHCModule.sqf", "F_NoHCModule"] call F_ReCompileFile;

["HCfunc\HCrep\StandardMenuHandler.sqf", "F_StandardMenuHandler"] call F_ReCompileFile;
["HCfunc\HCrep\WaypointMenuHandler.sqf", "F_WaypointMenuHandler"] call F_ReCompileFile;
["HCfunc\HCrep\DoOnGroupIconClickHC.sqf", "F_DoOnGroupIconClickHC"] call F_ReCompileFile;
["HCfunc\HCrep\DoOnGroupIconOverEnterHC.sqf", "F_DoOnGroupIconOverEnterHC"] call F_ReCompileFile;
["HCfunc\HCrep\DoOnGroupIconOverLeaveHC.sqf", "F_DoOnGroupIconOverLeaveHC"] call F_ReCompileFile;
["HCfunc\HCrep\DoHCGroupSelectionChanged.sqf", "F_DoHCGroupSelectionChanged"] call F_ReCompileFile;

["HCfunc\HCrep\GetModeHC.sqf", "F_GetModeHC"] call F_ReCompileFile;
["HCfunc\HCrep\SetModeHC.sqf", "F_SetModeHC"] call F_ReCompileFile;

//["HCfunc\HCrep\InitHC.sqf", "F_InitHC"] call F_ReCompileFile;

["HCfunc\HCrep\ReInitHCExtEventHandlers.sqf", "F_ReInitHCExtEventHandlers"] call F_ReCompileFile;
["HCfunc\HCrep\ReInitHCExtState.sqf", "F_ReInitHCExtState"] call F_ReCompileFile;
["HCfunc\HCrep\GetHCExtState.sqf", "F_GetHCExtState"] call F_ReCompileFile;
["HCfunc\HCrep\ShowHCExtState.sqf", "F_ShowHCExtState"] call F_ReCompileFile;
["HCfunc\HCrep\ProcessNewWaypoints.sqf", "F_ProcessNewWaypoints"] call F_ReCompileFile;
["HCfunc\HCrep\AddNewWaypointsToSubsetSelected.sqf", "F_AddNewWaypointsToSubsetSelected"] call F_ReCompileFile;
["HCfunc\HCrep\GetWorldClickParameters.sqf", "F_GetWorldClickParameters"] call F_ReCompileFile;

["HCfunc\HCrep\DoMouseButtonUpHC.sqf", "F_DoMouseButtonUpHC"] call F_ReCompileFile;
["HCfunc\HCrep\DoMouseButtonDownHC.sqf", "F_DoMouseButtonDownHC"] call F_ReCompileFile;
["HCfunc\HCrep\DoMouseHoldingHC.sqf", "F_DoMouseHoldingHC"] call F_ReCompileFile;
["HCfunc\HCrep\DoMouseMovingHC.sqf", "F_DoMouseMovingHC"] call F_ReCompileFile;

["HCfunc\HCrep\SetKeyUpDown.sqf", "F_SetKeyUpDown"] call F_ReCompileFile;
["HCfunc\HCrep\DoKeyDown.sqf", "F_DoKeyDown"] call F_ReCompileFile;
["HCfunc\HCrep\DoKeyUp.sqf", "F_DoKeyUp"] call F_ReCompileFile;

["HCfunc\HCrep\HCExtSetGroupIconsVisible.sqf", "F_HCExtSetGroupIconsVisible"] call F_ReCompileFile;
["HCfunc\HCrep\DoOnHCModeEnterLeave.sqf", "F_DoOnHCModeEnterLeave"] call F_ReCompileFile;
["HCfunc\HCrep\DoOnTeamSwitch.sqf", "F_DoOnTeamSwitch"] call F_ReCompileFile;
["HCfunc\HCrep\PerformTeamSwitch.sqf", "F_PerformTeamSwitch"] call F_ReCompileFile;

["HCfunc\HCrep\InitGroupIconAppearance.sqf", "F_InitGroupIconAppearance"] call F_ReCompileFile;
["HCfunc\HCrep\SetGroupWaypointsVisiblity.sqf", "F_SetGroupWaypointsVisiblity"] call F_ReCompileFile;

["HCfunc\HCrep\SetGroupVisiblity.sqf", "F_SetGroupVisiblity"] call F_ReCompileFile;
["HCfunc\HCrep\MakeAllGroupsVisible.sqf", "F_MakeAllGroupsVisible"] call F_ReCompileFile;
["HCfunc\HCrep\SetVisibleGroupIcons.sqf", "F_SetVisibleGroupIcons"] call F_ReCompileFile;
["HCfunc\HCrep\ClearAllEnemyGroupIcons.sqf", "F_ClearAllEnemyGroupIcons"] call F_ReCompileFile;
["HCfunc\HCrep\ShowGroupIconParams.sqf", "F_ShowGroupIconParams"] call F_ReCompileFile;
["HCfunc\HCrep\RefreshAllGroupsIcons.sqf", "F_RefreshAllGroupsIcons"] call F_ReCompileFile;
["HCfunc\HCrep\ShowGroupsWaypoints.sqf", "F_ShowGroupsWaypoints"] call F_ReCompileFile;
["HCfunc\HCrep\ShowGroupsTypeWaypoints.sqf", "F_ShowGroupsTypeWaypoints"] call F_ReCompileFile;

["HCfunc\HCrep\SetWaypointsType.sqf", "F_SetWaypointsType"] call F_ReCompileFile;
["HCfunc\HCrep\StoredWaypointExists.sqf", "F_StoredWaypointExists"] call F_ReCompileFile;
["HCfunc\HCrep\SetWaypointsCombatMode.sqf", "F_SetWaypointsCombatMode"] call F_ReCompileFile;
["HCfunc\HCrep\SetWaypointsFormation.sqf", "F_SetWaypointsFormation"] call F_ReCompileFile;
["HCfunc\HCrep\SetWaypointsSpeed.sqf", "F_SetWaypointsSpeed"] call F_ReCompileFile;
["HCfunc\HCrep\SetWaypointsTimeOut.sqf", "F_SetWaypointsTimeOut"] call F_ReCompileFile;
["HCfunc\HCrep\SetWaypointsCompletionRadius.sqf", "F_SetWaypointsCompletionRadius"] call F_ReCompileFile;
["HCfunc\HCrep\SelectedWaypointsDelete.sqf", "F_SelectedWaypointsDelete"] call F_ReCompileFile;
["HCfunc\HCrep\SelectedWaypointsSplitBeforeAfter.sqf", "F_SelectedWaypointsSplitBeforeAfter"] call F_ReCompileFile;
["HCfunc\HCrep\MoveSelectedWaypoints.sqf", "F_MoveSelectedWaypoints"] call F_ReCompileFile;
["HCfunc\HCrep\IncSelectedWpsOnSplitBeforeAfter.sqf", "F_IncSelectedWpsOnSplitBeforeAfter"] call F_ReCompileFile;

["HCfunc\HCrep\ShowWaypointInfo.sqf", "F_ShowWaypointInfo"] call F_ReCompileFile;

["HCfunc\HCrep\HCExtInitIcons.sqf", "F_HCExtInitIcons"] call F_ReCompileFile;
["HCfunc\HCrep\HCExtRefreshIcons.sqf", "F_HCExtRefreshIcons"] call F_ReCompileFile;
["HCfunc\HCrep\HCExtRefreshVisibleIcons.sqf", "F_HCExtRefreshVisibleIcons"] call F_ReCompileFile;

["HCfunc\HCrep\SelectHCGroupsInRectangle.sqf", "F_SelectHCGroupsInRectangle"] call F_ReCompileFile;
["HCfunc\HCrep\UpdateSelectionBand.sqf", "F_UpdateSelectionBand"] call F_ReCompileFile;
["HCfunc\HCrep\ProcessMovingWaypointsGUI.sqf", "F_ProcessMovingWaypointsGUI"] call F_ReCompileFile;


// Func

["HCfunc\Func\NumsEqual.sqf", "F_NumsEqual"] call F_ReCompileFile;

["HCfunc\Func\ObjectTypesTotalToString.sqf", "F_ObjectTypesTotalToString"] call F_ReCompileFile;
["HCfunc\Func\LockAllVehicles.sqf", "F_LockAllVehicles"] call F_ReCompileFile;

["HCfunc\Func\FilterObjectsOfTypes.sqf", "F_FilterObjectsOfTypes"] call F_ReCompileFile;
["HCfunc\Func\SumOfArray.sqf", "F_SumOfArray"] call F_ReCompileFile;
["HCfunc\Func\CountObjectsOfTypes.sqf", "F_CountObjectsOfTypes"] call F_ReCompileFile;
["HCfunc\Func\CountObjectsOfEachType.sqf", "F_CountObjectsOfEachType"] call F_ReCompileFile;
["HCfunc\Func\AccumulateObjectTypeTotals.sqf", "F_AccumulateObjectTypeTotals"] call F_ReCompileFile;
["HCfunc\Func\AccumulateTypeTotals.sqf", "F_AccumulateTypeTotals"] call F_ReCompileFile;
["HCfunc\Func\AccumulateTypeCountTotals.sqf", "F_AccumulateTypeCountTotals"] call F_ReCompileFile;
["HCfunc\Func\CalcObjectTypeTotals.sqf", "F_CalcObjectTypeTotals"] call F_ReCompileFile;
["HCfunc\Func\FilterEmptyVehicles.sqf", "F_FilterEmptyVehicles"] call F_ReCompileFile;
["HCfunc\Func\FilterArray.sqf", "F_FilterArray"] call F_ReCompileFile;
["HCfunc\Func\AccumulateDistinctArray.sqf", "F_AccumulateDistinctArray"] call F_ReCompileFile;
["HCfunc\Func\ArrayIsSubSetOfArray.sqf", "ArrayIsSubSetOfArray"] call F_ReCompileFile;
["HCfunc\Func\ArraysElementsEqual.sqf", "F_ArraysElementsEqual"] call F_ReCompileFile;

["HCfunc\Func\ReallocateHCgroups.sqf", "F_ReallocateHCgroups"] call F_ReCompileFile;
["HCfunc\Func\GetFactions.sqf", "F_GetFactions"] call F_ReCompileFile;
["HCfunc\Func\CollectGroupHCtoLeader.sqf", "F_CollectGroupHCtoLeader"] call F_ReCompileFile;

["HCfunc\Func\SplitPerVehicleCrewsGroups.sqf", "F_SplitPerVehicleCrewsGroups"] call F_ReCompileFile;
["HCfunc\Func\SplitNonCrewToNewGroups.sqf", "F_SplitNonCrewToNewGroups"] call F_ReCompileFile;
["HCfunc\Func\UnassignVehiclesGroup.sqf", "F_UnassignVehiclesGroup"] call F_ReCompileFile;
["HCfunc\Func\UnassignVehiclesGroupsOnFoot.sqf", "F_UnassignVehiclesGroupsOnFoot"] call F_ReCompileFile;

["HCfunc\Func\GetObjectsNearGroups.sqf", "F_GetObjectsNearGroups"] call F_ReCompileFile;
["HCfunc\Func\AccumulateVehiclesWeaponsOrMagazines.sqf", "F_AccumulateVehiclesWeaponsOrMagazines"] call F_ReCompileFile;

["HCfunc\Func\LandHelicopterGroup.sqf", "F_LandHelicopterGroup"] call F_ReCompileFile;
["HCfunc\Func\GetOutGroupsWithGroup.sqf", "F_GetOutGroupsWithGroup"] call F_ReCompileFile;

["HCfunc\Func\SeparateOutNewCrewAndCargoUnits.sqf", "F_SeparateOutNewCrewAndCargoUnits"] call F_ReCompileFile;
["HCfunc\Func\AssignCrewUnits.sqf", "F_AssignCrewUnits"] call F_ReCompileFile;
["HCfunc\Func\AssignCargoUnits.sqf", "F_AssignCargoUnits"] call F_ReCompileFile;


// Vectors

["HCfunc\Vectors\VectorAdd.sqf", "F_VectorAdd"] call F_ReCompileFile;
["HCfunc\Vectors\VectorSub.sqf", "F_VectorSub"] call F_ReCompileFile;
["HCfunc\Vectors\VectorScale.sqf", "F_VectorScale"] call F_ReCompileFile;
["HCfunc\Vectors\VectorAbs.sqf", "F_VectorAbs"] call F_ReCompileFile;
["HCfunc\Vectors\CoordsEqual2D.sqf", "F_CoordsEqual2D"] call F_ReCompileFile;
["HCfunc\Vectors\CoordsEqual3D.sqf", "F_CoordsEqual3D"] call F_ReCompileFile;


// VehicleProperties

["HCfunc\VehicleProperties\VehicleOfUseType.sqf", "F_VehicleOfUseType"] call F_ReCompileFile;
["HCfunc\VehicleProperties\IsVehicleTypeGroup.sqf", "F_IsVehicleTypeGroup"] call F_ReCompileFile;
["HCfunc\VehicleProperties\VehicleNeedsFuel.sqf", "F_VehicleNeedsFuel"] call F_ReCompileFile;
["HCfunc\VehicleProperties\GroupVehiclesNeedFuel.sqf", "F_GroupVehiclesNeedFuel"] call F_ReCompileFile;
["HCfunc\VehicleProperties\FilterVehicleNeedsFuel.sqf", "F_FilterVehicleNeedsFuel"] call F_ReCompileFile;

["HCfunc\VehicleProperties\VehicleHasDriverSeat.sqf", "F_VehicleHasDriverSeat"] call F_ReCompileFile;
["HCfunc\VehicleProperties\VehicleIsUsed.sqf", "F_VehicleIsUsed"] call F_ReCompileFile;
["HCfunc\VehicleProperties\VehicleIsOccupied.sqf", "F_VehicleIsOccupied"] call F_ReCompileFile;
["HCfunc\VehicleProperties\VehicleCargoCapacity.sqf", "F_VehicleCargoCapacity"] call F_ReCompileFile;
["HCfunc\VehicleProperties\VehicleCrewCapacity.sqf", "F_VehicleCrewCapacity"] call F_ReCompileFile;
["HCfunc\VehicleProperties\VehicleNumUnassignedCargo.sqf", "F_VehicleNumUnassignedCargo"] call F_ReCompileFile;
["HCfunc\VehicleProperties\VehicleCrewInside.sqf", "F_VehicleCrewInside"] call F_ReCompileFile;
["HCfunc\VehicleProperties\VehicleCrewInTurrets.sqf", "F_VehicleCrewInTurrets"] call F_ReCompileFile;
["HCfunc\VehicleProperties\VehicleDriverMounted.sqf", "F_VehicleDriverMounted"] call F_ReCompileFile;
["HCfunc\VehicleProperties\VehicleAssignedCrew.sqf", "F_VehicleAssignedCrew"] call F_ReCompileFile;
["HCfunc\VehicleProperties\VehicleHasCrew.sqf", "F_VehicleHasCrew"] call F_ReCompileFile;
["HCfunc\VehicleProperties\VehicleUnitsInCargo.sqf", "F_VehicleUnitsInCargo"] call F_ReCompileFile;
["HCfunc\VehicleProperties\VehicleTroopCapacity.sqf", "F_VehicleTroopCapacity"] call F_ReCompileFile;
["HCfunc\VehicleProperties\VehicleIsStatic.sqf", "F_VehicleIsStatic"] call F_ReCompileFile;
["HCfunc\VehicleProperties\VehicleTypeTurretPostions.sqf", "F_VehicleTypeTurretPostions"] call F_ReCompileFile;

["HCfunc\VehicleProperties\VehicleEnginesOnOff.sqf", "F_VehicleEnginesOnOff"] call F_ReCompileFile;
["HCfunc\VehicleProperties\VehicleLightsOnOff.sqf", "F_VehicleLightsOnOff"] call F_ReCompileFile;


// Waypoints

["HCfunc\Waypoints\WaypointTriggerActivateTest.sqf", "F_WaypointTriggerActivateTest"] call F_ReCompileFile;

["HCfunc\Waypoints\DeleteGroupWaypoint.sqf", "F_DeleteGroupWaypoint"] call F_ReCompileFile;
["HCfunc\Waypoints\WaypointSplitBeforeAfter.sqf", "F_WaypointSplitBeforeAfter"] call F_ReCompileFile;
["HCfunc\Waypoints\DeleteGroupsNextWaypoints.sqf", "F_DeleteGroupsNextWaypoints"] call F_ReCompileFile;
["HCfunc\Waypoints\DeleteGroupsLastWaypoints.sqf", "F_DeleteGroupsLastWaypoints"] call F_ReCompileFile;
["HCfunc\Waypoints\DeleteGroupWaypoints.sqf", "F_DeleteGroupWaypoints"] call F_ReCompileFile;
["HCfunc\Waypoints\DeleteGroupsWaypoints.sqf", "F_DeleteGroupsWaypoints"] call F_ReCompileFile;
["HCfunc\Waypoints\IsNeverTimeoutWaypoint.sqf", "F_IsNeverTimeoutWaypoint"] call F_ReCompileFile;
["HCfunc\Waypoints\HasGroupsNeverTimeoutWaypoint.sqf", "F_HasGroupsNeverTimeoutWaypoint"] call F_ReCompileFile;
["HCfunc\Waypoints\InsertNeverTimeoutWaypoint.sqf", "F_InsertNeverTimeoutWaypoint"] call F_ReCompileFile;
["HCfunc\Waypoints\InsertGroupsNeverTimeoutWaypoint.sqf", "F_InsertGroupsNeverTimeoutWaypoint"] call F_ReCompileFile;
["HCfunc\Waypoints\RemoveGroupsNeverTimeoutWaypoint.sqf", "F_RemoveGroupsNeverTimeoutWaypoint"] call F_ReCompileFile;
["HCfunc\Waypoints\GroupsWayPointStats.sqf", "F_GroupsWayPointStats"] call F_ReCompileFile;
["HCfunc\Waypoints\GroupHasWaypointsToDo.sqf", "F_GroupHasWaypointsToDo"] call F_ReCompileFile;

["HCfunc\Waypoints\SetWaypointsHelicopterLand.sqf", "F_SetWaypointsHelicopterLand"] call F_ReCompileFile;
["HCfunc\Waypoints\SetWaypointsAdvancedClear.sqf", "F_SetWaypointsAdvancedClear"] call F_ReCompileFile;
["HCfunc\Waypoints\SetWaypointsGetOutGroups.sqf", "F_SetWaypointsGetOutGroups"] call F_ReCompileFile;
["HCfunc\Waypoints\GenerateActionWaypoint.sqf", "F_GenerateActionWaypoint"] call F_ReCompileFile;


// Supply

["HCfunc\Supply\Resupply.sqf", "F_Resupply"] call F_ReCompileFile;
["HCfunc\Supply\SetupGroupSupplyMission.sqf", "F_SetupGroupSupplyMission"] call F_ReCompileFile;
["HCfunc\Supply\PerformSupplyFuelToVehicles.sqf", "F_PerformSupplyFuelToVehicles"] call F_ReCompileFile;
["HCfunc\Supply\SupplyFuelToVehicle.sqf", "F_SupplyFuelToVehicle"] call F_ReCompileFile;
["HCfunc\Supply\FilterObjectSides.sqf", "F_FilterObjectSides"] call F_ReCompileFile;
["HCfunc\Supply\ChooseObjectToSupplyFuelTo.sqf", "F_ChooseObjectToSupplyFuelTo"] call F_ReCompileFile;
["HCfunc\Supply\FilterVehiclesMoving.sqf", "F_FilterVehiclesMoving"] call F_ReCompileFile;
["HCfunc\Supply\TransferFuelToVehicle.sqf", "F_TransferFuelToVehicle"] call F_ReCompileFile;
["HCfunc\Supply\GenerateNextFuelSupplyState.sqf", "F_GenerateNextFuelSupplyState"] call F_ReCompileFile;


// Artillery

["HCfunc\Artillery\FireGroupArtillery.sqf", "F_FireGroupArtillery"] call F_ReCompileFile;
["HCfunc\Artillery\InitArtillery.sqf", "F_InitArtillery"] call F_ReCompileFile;
["HCfunc\Artillery\InitArtilleryBattery.sqf", "F_InitArtilleryBattery"] call F_ReCompileFile;
["HCfunc\Artillery\FireArtilleryBatteries.sqf", "F_FireArtilleryBatteries"] call F_ReCompileFile;
["HCfunc\Artillery\GroupIsBattery.sqf", "F_GroupIsBattery"] call F_ReCompileFile;
["HCfunc\Artillery\GetGroupArtillaryModule.sqf", "F_GetGroupArtillaryModule"] call F_ReCompileFile;
["HCfunc\Artillery\GetGroupArtilleryPieces.sqf", "F_GetGroupArtilleryPieces"] call F_ReCompileFile;
["HCfunc\Artillery\GetArtilleryPiecesArtilleryModule.sqf", "F_GetArtilleryPiecesArtilleryModule"] call F_ReCompileFile;
["HCfunc\Artillery\GetGroupSynchronizedObject.sqf", "F_GetGroupSynchronizedObject"] call F_ReCompileFile;


// Config

["HCfunc\Config\SideAccessible.sqf", "F_SideAccessible"] call F_ReCompileFile;
["HCfunc\Config\SideAccessibleNum.sqf", "F_SideAccessibleNum"] call F_ReCompileFile;
["HCfunc\Config\ShowHCIconsOnlyMySide.sqf", "F_ShowHCIconsOnlyMySide"] call F_ReCompileFile;
["HCfunc\Config\ShowIconsOnlyInHCMode.sqf", "F_ShowIconsOnlyInHCMode"] call F_ReCompileFile;
["HCfunc\Config\ShowAllHCIconsAndWaypoints.sqf", "F_ShowAllHCIconsAndWaypoints"] call F_ReCompileFile;
["HCfunc\Config\FlipConfigSetting.sqf", "F_FlipConfigSetting"] call F_ReCompileFile;
["HCfunc\Config\DoGroupIconVisible.sqf", "F_DoGroupIconVisible"] call F_ReCompileFile;
["HCfunc\Config\SideStatsAccessible.sqf", "F_SideStatsAccessible"] call F_ReCompileFile;
["HCfunc\Config\FilterArrayBySidesConfig.sqf", "F_FilterArrayBySidesConfig"] call F_ReCompileFile;
["HCfunc\Config\SideStatsTotal.sqf", "F_SideStatsTotal"] call F_ReCompileFile;
["HCfunc\Config\GetSidesWithVisibleIcons.sqf", "F_GetSidesWithVisibleIcons"] call F_ReCompileFile;
["HCfunc\Config\SideIconsAreVisible.sqf", "F_SideIconsAreVisible"] call F_ReCompileFile;


// Groups

["HCfunc\Groups\DoDeleteGroup.sqf", "F_DoDeleteGroup"] call F_ReCompileFile;

["HCfunc\Groups\SetGroupsCombatMode.sqf", "F_SetGroupsCombatMode"] call F_ReCompileFile;
["HCfunc\Groups\SetGroupsFireMode.sqf", "F_SetGroupsFireMode"] call F_ReCompileFile;
["HCfunc\Groups\SetGroupsSpeed.sqf", "F_SetGroupsSpeed"] call F_ReCompileFile;
["HCfunc\Groups\SetGroupsFormation.sqf", "F_SetGroupsFormation"] call F_ReCompileFile;
["HCfunc\Groups\SetEnableGroupsAttack.sqf", "F_SetEnableGroupsAttack"] call F_ReCompileFile;

["HCfunc\Groups\SubsetOfGroups.sqf", "F_SubsetOfGroups"] call F_ReCompileFile;
["HCfunc\Groups\SelectHCGroups.sqf", "F_SelectHCGroups"] call F_ReCompileFile;
["HCfunc\Groups\CountGroupsUnits.sqf", "F_CountGroupsUnits"] call F_ReCompileFile;
["HCfunc\Groups\GetGroupWithMostSeniorOfficer.sqf", "F_GetGroupWithMostSeniorOfficer"] call F_ReCompileFile;
["HCfunc\Groups\MakeHighestRankingUnitGroupLeader.sqf", "F_MakeHighestRankingUnitGroupLeader"] call F_ReCompileFile;

["HCfunc\Groups\GroupDrivesAllItsVehicles.sqf", "F_GroupDrivesAllItsVehicles"] call F_ReCompileFile;
["HCfunc\Groups\GroupsAndSubGroupsHC.sqf", "F_GroupsAndSubGroupsHC"] call F_ReCompileFile;
["HCfunc\Groups\GroupUnitsReallocate.sqf", "F_GroupUnitsReallocate"] call F_ReCompileFile;
["HCfunc\Groups\GroupUnitsReallocateExceptLeader.sqf", "F_GroupUnitsReallocateExceptLeader"] call F_ReCompileFile;
["HCfunc\Groups\GroupsStatsHCcalc.sqf", "F_GroupsStatsHCcalc"] call F_ReCompileFile;
["HCfunc\Groups\HCgroups.sqf", "F_HCgroups"] call F_ReCompileFile;

["HCfunc\Groups\GetVehiclesGroupIsDriving.sqf", "F_GetVehiclesGroupIsDriving"] call F_ReCompileFile;
["HCfunc\Groups\GetGroupsVehiclesIn.sqf", "F_GetGroupsVehiclesIn"] call F_ReCompileFile;
["HCfunc\Groups\GetGroupsVehiclesCrewing.sqf", "F_GetGroupsVehiclesCrewing"] call F_ReCompileFile;
["HCfunc\Groups\GetGroupsVehiclesInAndAssigned.sqf", "F_GetGroupsVehiclesInAndAssigned"] call F_ReCompileFile;
["HCfunc\Groups\GetGroupsUsingVehicles.sqf", "F_GetGroupsUsingVehicles"] call F_ReCompileFile;
["HCfunc\Groups\RemoveEmptyGroups.sqf", "F_RemoveEmptyGroups"] call F_ReCompileFile;
["HCfunc\Groups\CopyGroupToFreshGroupHC.sqf", "F_CopyGroupToFreshGroupHC"] call F_ReCompileFile;
["HCfunc\Groups\UnassignGroupUnitsFromVehicle.sqf", "F_UnassignGroupUnitsFromVehicle"] call F_ReCompileFile;
["HCfunc\Groups\UnassignGroupUnitsOnFootFromVehicles.sqf", "F_UnassignGroupUnitsOnFootFromVehicles"] call F_ReCompileFile;
["HCfunc\Groups\GetGroupsStances.sqf", "F_GetGroupsStances"] call F_ReCompileFile;


// Units

["HCfunc\Units\AllUnitsAreOnFoot.sqf", "F_AllUnitsAreOnFoot"] call F_ReCompileFile;
["HCfunc\Units\AllUnitsAreInVehicles.sqf", "F_AllUnitsAreInVehicles"] call F_ReCompileFile;
["HCfunc\Units\AllUnitsAreInCargo.sqf", "F_AllUnitsAreInCargo"] call F_ReCompileFile;
["HCfunc\Units\AllUnitsAreCrews.sqf", "F_AllUnitsAreCrews"] call F_ReCompileFile;
["HCfunc\Units\AllUnitsAreFlyingAirCrews.sqf", "F_AllUnitsAreFlyingAirCrews"] call F_ReCompileFile;
["HCfunc\Units\AllUnitsAreNotCrews.sqf", "F_AllUnitsAreNotCrews"] call F_ReCompileFile;

["HCfunc\Units\UnitIsSeniorHC.sqf", "F_UnitIsSeniorHC"] call F_ReCompileFile;
["HCfunc\Units\UnitIsHC.sqf", "F_UnitIsHC"] call F_ReCompileFile;
["HCfunc\Units\UnitIsOnFoot.sqf", "F_UnitsIsOnFoot"] call F_ReCompileFile;
["HCfunc\Units\UnitIsNotCrew.sqf", "F_UnitsIsNotCrew"] call F_ReCompileFile;
["HCfunc\Units\UnitIsInAVehicle.sqf", "F_UnitsIsInAVehicle"] call F_ReCompileFile;
["HCfunc\Units\UnitIsAssignedAVehicle.sqf", "F_UnitsIsAssignedAVehicle"] call F_ReCompileFile;
["HCfunc\Units\UnitIsDriver.sqf", "F_UnitIsDriver"] call F_ReCompileFile;
["HCfunc\Units\UnitIsMountedDriver.sqf", "F_UnitIsMountedDriver"] call F_ReCompileFile;

["HCfunc\Units\SetUnitRankWithoutChangingRating.sqf", "F_SetUnitRankWithoutChangingRating"] call F_ReCompileFile;
["HCfunc\Units\GetUnitsAssignedVehicle.sqf", "F_GetUnitsAssignedVehicle"] call F_ReCompileFile;


// Enemies

["HCfunc\Enemies\KnownEnemiesStats.sqf", "F_KnownEnemiesStats"] call F_ReCompileFile;
["HCfunc\Enemies\KnownEnemies.sqf", "F_KnownEnemies"] call F_ReCompileFile;
["HCfunc\Enemies\EnemySides.sqf", "F_EnemySides"] call F_ReCompileFile;
["HCfunc\Enemies\FilterSides.sqf", "F_FilterSides"] call F_ReCompileFile;
["HCfunc\Enemies\FilterOnKnowsAbout.sqf", "F_FilterOnKnowsAbout"] call F_ReCompileFile;
["HCfunc\Enemies\GetKnowsAboutValues.sqf", "F_GetKnowsAboutValues"] call F_ReCompileFile;
["HCfunc\Enemies\ShowKnownEnemies.sqf", "F_ShowKnownEnemies"] call F_ReCompileFile;
["HCfunc\Enemies\ClearHCShownEnemyIcons.sqf", "F_ClearHCShownEnemyIcons"] call F_ReCompileFile;
["HCfunc\Enemies\ShowEnemiesProcess.sqf", "F_ShowEnemiesProcess"] call F_ReCompileFile;
["HCfunc\Enemies\GetAllGroupsOnSide.sqf", "F_GetAllGroupsOnSide"] call F_ReCompileFile;
["HCfunc\Enemies\StopShowEnemiesProcess.sqf", "F_StopShowEnemiesProcess"] call F_ReCompileFile;
["HCfunc\Enemies\StartShowEnemiesProcess.sqf", "F_StartShowEnemiesProcess"] call F_ReCompileFile;
["HCfunc\Enemies\StartShowEnemiesProcess.sqf", "F_StartShowEnemiesProcess"] call F_ReCompileFile;
["HCfunc\Enemies\AllocateNewMarker.sqf", "F_AllocateNewMarker"] call F_ReCompileFile;
["HCfunc\Enemies\CreateHCEnemyIcons.sqf", "F_CreateHCEnemyIcons"] call F_ReCompileFile;
["HCfunc\Enemies\IsObjectTypeToShow.sqf", "F_IsObjectTypeToShow"] call F_ReCompileFile;


// Virtual Machines

["HCfunc\RemoveGroupsFromHC.sqf", "V_RemoveGroupsFromHC"] call F_ReCompileFile;
["HCfunc\MakeSelectedUnitsNewHG.sqf", "V_MakeSelectedUnitsNewHG"] call F_ReCompileFile;
["HCfunc\AddSelectedGroupsUnitsToHG.sqf", "V_AddSelectedGroupsUnitsToHG"] call F_ReCompileFile;
["HCfunc\CommandAllOfSide.sqf", "V_CommandAllOfSide"] call F_ReCompileFile;
["HCfunc\GroupsStatsHC.sqf", "V_GroupsStatsHC"] call F_ReCompileFile;
["HCfunc\MergeHG.sqf", "V_MergeHG"] call F_ReCompileFile;
["HCfunc\SplitHG.sqf", "V_SplitHG"] call F_ReCompileFile;
["HCfunc\ClearAllSideHC.sqf", "V_ClearAllSideHC"] call F_ReCompileFile;
["HCfunc\MakeGroupHCAndSwitchTo.sqf", "V_MakeGroupHCAndSwitchTo"] call F_ReCompileFile;
["HCfunc\Func\ReallocateHCgroups.sqf", "V_ReallocateHCgroups"] call F_ReCompileFile;

["HCfunc\ResetTeamSwitch.sqf", "V_ResetTeamSwitch"] call F_ReCompileFile;
["HCfunc\OnlyLeadersTeamSwitchable.sqf", "V_OnlyLeadersTeamSwitchable"] call F_ReCompileFile;
["HCfunc\MakeUnitsTeamSwitchable.sqf", "V_MakeUnitsTeamSwitchable"] call F_ReCompileFile;
["HCfunc\OnlyHCteamSwitchable.sqf", "V_OnlyHCteamSwitchable"] call F_ReCompileFile;
["HCfunc\SwitchToHCgroupLeader.sqf", "V_SwitchToHCgroupLeader"] call F_ReCompileFile;
["HCfunc\SwitchToSelectUnit.sqf", "V_SwitchToSelectUnit"] call F_ReCompileFile;
["HCfunc\SwitchToSquadLeader.sqf", "V_SwitchToSquadLeader"] call F_ReCompileFile;
["HCfunc\SwitchToUnitHC.sqf", "V_SwitchToUnitHC"] call F_ReCompileFile;
["HCfunc\SwitchToNextFaction.sqf", "V_SwitchToNextFaction"] call F_ReCompileFile;

["HCfunc\MakePlayerGroupLeader.sqf", "V_MakePlayerGroupLeader"] call F_ReCompileFile;
["HCfunc\MakeSelectedUnitGroupLeaderAndSwitch.sqf", "V_MakeSelectedUnitGroupLeaderAndSwitch"] call F_ReCompileFile;
["HCfunc\MakeSelectedUnitsNewGroup.sqf", "V_MakeSelectedUnitsNewGroup"] call F_ReCompileFile;
["HCfunc\MakeSelectedUnitsNewGroupLead.sqf", "V_MakeSelectedUnitsNewGroupLead"] call F_ReCompileFile;
["HCfunc\MakeSelectedUnitsNewGroupAndSwitchTo.sqf", "V_MakeSelectedUnitsNewGroupAndSwitchTo"] call F_ReCompileFile;
["HCfunc\PlayerGroupReallocateExceptLeader.sqf", "V_PlayerGroupReallocateExceptLeader"] call F_ReCompileFile;
["HCfunc\UnassignAllGroupFromVehicles.sqf", "V_UnassignAllGroupFromVehicles"] call F_ReCompileFile;
["HCfunc\UnassignSelectedUnitsFromVehicles.sqf", "V_UnassignSelectedUnitsFromVehicles"] call F_ReCompileFile;
["HCfunc\SquadUnitsStats.sqf", "V_SquadUnitsStats"] call F_ReCompileFile;

["HCfunc\ReturnDamagedToHG.sqf", "V_ReturnDamagedToHG"] call F_ReCompileFile;
["HCfunc\SwitchToOneDamagedUnit.sqf", "V_SwitchToOneDamagedUnit"] call F_ReCompileFile;
["HCfunc\GetPlayerDamaged.sqf", "V_GetPlayerDamaged"] call F_ReCompileFile;
["HCfunc\ReturnNotInVehiclesToHG.sqf", "V_ReturnNotInVehiclesToHG"] call F_ReCompileFile;

["HCfunc\SwitchToSide.sqf", "V_SwitchToSide"] call F_ReCompileFile;

["HCfunc\MakeSelectedGroupsNewSubCommand.sqf", "V_MakeSelectedGroupsNewSubCommand"] call F_ReCompileFile;
["HCfunc\GroupsToSeniorHG.sqf", "V_GroupsToSeniorHG"] call F_ReCompileFile;
["HCfunc\GroupsAndSubGroupsStatsHC.sqf", "V_GroupsAndSubGroupsStatsHC"] call F_ReCompileFile;
["HCfunc\FlattenSelectedHCGroups.sqf", "V_FlattenSelectedHCGroups"] call F_ReCompileFile;
["HCfunc\ReallocateAllGroupsExceptLeader.sqf", "V_ReallocateAllGroupsExceptLeader"] call F_ReCompileFile;
["HCfunc\ChangeHCbarIcons.sqf", "V_ChangeHCbarIcons"] call F_ReCompileFile;
["HCfunc\TotalUnitsOnAllSides.sqf", "V_TotalUnitsOnAllSides"] call F_ReCompileFile;
["HCfunc\InvertHCSelection.sqf", "V_InvertHCSelection"] call F_ReCompileFile;
["HCfunc\ShowKnownMarkers.sqf", "F_ShowKnownMarkers"] call F_ReCompileFile;


["HCfunc\LandHelicopterGroups.sqf", "V_LandHelicopterGroups"] call F_ReCompileFile;
["HCfunc\GetAirAltitudes.sqf", "V_GetAirAltitudes"] call F_ReCompileFile;

["HCfunc\GetOutGroup.sqf", "V_GetOutGroup"] call F_ReCompileFile;
["HCfunc\GetOutGroups.sqf", "V_GetOutGroups"] call F_ReCompileFile;

["HCfunc\GetinNearestVehicleOfTypeAsCargo.sqf", "V_GetinNearestVehicleOfTypeAsCargo"] call F_ReCompileFile;
["HCfunc\GetinNearestVehicleOfTypeAsCrew.sqf", "V_GetinNearestVehicleOfTypeAsCrew"] call F_ReCompileFile;
["HCfunc\GetinNearestVehicleOfTypeAsCrewAndCargo.sqf", "V_GetinNearestVehicleOfTypeAsCrewAndCargo"] call F_ReCompileFile;
["HCfunc\GetinNearestStaticAsCrew.sqf", "V_GetinNearestStaticAsCrew"] call F_ReCompileFile;
["HCfunc\SelectHCSubset.sqf", "V_SelectHCSubset"] call F_ReCompileFile;

["HCfunc\VehicleStats.sqf", "V_VehicleStats"] call F_ReCompileFile;
["HCfunc\VehicleTotals.sqf", "V_VehicleTotals"] call F_ReCompileFile;
["HCfunc\DeleteEmptyGroups.sqf", "V_DeleteEmptyGroups"] call F_ReCompileFile;
["HCfunc\UnitVehicleRoles.sqf", "V_UnitVehicleRoles"] call F_ReCompileFile;
["HCfunc\VehicleTurrets.sqf", "V_VehicleTurrets"] call F_ReCompileFile;
["HCfunc\ResetVehicleCrewRanks.sqf", "V_ResetVehicleCrewRanks"] call F_ReCompileFile;
["HCfunc\SetMyRank.sqf", "V_SetMyRank"] call F_ReCompileFile;

["HCfunc\SplitSelectedHCGroupsToGroupsOfN.sqf", "V_SplitSelectedHCGroupsToGroupsOfN"] call F_ReCompileFile;

["HCfunc\TotalUnitsDead.sqf", "V_TotalUnitsDead"] call F_ReCompileFile;
["HCfunc\SelectedHCUnitTypes.sqf", "V_SelectedHCUnitTypes"] call F_ReCompileFile;
["HCfunc\SelectedHCUnitsMagazines.sqf", "V_SelectedHCUnitsMagazines"] call F_ReCompileFile;
["HCfunc\SelectedHCUnitsWeapons.sqf", "V_SelectedHCUnitsWeapons"] call F_ReCompileFile;


// Menus

["HCfunc\Menus\WaypointMenuDef.sqf", "M_WaypointMenuDef"] call F_ReCompileFile;
["HCfunc\Menus\menu.sqf", "M_menu"] call F_ReCompileFile;
["HCfunc\Menus\ExampleMenu.sqf", "M_ExampleMenu"] call F_ReCompileFile;
["HCfunc\Menus\SetCommsMenu.sqf", "F_SetCommsMenu"] call F_ReCompileFile;


nil;