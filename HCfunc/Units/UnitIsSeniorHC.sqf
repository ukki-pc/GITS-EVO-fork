// Arma 2 function

private ["_Unit","_IsSeniorHC"];

_Unit = _this;

_IsSeniorHC = (isNull (hcLeader (group _Unit))) 
            && ((count (hcAllGroups _Unit)) >= 1);

_IsSeniorHC;


