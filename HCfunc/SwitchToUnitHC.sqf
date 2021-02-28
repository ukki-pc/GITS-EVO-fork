// Arma 2 function

private ["_unitgrp","_unithc"];
         
_unitgrp = group player;
_unithc = hcLeader _unitgrp;

if (isNull _unithc) then {

	_unithc = leader player;
};

if !(isNull _unithc) then {

	[player, _unithc] call F_PerformTeamSwitch;
};

nil;