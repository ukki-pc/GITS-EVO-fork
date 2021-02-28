// Arma 2 function

private ["_str"];


_str = "";

_str = _str + format["HCExtSelectedWaypoints = %1", 
                     missionNamespace getVariable "HCExtSelectedWaypoints"];
                    
_str = _str + format["\nHCExtCountEventHandlerInit = %1", 
                     missionNamespace getVariable "HCExtCountEventHandlerInit"];

//_str = _str + format["\nHCExtCountEventHandlerIDs = %1", 
//                     missionNamespace getVariable "HCExtCountEventHandlerIDs"];

_str = _str + format["\nHCExtShiftHeld = %1", 
                     missionNamespace getVariable "HCExtShiftHeld"];

_str = _str + format["\nHCExtCtrlHeld = %1", 
                     missionNamespace getVariable "HCExtCtrlHeld"];

_str = _str + format["\nHCExtAltHeld = %1", 
                     missionNamespace getVariable "HCExtAltHeld"];

_str;