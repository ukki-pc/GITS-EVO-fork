// Arma 2 function

// Assumes that all members of the groups are on the same side.
// They will be until the leader is killed normally.

private ["_groups","_ngrps","_gi","_totalwest","_totaleast","_totalcivilian","_totalresistance",
         "_totalfriendly","_totalenemy","_totalunknown","_totalsidelogic","_ngrpswest","_ngrpseast","_ngrpscivilian",
         "_ngrpsresistance","_ngrpsfriendly","_ngrpsenemy","_ngrpsunknown","_ngrpssidelogic","_tunits","_vehicles",
         "_nvehicles","_group","_grpside","_nunits","_str"];

_groups = allgroups;
_ngrps = count _groups;

_totalwest = West call F_SideStatsTotal;
_totaleast = East call F_SideStatsTotal;
_totalcivilian = Civilian call F_SideStatsTotal;
_totalresistance = Resistance call F_SideStatsTotal;
_totalfriendly = 0;
_totalenemy = 0;
_totalunknown = 0;
_totalsidelogic = 0;

_ngrpswest = West call F_SideStatsTotal;
_ngrpseast = East call F_SideStatsTotal;
_ngrpscivilian = Civilian call F_SideStatsTotal;
_ngrpsresistance = Resistance call F_SideStatsTotal;
_ngrpsfriendly = 0;
_ngrpsenemy = 0;
_ngrpsunknown = 0;
_ngrpssidelogic = 0;

_tunits = 0;
_vehicles = vehicles;
_nvehicles = count _vehicles;

for [{ _gi = 0 }, { _gi < _ngrps }, { _gi = _gi + 1 }] do {
 
	_group = _groups select _gi;
	_grpside = side (leader _group);
	_nunits = count (units _group);
	
	if (_grpside call F_SideStatsAccessible) then {

		switch (_grpside) do {
			case West: { _totalwest = _totalwest + _nunits;  _ngrpswest = _ngrpswest + 1; _tunits = _tunits + _nunits; };   
			case East: { _totaleast = _totaleast + _nunits;  _ngrpseast = _ngrpseast + 1; _tunits = _tunits + _nunits; };   
			case Civilian: { _totalcivilian = _totalcivilian + _nunits;  _ngrpscivilian = _ngrpscivilian + 1; _tunits = _tunits + _nunits; };   
			case Resistance: { _totalresistance = _totalresistance + _nunits;  _ngrpsresistance = _ngrpsresistance + 1; _tunits = _tunits + _nunits; };   
			case Friendly: { _totalfriendly = _totalfriendly + _nunits;  _ngrpsfriendly = _ngrpsfriendly + 1; _tunits = _tunits + _nunits; };   
			case Enemy: { _totalenemy = _totalenemy + _nunits;  _ngrpsenemy = _ngrpsenemy + 1; _tunits = _tunits + _nunits; };   
			case Unknown: { _totalunknown = _totalunknown + _nunits;  _ngrpsunknown = _ngrpsunknown + 1; _tunits = _tunits + _nunits; };   
			case sideLogic: { _totalsidelogic = _totalsidelogic + _nunits;  _ngrpssidelogic = _ngrpssidelogic + 1; _tunits = _tunits + _nunits; };   
		};
	};
};

_str = format ["West = %1;\nEast = %2;\nCivilian = %3;\nResistance = %4;\nFriendly = %5;\nEnemy = %6;\nUnknown = %7;\nsideLogic = %8;\nGroups West = %9;\nGroups East = %10;\nGroups Civilian = %11;\nGroups Resistance = %12;\nGroups Friendly = %13;\nGroups Enemy = %14;\nGroups Unknown = %15;\nGroups sideLogic = %16;\nGroups = %17;\nUnits = %18;\nVehicles = %19", 
                   _totalwest, _totaleast, _totalcivilian, _totalresistance, _totalfriendly, _totalenemy, _totalunknown, _totalsidelogic, 
                   _ngrpswest, _ngrpseast, _ngrpscivilian, _ngrpsresistance, _ngrpsfriendly, _ngrpsenemy, _ngrpsunknown, _ngrpssidelogic, 
                   _ngrps, _tunits, _nvehicles];
                   
hintSilent _str;
copyToClipboard _str;

nil;
