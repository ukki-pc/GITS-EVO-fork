// Arma 2 function


private ["_TargetRange","_OnlyDoLeaders","_KnownValue","_Side","_Groups","_LoopNum"];

_TargetRange = _this select 0;
_OnlyDoLeaders = _this select 1;
_KnownValue = _this select 2;

missionNamespace setVariable ["HCExtEnemyMarkers", []];
_LoopNum = 0;

while { true } do {
	
	_Side = playerSide;
	_Groups = _Side call F_GetAllGroupsOnSide;
	
	[_Groups, _TargetRange, _Side, _OnlyDoLeaders, _KnownValue] call F_ShowKnownEnemies;
	
	_LoopNum = _LoopNum + 1;
	//hintSilent format ["Process Loop Count = %1\n_Groups = %2\n_Side = %3", 
    //                       _LoopNum, _Groups, _Side ];
	sleep 5.0;
};

nil;

