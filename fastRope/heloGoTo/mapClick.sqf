// mapClick.sqf
// � OCTOBER 2011 - norrin
private ["_array","_unit","_heli"];
_array 					= _this select 3;
_heli 					= _array select 0;
_unit 					= _array select 1;
NORRN_frPos 			= [];
_heli setVariable ["NORRN_heloGoto_cancel", false, true];
////////////////////////////////////////////
//To stop players from deploying fastropes
_heli setVariable ["NORRN_fastRopeComplete", true, true];
////////////////////////////////////////////
_heli removeAction NORRN_heliGoTo_action;
_heli removeAction NORRN_heliGoToLand_action;
_heli removeAction NORRN_heliGoToRTB_action;
_heli removeAction NORRN_heliGoToRTB_action;
NORRN_heliGoToCancel_action = _heli addAction  ["Cancel fast rope destination", "fastRope\heloGoTo\cancelGotoAction.sqf", _heli,0, false];
NORRN_heloGotoMapClick = true;
titletext ["Click on the map to set chopper fast rope point","plain down"];
onMapSingleClick "NORRN_frPos = _pos; NORRN_heloGotoMapClick = false";
while {NORRN_heloGotoMapClick} do {sleep 0.1};
titletext ["","plain down"];
hint "Fast rope destination set";
_heli setVariable ["NORRN_FR_destChosen", true, true];
_heli setVariable ["NORRN_FR_destPos", NORRN_frPos, true];
_heli setVariable ["NORRN_FR_commandingUnit", _unit, true];
Nor_HT_S = [_heli, Nor_HT_S12];
publicVariable "Nor_HT_S";
if (local _heli) then {[_heli] spawn Nor_HT_S12};
sleep 3; 
hint "";






