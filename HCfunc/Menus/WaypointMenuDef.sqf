// Arma 2 function

private ["_SelectedGroups"];

	
// Selected Waypoints menu

WaypointType_menu = [
	["Set Waypoint Type",false],
	["Move",[2],"",-5,[["expression","['WPType', 'MOVE'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Cycle",[3],"",-5,[["expression","['WPType', 'CYCLE'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Seek and Destroy",[4],"",-5,[["expression","['WPType', 'SAD'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Guard",[5],"",-5,[["expression","['WPType', 'GUARD'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Unload",[6],"",-5,[["expression","['WPType', 'UNLOAD'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Load",[7],"",-5,[["expression","['WPType', 'LOAD'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Support (Resupply)",[8],"",-5,[["expression","['WPType', 'SUPPORT'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Hold",[9],"",-5,[["expression","['WPType', 'HOLD'] spawn F_WaypointMenuHandler"]],"1","1"]
	];
	
//	["Get Out",[8],"",-5,[["expression","['WPType', 'GETOUT'] spawn F_WaypointMenuHandler"]],"1","1"],
//	["Get In",[9],"",-5,[["expression","['WPType', 'GETIN NEAREST'] spawn F_WaypointMenuHandler"]],"1","1"],
	
	
WaypointCombatMode_menu = [
	["Waypoint Combat Mode",false],
	["Stealth",[2],"",-5,[["expression","['WPCombatMode', 'STEALTH'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Danger",[3],"",-5,[["expression","['WPCombatMode', 'COMBAT'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Aware",[4],"",-5,[["expression","['WPCombatMode', 'AWARE'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Safe",[5],"",-5,[["expression","['WPCombatMode', 'SAFE'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Careless",[6],"",-5,[["expression","['WPCombatMode', 'CARELESS'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Unchanged",[7],"",-5,[["expression","['WPCombatMode', 'UNCHANGED'] spawn F_WaypointMenuHandler"]],"1","1"]
	];


WaypointFormation_menu = [
	["Waypoint Formation",false],
	["Column",[2],"",-5,[["expression","['WPFormation', 'COLUMN'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Staggered Column",[3],"",-5,[["expression","['WPFormation', 'STAG COLUMN'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Wedge",[4],"",-5,[["expression","['WPFormation', 'WEDGE'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Echelon Left",[5],"",-5,[["expression","['WPFormation', 'ECH LEFT'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Echelon Right",[6],"",-5,[["expression","['WPFormation', 'ECH RIGHT'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Vee",[7],"",-5,[["expression","['WPFormation', 'VEE'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Line",[8],"",-5,[["expression","['WPFormation', 'LINE'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Column (compact)",[9],"",-5,[["expression","['WPFormation', 'FILE'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Delta",[10],"",-5,[["expression","['WPFormation', 'DIAMOND'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Unchanged",[11],"",-5,[["expression","['WPFormation', 'NO CHANGE'] spawn F_WaypointMenuHandler"]],"1","1"]
	];

WaypointSpeed_menu = [
	["Waypoint Speed",false],
	["Limited",[2],"",-5,[["expression","['WPSpeed', 'LIMITED'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Normal",[3],"",-5,[["expression","['WPSpeed', 'NORMAL'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Full",[4],"",-5,[["expression","['WPSpeed', 'FULL'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Unchanged",[5],"",-5,[["expression","['WPSpeed', 'UNCHANGED'] spawn F_WaypointMenuHandler"]],"1","1"]
	];


WaypointTimeout_menu = [
	["Waypoint Timeout",false],
	["No Wait",[2],"",-5,[["expression","['WpWait', 0] spawn F_WaypointMenuHandler"]],"1","1"],
	["Wait 10 Seconds",[3],"",-5,[["expression","['WpWait', 10] spawn F_WaypointMenuHandler"]],"1","1"],
	["Wait 30 Seconds",[4],"",-5,[["expression","['WpWait', 30] spawn F_WaypointMenuHandler"]],"1","1"],
	["Wait 1 Minute",[5],"",-5,[["expression","['WpWait', 60] spawn F_WaypointMenuHandler"]],"1","1"],
	["Wait 5 Minutes",[6],"",-5,[["expression","['WpWait', 300] spawn F_WaypointMenuHandler"]],"1","1"],
	["Wait 10 Minutes",[7],"",-5,[["expression","['WpWait', 600] spawn F_WaypointMenuHandler"]],"1","1"],
	["Wait 15 Minutes",[8],"",-5,[["expression","['WpWait', 900] spawn F_WaypointMenuHandler"]],"1","1"],
	["Wait 30 Minutes",[9],"",-5,[["expression","['WpWait', 1800] spawn F_WaypointMenuHandler"]],"1","1"],
	["Wait 60 Minutes",[10],"",-5,[["expression","['WpWait', 3600] spawn F_WaypointMenuHandler"]],"1","1"],
	["Wait Indefinitely",[11],"",-5,[["expression","['WpWait', 1e9] spawn F_WaypointMenuHandler"]],"1","1"]
	];


WaypointCompletionRadius_menu = [
	["Waypoint Completion Radius",false],
	["0 (m)",[2],"",-5,[["expression","['WpCompletionRadius', 0] spawn F_WaypointMenuHandler"]],"1","1"],
	["10 (m)",[3],"",-5,[["expression","['WpCompletionRadius', 10] spawn F_WaypointMenuHandler"]],"1","1"],
	["25 (m)",[4],"",-5,[["expression","['WpCompletionRadius', 25] spawn F_WaypointMenuHandler"]],"1","1"],
	["50 (m)",[5],"",-5,[["expression","['WpCompletionRadius', 50] spawn F_WaypointMenuHandler"]],"1","1"],
	["100 (m)",[6],"",-5,[["expression","['WpCompletionRadius', 100] spawn F_WaypointMenuHandler"]],"1","1"],
	["200 (m)",[7],"",-5,[["expression","['WpCompletionRadius', 200] spawn F_WaypointMenuHandler"]],"1","1"],
	["500 (m)",[8],"",-5,[["expression","['WpCompletionRadius', 500] spawn F_WaypointMenuHandler"]],"1","1"],
	["1000 (m)",[9],"",-5,[["expression","['WpCompletionRadius', 1000] spawn F_WaypointMenuHandler"]],"1","1"],
	["2000 (m)",[10],"",-5,[["expression","['WpCompletionRadius', 2000] spawn F_WaypointMenuHandler"]],"1","1"]
	];


WaypointSplitDelete_menu = [
	["Waypoint Completion Radius",false],
	["Cancel Selected Waypoints",[2],"",-5,[["expression","'WPDelete' spawn F_WaypointMenuHandler"]],"1","1"],
	["Split Waypoint Before Selected in 2",[3],"",-5,[["expression","['WpSplitBeforeAfter', false, 2] spawn F_WaypointMenuHandler"]],"1","1"],
	["Split Waypoint Before Selected in 3",[4],"",-5,[["expression","['WpSplitBeforeAfter', false, 3] spawn F_WaypointMenuHandler"]],"1","1"],
	["Split Waypoint Before Selected in 4",[5],"",-5,[["expression","['WpSplitBeforeAfter', false, 4] spawn F_WaypointMenuHandler"]],"1","1"],
	["Split Waypoint After Selected in 2",[6],"",-5,[["expression","['WpSplitBeforeAfter', true, 2] spawn F_WaypointMenuHandler"]],"1","1"],
	["Split Waypoint After Selected in 3",[7],"",-5,[["expression","['WpSplitBeforeAfter', true, 3] spawn F_WaypointMenuHandler"]],"1","1"],
	["Split Waypoint After Selected in 4",[8],"",-5,[["expression","['WpSplitBeforeAfter', true, 4] spawn F_WaypointMenuHandler"]],"1","1"]
	];


WaypointAdvancedType_menu = [
	["Set Waypoint Advanced Type",false],
	["Helicopter Land",[2],"",-5,[["expression","['WpHelicopterLand', 'LAND'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Helicopter GET IN",[3],"",-5,[["expression","['WpHelicopterLand', 'GET IN'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Helicopter GET OUT",[4],"",-5,[["expression","['WpHelicopterLand', 'GET OUT'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Clear Waypoint Advanced",[5],"",-5,[["expression","['WpAdvancedClear'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Get Out Non Crew Groups",[6],"",-5,[["expression","['WpAdvGetOutGroups','NonCrews'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Get Out Cargo Groups",[7],"",-5,[["expression","['WpAdvGetOutGroups','InCargo'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Get Out Crews Groups",[8],"",-5,[["expression","['WpAdvGetOutGroups','Crews'] spawn F_WaypointMenuHandler"]],"1","1"],
	["Get Out All Groups",[9],"",-5,[["expression","['WpAdvGetOutGroups','All'] spawn F_WaypointMenuHandler"]],"1","1"]
	];


missionNamespace setVariable ["HCExtWaypoint_menu", 
	[["Selected Waypoints", false],
		["Type",[2],"#USER:WaypointType_menu",-5,[["expression",""]],"1","1"],
		["Combat Mode",[3],"#USER:WaypointCombatMode_menu",-5,[["expression",""]],"1","1"],
		["Formation",[4],"#USER:WaypointFormation_menu",-5,[["expression",""]],"1","1"],
		["Speed",[5],"#USER:WaypointSpeed_menu",-5,[["expression",""]],"1","1"],
		["Timeout",[6],"#USER:WaypointTimeout_menu",-5,[["expression",""]],"1","1"],
		["Completion Radius",[7],"#USER:WaypointCompletionRadius_menu",-5,[["expression",""]],"1","1"],
		["Waypoints Split & Delete",[8],"#USER:WaypointSplitDelete_menu",-5,[["expression",""]],"1","1"],
		["Advanced Type",[9],"#USER:WaypointAdvancedType_menu",-5,[["expression",""]],"1","1"]
	]];


nil;
