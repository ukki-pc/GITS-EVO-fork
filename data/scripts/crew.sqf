_crew = (crew vehicle player);
_count = count _crew;

_stringa = "";
_msg = "";
_txt = "";
_head = parseText format["<t color='#FFFFCC'>  %1</t>",localize "STR_M04t71"];
_separator1 = parseText "<br /><br />";
_vec = parseText format["<t size='2.2'><img image='%1'/></t>",getText (configFile >> "CfgVehicles" >> format["%1", typeOf (vehicle player)] >> "picture")];

_crewarray = [_vec,_head,_separator1];



_i = 0;
while {_i < _count} do 
{
	_unit = (_crew select _i);
	_name = name _unit;
	if(_name == "Error: No unit") then {_name = localize "STR_M04t72"};
	_stringa = parseText "<img image='\ca\ui\data\i_cargo_ca.paa'/></t>";
	if(_unit == driver vehicle _unit) then {_stringa = parseText "<img image='\ca\ui\data\i_driver_ca.paa'/></t>"};
	if(_unit == gunner vehicle _unit) then {_stringa = parseText "<img image='\ca\ui\data\i_gunner_ca.paa'/></t>"};
	if(_unit == commander vehicle _unit) then {_stringa = parseText "<img image='\ca\ui\data\i_commander_ca.paa'/></t>"};
	_crewarray = _crewarray+[_stringa];
	_msg = parseText format["<t color='#FFFFFF'>   %1</t><br />",_name];
	_crewarray = _crewarray+[_msg];
	sleep 0.1;
	_i=_i+1;
};

_txt = composeText _crewarray;
hint _txt;
